/*
 * Standalone Arduino AX.25 Digipeater with EnduroSat Detection
 * Secondary communication system for CubeSat - operates independently
 * Operates at 436.42 MHz with automatic pause on EnduroSat detection
 * Power limited to 0.47W EIRP
 * 
 * This system runs completely separate from the main satellite computer
 * Follows NASA safety-critical coding principles where applicable
 */

#include <SPI.h>
#include <RH_RF95.h>

// Pin Definitions (matching existing configuration)
#define RFM95_CS   16
#define RFM95_INT  21  
#define RFM95_RST  17

// AX.25 Digipeater Configuration
#define DIGI_FREQ_MHZ      436.42    // Outside primary antenna range (433-435 MHz)
#define DIGI_POWER_DBM     17        // ~50mW RF output for 0.47W EIRP compliance
#define MYCALL             "KQ4NPQ"  // Digipeater callsign
#define MYCALL_SSID        1         // Digipeater SSID

// AX.25 Protocol Constants
#define AX25_FLAG          0x7E
#define AX25_CONTROL_UI    0x03
#define AX25_PID_NOLAYER3  0xF0
#define CALL_SIZE          7
#define MAX_FRAME_SIZE     200       // Reduced for Arduino memory limits
#define MAX_DIGI_HOPS      4         // Maximum digipeater hops

// EnduroSat Detection and Pause
#define ENDUROSAT_PAUSE_MS 600000UL  // 10 minutes in milliseconds
#define ENDUROSAT_PATTERN1 0x55AA    // Example EnduroSat preamble pattern
#define ENDUROSAT_PATTERN2 0x7E7E    // Example EnduroSat sync pattern
#define ENDUROSAT_PATTERN3 0xAA55    // Additional pattern for detection

// Timing Constants
#define PACKET_TIMEOUT_MS  5000      // 5 second packet processing timeout
#define STATUS_INTERVAL_MS 30000     // 30 second status reports

// Global Variables (minimized scope per NASA guidelines)
RH_RF95 rf95(RFM95_CS, RFM95_INT);
static bool digipeater_enabled = true;
static unsigned long pause_start_time = 0;
static unsigned long last_status_time = 0;
static unsigned int packets_received = 0;
static unsigned int packets_digipeated = 0;
static unsigned int endurosat_detections = 0;

/*
 * Initialize radio for AX.25 digipeater operation
 * Returns: true on success, false on failure
 * Function size: <60 lines per NASA Rule 4
 */
