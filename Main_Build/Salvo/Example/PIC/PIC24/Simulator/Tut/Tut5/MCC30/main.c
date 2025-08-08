// Essential Configuration Bits Only
#pragma config FNOSC = FRC              // Internal Fast RC Oscillator
#pragma config FWDTEN = OFF             // Watchdog Timer Off
#pragma config JTAGEN = OFF             // JTAG Disabled             

#include <xc.h>
#include <salvo.h>
#include "p33FJ256GP710.h"
#include "satellite_defs.h"
#include "satellite_utils.h"
#include <stdio.h>

// Function prototypes
void initUART(void);
void initTimer1(void);
void TaskSystemInit(void);
void TaskStartSystem(void);
void TaskIdle(void);

// Write function for printf support
int __attribute__((__section__(".libc.write"))) write(int handle, void *buffer, unsigned int len) {
    int i;
    if (handle != 1) return -1;  // Only support stdout
    
    for (i = 0; i < len; i++) {
        while (U1STAbits.UTXBF);  
        U1TXREG = *(char*)buffer++;
    }
    return len;
}

// OS Idle Hook - kicks watchdog
void OSIdleHook(void) {
    ClrWdt();
}

// UART initialization for debug output
void initUART(void) {
    // Assert: Valid FCY value
    if (FCY == 0) return;
    
    U1MODEbits.UARTEN = 0;      // Disable during config
    
    // Configure UART1 settings
    U1MODEbits.STSEL = 0;       // 1 Stop bit
    U1MODEbits.PDSEL = 0;       // No Parity, 8 data bits
    U1MODEbits.ABAUD = 0;       // Auto-Baud disabled
    U1MODEbits.BRGH = 0;        // Standard Speed mode
    
    // Calculate and set baud rate
    U1BRG = ((FCY/9600)/16) - 1;
    
    // Assert: BRG value is reasonable
    if (U1BRG > 65535) return;
    
    // Enable UART
    U1MODEbits.UARTEN = 1;      
    U1STAbits.UTXEN = 1;        
}

// Character output for printf
int putchar(int c) {
    // Assert: Valid character range
    if (c < 0 || c > 255) return -1;
    
    while (U1STAbits.UTXBF);    // Wait for TX buffer
    U1TXREG = c;
    return c;
}

// Timer1 initialization for system tick
void initTimer1(void) {
    // Assert: Timer registers accessible
    T1CON = 0x0000;             // Clear timer config
    TMR1 = 0;                   // Clear timer value
    PR1 = 15625;                // Set period for 100Hz at FCY/256
    
    // Assert: PR1 value is non-zero
    if (PR1 == 0) return;
    
    T1CONbits.TCKPS = 0b11;     // 1:256 prescaler
    IPC0bits.T1IP = 4;          // Interrupt priority 4
    IFS0bits.T1IF = 0;          // Clear interrupt flag
    IEC0bits.T1IE = 1;          // Enable interrupt
    T1CONbits.TON = 1;          // Start timer
}

// Timer1 interrupt service routine
void __attribute__((interrupt, auto_psv)) _T1Interrupt(void) {
    IFS0bits.T1IF = 0;          // Clear interrupt flag
    OSTimer();                  // Call OS timer service
}

// System initialization task
void TaskSystemInit(void) {
    printf("TaskSystemInit: Hardware initialization complete\n");
    
    // Signal initialization complete
    OSSignalBinSem(BINSEM_INIT_COMPLETE);
    printf("TaskSystemInit: Initialization signal sent\n");
    
    // Task complete - destroy self
    OS_Destroy();
}

// System startup task
void TaskStartSystem(void) {
    printf("TaskStartSystem: Waiting for initialization\n");
    
    // Wait for initialization to complete
    OS_WaitBinSem(BINSEM_INIT_COMPLETE, OSNO_TIMEOUT);
    printf("TaskStartSystem: Initialization confirmed\n");
    
    // Create the idle task
    OSCreateTask(TaskIdle, TASK_IDLE_P, PRIO_IDLE);
    printf("TaskStartSystem: Idle task created\n");
    printf("TaskStartSystem: System startup complete\n");
    
    // Task complete - destroy self  
    OS_Destroy();
}

// Idle task - runs continuously after system startup
void TaskIdle(void) {
    unsigned long tick_counter = 0;
    
    printf("TaskIdle: Entering idle state\n");
    
    for(;;) {
        // Kick watchdog to prevent reset
        ClrWdt();
        
        // Print heartbeat every 10 seconds (1000 ticks at 100Hz)
        tick_counter++;
        if (tick_counter >= 1000) {
            printf("TaskIdle: Heartbeat - System running\n");
            tick_counter = 0;
        }
        
        // Yield to other tasks and delay
        OS_Delay(1);
    }
}

// Main function
int main(void) {
    // Initialize hardware
    initUART();
    printf("\n--- Satellite System Start ---\n");
    
    // Initialize Salvo RTOS
    OSInit();
    printf("Salvo RTOS initialized\n");
    
    // Create initialization semaphore
    OSCreateBinSem(BINSEM_INIT_COMPLETE, 0);
    printf("Initialization semaphore created\n");
    
    // Create startup tasks
    OSCreateTask(TaskSystemInit, TASK_SYSTEM_INIT_P, PRIO_SYSTEM_INIT);
    OSCreateTask(TaskStartSystem, TASK_START_SYSTEM_P, PRIO_START_SYSTEM);
    printf("Startup tasks created\n");
    
    // Initialize system timer
    initTimer1();
    printf("System timer initialized\n");
    
    // Initialize tick counter
    OSSetTicks(0);
    printf("Tick counter initialized\n");
    
    printf("Starting scheduler\n");
    printf("--- System Ready ---\n");
    
    // Main scheduler loop
    while(1) {
        OSSched();
        ClrWdt();  // Additional watchdog kick in main loop
    }
    
    // Should never reach here
    return 0;
}