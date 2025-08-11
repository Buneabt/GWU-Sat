#ifndef I2C_DRIVER_H
#define I2C_DRIVER_H

#include <xc.h>
#include <stdint.h>

// I2C communication results
typedef struct {
    uint8_t success;
    uint8_t bytes_received;
    uint8_t data[8];  // Max 8 bytes response
} i2c_result_t;

// I2C error codes
#define I2C_SUCCESS             0
#define I2C_ERROR_TIMEOUT       1
#define I2C_ERROR_NACK          2
#define I2C_ERROR_START_FAIL    3
#define I2C_ERROR_STOP_FAIL     4

// Function prototypes
void I2C_Init(void);
i2c_result_t I2C_SendCommand(uint8_t device_address, uint8_t command, uint8_t data_byte);
i2c_result_t I2C_ReadBytes(uint8_t device_address, uint8_t num_bytes);
uint8_t I2C_WriteBytes(uint8_t device_address, uint8_t* data, uint8_t num_bytes);

#endif // I2C_DRIVER_H