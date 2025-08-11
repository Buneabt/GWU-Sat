#include "uart_driver.h"
#include "satellite_defs.h"
#include <xc.h>

// Write function for printf support - using UART1 consistently
int __attribute__((__section__(".libc.write"))) write(int handle, void *buffer, unsigned int len) {
    return UART_Printf_Support(handle, buffer, len);
}

// Initialize UART1 for console output
void UART_Init(void) {
    U1MODEbits.UARTEN = 0;      // Disable during config
    U1MODEbits.STSEL = 0;       // 1 Stop bit
    U1MODEbits.PDSEL = 0;       // No Parity, 8 data bits
    U1MODEbits.ABAUD = 0;       // Auto-Baud disabled
    U1MODEbits.BRGH = 0;        // Standard Speed mode
    
    // Calculate baud rate register value
    // BRG = (FCY / (16 * BAUD_RATE)) - 1
    // For FCY=4MHz, BAUD=9600: BRG = (4000000 / (16 * 9600)) - 1 = 25
    U1BRG = 25;
    
    U1MODEbits.UARTEN = 1;      // Enable UART
    U1STAbits.UTXEN = 1;        // Enable TX
}

// Send a single byte over UART
void UART_SendByte(uint8_t data) {
    while (U1STAbits.UTXBF);    // Wait for TX buffer to be empty
    U1TXREG = data;
}

// Send a string over UART
void UART_SendString(const char* str) {
    if (str == NULL) return;
    
    while (*str) {
        UART_SendByte(*str++);
    }
}

// Receive a single byte from UART (non-blocking)
uint8_t UART_ReceiveByte(void) {
    if (U1STAbits.URXDA) {      // Check if data available
        return U1RXREG;
    }
    return 0;  // No data available
}

// Check if UART data is available
uint8_t UART_DataAvailable(void) {
    return U1STAbits.URXDA ? 1 : 0;
}

// Printf support function for UART output
int UART_Printf_Support(int handle, void *buffer, unsigned int len) {
    int i;
    if (handle != 1) return -1;  // Only support stdout
    
    for (i = 0; i < len; i++) {
        UART_SendByte(*(char*)buffer++);
    }
    return len;
}

// Character output function for printf
int putchar(int c) {
    if (c < 0 || c > 255) return -1;
    
    UART_SendByte((uint8_t)c);
    return c;
}