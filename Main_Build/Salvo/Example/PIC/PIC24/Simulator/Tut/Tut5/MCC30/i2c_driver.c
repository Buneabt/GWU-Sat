#include "i2c_driver.h"
#include "timer_driver.h"
#include <stdio.h>

// Private function prototypes
static uint8_t I2C_WaitForFlag(volatile uint8_t* flag_register, uint8_t flag_bit, uint8_t expected_state, uint16_t timeout_us);
static uint8_t I2C_SendStart(void);
static uint8_t I2C_SendStop(void);
static uint8_t I2C_SendByte(uint8_t data);
static uint8_t I2C_ReceiveByte(uint8_t send_ack);

// Global state tracking
static uint8_t i2c_initialized = 0;

// Initialize I2C1 interface following NASA Rule #4 (single page function)
void I2C_Init(void) {
    // NASA Rule #5: At least 2 assertions per function
    if (i2c_initialized != 0) {
        return; // Already initialized
    }
    
    // Disable I2C during configuration
    I2C1CONbits.I2CEN = 0;
    
    // Configure I2C pins as inputs (open drain)
    TRISGbits.TRISG2 = 1;  // SCL1 as input
    TRISGbits.TRISG3 = 1;  // SDA1 as input
    
    // Configure I2C baud rate for 80Hz (standard mode)
    // BRG = (FCY / (2 * Fscl)) - 2
    // For FCY = 4MHz, Fscl = 80KHz: BRG = (4000000 / 160000) - 2 = 23
    I2C1BRG = 23;
    
    // Configure I2C control register
    I2C1CONbits.DISSLW = 1;   // Disable slew rate control for 100kHz
    I2C1CONbits.A10M = 0;     // 7-bit address mode
    I2C1CONbits.SCLREL = 1;   // Release SCL clock
    
    // Enable I2C
    I2C1CONbits.I2CEN = 1;
    
    // NASA Rule #5: Second assertion
    if (I2C1CONbits.I2CEN == 0) {
        printf("ERROR: I2C failed to enable\n");
        return;
    }
    
    i2c_initialized = 1;
    printf("I2C driver initialized successfully\n");
    return;
}

// Wait for I2C flag with timeout
// NASA Rule #4: Function fits on single page  
static uint8_t I2C_WaitForFlag(volatile uint8_t* flag_register, uint8_t flag_bit, 
                              uint8_t expected_state, uint16_t timeout_us) {
    // NASA Rule #5: At least 2 assertions
    if (flag_register == (void*)0) {
        return I2C_ERROR_TIMEOUT;
    }
    if (timeout_us == 0) {
        timeout_us = 1; // Minimum 1us timeout
    }
    
    uint16_t timeout_counter = 0;
    uint8_t flag_value;
    
    // NASA Rule #2: Fixed bounds loop
    for (timeout_counter = 0; timeout_counter < timeout_us; timeout_counter++) {
        flag_value = (*flag_register & flag_bit) ? 1 : 0;
        
        if (flag_value == expected_state) {
            return I2C_SUCCESS;
        }
        
        Timer_DelayTicks(1); // 1 microsecond delay
    }
    
    return I2C_ERROR_TIMEOUT;
}

// Send I2C start condition
// NASA Rule #4: Function fits on single page
static uint8_t I2C_SendStart(void) {
    // NASA Rule #5: At least 2 assertions
    if (i2c_initialized == 0) {
        return I2C_ERROR_NOT_INIT;
    }
    if (I2C1CONbits.I2CEN == 0) {
        return I2C_ERROR_NOT_INIT;
    }
    
    // Initiate start condition
    I2C1CONbits.SEN = 1;
    
    // Wait for start condition to complete (max 100us)
    uint8_t result = I2C_WaitForFlag((volatile uint8_t*)&I2C1CON, 0x01, 0, 100);
    return result;
}

// Send I2C stop condition  
// NASA Rule #4: Function fits on single page
static uint8_t I2C_SendStop(void) {
    // NASA Rule #5: At least 2 assertions
    if (i2c_initialized == 0) {
        return I2C_ERROR_NOT_INIT;
    }
    if (I2C1CONbits.I2CEN == 0) {
        return I2C_ERROR_NOT_INIT;
    }
    
    // Initiate stop condition
    I2C1CONbits.PEN = 1;
    
    // Wait for stop condition to complete (max 100us)
    uint8_t result = I2C_WaitForFlag((volatile uint8_t*)&I2C1CON, 0x04, 0, 100);
    return result;
}

// Send single byte over I2C
// NASA Rule #4: Function fits on single page
static uint8_t I2C_SendByte(uint8_t data) {
    // NASA Rule #5: At least 2 assertions
    if (i2c_initialized == 0) {
        return I2C_ERROR_NOT_INIT;
    }
    if (I2C1CONbits.I2CEN == 0) {
        return I2C_ERROR_NOT_INIT;
    }
    
    // Send data byte
    I2C1TRN = data;
    
    // Wait for transmission to complete (max 1000us)
    uint8_t result = I2C_WaitForFlag((volatile uint8_t*)&I2C1STAT, 0x01, 0, 1000);
    if (result != I2C_SUCCESS) {
        return I2C_ERROR_TIMEOUT;
    }
    
    // Check for ACK/NACK
    if (I2C1STATbits.ACKSTAT == 1) {
        return I2C_ERROR_NACK;
    }
    
    return I2C_SUCCESS;
}

