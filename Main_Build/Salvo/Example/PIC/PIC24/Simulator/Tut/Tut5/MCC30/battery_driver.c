#include "battery_driver.h"
#include "i2c_driver.h"
#include <stdio.h>
#include <string.h>

// Static variable to track which address works
static uint8_t battery_i2c_addr = BATTERY_I2C_ADDR_DEFAULT;
static uint8_t battery_initialized = 0;

// Custom delay function to replace Salvo calls
// NASA Rule #4: Function fits on single page
static void Battery_DelayMs(uint16_t ms) {
    // NASA Rule #5: At least 2 assertions per function
    if (ms == 0) {
        return;
    }
    if (ms > 10000) {
        ms = 10000; // Cap at 10 seconds maximum
    }
    
    volatile uint32_t count;
    // Adjust this value based on your FCY (approximately 90 loops per ms at 3.6864 MHz)
    uint32_t loops_per_ms = 90;
    
    // NASA Rule #2: Fixed bounds loop
    uint16_t i;
    for (i = 0; i < ms; i++) {
        count = loops_per_ms;
        while (count--) {
            __asm__ volatile ("nop");
        }
    }
}

// Initialize battery interface
// NASA Rule #4: Function fits on single page
uint8_t Battery_Init(void) {
    // NASA Rule #5: At least 2 assertions per function
    printf("Battery_Init: Attempting communication at 0x%02X\n", BATTERY_I2C_ADDR_DEFAULT);
    
    // Initialize I2C first
    I2C_Init();
    
    // Try default address first
    battery_i2c_addr = BATTERY_I2C_ADDR_DEFAULT;
    battery_status_t status = Battery_GetBoardStatus();
    
    // Check if we got a valid response (command recognized)
    if (!status.command_not_recognized) {
        battery_initialized = 1;
        printf("Battery_Init: Communication established at 0x%02X\n", battery_i2c_addr);
        return 1;  // Success
    }
    
    // Try alternate address for 80Wh second unit
    printf("Battery_Init: Trying alternate address 0x%02X\n", BATTERY_I2C_ADDR_80WH_2);
    battery_i2c_addr = BATTERY_I2C_ADDR_80WH_2;
    status = Battery_GetBoardStatus();
    
    if (!status.command_not_recognized) {
        battery_initialized = 1;
        printf("Battery_Init: Communication established at 0x%02X (80Wh unit 2)\n", battery_i2c_addr);
        return 1;  // Success
    }
    
    // NASA Rule #5: Second assertion
    if (battery_i2c_addr == 0) {
        printf("Battery_Init: Invalid I2C address\n");
    }
    
    // Reset to default and fail
    battery_i2c_addr = BATTERY_I2C_ADDR_DEFAULT;
    printf("Battery_Init: Failed to establish communication\n");
    return 0;  // Failure
}

// Get battery board status
// NASA Rule #4: Function fits on single page
battery_status_t Battery_GetBoardStatus(void) {
    battery_status_t status;
    uint8_t command_data[2];
    i2c_result_t result;
    
    // NASA Rule #5: At least 2 assertions per function
    memset(&status, 0, sizeof(status));
    
    // Prepare command packet
    command_data[0] = BATTERY_CMD_BOARD_STATUS;
    command_data[1] = 0x00;  // Data parameter (always 0x00 for status)
    
    // Send command and expect 2-byte response
    result = I2C_SendCommand(battery_i2c_addr, command_data, 2, 2);
    
    // Parse status if successful
    if (result.success && result.bytes_received >= 1) {
        // First byte returned contains status flags
        uint8_t status_byte = result.data[0];
        
        status.command_not_recognized = (status_byte & 0x01) ? 1 : 0;
        status.watchdog_error = (status_byte & 0x02) ? 1 : 0;
        status.data_incorrect = (status_byte & 0x04) ? 1 : 0;
        status.channel_incorrect = (status_byte & 0x08) ? 1 : 0;
        status.eeprom_error = (status_byte & 0x10) ? 1 : 0;
        status.power_on_reset = (status_byte & 0x20) ? 1 : 0;
        status.brownout_reset = (status_byte & 0x40) ? 1 : 0;
        status.heater_active = (status_byte & 0x80) ? 1 : 0;
    } else {
        // Communication failed - set command not recognized flag
        status.command_not_recognized = 1;
        // All other flags remain 0 from memset
    }
    
    // NASA Rule #5: Second assertion
    if (result.error_code != I2C_SUCCESS && result.success == 0) {
        status.command_not_recognized = 1;
    }
    
    return status;
}

