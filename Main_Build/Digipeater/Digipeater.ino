/*
 * Space-Based Digipeater for CubeSat Implementation
 * Author: Bogdan Bunea
 * Callsign: KQ4NPQ
 * 
 * This implementation provides store-and-forward digipeater functionality
 * for a CubeSat in Low Earth Orbit. It handles AX.25 packet processing,
 * SD card storage, and proper amateur radio digipeater operation.
 */

#include <SPI.h>
#include <RH_RF95.h>
#include <SD.h>
#include <TimeLib.h>

//====================== Pin Definitions ======================
// Radio Module Pins
#define RFM95_CS   16    // Radio chip select
#define RFM95_INT  21    // Radio interrupt
#define RFM95_RST  17    // Radio reset
#define SD_CS      5     // SD card chip select

//=================== Radio Configuration ====================
#define RF95_FREQ     435.0  // Operating frequency in MHz
#define RF95_POWER    20     // Transmission power in dBm
#define BANDWIDTH     125.0  // Channel bandwidth in kHz
#define CODING_RATE   5      // 4/5 coding rate
#define SPREADING_FACTOR 7    // Lower SF for better Doppler tolerance

//==================== AX.25 Constants =====================
#define AX25_FLAG           0x7E    // Frame delimiter
#define AX25_CONTROL_UI     0x03    // Unnumbered Information frame
#define AX25_PID_NOLAYER3   0xF0    // No layer 3 protocol
#define CALL_SIZE           7        // 6 chars + SSID
#define MAX_FRAME_SIZE      332      // Maximum AX.25 frame size
#define MAX_DIGIPEATER_PATHS 8       // Maximum number of digipeater addresses
#define MYCALL              "KQ4NPQ" // Station callsign

//================= Message Management =====================
#define MESSAGE_TTL         1800000  // Message lifetime (30 minutes in ms)
#define MAX_RETRY_COUNT     3        // Maximum retransmission attempts
#define RETRY_DELAY         5000     // Delay between retries (ms)
#define MESSAGE_DIR         "/msgs"  // SD card directory for stored messages
#define LOG_FILE           "/digilog.txt"  // Log file path
#define MAX_FILENAME_LEN    32       // Maximum filename length

//=================== Data Structures =====================

// Structure for digipeater path element
struct AX25Path {
    char call[CALL_SIZE];
    bool used;  // Has-been-repeated bit
};

// Structure for complete AX.25 packet
struct AX25Packet {
    char destCall[CALL_SIZE];        // Destination callsign
    char sourceCall[CALL_SIZE];      // Source callsign
    AX25Path digipeaters[MAX_DIGIPEATER_PATHS];  // Digipeater path
    uint8_t numDigipeaters;          // Number of digipeaters in path
    uint8_t control;                 // Control field
    uint8_t pid;                     // Protocol ID
    uint8_t* info;                   // Information field
    uint16_t infoLength;             // Length of info field
    time_t timestamp;                // Time packet was received
    uint8_t retryCount;              // Number of transmission attempts
};

// Radio object
RH_RF95 rf95(RFM95_CS, RFM95_INT);

//================== Function Prototypes ==================
bool initSD();
bool initRadio();
void logMessage(const char* message);
bool savePacketToSD(const AX25Packet* packet);
bool loadPacketFromSD(const char* filename, AX25Packet* packet);
void deleteMessage(const char* filename);
bool transmitPacket(const AX25Packet* packet);
bool isValidPacket(uint8_t* data, uint8_t len);
void parseAX25Packet(uint8_t* data, uint8_t len, AX25Packet* packet);
void processStoredMessages();
uint16_t calculateCRC(uint8_t* data, uint16_t len);

