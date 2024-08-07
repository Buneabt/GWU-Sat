#include "i2c_comm.h"
#include <xc.h>        // Microcontroller-specific header
#include <libpic30.h>  // Include delay functions

#define I2C_ADDRESS 0x2A // Define the I2C address of the slave device
#define FCY 16000000UL   // Define the instruction cycle frequency

void I2C_Init(void) {
    I2C1BRG = ((FCY / 100000) - (FCY / 1111111)) - 1; // 100 kHz I2C clock
    I2C1CONbits.I2CEN = 1; // Enable I2C module
}

void I2C_SendCommand(uint8_t command, uint8_t parameter) {
    I2C1CONbits.SEN = 1; // Start condition
    while (I2C1CONbits.SEN); // Wait for start condition to complete
    __delay_us(10); // Small delay for bus stability
    
    I2C1TRN = (I2C_ADDRESS << 1) | 0; // Send address with write bit
    while (I2C1STATbits.TRSTAT); // Wait for transmission to complete
    if (I2C1STATbits.ACKSTAT) return; // Check for ACK

    I2C1TRN = command; // Send command
    while (I2C1STATbits.TRSTAT); // Wait for transmission to complete
    if (I2C1STATbits.ACKSTAT) return; // Check for ACK

    I2C1TRN = parameter; // Send parameter
    while (I2C1STATbits.TRSTAT); // Wait for transmission to complete
    if (I2C1STATbits.ACKSTAT) return; // Check for ACK

    I2C1CONbits.PEN = 1; // Stop condition
    while (I2C1CONbits.PEN); // Wait for stop condition to complete
}

uint16_t I2C_ReadTelemetry(uint8_t command) {
    uint16_t data = 0;

    I2C1CONbits.SEN = 1; // Start condition
    while (I2C1CONbits.SEN); // Wait for start condition to complete
    __delay_us(10); // Small delay for bus stability
    
    I2C1TRN = (I2C_ADDRESS << 1) | 0; // Send address with write bit
    while (I2C1STATbits.TRSTAT); // Wait for transmission to complete
    if (I2C1STATbits.ACKSTAT) return 0xFFFF; // Check for ACK

    I2C1TRN = command; // Send command
    while (I2C1STATbits.TRSTAT); // Wait for transmission to complete
    if (I2C1STATbits.ACKSTAT) return 0xFFFF; // Check for ACK

    I2C1CONbits.RSEN = 1; // Repeated start condition
    while (I2C1CONbits.RSEN); // Wait for repeated start condition to complete
    __delay_us(10); // Small delay for bus stability

    I2C1TRN = (I2C_ADDRESS << 1) | 1; // Send address with read bit
    while (I2C1STATbits.TRSTAT); // Wait for transmission to complete
    if (I2C1STATbits.ACKSTAT) return 0xFFFF; // Check for ACK

    I2C1CONbits.RCEN = 1; // Enable receive mode
    while (!I2C1STATbits.RBF); // Wait for receive buffer to be full
    data = I2C1RCV; // Read first byte
    data <<= 8; // Shift to upper byte

    I2C1CONbits.ACKEN = 1; // Send ACK for the first byte
    while (I2C1CONbits.ACKEN); // Wait for ACK sequence to complete

    I2C1CONbits.RCEN = 1; // Enable receive mode for second byte
    while (!I2C1STATbits.RBF); // Wait for receive buffer to be full
    data |= I2C1RCV; // Read second byte

    I2C1CONbits.PEN = 1; // Stop condition
    while (I2C1CONbits.PEN); // Wait for stop condition to complete

    return data;
}
