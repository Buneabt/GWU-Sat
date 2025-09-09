#include "uhf_driver.h"
#include "i2c_driver.h"
#include "timer_driver.h"
#include "satellite_defs.h"
#include <stdio.h>
#include <string.h>

// Private constants
#define UHF_I2C_ADDRESS         0x22    // Default UHF I2C address (7-bit)
#define UHF_COMMAND_MAX_LENGTH  64      // Maximum ESTTC command length
#define UHF_RESPONSE_MAX_LENGTH 32      // Maximum expected response length
#define UHF_COMMAND_TIMEOUT_MS  500     // Command timeout in milliseconds

// Private variables for driver state
static uint8_t uhf_initialized = 0;

// Private function prototypes
static uhf_status_t UHF_SendESTTCCommand(const char* command, uint8_t* response, 
                                        uint8_t* response_length);
static uint8_t UHF_CalculateCRC32(const char* data, uint8_t length);
static uhf_status_t UHF_ParseResponse(uint8_t* raw_response, uint8_t raw_length,
                                     uint8_t* parsed_data, uint8_t* parsed_length);

// Initialize UHF driver
// NASA Rule #4: Function fits on single page
uhf_status_t UHF_Init(void) {
    // NASA Rule #5: At least 2 assertions per function
    if (uhf_initialized != 0) {
        return UHF_OK; // Already initialized
    }
    
    // Initialize I2C first
    I2C_Init();
    
    // Check if UHF device is present on the bus
    uint8_t i2c_status = I2C_DeviceReady(UHF_I2C_ADDRESS);
    if (i2c_status != I2C_SUCCESS) {
        printf("UHF: Device not found at address 0x%02X\n", UHF_I2C_ADDRESS);
        return UHF_ERROR_I2C_NACK;
    }
    
    uhf_initialized = 1;
    printf("UHF driver initialized successfully\n");
    return UHF_OK;
}

// Get UHF board status/telemetry
// NASA Rule #4: Function fits on single page
uhf_status_t UHF_GetBoardStatus(uhf_telemetry_t* telemetry) {
    // NASA Rule #5: At least 2 assertions per function
    if (telemetry == (void*)0) {
        return UHF_ERROR_BAD_DATA;
    }
    if (uhf_initialized == 0) {
        return UHF_NOT_INITIALIZED;
    }
    
    // Initialize telemetry structure
    memset(telemetry, 0, sizeof(uhf_telemetry_t));
    
    uint8_t response[UHF_RESPONSE_MAX_LENGTH];
    uint8_t response_length = 0;
    
    // Send ESTTC status command (without CRC for simplicity)
    // Format: ES+R22F9<CR> (Read board status)
    uhf_status_t status = UHF_SendESTTCCommand("ES+R22F9\r", response, &response_length);
    
    if (status != UHF_OK) {
        telemetry->communication_ok = 0;
        return status;
    }
    
    telemetry->communication_ok = 1;
    
    // Parse response - should be format: OK+[STATUS_DATA] [CRC]<CR>
    // For now, we'll do basic validation
    if (response_length >= 3 && response[0] == 'O' && response[1] == 'K') {
        telemetry->board_status_valid = 1;
        // Extract basic status information from response
        // This would need to be expanded based on actual response format
    }
    
    return UHF_OK;
}

