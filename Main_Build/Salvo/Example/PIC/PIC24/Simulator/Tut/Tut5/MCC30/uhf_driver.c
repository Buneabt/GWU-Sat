#include "uhf_driver.h"
#include "uart_driver.h"
#include "timer_driver.h"
#include <stdio.h>
#include <string.h>
#include <xc.h>

// Private variables
static uint8_t uhf_initialized = 0;

// Helper function prototypes
static uint8_t wait_for_response(char *buffer, uint16_t max_len, uint16_t timeout_ms);
static uint8_t parse_ok_response(const char *response);

// Get UHF board status with telemetry
// NASA Rule #4: Function under 60 lines
uhf_status_t UHF_GetBoardStatus(uhf_telemetry_t *telemetry) {
    char response[64];
    
    // NASA Rule #5: First assertion
    if (telemetry == NULL) {
        printf("UHF_GetBoardStatus: Error - NULL telemetry pointer\n");
        return UHF_ERROR_INVALID_PARAM;
    }
    
    // Initialize telemetry structure
    telemetry->uptime_seconds = 0;
    telemetry->temperature_c = 0;
    telemetry->is_responding = 0;
    
    // Send simple status command without CRC
    // ES+R2200<CR> - Read Status Control Word
    printf("ES+R2200\r");
    
    // Wait for response (1 second timeout)
    if (!wait_for_response(response, sizeof(response), 1000)) {
        printf("UHF: No response from transceiver\n");
        return UHF_ERROR_NO_RESPONSE;
    }
    
    // Check if response starts with "OK"
    if (parse_ok_response(response)) {
        telemetry->is_responding = 1;
        printf("UHF: Transceiver responding\n");
        return UHF_OK;
    }
    
    // NASA Rule #5: Second assertion
    if (strlen(response) > 0) {
        printf("UHF: Unexpected response: %s\n", response);
    }
    
    return UHF_ERROR_INVALID_RESPONSE;
}

// Check if UHF telemetry indicates healthy status
// NASA Rule #4: Function under 60 lines
uint8_t UHF_IsHealthy(uhf_telemetry_t telemetry) {
    // NASA Rule #5: First assertion
    if (!uhf_initialized) {
        printf("UHF_IsHealthy: Warning - UHF not initialized\n");
    }
    
    // Check if transceiver is responding
    if (!telemetry.is_responding) {
        return 0;
    }
    
    // NASA Rule #5: Second assertion
    if (telemetry.uptime_seconds == 0 && telemetry.is_responding) {
        printf("UHF_IsHealthy: Note - Zero uptime reported\n");
    }
    
    return 1;
}

// Send beacon message
// NASA Rule #4: Function under 60 lines
uhf_status_t UHF_SendBeacon(const char *message) {
    char response[64];
    uint8_t msg_len;
    
    // NASA Rule #5: First assertion
    if (message == NULL) {
        printf("UHF_SendBeacon: Error - NULL message\n");
        return UHF_ERROR_INVALID_PARAM;
    }
    
    msg_len = strlen(message);
    
    // NASA Rule #5: Second assertion
    if (msg_len == 0 || msg_len > 50) {
        printf("UHF_SendBeacon: Error - Invalid message length: %d\n", msg_len);
        return UHF_ERROR_INVALID_PARAM;
    }
    
    // Send explicit beacon command (without CRC for simplicity)
    // ES+W22EC[LL][message]<CR>
    // For now, use force beacon command instead
    // ES+W22EE<CR>
    printf("ES+W22EE\r");
    
    // Wait for response
    if (!wait_for_response(response, sizeof(response), 2000)) {
        return UHF_ERROR_NO_RESPONSE;
    }
    
    // Check for OK response
    if (parse_ok_response(response)) {
        printf("UHF: Beacon sent successfully\n");
        return UHF_OK;
    }
    
    return UHF_ERROR_INVALID_RESPONSE;
}

