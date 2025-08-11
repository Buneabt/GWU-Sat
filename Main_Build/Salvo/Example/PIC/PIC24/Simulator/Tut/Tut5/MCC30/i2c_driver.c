#include "i2c_driver.h"
#include <stdio.h>

// Initialize I2C1 interface
void I2C_Init(void) {
    // Disable I2C during configuration
    I2C1CONbits.I2CEN = 0;
    
    // Configure I2C pins (adjust these based on your actual connections)
    // From the CubeSat pinout: I2C_DATA (pin 41) and I2C_CLK (pin 43)
    TRISGbits.TRISG2 = 1;  // SCL1 as input (open drain)
    TRISGbits.TRISG3 = 1;  // SDA1 as input (open drain)
    
    // Configure I2C baud rate for 100kHz (standard mode)
    // BRG = (FCY / (2 * Fscl)) - 2
    // For FCY = 4MHz, Fscl = 100kHz: BRG = (4000000 / 200000) - 2 = 18
    I2C1BRG = 18;
    
    // Configure I2C control register
    I2C1CONbits.DISSLW = 1;   // Disable slew rate control for 100kHz
    I2C1CONbits.A10M = 0;     // 7-bit address mode
    I2C1CONbits.SCLREL = 1;   // Release SCL clock
    
    // Enable I2C
    I2C1CONbits.I2CEN = 1;
    
    printf("I2C driver initialized\n");
}

// Send command to I2C device and receive response
i2c_result_t I2C_SendCommand(uint8_t device_address, uint8_t command, uint8_t data_byte) {
    i2c_result_t result = {0};
    uint16_t timeout;
    
    // Start condition
    I2C1CONbits.SEN = 1;
    timeout = 1000;
    while (I2C1CONbits.SEN && timeout--);  // Wait for start condition
    if (timeout == 0) {
        return result;  // Start condition timeout
    }
    
    // Send device address with write bit
    I2C1TRN = (device_address << 1) | 0;  // Write operation
    timeout = 1000;
    while (I2C1STATbits.TRSTAT && timeout--);  // Wait for transmission
    if (timeout == 0 || I2C1STATbits.ACKSTAT) {
        I2C1CONbits.PEN = 1;  // Stop condition
        return result;  // Address NACK
    }
    
    // Send command byte
    I2C1TRN = command;
    timeout = 1000;
    while (I2C1STATbits.TRSTAT && timeout--);
    if (timeout == 0 || I2C1STATbits.ACKSTAT) {
        I2C1CONbits.PEN = 1;
        return result;  // Command NACK
    }
    
    // Send data byte
    I2C1TRN = data_byte;
    timeout = 1000;
    while (I2C1STATbits.TRSTAT && timeout--);
    if (timeout == 0 || I2C1STATbits.ACKSTAT) {
        I2C1CONbits.PEN = 1;
        return result;  // Data NACK
    }
    
    // Restart condition for read
    I2C1CONbits.RSEN = 1;
    timeout = 1000;
    while (I2C1CONbits.RSEN && timeout--);
    
    // Send device address with read bit
    I2C1TRN = (device_address << 1) | 1;  // Read operation
    timeout = 1000;
    while (I2C1STATbits.TRSTAT && timeout--);
    if (timeout == 0 || I2C1STATbits.ACKSTAT) {
        I2C1CONbits.PEN = 1;
        return result;  // Read address NACK
    }
    
    // Read response bytes (up to 8 bytes)
    for (uint8_t i = 0; i < 8; i++) {
        I2C1CONbits.RCEN = 1;  // Enable receive
        timeout = 1000;
        while (!I2C1STATbits.RBF && timeout--);  // Wait for data
        if (timeout == 0) break;
        
        result.data[i] = I2C1RCV;  // Read received byte
        result.bytes_received++;
        
        // Send ACK for all but last few bytes
        if (i < 7) {
            I2C1CONbits.ACKDT = 0;  // ACK
        } else {
            I2C1CONbits.ACKDT = 1;  // NACK for last byte
        }
        I2C1CONbits.ACKEN = 1;
        while (I2C1CONbits.ACKEN);
        
        // Check if we should stop reading (device may send fewer bytes)
        if (i >= 3 && result.bytes_received >= 4) break;
    }
    
    // Stop condition
    I2C1CONbits.PEN = 1;
    while (I2C1CONbits.PEN);
    
    if (result.bytes_received > 0) {
        result.success = 1;
    }
    
    return result;
}

// Read bytes from I2C device
i2c_result_t I2C_ReadBytes(uint8_t device_address, uint8_t num_bytes) {
    i2c_result_t result = {0};
    uint16_t timeout;
    
    if (num_bytes > 8) num_bytes = 8;  // Limit to buffer size
    
    // Start condition
    I2C1CONbits.SEN = 1;
    timeout = 1000;
    while (I2C1CONbits.SEN && timeout--);
    if (timeout == 0) return result;
    
    // Send device address with read bit
    I2C1TRN = (device_address << 1) | 1;
    timeout = 1000;
    while (I2C1STATbits.TRSTAT && timeout--);
    if (timeout == 0 || I2C1STATbits.ACKSTAT) {
        I2C1CONbits.PEN = 1;
        return result;
    }
    
    // Read the requested number of bytes
    for (uint8_t i = 0; i < num_bytes; i++) {
        I2C1CONbits.RCEN = 1;
        timeout = 1000;
        while (!I2C1STATbits.RBF && timeout--);
        if (timeout == 0) break;
        
        result.data[i] = I2C1RCV;
        result.bytes_received++;
        
        // Send ACK for all but last byte
        I2C1CONbits.ACKDT = (i == num_bytes - 1) ? 1 : 0;
        I2C1CONbits.ACKEN = 1;
        while (I2C1CONbits.ACKEN);
    }
    
    // Stop condition
    I2C1CONbits.PEN = 1;
    while (I2C1CONbits.PEN);
    
    if (result.bytes_received > 0) {
        result.success = 1;
    }
    
    return result;
}

// Write bytes to I2C device
uint8_t I2C_WriteBytes(uint8_t device_address, uint8_t* data, uint8_t num_bytes) {
    uint16_t timeout;
    
    // Start condition
    I2C1CONbits.SEN = 1;
    timeout = 1000;
    while (I2C1CONbits.SEN && timeout--);
    if (timeout == 0) return I2C_ERROR_TIMEOUT;
    
    // Send device address with write bit
    I2C1TRN = (device_address << 1) | 0;
    timeout = 1000;
    while (I2C1STATbits.TRSTAT && timeout--);
    if (timeout == 0) return I2C_ERROR_TIMEOUT;
    if (I2C1STATbits.ACKSTAT) return I2C_ERROR_NACK;
    
    // Send data bytes
    for (uint8_t i = 0; i < num_bytes; i++) {
        I2C1TRN = data[i];
        timeout = 1000;
        while (I2C1STATbits.TRSTAT && timeout--);
        if (timeout == 0) return I2C_ERROR_TIMEOUT;
        if (I2C1STATbits.ACKSTAT) return I2C_ERROR_NACK;
    }
    
    // Stop condition
    I2C1CONbits.PEN = 1;
    while (I2C1CONbits.PEN);
    
    return I2C_SUCCESS;
}