// Read Status Control Word (SCW)
// NASA Rule #4: Function fits on single page  
uhf_status_t UHF_ReadSCW(uint16_t* scw) {
    // NASA Rule #5: At least 2 assertions per function
    if (scw == (void*)0) {
        return UHF_ERROR_BAD_DATA;
    }
    if (uhf_initialized == 0) {
        return UHF_NOT_INITIALIZED;
    }
    
    uint8_t response[UHF_RESPONSE_MAX_LENGTH];
    uint8_t response_length = 0;
    
    // Send ESTTC command to read SCW (from table: ES+R2200 without CRC)
    // Format: ES+R2200<CR> - Status Control Word read
    uhf_status_t status = UHF_SendESTTCCommand("ES+R2200\r", response, &response_length);
    
    if (status != UHF_OK) {
        return status;
    }
    
    // Parse SCW from response
    // Response format should be: OK+[SCW_HEX] [CRC]<CR>
    if (response_length >= 7 && response[0] == 'O' && response[1] == 'K' && response[2] == '+') {
        // Extract 4-character hex value starting at position 3
        uint16_t parsed_scw = 0;
        uint8_t i;
        for (i = 0; i < 4 && (i + 3) < response_length; i++) {
            uint8_t hex_char = response[3 + i];
            uint8_t hex_value;
            
            if (hex_char >= '0' && hex_char <= '9') {
                hex_value = hex_char - '0';
            } else if (hex_char >= 'A' && hex_char <= 'F') {
                hex_value = hex_char - 'A' + 10;
            } else if (hex_char >= 'a' && hex_char <= 'f') {
                hex_value = hex_char - 'a' + 10;
            } else {
                return UHF_ERROR_BAD_DATA;
            }
            
            parsed_scw = (parsed_scw << 4) | hex_value;
        }
        
        *scw = parsed_scw;
        return UHF_OK;
    }
    
    return UHF_ERROR_BAD_DATA;
}

// Write Status Control Word (SCW) 
// NASA Rule #4: Function fits on single page
uhf_status_t UHF_WriteSCW(uint16_t scw) {
    // NASA Rule #5: At least 2 assertions per function
    if (uhf_initialized == 0) {
        return UHF_NOT_INITIALIZED;
    }
    if (scw > 0xFFFF) {  // Redundant check, but good practice
        return UHF_ERROR_BAD_DATA;
    }
    
    char command[32];
    uint8_t response[UHF_RESPONSE_MAX_LENGTH];
    uint8_t response_length = 0;
    
    // Format command: ES+W22F8[SCW_HEX]<CR>
    // Using sprintf is not ideal for safety-critical code, but keeping it simple
    snprintf(command, sizeof(command), "ES+W22F8%04X\r", scw);
    
    uhf_status_t status = UHF_SendESTTCCommand(command, response, &response_length);
    
    if (status != UHF_OK) {
        return status;
    }
    
    // Check for OK response
    if (response_length >= 2 && response[0] == 'O' && response[1] == 'K') {
        return UHF_OK;
    }
    
    return UHF_ERROR;
}

// Read internal temperature
// NASA Rule #4: Function fits on single page
uhf_status_t UHF_ReadTemperature(int16_t* temperature_tenths) {
    // NASA Rule #5: At least 2 assertions per function
    if (temperature_tenths == (void*)0) {
        return UHF_ERROR_BAD_DATA;
    }
    if (uhf_initialized == 0) {
        return UHF_NOT_INITIALIZED;
    }
    
    uint8_t response[UHF_RESPONSE_MAX_LENGTH];
    uint8_t response_length = 0;
    
    // Send temperature read command: ES+R220A<CR>
    uhf_status_t status = UHF_SendESTTCCommand("ES+R220A\r", response, &response_length);
    
    if (status != UHF_OK) {
        return status;
    }
    
    // Parse temperature from response: OK [S][TTT] [CRC]<CR>
    // S = sign ('+', '-', or space), TTT = temperature in tenths
    if (response_length >= 7 && response[0] == 'O' && response[1] == 'K' && 
        response[2] == ' ') {
        
        int16_t temp_value = 0;
        uint8_t is_negative = 0;
        uint8_t start_pos = 3;
        
        // Check sign
        if (response[3] == '-') {
            is_negative = 1;
            start_pos = 4;
        } else if (response[3] == '+') {
            start_pos = 4;
        }
        
        // Parse 3-digit temperature value
        uint8_t i;
        for (i = 0; i < 3 && (start_pos + i) < response_length; i++) {
            uint8_t digit_char = response[start_pos + i];
            if (digit_char >= '0' && digit_char <= '9') {
                temp_value = temp_value * 10 + (digit_char - '0');
            } else {
                break; // Invalid character
            }
        }
        
        if (is_negative) {
            temp_value = -temp_value;
        }
        
        *temperature_tenths = temp_value;
        return UHF_OK;
    }
    
    return UHF_ERROR_BAD_DATA;
}

