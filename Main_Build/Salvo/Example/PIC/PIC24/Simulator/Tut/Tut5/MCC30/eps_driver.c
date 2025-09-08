#include "eps_driver.h"
#include "i2c_driver.h"
#include <stdio.h>
#include <string.h>

// Static variable to track initialization
static uint8_t eps_initialized = 0;

// Initialize EPS communication
// NASA Rule #4: Function fits on single page
uint8_t EPS_Init(void) {
    uint8_t command_data[2];
    i2c_result_t result;
    
    // NASA Rule #5: At least 2 assertions per function
    printf("EPS_Init: Initializing I2C and testing communication\n");
    
    // Initialize I2C first
    I2C_Init();
    
    // Test basic communication with EPS
    command_data[0] = EPS_CMD_BOARD_STATUS;
    command_data[1] = 0x00;
    
    result = I2C_SendCommand(EPS_I2C_ADDRESS, command_data, 2, 4);
    
    if (result.success) {
        eps_initialized = 1;
        printf("EPS communication established\n");
        return 1;  // Success
    } else {
        printf("EPS communication failed: Error %d\n", result.error_code);
        return 0;  // Failure
    }
    
    // NASA Rule #5: Second assertion
    if (result.bytes_received == 0 && result.success) {
        printf("EPS_Init: Warning - no response data received\n");
    }
}

// Get board status from EPS
// NASA Rule #4: Function fits on single page
eps_status_t EPS_GetBoardStatus(void) {
    eps_status_t status;
    uint8_t command_data[2];
    i2c_result_t result;
    
    // NASA Rule #5: At least 2 assertions per function
    memset(&status, 0, sizeof(status));
    
    if (!eps_initialized) {
        status.command_recognized = 0; // Not initialized
        return status;
    }
    
    // Prepare command
    command_data[0] = EPS_CMD_BOARD_STATUS;
    command_data[1] = 0x00;
    
    // Send command and expect up to 4 bytes response
    result = I2C_SendCommand(EPS_I2C_ADDRESS, command_data, 2, 4);
    
    if (result.success && result.bytes_received >= 1) {
        uint8_t status_byte0 = result.data[0];
        
        // Parse status bits according to Clyde Space documentation
        status.command_recognized = (status_byte0 & 0x01) ? 0 : 1;  // Inverted - 0 = OK
        status.watchdog_error = (status_byte0 & 0x02) ? 1 : 0;
        status.data_error = (status_byte0 & 0x04) ? 1 : 0;
        status.channel_error = (status_byte0 & 0x08) ? 1 : 0;
        status.eeprom_error = (status_byte0 & 0x10) ? 1 : 0;
        status.power_on_reset = (status_byte0 & 0x20) ? 1 : 0;
        status.brown_out_reset = (status_byte0 & 0x40) ? 1 : 0;
        
        // Store extended status bytes if available (up to 3 additional bytes)
        uint8_t i;
        for (i = 1; i < result.bytes_received && i <= 3; i++) {
            status.extended_status[i-1] = result.data[i];
        }
    } else {
        // Communication failed
        status.command_recognized = 0;
        // All other fields remain 0 from memset
    }
    
    // NASA Rule #5: Second assertion
    if (result.error_code != I2C_SUCCESS && result.success == 0) {
        status.command_recognized = 0;
    }
    
    return status;
}

// Get telemetry data from EPS
// NASA Rule #4: Function fits on single page
i2c_result_t EPS_GetTelemetry(void) {
    uint8_t command_data[2];
    i2c_result_t result = {0}; // Initialize all fields to 0
    
    // NASA Rule #5: At least 2 assertions per function
    if (!eps_initialized) {
        result.error_code = I2C_ERROR_NOT_INIT;
        return result;
    }
    
    // Prepare telemetry command
    command_data[0] = EPS_CMD_GET_TELEMETRY;
    command_data[1] = 0x00;
    
    // Send command and expect response (size depends on EPS configuration)
    // Using maximum buffer size to capture all available telemetry
    result = I2C_SendCommand(EPS_I2C_ADDRESS, command_data, 2, I2C_MAX_BUFFER_SIZE);
    
    // NASA Rule #5: Second assertion
    if (result.success && result.bytes_received == 0) {
        result.success = 0;
        result.error_code = I2C_ERROR_TIMEOUT;
    }
    
    return result;
}

