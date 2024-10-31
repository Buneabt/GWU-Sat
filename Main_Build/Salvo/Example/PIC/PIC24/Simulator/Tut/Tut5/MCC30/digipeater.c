#include "digipeater.h"
#include "secure_comms.h"
#include <string.h>
#include <stdio.h>

// Static buffer for storing messages to be digipeated
static RadioMessage messageBuffer[MAX_STORED_MESSAGES];
static volatile uint8_t messageCount = 0;

// Secure key storage in protected flash section
__attribute__((section(".secure_data"))) 
static const uint8_t VALID_SECURITY_KEY[SECURITY_KEY_LENGTH] = {
    0x00  // Will be programmed separately via secure bootloader
};

// Initialize the digipeater subsystem
void initDigipeater(void) {
    // Clear message buffer
    memset(messageBuffer, 0, sizeof(messageBuffer));
    messageCount = 0;
    
    // Create the high-priority receive task
    OSCreateTask(TaskCommRead, TASK_COMM_READ_P, PRIO_COMM_READ);
    
    printf("Digipeater initialized\n");
}

// Check if a stored message is still valid
static bool isMessageValid(const RadioMessage* msg) {
    uint32_t currentTime = OSGetTicks();
    uint32_t messageAge = currentTime - msg->timestamp;
    
    return (messageAge < MAX_MESSAGE_AGE);
}

// Store a message for later transmission
static void storeMessage(RadioMessage* msg) {
    if (messageCount >= MAX_STORED_MESSAGES) {
        // Buffer full - find oldest message to replace
        uint32_t oldestTime = UINT32_MAX;
        int oldestIndex = 0;
        
        for (int i = 0; i < MAX_STORED_MESSAGES; i++) {
            if (messageBuffer[i].timestamp < oldestTime) {
                oldestTime = messageBuffer[i].timestamp;
                oldestIndex = i;
            }
        }
        
        // Replace oldest message
        memcpy(&messageBuffer[oldestIndex], msg, sizeof(RadioMessage));
    } else {
        // Add to buffer
        memcpy(&messageBuffer[messageCount], msg, sizeof(RadioMessage));
        messageCount++;
    }
}

// Main receive task
void TaskCommRead(void) {
    SecureCommand rxCmd;
    uint8_t decryptedData[64];
    RadioMessage rxMsg;
    
    for(;;) {
        // Check for incoming messages
        if (receiveMessage(&rxCmd)) {  // Hardware-specific function
            // Verify and decrypt the command
            SecurityStatus status = verifyAndDecryptCommand(&rxCmd, decryptedData);
            
            if (status != SEC_SUCCESS) {
                logSecurityEvent(status);
                continue;
            }
            
            // Process the decrypted command
            memcpy(&rxMsg, decryptedData, sizeof(RadioMessage));
            rxMsg.timestamp = OSGetTicks();
            
            switch(rxMsg.cmd) {
                case CMD_PING:
                    // Signal ground station visibility
                    OSSignalBinSem(BINSEM_OVER_GROUND_STATION);
                    printf("Ground station ping received\n");
                    break;
                    
                case CMD_SHUTDOWN:
                    printf("Emergency shutdown command received\n");
                    performEmergencyShutdown();
                    break;
                    
                case CMD_START_EXPERIMENT:
                    printf("Experiment authorization received\n");
                    OSSignalBinSem(BINSEM_EXPERIMENT_WINDOW);
                    break;
                    
                case CMD_DIGIPEAT:
                    // Store message for later retransmission
                    printf("Storing message for digipeating\n");
                    storeMessage(&rxMsg);
                    break;
                    
                case CMD_CLEAR_BUFFER:
                    // Clear digipeater buffer
                    messageCount = 0;
                    printf("Digipeater buffer cleared\n");
                    break;
                    
                case CMD_STATUS_REQUEST:
                    // Trigger immediate status transmission
                    OSSignalBinSem(BINSEM_STATUS_CHECKED);
                    break;
                    
                default:
                    printf("Unknown command received: 0x%02X\n", rxMsg.cmd);
                    break;
            }
        }
        
        // Clean expired messages from buffer
        for (int i = 0; i < messageCount; i++) {
            if (!isMessageValid(&messageBuffer[i])) {
                // Remove expired message
                if (i < messageCount - 1) {
                    memmove(&messageBuffer[i], 
                           &messageBuffer[i + 1], 
                           (messageCount - i - 1) * sizeof(RadioMessage));
                }
                messageCount--;
                i--; // Recheck this position
            }
        }
        
        // Brief delay to prevent task hogging
        OS_Delay(1);
    }
}

// Modified TaskCommunication to handle digipeating
void TaskCommunication(void) {
    static uint8_t currentMsg = 0;
    
    for(;;) {
        // Wait for data and ground station visibility
        OS_WaitBinSem(BINSEM_DATA_READY && BINSEM_OVER_GROUND_STATION, OSNO_TIMEOUT);
        
        // Process stored digipeater messages first
        while (messageCount > 0 && currentMsg < messageCount) {
            RadioMessage* msg = &messageBuffer[currentMsg];
            
            if (isMessageValid(msg)) {
                // Attempt to transmit message
                if (transmitMessage(msg)) {  // Hardware-specific function
                    printf("Digipeated message %d\n", currentMsg);
                    
                    // Remove successfully transmitted message
                    if (currentMsg < messageCount - 1) {
                        memmove(&messageBuffer[currentMsg], 
                               &messageBuffer[currentMsg + 1], 
                               (messageCount - currentMsg - 1) * sizeof(RadioMessage));
                    }
                    messageCount--;
                } else {
                    // Transmission failed, try next message
                    currentMsg++;
                }
            } else {
                // Remove expired message
                if (currentMsg < messageCount - 1) {
                    memmove(&messageBuffer[currentMsg], 
                           &messageBuffer[currentMsg + 1], 
                           (messageCount - currentMsg - 1) * sizeof(RadioMessage));
                }
                messageCount--;
            }
        }
        
        // Reset message pointer if we've processed all messages
        if (currentMsg >= messageCount) {
            currentMsg = 0;
        }
        
        // Handle regular satellite data transmission
        if (OSPendingBinSem(BINSEM_DATA_READY)) {
            // Your existing communication code here
            printf("Transmitting satellite data\n");
        }
        
        OS_Delay(35);  // Delay between transmission attempts
    }
}