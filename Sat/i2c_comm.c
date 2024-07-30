#include "i2c_comm.h"
#include <xc.h> // Microcontroller-specific header

void I2C_Init(void) {
    // I2C initialization code here should be called once in Main.C
}

void I2C_SendCommand(uint8_t command, uint8_t parameter) { //This is supposed to be modular as all communication will be done through i2C
                                                           //I don't know if the command format is different so I may haev to add more protocols based on the component
    // Send command over I2C
}

uint16_t I2C_ReadTelemetry(uint8_t command) {
    // Read telemetry data from I2C
    return data;
}
