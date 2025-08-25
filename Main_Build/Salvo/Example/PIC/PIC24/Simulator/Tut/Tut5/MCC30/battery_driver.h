#ifndef BATTERY_DRIVER_H
#define BATTERY_DRIVER_H

#include <stdint.h>
#include "i2c_driver.h"
#define BATTERY_CMD_GET_TELEMETRY  0x10



// Battery I2C Configuration
#define BATTERY_I2C_ADDR_DEFAULT  0x2A  // 10-40Wh batteries
#define BATTERY_I2C_ADDR_80WH_2    0x2D  // Second 40Wh unit of 80Wh battery

// Battery Commands
#define BATTERY_CMD_BOARD_STATUS   0x01
#define BATTERY_CMD_DELAY_MS       1     // <1ms delay for status command

// Battery status structure - matches documentation Table 12-2
typedef struct {
    uint8_t command_not_recognized : 1;  // Bit 0
    uint8_t watchdog_error : 1;          // Bit 1
    uint8_t data_incorrect : 1;          // Bit 2
    uint8_t channel_incorrect : 1;       // Bit 3
    uint8_t eeprom_error : 1;            // Bit 4
    uint8_t power_on_reset : 1;          // Bit 5
    uint8_t brownout_reset : 1;          // Bit 6
    uint8_t heater_active : 1;           // Bit 7
} battery_status_t;

// Telemetry structure
typedef struct {
    float voltage_V;      // Battery voltage in Volts
    float current_mA;     // Battery current in milliamps  
    uint8_t charging;     // 1 if charging, 0 if discharging
    float power_W;        // Calculated power in Watts
} battery_telemetry_t;


// Function prototypes
uint8_t Battery_Init(void);
battery_status_t Battery_GetBoardStatus(void);
uint8_t Battery_IsHealthy(battery_status_t status);
void Battery_PrintStatus(battery_status_t status);
battery_telemetry_t Battery_GetTelemetry(void);

#endif // BATTERY_DRIVER_H