//===================== Setup Function ====================
void setup() {
    Serial.begin(115200);
    
    // Initialize SD card
    if (!initSD()) {
        Serial.println("SD card init failed!");
        while (1);  // Halt if SD fails
    }
    
    // Create messages directory
    if (!SD.exists(MESSAGE_DIR)) {
        SD.mkdir(MESSAGE_DIR);
    }
    
    // Initialize radio
    if (!initRadio()) {
        Serial.println("Radio init failed!");
        while (1);  // Halt if radio fails
    }
    
    logMessage("Digipeater initialized - KQ4NPQ operational");
}

//===================== Main Loop ========================
void loop() {
    // Check for incoming packets
    if (rf95.available()) {
        uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
        uint8_t len = sizeof(buf);
        
        if (rf95.recv(buf, &len)) {
            // Process only valid AX.25 packets
            if (isValidPacket(buf, len)) {
                AX25Packet packet;
                parseAX25Packet(buf, len, &packet);
                
                // Store packet if it's valid and hasn't been repeated by us
                if (shouldDigipeat(&packet)) {
                    if (savePacketToSD(&packet)) {
                        char logBuf[64];
                        snprintf(logBuf, sizeof(logBuf), 
                                "Stored packet: %s>%s", 
                                packet.sourceCall, 
                                packet.destCall);
                        logMessage(logBuf);
                    }
                }
                
                // Free allocated memory
                if (packet.info != NULL) {
                    free(packet.info);
                }
            }
        }
    }
    
    // Process stored messages
    processStoredMessages();
    
    delay(100); // Prevent tight loop
}

//================= Radio Initialization =================
bool initRadio() {
    pinMode(RFM95_RST, OUTPUT);
    digitalWrite(RFM95_RST, HIGH);
    
    // Reset sequence
    digitalWrite(RFM95_RST, LOW);
    delay(10);
    digitalWrite(RFM95_RST, HIGH);
    delay(10);
    
    if (!rf95.init()) {
        return false;
    }
    
    // Configure for space operation
    if (!rf95.setFrequency(RF95_FREQ)) {
        return false;
    }
    
    // Configure for Doppler tolerance
    rf95.spiWrite(RH_RF95_REG_1D_MODEM_CONFIG1, 
                  RH_RF95_BW_125KHZ |         // Wide bandwidth
                  RH_RF95_CODING_RATE_4_5 |   // Conservative coding
                  RH_RF95_IMPLICIT_HEADER_MODE_ON);
    
    // Enable AFC and AGC
    rf95.spiWrite(RH_RF95_REG_26_MODEM_CONFIG3, 
                  RH_RF95_AGC_AUTO_ON |       // Auto gain control
                  RH_RF95_LOW_DATA_RATE_OPTIMIZE_ON);
    
    rf95.setTxPower(RF95_POWER, false);
    
    return true;
}

//================= Packet Processing ===================

// Check if packet should be digipeated
bool shouldDigipeat(const AX25Packet* packet) {
    // Don't digipeat our own packets
    if (strncmp(packet->sourceCall, MYCALL, 6) == 0) {
        return false;
    }
    
    // Check digipeater path
    for (int i = 0; i < packet->numDigipeaters; i++) {
        // If we find our callsign and haven't repeated it yet
        if (strncmp(packet->digipeaters[i].call, MYCALL, 6) == 0 && 
            !packet->digipeaters[i].used) {
            return true;
        }
    }
    
    return false;
}

