#include "eps_driver.h"
#include <stdio.h>

// Initialize EPS communication
uint8_t EPS_Init(void) {
    // Initialize I2C first
    I2C_Init();
    
    // Test basic communication with EPS
    i2c_result_t result = I2C_SendCommand(EPS_I2C_ADDRESS, EPS_CMD_BOARD_STATUS, 0x00);
    
    if (result.success) {
        printf("EPS communication established\n");
        return 1;  // Success
    } else {
        printf("EPS communication failed\n");
        return 0;  // Failure
    }
}

// Get board status from EPS
eps_status_t EPS_GetBoardStatus(void) {
    eps_status_t status = {0};
    
    i2c_result_t result = I2C_SendCommand(EPS_I2C_ADDRESS, EPS_CMD_BOARD_STATUS, 0x00);
    
    if (result.success && result.bytes_received >= 2) {
        uint8_t status_byte0 = result.data[0];
        
        // Parse status bits according to Clyde Space documentation
        status.command_recognized = (status_byte0 & 0x01) ? 0 : 1;  // Inverted - 0 = OK
        status.watchdog_error = (status_byte0 & 0x02) ? 1 : 0;
        status.data_error = (status_byte0 & 0x04) ? 1 : 0;
        status.channel_error = (status_byte0 & 0x08) ? 1 : 0;
        status.eeprom_error = (status_byte0 & 0x10) ? 1 : 0;
        status.power_on_reset = (status_byte0 & 0x20) ? 1 : 0;
        status.brown_out_reset = (status_byte0 & 0x40) ? 1 : 0;
        
        // Store extended status bytes if available
        for (uint8_t i = 1; i < result.bytes_received && i <= 3; i++) {
            status.extended_status[i-1] = result.data[i];
        }
    }
    
    return status;
}

// Get telemetry data from EPS
i2c_result_t EPS_GetTelemetry(void) {
    return I2C_SendCommand(EPS_I2C_ADDRESS, EPS_CMD_GET_TELEMETRY, 0x00);
}

// Print EPS status in human-readable format
void EPS_PrintStatus(eps_status_t status) {
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
        
        // Show extended status only if there are errors
        printf("  Extended Status: 0x%02X 0x%02X 0x%02X\n",
               status.extended_status[0], 
               status.extended_status[1], 
               status.extended_status[2]);
    }
}

// Check if EPS is healthy (no critical errors)
uint8_t EPS_IsHealthy(eps_status_t status) {
    // EPS is considered healthy if no critical errors are present
    if (!status.command_recognized || //First make sure we are actually attached to it
        status.watchdog_error || status.data_error || 
        status.channel_error || status.eeprom_error) {
        return 0;  // Not healthy
    }
    
    // Power-on reset and brown-out reset are informational, not critical
    return 1;  // Healthy
}
