#include "battery.h"
#include "i2c_comm.h"

void Battery_Init(void) {
    // Battery-specific initialization
}

unsigned int GetBatteryLevel(void) {
    // Use I2C communication to get battery level
    return I2C_ReadTelemetry(CMD_Board_Status);
}
