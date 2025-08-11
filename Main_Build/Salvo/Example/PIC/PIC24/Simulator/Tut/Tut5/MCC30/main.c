// 'C' source line config statements

// FBS
#pragma config BWRP = WRPROTECT_OFF     // Boot Segment Write Protect (Boot Segment may be written)
#pragma config BSS = NO_FLASH           // Boot Segment Program Flash Code Protection (No Boot program Flash segment)
#pragma config RBS = NO_RAM             // Boot Segment RAM Protection (No Boot RAM)

// FSS
#pragma config SWRP = WRPROTECT_OFF     // Secure Segment Program Write Protect (Secure Segment may be written)
#pragma config SSS = NO_FLASH           // Secure Segment Program Flash Code Protection (No Secure Segment)
#pragma config RSS = NO_RAM             // Secure Segment Data RAM Protection (No Secure RAM)

// FGS
#pragma config GWRP = OFF               // General Code Segment Write Protect (User program memory is not write-protected)
#pragma config GSS = OFF                // General Segment Code Protection (User program memory is not code-protected)

// FOSCSEL
#pragma config FNOSC = LPRCDIVN         // Oscillator Mode (Internal Fast RC (FRC) with divide by N)
#pragma config IESO = ON                // Two-speed Oscillator Start-Up Enable (Start up with FRC, then switch)

// FOSC
#pragma config POSCMD = XT              // Primary Oscillator Source (XT Oscillator Mode)
#pragma config OSCIOFNC = OFF           // OSC2 Pin Function (OSC2 pin has clock out function)
#pragma config FCKSM = CSDCMD           // Clock Switching and Monitor (Both Clock Switching and Fail-Safe Clock Monitor are disabled)

// FWDT
#pragma config WDTPOST = PS32768        // Watchdog Timer Postscaler (1:32,768)
#pragma config WDTPRE = PR128           // WDT Prescaler (1:128)
#pragma config WINDIS = OFF             // Watchdog Timer Window (Watchdog Timer in Non-Window mode)
#pragma config FWDTEN = ON              // Watchdog Timer Enable (Watchdog timer always enabled)

// FPOR
#pragma config FPWRT = PWR128           // POR Timer Value (128ms)

// FICD
#pragma config ICS = PGD1               // Comm Channel Select (Communicate on PGC1/EMUC1 and PGD1/EMUD1)
#pragma config JTAGEN = OFF             // JTAG Port Enable (JTAG is Disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

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

// Write function for printf support - using UART1 consistently
int __attribute__((__section__(".libc.write"))) write(int handle, void *buffer, unsigned int len) {
    int i;
    if (handle != 1) return -1;  // Only support stdout
    
    for (i = 0; i < len; i++) {
        while (U1STAbits.UTXBF);  // Use UART1 (working UART)
        U1TXREG = *(char*)buffer++;
    }
    return len;
}

// OS Idle Hook - kicks watchdog
void OSIdleHook(void) {
    ClrWdt();
}

// UART initialization - using the working UART1 configuration
void initUART(void) {
    U1MODEbits.UARTEN = 0;      // Disable during config
    U1MODEbits.STSEL = 0;       // 1 Stop bit
    U1MODEbits.PDSEL = 0;       // No Parity, 8 data bits
    U1MODEbits.ABAUD = 0;       // Auto-Baud disabled
    U1MODEbits.BRGH = 0;        // Standard Speed mode
    
    U1BRG = 25;                 // For FCY=4MHz, 9600 baud (WORKING VALUE)
    
    U1MODEbits.UARTEN = 1;      // Enable UART
    U1STAbits.UTXEN = 1;        // Enable TX
}

// Character output for printf - using UART1
int putchar(int c) {
    if (c < 0 || c > 255) return -1;
    
    while (U1STAbits.UTXBF);    // Wait for UART1 TX buffer
    U1TXREG = c;
    return c;
}

// Timer1 initialization for system tick
void initTimer1(void) {
    T1CON = 0x0000;             // Clear timer config
    TMR1 = 0;                   // Clear timer value
    
    // For FCY=4MHz, want 100Hz tick: 4MHz / 256 / 100Hz = 156
    PR1 = 156;                  // Set period for 100Hz at FCY/256
    
    if (PR1 == 0) return;       // Safety check
    
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
    static unsigned long last_heartbeat_time = 0;
    unsigned long current_time;
    
    printf("TaskIdle: Entering idle state\n");
    
    for(;;) {
        // Kick watchdog to prevent reset
        ClrWdt();
        
        // Get current system time in ticks
        current_time = OSGetTicks();
        
        // Print heartbeat every 10 seconds (1000 ticks at 100Hz)
        if ((current_time - last_heartbeat_time) >= 1000) {
            printf("TaskIdle: Heartbeat - System running (Ticks: %lu)\n", current_time);
            last_heartbeat_time = current_time;
        }
        
        // Yield to other tasks and delay for 100 ticks (1 second)
        OS_Delay(100);
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