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
#include <stdbool.h>
#include <stdint.h>
#include "satellite_defs.h"

// Constants
#define MAX_STORED_MESSAGES 10
#define SECURITY_KEY_LENGTH 32
#define MAX_MESSAGE_AGE 3600  // 1 hour in ticks

// Type definitions
typedef struct {
    uint8_t cmd;
    uint32_t timestamp;
    uint8_t data[64];
} RadioMessage;

typedef struct {
    uint8_t data[128];
    uint8_t length;
} SecureCommand;

typedef enum {
    SEC_SUCCESS,
    SEC_INVALID_KEY,
    SEC_FAILED_DECRYPT
} SecurityStatus;

// Command definitions
#define CMD_PING              0x01
#define CMD_SHUTDOWN          0x02
#define CMD_START_EXPERIMENT  0x03
#define CMD_DIGIPEAT          0x04
#define CMD_CLEAR_BUFFER      0x05
#define CMD_STATUS_REQUEST    0x06

// Function declarations
void initDigipeater(void);
void TaskCommRead(void);
void TaskCommunication(void);

// Hardware interface functions
bool receiveMessage(SecureCommand* cmd);
bool transmitMessage(const RadioMessage* msg);
void performEmergencyShutdown(void);

// Security functions
SecurityStatus verifyAndDecryptCommand(const SecureCommand* cmd, uint8_t* decryptedData);
void logSecurityEvent(SecurityStatus status);

#endif // DIGIPEATER_H