bool initAX25Radio() {
  uint8_t init_attempts = 0;
  const uint8_t MAX_ATTEMPTS = 3;
  
  pinMode(RFM95_RST, OUTPUT);
  pinMode(RFM95_CS, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(RFM95_CS, HIGH);

  SPI.begin();
  delay(100);

  // Reset sequence
  digitalWrite(RFM95_RST, HIGH);
  delay(150);
  digitalWrite(RFM95_RST, LOW);
  delay(150);
  digitalWrite(RFM95_RST, HIGH);
  delay(150);

  while (init_attempts < MAX_ATTEMPTS) {
    if (rf95.init() && rf95.setFrequency(DIGI_FREQ_MHZ)) {
      // Configure for digipeater operation with space constraints
      rf95.setTxPower(DIGI_POWER_DBM, false);
      
      // Configure modulation for better space performance
      rf95.setSignalBandwidth(125000);    // 125 kHz bandwidth for Doppler tolerance
      rf95.setSpreadingFactor(7);         // SF7 for better Doppler performance
      rf95.setCodingRate4(5);             // 4/5 coding rate for reliability
      
      Serial.print("AX.25 digipeater initialized at ");
      Serial.print(DIGI_FREQ_MHZ, 2);
      Serial.print(" MHz, ");
      Serial.print(DIGI_POWER_DBM);
      Serial.println(" dBm");
      
      // Flash LED to indicate successful init
      for (uint8_t i = 0; i < 3; i++) {
        digitalWrite(LED_BUILTIN, HIGH);
        delay(200);
        digitalWrite(LED_BUILTIN, LOW);
        delay(200);
      }
      
      return true;
    }
    
    init_attempts++;
    Serial.print("Radio init attempt ");
    Serial.print(init_attempts);
    Serial.println(" failed");
    delay(1000);
  }
  
  Serial.println("FATAL: AX.25 radio initialization failed");
  return false;
}

/*
 * Detect EnduroSat packet patterns to trigger pause
 * Returns: true if EnduroSat pattern detected
 * Function size: <60 lines per NASA Rule 4
 */
bool detectEnduroSatPacket(uint8_t* data, uint8_t len) {
  uint8_t i = 0;
  uint16_t pattern = 0;
  
  // Runtime assertion per NASA Rule 5
  if (data == NULL) {
    Serial.println("ERROR: Null data in EnduroSat detection");
    return false;
  }
  
  // Runtime assertion per NASA Rule 5
  if (len < 4) {
    return false;  // Too short to contain meaningful pattern
  }
  
  // Check for EnduroSat patterns throughout the packet
  while (i < (len - 1)) {
    pattern = (data[i] << 8) | data[i + 1];
    
    if (pattern == ENDUROSAT_PATTERN1 || 
        pattern == ENDUROSAT_PATTERN2 || 
        pattern == ENDUROSAT_PATTERN3) {
      Serial.println("EnduroSat pattern detected - pausing digipeater for 10 minutes");
      endurosat_detections++;
      return true;
    }
    i++;
  }
  
  return false;
}

/*
 * Parse callsign from AX.25 address field
 * Handles HDLC bit shifting per AX.25 standard
 * Function size: <60 lines per NASA Rule 4
 */
void parseCallsign(uint8_t* addr_field, char* callsign) {
  uint8_t i = 0;
  
  // Runtime assertion per NASA Rule 5
  if (addr_field == NULL || callsign == NULL) {
    Serial.println("ERROR: Null pointer in callsign parsing");
    return;
  }
  
  // Extract 6-character callsign from HDLC-shifted data
  while (i < 6) {
    callsign[i] = (addr_field[i] >> 1) & 0x7F;  // Remove HDLC shift
    if (callsign[i] == ' ' || callsign[i] == '\0') {
      break;  // Stop at first space or null
    }
    i++;
  }
  callsign[i] = '\0';  // Ensure null termination
}

/*
 * Check if packet should be digipeated
 * Simplified digipeater logic for space operation
 * Function size: <60 lines per NASA Rule 4
 */
bool shouldDigipeat(uint8_t* data, uint8_t len) {
  char source_call[8];
  uint8_t pos = 0;
  uint8_t hop_count = 0;
  
  // Runtime assertions per NASA Rule 5
  if (data == NULL) {
    Serial.println("ERROR: Null data in digipeat check");
    return false;
  }
  
  if (len < 16) {  // Minimum AX.25 frame size
    return false;
  }
  
  // Skip flag if present
  if (data[pos] == AX25_FLAG) {
    pos++;
  }
  
  // Skip destination address (7 bytes)
  pos += 7;
  
  // Parse source address (7 bytes)
  if (pos + 7 > len) {
    return false;  // Malformed packet
  }
  
  parseCallsign(&data[pos], source_call);
  pos += 7;
  
  // Don't digipeat our own packets
  if (strncmp(source_call, MYCALL, strlen(MYCALL)) == 0) {
    return false;
  }
  
  // Count digipeater hops in path (simplified check)
  while (pos < len && hop_count < MAX_DIGI_HOPS) {
    if (data[pos - 1] & 0x01) {  // Check end-of-address bit
      break;
    }
    hop_count++;
    pos += 7;  // Skip digipeater address
  }
  
  // Don't digipeat if too many hops
  if (hop_count >= MAX_DIGI_HOPS) {
    return false;
  }
  
  return true;  // Packet is eligible for digipeating
}

/*
 * Simple packet retransmission for digipeating
 * Adds our callsign to the digipeater path
 * Function size: <60 lines per NASA Rule 4
 */
bool transmitDigipeatedPacket(uint8_t* original_data, uint8_t original_len) {
  uint8_t tx_buffer[MAX_FRAME_SIZE];
  uint8_t tx_len = 0;
  
  // Runtime assertions per NASA Rule 5
  if (original_data == NULL) {
    Serial.println("ERROR: Null data in packet transmission");
    return false;
  }
  
  if (original_len > (MAX_FRAME_SIZE - 10)) {  // Leave room for our callsign
    Serial.println("ERROR: Packet too large for digipeating");
    return false;
  }
  
  // For simplified operation, retransmit with minimal modification
  // In full implementation, would properly modify digipeater path
  memcpy(tx_buffer, original_data, original_len);
  tx_len = original_len;
  
  // Transmit the packet
  bool success = rf95.send(tx_buffer, tx_len);
  if (success) {
    rf95.waitPacketSent();
    packets_digipeated++;
    
    // Brief LED flash to indicate transmission
    digitalWrite(LED_BUILTIN, HIGH);
    delay(50);
    digitalWrite(LED_BUILTIN, LOW);
    
    Serial.print("Packet digipeated, total: ");
    Serial.println(packets_digipeated);
  } else {
    Serial.println("ERROR: Failed to transmit packet");
  }
  
  return success;
}

/*
 * Print system status and statistics
 * Function size: <60 lines per NASA Rule 4
 */
void printStatus() {
  unsigned long uptime_sec = millis() / 1000;
  unsigned long uptime_min = uptime_sec / 60;
  unsigned long uptime_hr = uptime_min / 60;
  
  Serial.println("=== AX.25 Digipeater Status ===");
  Serial.print("Uptime: ");
  Serial.print(uptime_hr);
  Serial.print("h ");
  Serial.print(uptime_min % 60);
  Serial.print("m ");
  Serial.print(uptime_sec % 60);
  Serial.println("s");
  
  Serial.print("Status: ");
  if (digipeater_enabled) {
    Serial.println("ACTIVE");
  } else {
    unsigned long pause_remaining = (ENDUROSAT_PAUSE_MS - (millis() - pause_start_time)) / 1000;
    Serial.print("PAUSED (");
    Serial.print(pause_remaining);
    Serial.println("s remaining)");
  }
  
  Serial.print("Packets received: ");
  Serial.println(packets_received);
  Serial.print("Packets digipeated: ");
  Serial.println(packets_digipeated);
  Serial.print("EnduroSat detections: ");
  Serial.println(endurosat_detections);
  Serial.println("============================");
}

/*
 * Arduino setup function
 * Initializes the digipeater system
 */
void setup() {
  Serial.begin(115200);
  delay(2000);  // Allow time for serial connection
  
  Serial.println("=== Standalone AX.25 Digipeater Starting ===");
  Serial.print("Callsign: ");
  Serial.print(MYCALL);
  Serial.print("-");
  Serial.println(MYCALL_SSID);
  Serial.print("Frequency: ");
  Serial.print(DIGI_FREQ_MHZ, 2);
  Serial.println(" MHz");
  Serial.println("EnduroSat auto-pause: ENABLED");
  
  // Initialize radio system
  if (!initAX25Radio()) {
    Serial.println("FATAL: Cannot start without radio - halting");
    while (1) {
      // Flash LED rapidly to indicate fatal error
      digitalWrite(LED_BUILTIN, HIGH);
      delay(100);
      digitalWrite(LED_BUILTIN, LOW);
      delay(100);
    }
  }
  
  Serial.println("Digipeater ready - monitoring for packets");
  last_status_time = millis();
}

/*
 * Arduino main loop
 * Handles packet reception, EnduroSat detection, and digipeating
 */
void loop() {
  unsigned long current_time = millis();
  uint8_t rx_buffer[RH_RF95_MAX_MESSAGE_LEN];
  uint8_t rx_len = sizeof(rx_buffer);
  
  // Check if we're in EnduroSat pause period
  if (!digipeater_enabled) {
    if ((current_time - pause_start_time) >= ENDUROSAT_PAUSE_MS) {
      digipeater_enabled = true;
      Serial.println("EnduroSat pause period ended - resuming digipeater operation");
    } else {
      // During pause, just monitor but don't process
      delay(1000);
      return;
    }
  }
  
  // Check for incoming packets
  if (rf95.available()) {
    if (rf95.recv(rx_buffer, &rx_len)) {
      packets_received++;
      
      // Check for EnduroSat patterns first
      if (detectEnduroSatPacket(rx_buffer, rx_len)) {
        digipeater_enabled = false;
        pause_start_time = current_time;
        Serial.println("Entering 10-minute pause for EnduroSat traffic");
        return;
      }
      
      // Process packet for digipeating if enabled
      if (digipeater_enabled && shouldDigipeat(rx_buffer, rx_len)) {
        Serial.print("Digipeating packet (RSSI: ");
        Serial.print(rf95.lastRssi());
        Serial.println(" dBm)");
        
        // Add small delay to avoid immediate retransmission
        delay(random(100, 500));  // Random delay 100-500ms
        
        transmitDigipeatedPacket(rx_buffer, rx_len);
      }
    }
  }
  
  // Print status periodically
  if ((current_time - last_status_time) >= STATUS_INTERVAL_MS) {
    printStatus();
    last_status_time = current_time;
  }
  
  delay(10);  // Small delay to prevent tight loop
}