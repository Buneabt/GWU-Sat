#ifndef UART_DRIVER_H
#define UART_DRIVER_H

#include <stdint.h>

// UART configuration
#define UART_BAUD_RATE      9600
#define UART_BUFFER_SIZE    128

// Function prototypes
void UART_Init(void);
void UART_SendByte(uint8_t data);
void UART_SendString(const char* str);
uint8_t UART_ReceiveByte(void);
uint8_t UART_DataAvailable(void);
int UART_Printf_Support(int handle, void *buffer, unsigned int len);

#endif // UART_DRIVER_H