// Transmit AX.25 packet with proper digipeating bits set
bool transmitPacket(const AX25Packet* packet) {
    uint16_t totalSize = 1 + // Flag
                        CALL_SIZE * 2 + // Dest and Source
                        (packet->numDigipeaters * CALL_SIZE) + // Path
                        2 + // Control and PID
                        packet->infoLength +
                        2 + // FCS
                        1; // End flag
    
    uint8_t* txBuf = (uint8_t*)malloc(totalSize);
    if (!txBuf) return false;
    
    uint16_t pos = 0;
    
    // Build AX.25 frame
    txBuf[pos++] = AX25_FLAG;
    
    // Add addresses (shifted left by 1)
    for (int i = 0; i < 6; i++) {
        txBuf[pos++] = packet->destCall[i] << 1;
    }
    txBuf[pos++] = (packet->destCall[6] << 1);
    
    for (int i = 0; i < 6; i++) {
        txBuf[pos++] = packet->sourceCall[i] << 1;
    }
    txBuf[pos++] = (packet->sourceCall[6] << 1);
    
    // Add digipeater path
    for (int i = 0; i < packet->numDigipeaters; i++) {
        for (int j = 0; j < 6; j++) {
            txBuf[pos++] = packet->digipeaters[i].call[j] << 1;
        }
        
        uint8_t ssid = packet->digipeaters[i].call[6];
        
        // If this is our callsign, set the H bit
        if (strncmp(packet->digipeaters[i].call, MYCALL, 6) == 0) {
            ssid |= 0x80;  // Set H bit
        }
        
        // Set C bit if last address
        if (i == packet->numDigipeaters - 1) {
            ssid |= 0x01;
        }
        
        txBuf[pos++] = ssid << 1;
    }
    
    // Add control and PID
    txBuf[pos++] = packet->control;
    txBuf[pos++] = packet->pid;
    
    // Add info field
    memcpy(&txBuf[pos], packet->info, packet->infoLength);
    pos += packet->infoLength;
    
    // Calculate and add FCS
    uint16_t fcs = calculateCRC(&txBuf[1], pos - 1);
    txBuf[pos++] = fcs & 0xFF;
    txBuf[pos++] = (fcs >> 8) & 0xFF;
    
    // Add end flag
    txBuf[pos++] = AX25_FLAG;
    
    // Transmit
    bool success = rf95.send(txBuf, totalSize);
    rf95.waitPacketSent();
    
    free(txBuf);
    return success;
}

//============== Message Storage Management ==============

// Save packet to SD card
bool savePacketToSD(const AX25Packet* packet) {
    char filename[MAX_FILENAME_LEN];
    snprintf(filename, sizeof(filename), 
             "%s/%lu.pkt", MESSAGE_DIR, now());
    
    File file = SD.open(filename, FILE_WRITE);
    if (!file) return false;
    
    // Write packet data
    file.write((uint8_t*)packet, sizeof(AX25Packet));
    file.write(packet->info, packet->infoLength);
    
    file.close();
    return true;
}

// Process stored messages
void processStoredMessages() {
    File dir = SD.open(MESSAGE_DIR);
    if (!dir) return;
    
    while (true) {
        File entry = dir.openNextFile();
        if (!entry) break;
        
        // Load and process packet
        AX25Packet packet;
        if (loadPacketFromSD(entry.name(), &packet)) {
            // Check if expired
            if ((now() - packet.timestamp) > MESSAGE_TTL) {
                deleteMessage(entry.name());
            }
            // Try to transmit if retries remain
            else if (packet.retryCount < MAX_RETRY_COUNT) {
                if (transmitPacket(&packet)) {
                    deleteMessage(entry.name());
                    logMessage("Packet digipeated successfully");
                } else {
                    packet.retryCount++;
                    savePacketToSD(&packet);
                }
            }
            
            if (packet.info != NULL) {
                free(packet.info);
            }
        }
        
        entry.close();
    }
    
    dir.close();
}

//===================== Utility Functions ==================

// Calculate CRC for AX.25
uint16_t calculateCRC(uint8_t* data, uint16_t len) {
    uint16_t crc = 0xFFFF;
    
    for (uint16_t i = 0; i < len; i++) {
        crc ^= data[i];
        for (uint8_t j = 0; j < 8; j++) {
            if (crc & 0x0001) {
                crc = (crc >> 1) ^ 0x8408;
            } else {
                crc = crc >> 1;
            }
        }
    }
    
    return ~crc;
}

// Log message with timestamp
void logMessage(const char* message) {
    File logFile = SD.open(LOG_FILE, FILE_WRITE);
    if (logFile) {
        logFile.print(now());
        logFile.print(": ");
        logFile.println(message);
        logFile.close();
    }
}