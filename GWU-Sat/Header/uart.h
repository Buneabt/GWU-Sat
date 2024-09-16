#include <stdbool.h>
#include <stdint.h>
#include <xc.h>
#include <stdbool.h>
#include <stdint.h>


#ifndef EOF
#define EOF (-1)
#endif


// Basic UART function prototypes
void UART1_Initialize(void);
void UART1_Write(uint8_t data);
bool UART1_IsRxReady(void);
bool UART1_IsTxReady(void);

// Add more function prototypes as needed

void CloseUART1(void);
void ConfigIntUART1(unsigned int config);
void OpenUART1(unsigned int config1, unsigned int config2, unsigned int ubrg);
void DisableIntU1RX(void);
void EnableIntU1RX(void);
void DisableIntU1TX(void);
void EnableIntU1TX(void);
void U1TX_Clear_Intr_Status_Bit(void);
int BusyUART1(void);
void WriteUART1(unsigned int data);
void U1RX_Clear_Intr_Status_Bit(void);
void CloseUART2(void);
void ConfigIntUART2(unsigned int config);
void OpenUART2(unsigned int config1, unsigned int config2, unsigned int ubrg);
void DisableIntU2RX(void);
void EnableIntU2RX(void);
void DisableIntU2TX(void);
void EnableIntU2TX(void);
void U2TX_Clear_Intr_Status_Bit(void);
int BusyUART2(void);
void WriteUART2(unsigned int data);
void U2RX_Clear_Intr_Status_Bit(void);

