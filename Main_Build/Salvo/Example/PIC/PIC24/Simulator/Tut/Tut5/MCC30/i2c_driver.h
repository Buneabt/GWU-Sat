#ifndef I2C_DRIVER_H
#define I2C_DRIVER_H

#include <xc.h>
#include <stdint.h>

// I2C configuration constants
#define I2C_MAX_BUFFER_SIZE     512  // Maximum bytes in single transaction
#define I2C_DEFAULT_TIMEOUT     1000 // Default timeout in microseconds

// I2C communication results structure
typedef struct {
    uint8_t success;            // 1 = success, 0 = failure
    uint8_t bytes_received;     // Number of bytes successfully received
    uint8_t data[I2C_MAX_BUFFER_SIZE];  // Received data buffer
    uint8_t error_code;         // Error code if success = 0
} i2c_result_t;

// I2C error codes following NASA safety-critical practices
#define I2C_SUCCESS             0   // Operation successful
#define I2C_ERROR_TIMEOUT       1   // Communication timeout
#define I2C_ERROR_NACK          2   // Device did not acknowledge
#define I2C_ERROR_START_FAIL    3   // Failed to generate start condition
#define I2C_ERROR_STOP_FAIL     4   // Failed to generate stop condition
#define I2C_ERROR_NOT_INIT      5   // I2C driver not initialized
#define I2C_ERROR_NULL_PTR      6   // Null pointer passed
#define I2C_ERROR_BAD_PARAM     7   // Invalid parameter value
#define I2C_ERROR_BUS_BUSY      8   // I2C bus is busy

// Function prototypes following NASA safety-critical rules
// All functions check parameters and return meaningful error codes

/**
 * Initialize I2C1 interface
 * NASA Rule #5: Contains runtime assertions
 * NASA Rule #4: Function fits on single page
 */
void I2C_Init(void);

/**
 * Write bytes to I2C device
 * @param device_address: 7-bit I2C slave address
 * @param data: Pointer to data buffer (must not be NULL)
 * @param num_bytes: Number of bytes to write (1-32)
 * @return I2C_SUCCESS or error code
 * NASA Rule #7: Return value must be checked
 */
uint8_t I2C_WriteBytes(uint8_t device_address, uint8_t* data, uint8_t num_bytes);

/**
 * Read bytes from I2C device
 * @param device_address: 7-bit I2C slave address  
 * @param num_bytes: Number of bytes to read (1-32)
 * @return i2c_result_t structure with data and status
 * NASA Rule #6: Minimize scope - result is returned by value
 */
i2c_result_t I2C_ReadBytes(uint8_t device_address, uint8_t num_bytes);

/**
 * Send command and receive response from I2C device
 * @param device_address: 7-bit I2C slave address
 * @param command_data: Pointer to command buffer (must not be NULL)
 * @param command_length: Length of command (1-32)
 * @param response_length: Expected response length (0-32, 0 = no response)
 * @return i2c_result_t structure with response data and status
 * NASA Rule #7: Return value must be checked
 */
i2c_result_t I2C_SendCommand(uint8_t device_address, uint8_t* command_data,
                            uint8_t command_length, uint8_t response_length);

/**
 * Check if I2C device is ready (responds to address)
 * @param device_address: 7-bit I2C slave address
 * @return I2C_SUCCESS if device responds, error code otherwise
 * NASA Rule #7: Return value should be checked
 */
uint8_t I2C_DeviceReady(uint8_t device_address);

#endif // I2C_DRIVER_H