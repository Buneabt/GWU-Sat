#ifndef I2C_COMM_H
#define I2C_COMM_H

void I2C_Init(void);
void I2C_SendCommand(uint8_t command, uint8_t parameter);
uint16_t I2C_ReadTelemetry(uint8_t command);

#endif // I2C_COMM_H
