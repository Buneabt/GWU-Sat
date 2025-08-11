#ifndef EPS_DRIVER_H
#define EPS_DRIVER_H

#include <stdint.h>
#include "i2c_driver.h"

// EPS I2C address and commands
#define EPS_I2C_ADDRESS         0x2B
#define EPS_CMD_BOARD_STATUS    0x01
#define EPS_CMD_GET_TELEMETRY   0x10
#define EPS_CMD_GET_VERSION     0x04
#define EPS_CMD_GET_CHECKSUM    0x05

// EPS status structure
typedef struct {
    uint8_t command_recognized;
    uint8_t watchdog_error;
    uint8_t data_error;
    uint8_t channel_error;
    uint8_t eeprom_error;
    uint8_t power_on_reset;
    uint8_t brown_out_reset;
    uint8_t extended_status[3];  // Additional status bytes
} eps_status_t;

// Function prototypes
uint8_t EPS_Init(void);
eps_status_t EPS_GetBoardStatus(void);
i2c_result_t EPS_GetTelemetry(void);
void EPS_PrintStatus(eps_status_t status);
uint8_t EPS_IsHealthy(eps_status_t status);

#endif // EPS_DRIVER_H