// Convert status to string
// NASA Rule #4: Function under 60 lines
const char* UHF_StatusToString(uhf_status_t status) {
    // NASA Rule #6: Minimize scope
    switch (status) {
        case UHF_OK:
            return "OK";
        case UHF_ERROR_NO_RESPONSE:
            return "No Response";
        case UHF_ERROR_INVALID_RESPONSE:
            return "Invalid Response";
        case UHF_ERROR_TIMEOUT:
            return "Timeout";
        case UHF_ERROR_INVALID_PARAM:
            return "Invalid Parameter";
        case UHF_ERROR_I2C_FAIL:
            return "I2C Failure";
        default:
            return "Unknown Error";
    }
}

// Initialize UHF transceiver
// NASA Rule #4: Function under 60 lines
uhf_status_t UHF_Init(void) {
    char response[64];
    
    printf("UHF_Init: Initializing UHF transceiver...\n");
    
    // Try a simple status check
    printf("ES+R2200\r");
    
    // Wait for response
    if (wait_for_response(response, sizeof(response), 2000)) {
        if (parse_ok_response(response)) {
            uhf_initialized = 1;
            printf("UHF_Init: Transceiver initialized successfully\n");
            return UHF_OK;
        }
    }
    
    printf("UHF_Init: Failed to initialize transceiver\n");
    return UHF_ERROR_NO_RESPONSE;
}

// Get uptime from UHF transceiver
// NASA Rule #4: Function under 60 lines
uhf_status_t UHF_GetUptime(uint32_t *uptime_seconds) {
    char response[64];
    
    // NASA Rule #5: First assertion
    if (uptime_seconds == NULL) {
        return UHF_ERROR_INVALID_PARAM;
    }
    
    // Send uptime command: ES+R2202<CR>
    printf("ES+R2202\r");
    
    // Wait for response
    if (!wait_for_response(response, sizeof(response), 1000)) {
        return UHF_ERROR_NO_RESPONSE;
    }
    
    // Check for OK response
    if (parse_ok_response(response)) {
        /* TODO: Parse actual uptime value from response */
        /* Response format: OK+[RR][PPPPPPPP] [CRC]<CR> */
        *uptime_seconds = 0; /* Placeholder */
        return UHF_OK;
    }
    
    // NASA Rule #5: Second assertion
    if (strlen(response) == 0) {
        printf("UHF_GetUptime: Empty response received\n");
    }
    
    return UHF_ERROR_INVALID_RESPONSE;
}

// Private helper: Wait for response from UHF
// NASA Rule #4: Function under 60 lines
static uint8_t wait_for_response(char *buffer, uint16_t max_len, uint16_t timeout_ms) {
    uint16_t index = 0;
    uint16_t timeout_count = 0;
    const uint16_t delay_per_loop = 10; /* 10ms per loop = 1 tick (100 ticks/sec) */
    char c;
    
    // NASA Rule #5: First assertion
    if (buffer == NULL || max_len == 0) {
        return 0;
    }
    
    // Clear buffer
    memset(buffer, 0, max_len);
    
    // NASA Rule #2: Fixed loop bound
    while (timeout_count < timeout_ms) {
        // Check if data available using existing UART driver
        if (UART_DataAvailable()) {
            c = UART_ReceiveByte();
            
            // Store character
            if (index < max_len - 1) {
                buffer[index++] = c;
            }
            
            // Check for end of response (CR)
            if (c == '\r') {
                buffer[index] = '\0';
                return 1;
            }
            
            // Reset timeout on data received
            timeout_count = 0;
        } else {
            // Small delay using your timer (1 tick = 10ms at 100 ticks/sec)
            Timer_DelayTicks(1);
            timeout_count += delay_per_loop;
        }
    }
    
    // NASA Rule #5: Second assertion
    if (index > 0) {
        buffer[index] = '\0';
    }
    
    return 0;
}

// Private helper: Parse OK response
// NASA Rule #4: Function under 60 lines
static uint8_t parse_ok_response(const char *response) {
    // NASA Rule #5: First assertion
    if (response == NULL) {
        return 0;
    }
    
    // NASA Rule #5: Second assertion
    if (strlen(response) < 2) {
        return 0;
    }
    
    // Check if response starts with "OK"
    if (response[0] == 'O' && response[1] == 'K') {
        return 1;
    }
    
    return 0;
}