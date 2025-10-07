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
#pragma config FNOSC = PRI        
#pragma config IESO = OFF                

// FOSC  
#pragma config POSCMD = HS              // HS Crystal Oscillator Mode (for 8MHz crystal)
#pragma config OSCIOFNC = OFF           // OSC2 pin has clock out function
#pragma config FCKSM = CSDCMD           // Clock switching and monitor disabled

// FWDT - Disable watchdog for now to isolate the issue
#pragma config WDTPOST = PS32768        // Watchdog Timer Postscaler (1:32,768)
#pragma config WDTPRE = PR128           // WDT Prescaler (1:128)
#pragma config WINDIS = OFF             // Watchdog Timer Window (Watchdog Timer in Non-Window mode)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (Watchdog timer DISABLED for debugging)

// FPOR
#pragma config FPWRT = PWR128           // POR Timer Value (128ms)

// FICD
#pragma config ICS = PGD1               // Comm Channel Select (Communicate on PGC1/EMUC1 and PGD1/EMUD1)
#pragma config JTAGEN = OFF             // JTAG Port Enable (JTAG is Disabled)

// System includes
#include <xc.h>
#include <salvo.h>
#include "p33FJ256GP710.h"
#include <stdio.h>

// Project includes
#include "satellite_defs.h"
#include "satellite_utils.h"
#include "uart_driver.h"
#include "timer_driver.h"
#include "task_system.h"

// OS Idle Hook - no watchdog kick since it's disabled
void OSIdleHook(void) {
    // Watchdog disabled for debugging
}

// Main function - clean and focused
int main(void) {
    // Initialize hardware drivers
    
  
  
    UART_Init(24);// Initializes to 9600
    
    
    
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
    
    
    printf("Starting scheduler\n");
    printf("--- System Ready ---\n");
    
    // Main scheduler loop
    while(1) {
        OSSched();
        // Note: Individual tasks will kick watchdog, 
        // main loop doesn't need to since scheduler yields to tasks
    }
    
    // Should never reach here
    return 0;
}