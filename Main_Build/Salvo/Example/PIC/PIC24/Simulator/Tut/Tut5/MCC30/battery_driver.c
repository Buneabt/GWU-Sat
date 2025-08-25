#include "battery_driver.h"
#include <stdio.h>

// Static variable to track which address works
static uint8_t battery_i2c_addr = BATTERY_I2C_ADDR_DEFAULT;
static uint8_t battery_initialized = 0;

// Initialize battery interface
uint8_t Battery_Init(void) {
    printf("Battery_Init: Attempting communication at 0x%02X\n", BATTERY_I2C_ADDR_DEFAULT);
    
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
    
    // Reset to default and fail
    battery_i2c_addr = BATTERY_I2C_ADDR_DEFAULT;
    printf("Battery_Init: Failed to establish communication\n");
    return 0;  // Failure
}

// ------------------------- BASIC BOARD STATUSING ------------------------- //
battery_status_t Battery_GetBoardStatus(void) {
    battery_status_t status;
    uint8_t tx_data[2];
    i2c_result_t result;
    
    // Prepare command packet
    tx_data[0] = BATTERY_CMD_BOARD_STATUS;
    tx_data[1] = 0x00;  // Data parameter (always 0x00 for status)
    
    // Send command and read response
    result = I2C_SendCommand(battery_i2c_addr, BATTERY_CMD_BOARD_STATUS, 0x00);
    
    // Parse status if successful
    if (result.success && result.bytes_received >= 2) {
        // Data[1] is first byte returned (index 0 in result.data)
        uint8_t status_byte = result.data[0];
        
        status.command_not_recognized = (status_byte & 0x01);
        status.watchdog_error = (status_byte & 0x02) >> 1;
        status.data_incorrect = (status_byte & 0x04) >> 2;
        status.channel_incorrect = (status_byte & 0x08) >> 3;
        status.eeprom_error = (status_byte & 0x10) >> 4;
        status.power_on_reset = (status_byte & 0x20) >> 5;
        status.brownout_reset = (status_byte & 0x40) >> 6;
        status.heater_active = (status_byte & 0x80) >> 7;
    } else {
        // Communication failed - set all error flags
        status.command_not_recognized = 1;
        status.watchdog_error = 0;
        status.data_incorrect = 0;
        status.channel_incorrect = 0;
        status.eeprom_error = 0;
        status.power_on_reset = 0;
        status.brownout_reset = 0;
        status.heater_active = 0;
    }
    
    return status;
}

// Check if battery is healthy
uint8_t Battery_IsHealthy(battery_status_t status) {
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
    
    // Brownout and power-on resets are concerning but not critical
    // Heater active is normal operation
    return 1;  // Healthy
}

// Updated Battery_PrintStatus to show telemetry when healthy:
void Battery_PrintStatus(battery_status_t status) {
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
}


// ------------------------- TELEMETRY STATUSING ------------------------- //
static void Battery_DelayMs(uint16_t ms) {
    volatile uint32_t count;
    // Adjust this value based on your FCY (3.6864 MHz)
    // This is approximate - tune as needed
    uint32_t loops_per_ms = 90;  // Start with this, adjust if needed
    
    while (ms--) {
        count = loops_per_ms;
        while (count--) {
            // Busy wait
            asm("nop");
        }
    }
}


static uint16_t Battery_GetTelemetryValue(uint8_t tlm_code_high, uint8_t tlm_code_low) {
    i2c_result_t result;
    uint16_t adc_value = 0;

    // Send telemetry command with 2-byte code
    uint8_t tx_data[3];
    tx_data[0] = BATTERY_CMD_GET_TELEMETRY;
    tx_data[1] = tlm_code_high;  // Data[1] - first telemetry code byte
    tx_data[2] = tlm_code_low;   // Data[0] - second telemetry code byte
    
    // Write command
    if (I2C_WriteBytes(battery_i2c_addr, tx_data, 3) != I2C_SUCCESS) {
        return 0;
    }
    
    
//    for(;;) {
//        current_time = OSGetTicks();
//        // Get current system time in ticks
//         if ((current_time - last_check_time) >= 500) {
//             break;
//        }
//        last_check_time = OSGetTicks();
//    }

    Battery_DelayMs(5000);
   
    // Read result (2 bytes)
    result = I2C_ReadBytes(battery_i2c_addr, 2);
    
    if (result.success && result.bytes_received >= 2) {
        // ADC result is 10-bit value in bits 0-9
        adc_value = ((result.data[0] & 0x03) << 8) | result.data[1];
    }
    
    return adc_value;
}

// Get battery telemetry (voltage, current, power)
battery_telemetry_t Battery_GetTelemetry(void) {
    battery_telemetry_t telemetry = {0};
    uint16_t adc_value;
    
    // Get Battery Voltage (TLM_VBAT = 0xE280)
    adc_value = Battery_GetTelemetryValue(0xE2, 0x80);
    if (adc_value > 0) {
        // Convert using equation from Table 12-8: 0.008993 * ADC
        telemetry.voltage_V = 0.008993 * adc_value;
    }
    
    // Get Battery Current Magnitude (TLM_IBAT = 0xE284)
    adc_value = Battery_GetTelemetryValue(0xE2, 0x84);
    if (adc_value > 0) {
        // Convert using equation from Table 12-8: 14.662757 * ADC
        telemetry.current_mA = 14.662757 * adc_value;
    }
    
    // Get Battery Current Direction (TLM_IDIRBAT = 0xE28E)
    adc_value = Battery_GetTelemetryValue(0xE2, 0x8E);
    // From Table 12-8: ADC < 512 = Charging, else Discharging
    telemetry.charging = (adc_value < 512) ? 1 : 0;
    
    // Calculate power (P = V * I)
    // Convert current to Amps and calculate Watts
    telemetry.power_W = telemetry.voltage_V * (telemetry.current_mA / 1000.0);
    
    return telemetry;
}