// Receive single byte from I2C  
// NASA Rule #4: Function fits on single page
static uint8_t I2C_ReceiveByte(uint8_t send_ack) {
    // NASA Rule #5: At least 2 assertions
    if (i2c_initialized == 0) {
        return 0xFF; // Error value
    }
    if (I2C1CONbits.I2CEN == 0) {
        return 0xFF; // Error value
    }
    
    // Enable receive
    I2C1CONbits.RCEN = 1;
    
    // Wait for data to be received (max 1000us)
    uint8_t result = I2C_WaitForFlag((volatile uint8_t*)&I2C1STAT, 0x40, 1, 1000);
    if (result != I2C_SUCCESS) {
        return 0xFF; // Error value
    }
    
    uint8_t received_data = I2C1RCV;
    
    // Send ACK/NACK
    I2C1CONbits.ACKDT = send_ack ? 0 : 1; // 0 = ACK, 1 = NACK
    I2C1CONbits.ACKEN = 1;
    
    // Wait for ACK/NACK to complete (max 100us)
    I2C_WaitForFlag((volatile uint8_t*)&I2C1CON, 0x10, 0, 100);
    
    return received_data;
}

// Write bytes to I2C device
// NASA Rule #4: Function fits on single page
uint8_t I2C_WriteBytes(uint8_t device_address, uint8_t* data, uint8_t num_bytes) {
    // NASA Rule #5: At least 2 assertions
    if (data == (void*)0) {
        return I2C_ERROR_NULL_PTR;
    }
    if (num_bytes == 0 || num_bytes > I2C_MAX_BUFFER_SIZE) {
        return I2C_ERROR_BAD_PARAM;
    }
    
    uint8_t result;
    
    // Send start condition
    result = I2C_SendStart();
    if (result != I2C_SUCCESS) {
        return result;
    }
    
    // Send device address with write bit
    result = I2C_SendByte((device_address << 1) | 0x00);
    if (result != I2C_SUCCESS) {
        (void)I2C_SendStop(); // NASA Rule #7: Check or cast return value
        return result;
    }
    
    // Send data bytes - NASA Rule #2: Fixed bounds loop
    uint8_t i;
    for (i = 0; i < num_bytes; i++) {
        result = I2C_SendByte(data[i]);
        if (result != I2C_SUCCESS) {
            (void)I2C_SendStop(); // NASA Rule #7: Check or cast return value
            return result;
        }
    }
    
    // Send stop condition
    result = I2C_SendStop();
    return result;
}

// Read bytes from I2C device
// NASA Rule #4: Function fits on single page  
i2c_result_t I2C_ReadBytes(uint8_t device_address, uint8_t num_bytes) {
    i2c_result_t result = {0}; // Initialize all fields to 0
    
    // NASA Rule #5: At least 2 assertions
    if (num_bytes == 0 || num_bytes > I2C_MAX_BUFFER_SIZE) {
        result.error_code = I2C_ERROR_BAD_PARAM;
        return result;
    }
    if (i2c_initialized == 0) {
        result.error_code = I2C_ERROR_NOT_INIT;
        return result;
    }
    
    uint8_t status;
    
    // Send start condition
    status = I2C_SendStart();
    if (status != I2C_SUCCESS) {
        result.error_code = status;
        return result;
    }
    
    // Send device address with read bit
    status = I2C_SendByte((device_address << 1) | 0x01);
    if (status != I2C_SUCCESS) {
        (void)I2C_SendStop(); // NASA Rule #7: Check or cast return value
        result.error_code = status;
        return result;
    }
    
    // Read data bytes - NASA Rule #2: Fixed bounds loop
    uint8_t i;
    for (i = 0; i < num_bytes; i++) {
        uint8_t send_ack = (i == (num_bytes - 1)) ? 0 : 1; // NACK on last byte
        result.data[i] = I2C_ReceiveByte(send_ack);
        result.bytes_received++;
    }
    
    // Send stop condition
    status = I2C_SendStop();
    if (status == I2C_SUCCESS) {
        result.success = 1;
    } else {
        result.error_code = status;
    }
    
    return result;
}

// Send command to I2C device and receive response
// NASA Rule #4: Function fits on single page
i2c_result_t I2C_SendCommand(uint8_t device_address, uint8_t* command_data, 
                            uint8_t command_length, uint8_t response_length) {
    i2c_result_t result = {0}; // Initialize all fields to 0
    
    // NASA Rule #5: At least 2 assertions
    if (command_data == (void*)0) {
        result.error_code = I2C_ERROR_NULL_PTR;
        return result;
    }
    if (command_length == 0 || command_length > I2C_MAX_BUFFER_SIZE) {
        result.error_code = I2C_ERROR_BAD_PARAM;
        return result;
    }
    
    uint8_t status;
    
    // Write command to device
    status = I2C_WriteBytes(device_address, command_data, command_length);
    if (status != I2C_SUCCESS) {
        result.error_code = status;
        return result;
    }
    
    // If response is expected, read it
    if (response_length > 0) {
        // Small delay before reading response (per UHF manual timing)
        Timer_DelayTicks(100);
        
        result = I2C_ReadBytes(device_address, response_length);
    } else {
        result.success = 1;
    }
    
    return result;
}

// Check if I2C device responds (ping test)
// NASA Rule #4: Function fits on single page
uint8_t I2C_DeviceReady(uint8_t device_address) {
    // NASA Rule #5: At least 2 assertions
    if (i2c_initialized == 0) {
        return I2C_ERROR_NOT_INIT;
    }
    if (device_address > 0x7F) { // 7-bit address check
        return I2C_ERROR_BAD_PARAM;
    }
    
    uint8_t result;
    
    // Send start condition
    result = I2C_SendStart();
    if (result != I2C_SUCCESS) {
        return result;
    }
    
    // Send device address with write bit
    result = I2C_SendByte((device_address << 1) | 0x00);
    
    // Send stop condition regardless of ACK/NACK
    (void)I2C_SendStop(); // NASA Rule #7: Check or cast return value
    
    return result;
}