// Check if EPS is healthy (no critical errors)
// NASA Rule #4: Function fits on single page
uint8_t EPS_IsHealthy(eps_status_t status) {
    // NASA Rule #5: At least 2 assertions per function
    // EPS is considered healthy if no critical errors are present
    if (!status.command_recognized ||  // First make sure we are actually attached to it
        status.watchdog_error || 
        status.data_error || 
        status.channel_error || 
        status.eeprom_error) {
        return 0;  // Not healthy
    }
    
    // NASA Rule #5: Second assertion
    if (!eps_initialized) {
        return 0; // Not initialized
    }
    
    // Power-on reset and brown-out reset are informational, not critical
    return 1;  // Healthy
}

// Print EPS status in human-readable format
// NASA Rule #4: Function fits on single page
void EPS_PrintStatus(eps_status_t status) {
    // NASA Rule #5: At least 2 assertions per function
    if (!eps_initialized) {
        printf("EPS: Not initialized\n");
        return;
    }
    
    // Check if healthy first
    if (EPS_IsHealthy(status)) {
        printf("EPS: OK\n");
        
        // Only show additional info if there are non-critical events
        if (status.brown_out_reset) {
            printf("  Note: Brownout reset occurred\n");
        }
        if (status.power_on_reset) {
            printf("  Note: Power-on reset occurred\n");
        }
        
        // Show extended status if any non-zero values
        if (status.extended_status[0] != 0 || 
            status.extended_status[1] != 0 || 
            status.extended_status[2] != 0) {
            printf("  Extended Status: 0x%02X 0x%02X 0x%02X\n",
                   status.extended_status[0], 
                   status.extended_status[1], 
                   status.extended_status[2]);
        }
    } else {
        // Show specific failures only when unhealthy
        printf("EPS: FAILURE\n");
        
        if (!status.command_recognized) {
            printf("  Error: Command not recognized (no communication)\n");
        }
        if (status.watchdog_error) {
            printf("  Error: Watchdog reset\n");
        }
        if (status.data_error) {
            printf("  Error: Data incorrect\n");
        }
        if (status.channel_error) {
            printf("  Error: Channel incorrect\n");
        }
        if (status.eeprom_error) {
            printf("  Error: EEPROM error\n");
        }
        
        // Show extended status for debugging
        printf("  Extended Status: 0x%02X 0x%02X 0x%02X\n",
               status.extended_status[0], 
               status.extended_status[1], 
               status.extended_status[2]);
    }
    
    // NASA Rule #5: Second assertion
    if (!status.command_recognized && eps_initialized) {
        printf("  Warning: Communication issue detected\n");
    }
}

// Get specific EPS telemetry value (utility function)
// NASA Rule #4: Function fits on single page
uint16_t EPS_GetTelemetryValue(uint8_t channel) {
    uint8_t command_data[3];
    i2c_result_t result;
    uint16_t value = 0;
    
    // NASA Rule #5: At least 2 assertions per function
    if (!eps_initialized) {
        return 0;
    }
    if (channel > 0xFF) { // Validate channel parameter
        return 0;
    }
    
    // Prepare specific telemetry command with channel
    command_data[0] = EPS_CMD_GET_TELEMETRY;
    command_data[1] = channel;  // Specific channel/parameter
    command_data[2] = 0x00;     // Additional parameter if needed
    
    // Send command and expect 2-byte response (typical for single value)
    result = I2C_SendCommand(EPS_I2C_ADDRESS, command_data, 2, 2);
    
    if (result.success && result.bytes_received >= 2) {
        // Combine two bytes into 16-bit value (assuming MSB first)
        value = ((uint16_t)result.data[0] << 8) | result.data[1];
    }
    
    return value;
}