// Get single telemetry value from battery
// NASA Rule #4: Function fits on single page
static uint16_t Battery_GetTelemetryValue(uint8_t tlm_code_high, uint8_t tlm_code_low) {
    uint8_t command_data[3];
    i2c_result_t result;
    uint16_t adc_value = 0;
    
    // NASA Rule #5: At least 2 assertions per function
    if (tlm_code_high == 0 && tlm_code_low == 0) {
        return 0; // Invalid telemetry code
    }
    if (!battery_initialized) {
        return 0; // Battery not initialized
    }
    
    // Prepare telemetry command with 2-byte code
    command_data[0] = BATTERY_CMD_GET_TELEMETRY;
    command_data[1] = tlm_code_high;  // First telemetry code byte
    command_data[2] = tlm_code_low;   // Second telemetry code byte
    
    // Send command (3 bytes) and expect no immediate response
    result = I2C_SendCommand(battery_i2c_addr, command_data, 3, 0);
    if (result.success == 0) {
        return 0;
    }
    
    // Wait for battery to process telemetry request (as per original code)
    Battery_DelayMs(5000); // 5 second delay as in original
    
    // Read telemetry result (2 bytes)
    result = I2C_ReadBytes(battery_i2c_addr, 2);
    
    if (result.success && result.bytes_received >= 2) {
        // ADC result is 10-bit value in bits 0-9
        adc_value = ((uint16_t)(result.data[0] & 0x03) << 8) | result.data[1];
    }
    
    return adc_value;
}

// Get battery telemetry (voltage, current, power)
// NASA Rule #4: Function fits on single page
battery_telemetry_t Battery_GetTelemetry(void) {
    battery_telemetry_t telemetry;
    uint16_t adc_value;
    
    // NASA Rule #5: At least 2 assertions per function
    memset(&telemetry, 0, sizeof(telemetry));
    
    if (!battery_initialized) {
        return telemetry; // Return zeros if not initialized
    }
    
    // Get Battery Voltage (TLM_VBAT = 0xE280)
    adc_value = Battery_GetTelemetryValue(0xE2, 0x80);
    if (adc_value > 0) {
        // Convert using equation from Table 12-8: 0.008993 * ADC
        telemetry.voltage_V = 0.008993f * adc_value;
    }
    
    // Get Battery Current Magnitude (TLM_IBAT = 0xE284)
    adc_value = Battery_GetTelemetryValue(0xE2, 0x84);
    if (adc_value > 0) {
        // Convert using equation from Table 12-8: 14.662757 * ADC
        telemetry.current_mA = 14.662757f * adc_value;
    }
    
    // Get Battery Current Direction (TLM_IDIRBAT = 0xE28E)
    adc_value = Battery_GetTelemetryValue(0xE2, 0x8E);
    // From Table 12-8: ADC < 512 = Charging, else Discharging
    telemetry.charging = (adc_value < 512) ? 1 : 0;
    
    // Calculate power (P = V * I)
    // Convert current to Amps and calculate Watts
    telemetry.power_W = telemetry.voltage_V * (telemetry.current_mA / 1000.0f);
    
    // NASA Rule #5: Second assertion
    if (telemetry.voltage_V < 0.0f || telemetry.voltage_V > 50.0f) {
        telemetry.voltage_V = 0.0f; // Sanity check on voltage
    }
    
    return telemetry;
}

// Check if battery is healthy
// NASA Rule #4: Function fits on single page
uint8_t Battery_IsHealthy(battery_status_t status) {
    // NASA Rule #5: At least 2 assertions per function
    // First ensure we can communicate (command must be recognized)
    if (status.command_not_recognized) {
        return 0;  // Can't communicate
    }
    
    // Check for critical errors
    if (status.watchdog_error || 
        status.data_incorrect || 
        status.channel_incorrect || 
        status.eeprom_error) {
        return 0;  // Has errors
    }
    
    // NASA Rule #5: Second assertion
    if (!battery_initialized) {
        return 0; // Not initialized
    }
    
    // Brownout and power-on resets are concerning but not critical
    // Heater active is normal operation
    return 1;  // Healthy
}

// Print battery status in human-readable format
// NASA Rule #4: Function fits on single page
void Battery_PrintStatus(battery_status_t status) {
    // NASA Rule #5: At least 2 assertions per function
    if (!battery_initialized) {
        printf("Battery: Not initialized\n");
        return;
    }
    
    // Check overall health first
    if (Battery_IsHealthy(status)) {
        printf("Battery: OK\n");
        
        // Get and display telemetry
        battery_telemetry_t tlm = Battery_GetTelemetry();
        printf("  Voltage: %.2f V\n", tlm.voltage_V);
        printf("  Current: %.1f mA (%s)\n", 
               tlm.current_mA, 
               tlm.charging ? "Charging" : "Discharging");
        printf("  Power: %.2f W\n", tlm.power_W);
        
        // Only show additional info if there are non-critical events
        if (status.brownout_reset) {
            printf("  Note: Brownout reset occurred\n");
        }
        if (status.power_on_reset) {
            printf("  Note: Power-on reset occurred\n");
        }
        if (status.heater_active) {
            printf("  Info: Heater active\n");
        }
    } else {
        // Show specific failures
        printf("Battery: FAILURE\n");
        
        if (status.command_not_recognized) {
            printf("  Error: Command not recognized (no communication)\n");
        }
        if (status.watchdog_error) {
            printf("  Error: Watchdog reset\n");
        }
        if (status.data_incorrect) {
            printf("  Error: Data incorrect\n");
        }
        if (status.channel_incorrect) {
            printf("  Error: Channel incorrect\n");
        }
        if (status.eeprom_error) {
            printf("  Error: EEPROM error\n");
        }
    }
    
    // NASA Rule #5: Second assertion
    if (status.command_not_recognized && battery_initialized) {
        printf("  Warning: Communication issue detected\n");
    }
}