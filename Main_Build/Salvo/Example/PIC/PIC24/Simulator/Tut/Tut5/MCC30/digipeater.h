/* 
 * File:   digipeater.h
 * Author: bogdanbunea
 *
 * Created on October 31, 2024, 10:56 AM
 */

// digipeater.h
#ifndef DIGIPEATER_H
#define DIGIPEATER_H

#include <salvo.h>
#include <stdint.h>

// Security definitions
#define SECURITY_KEY_LENGTH 32      // Length of security key in bytes (256-bit)

// Maximum time to store messages before they expire
#define MAX_MESSAGE_AGE (30 * TICKS_PER_MINUTE)  // 30 minutes in system ticks

// Maximum number of messages that can be stored for digipeating
#define MAX_STORED_MESSAGES 10      // Buffer size for stored messages

// Command types that can be received
typedef enum {
    CMD_PING = 0x01,               // Ground station visibility check
    CMD_SHUTDOWN = 0x02,           // Emergency shutdown command
    CMD_START_EXPERIMENT = 0x03,   // Authorize experiment execution
    CMD_DIGIPEAT = 0x04,          // Message to be repeated
    CMD_CLEAR_BUFFER = 0x05,      // Clear digipeater buffer
    CMD_STATUS_REQUEST = 0x06     // Request satellite status
} CommandType;

// Structure for secure command verification
typedef struct {
    uint8_t iv[16];                // Initialization vector for encryption
    uint8_t encryptedData[80];     // Encrypted command data
    uint8_t hmac[32];              // Message authentication code
} SecureCommand;

// Structure for processed radio messages
typedef struct {
    uint8_t securityKey[SECURITY_KEY_LENGTH];  // Security key for verification
    CommandType cmd;                           // Command type
    uint8_t data[64];                         // Command payload
    uint8_t length;                           // Length of payload
    uint32_t timestamp;                       // Time message was received
    uint8_t priority;                         // Message priority level
    uint8_t retries;                         // Number of transmission attempts
} RadioMessage;

// Security status enumeration
typedef enum {
    SEC_SUCCESS = 0,           // Security verification passed
    SEC_INVALID_KEY,           // Invalid security key
    SEC_CORRUPTED_DATA,        // Data corruption detected
    SEC_INVALID_HMAC          // Invalid message authentication code
} SecurityStatus;

// Function prototypes
void initDigipeater(void);                    // Initialize digipeater subsystem
void TaskCommRead(void);                      // High-priority receive task
SecurityStatus verifyAndDecryptCommand(
    const SecureCommand* cmd,                 // Verify and decrypt incoming commands
    uint8_t* decryptedData
);
void logSecurityEvent(SecurityStatus status);  // Log security-related events

#endif // DIGIPEATER_H