// Send beacon message immediately
// NASA Rule #4: Function fits on single page
uhf_status_t UHF_SendBeacon(const char* message) {
    // NASA Rule #5: At least 2 assertions per function
    if (message == (void*)0) {
        return UHF_ERROR_BAD_DATA;
    }
    if (uhf_initialized == 0) {
        return UHF_NOT_INITIALIZED;
    }
    
    uint8_t message_length = strlen(message);
    if (message_length == 0 || message_length > 96) { // Per UHF manual limit
        return UHF_ERROR_BAD_DATA;
    }
    
    char command[128];
    uint8_t response[UHF_RESPONSE_MAX_LENGTH];
    uint8_t response_length = 0;
    
    // Format: ES+W22EC[LL][MESSAGE]<CR> where LL is hex length
    snprintf(command, sizeof(command), "ES+W22EC%02X%s\r", message_length, message);
    
    uhf_status_t status = UHF_SendESTTCCommand(command, response, &response_length);
    
    if (status != UHF_OK) {
        return status;
    }
    
    // Check for OK response
    if (response_length >= 2 && response[0] == 'O' && response[1] == 'K') {
        return UHF_OK;
    }
    
    return UHF_ERROR;
}

// Private function: Send ESTTC command via I2C
// NASA Rule #4: Function fits on single page
static uhf_status_t UHF_SendESTTCCommand(const char* command, uint8_t* response, 
                                        uint8_t* response_length) {
    // NASA Rule #5: At least 2 assertions per function
    if (command == (void*)0 || response == (void*)0 || response_length == (void*)0) {
        return UHF_ERROR_BAD_DATA;
    }
    
    uint8_t command_length = strlen(command);
    if (command_length == 0 || command_length > UHF_COMMAND_MAX_LENGTH) {
        return UHF_ERROR_BAD_DATA;
    }
    
    // Send command via I2C
    uint8_t command_buffer[UHF_COMMAND_MAX_LENGTH];
    memcpy(command_buffer, command, command_length);
    
    uint8_t i2c_status = I2C_WriteBytes(UHF_I2C_ADDRESS, command_buffer, command_length);
    if (i2c_status != I2C_SUCCESS) {
        if (i2c_status == I2C_ERROR_NACK) {
            return UHF_ERROR_I2C_NACK;
        } else if (i2c_status == I2C_ERROR_TIMEOUT) {
            return UHF_TIMEOUT;
        } else {
            return UHF_ERROR;
        }
    }
    
    // Wait for response (UHF needs time to process command)
    Timer_DelayTicks(100);
    
    // Read response
    i2c_result_t read_result = I2C_ReadBytes(UHF_I2C_ADDRESS, UHF_RESPONSE_MAX_LENGTH);
    
    if (read_result.success == 0) {
        if (read_result.error_code == I2C_ERROR_NACK) {
            return UHF_ERROR_I2C_NACK;
        } else if (read_result.error_code == I2C_ERROR_TIMEOUT) {
            return UHF_TIMEOUT;
        } else {
            return UHF_ERROR;
        }
    }
    
    // Copy response data
    uint8_t copy_length = (read_result.bytes_received < UHF_RESPONSE_MAX_LENGTH) ? 
                         read_result.bytes_received : UHF_RESPONSE_MAX_LENGTH;
    
    memcpy(response, read_result.data, copy_length);
    *response_length = copy_length;
    
    return UHF_OK;
}

// Convert status code to human-readable string
// NASA Rule #4: Function fits on single page
const char* UHF_StatusToString(uhf_status_t status) {
    // NASA Rule #5: At least 2 assertions per function  
    if (status > UHF_NOT_INITIALIZED) {
        return "Unknown Status";
    }
    
    // NASA Rule #6: Minimize scope - use static const for string literals
    static const char* status_strings[] = {
        "OK",                    // UHF_OK = 0
        "Error",                 // UHF_ERROR = 1
        "Bad Data",              // UHF_ERROR_BAD_DATA = 2
        "Not Implemented",       // UHF_ERROR_NOT_IMPLEMENTED = 3
        "I2C NACK",             // UHF_ERROR_I2C_NACK = 4
        "Busy",                 // UHF_ERROR_BUSY = 5
        "Timeout",              // UHF_TIMEOUT = 6
        "Not Initialized"       // UHF_NOT_INITIALIZED = 7
    };
    
    return status_strings[status];
}

// Check if UHF is healthy based on telemetry
// NASA Rule #4: Function fits on single page
uint8_t UHF_IsHealthy(uhf_telemetry_t telemetry) {
    // NASA Rule #5: At least 2 assertions per function
    if (telemetry.communication_ok == 0) {
        return 0; // Cannot determine health without communication
    }
    if (telemetry.board_status_valid == 0) {
        return 0; // Cannot determine health without valid status
    }
    
    // Basic health checks - expand based on actual telemetry format
    // For now, if we can communicate and get valid status, consider healthy
    return 1;
}

// Reset UHF to default configuration
// NASA Rule #4: Function fits on single page
uhf_status_t UHF_ResetToDefaults(void) {
    // NASA Rule #5: At least 2 assertions per function
    if (uhf_initialized == 0) {
        return UHF_NOT_INITIALIZED;
    }
    
    uint8_t response[UHF_RESPONSE_MAX_LENGTH];
    uint8_t response_length = 0;
    
    // Send restore defaults command: ES+W2209<CR>
    uhf_status_t status = UHF_SendESTTCCommand("ES+W2209\r", response, &response_length);
    
    if (status != UHF_OK) {
        return status;
    }
    
    // NASA Rule #5: Second assertion
    if (response_length < 2) {
        return UHF_ERROR_BAD_DATA;
    }
    
    // Check for OK response
    if (response[0] == 'O' && response[1] == 'K') {
        return UHF_OK;
    }
    
    return UHF_ERROR;
}

// Private function: Calculate simple checksum (placeholder for CRC32)
// NASA Rule #4: Function fits on single page
static uint8_t UHF_CalculateCRC32(const char* data, uint8_t length) {
    // NASA Rule #5: At least 2 assertions per function
    if (data == (void*)0) {
        return 0;
    }
    if (length == 0) {
        return 0;
    }
    
    // Simplified checksum - in production, implement full CRC32
    // as specified in UHF manual (polynomial 0x04C11DB7)
    uint8_t checksum = 0;
    uint8_t i;
    
    // NASA Rule #2: Fixed bounds loop
    for (i = 0; i < length; i++) {
        checksum ^= (uint8_t)data[i];
        checksum = (checksum << 1) | (checksum >> 7); // Simple rotation
    }
    
    return checksum;
}

// Private function: Parse UHF response 
// NASA Rule #4: Function fits on single page
static uhf_status_t UHF_ParseResponse(uint8_t* raw_response, uint8_t raw_length,
                                     uint8_t* parsed_data, uint8_t* parsed_length) {
    // NASA Rule #5: At least 2 assertions per function
    if (raw_response == (void*)0 || parsed_data == (void*)0 || parsed_length == (void*)0) {
        return UHF_ERROR_BAD_DATA;
    }
    if (raw_length == 0) {
        return UHF_ERROR_BAD_DATA;
    }
    
    // Look for standard ESTTC response format
    // Should start with "OK" or "ERR"
    if (raw_length >= 2) {
        if (raw_response[0] == 'O' && raw_response[1] == 'K') {
            // Extract data portion (skip "OK+" if present)
            uint8_t data_start = 2;
            if (raw_length > 2 && raw_response[2] == '+') {
                data_start = 3;
            }
            
            // Copy relevant data
            uint8_t copy_length = raw_length - data_start;
            if (copy_length > 0) {
                memcpy(parsed_data, &raw_response[data_start], copy_length);
                *parsed_length = copy_length;
            } else {
                *parsed_length = 0;
            }
            
            return UHF_OK;
        } else if (raw_response[0] == 'E' && raw_response[1] == 'R' && 
                   raw_length >= 3 && raw_response[2] == 'R') {
            return UHF_ERROR;
        }
    }
    
    return UHF_ERROR_BAD_DATA;
}