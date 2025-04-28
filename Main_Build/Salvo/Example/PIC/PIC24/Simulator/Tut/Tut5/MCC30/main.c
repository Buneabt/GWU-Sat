// DSPIC33FJ256GP710 Configuration Bit Settings
// Put this at the very top of your main.c or in config.h

// FBS
#pragma config BWRP = WRPROTECT_OFF     // Boot Segment Write Protect (Boot segment may be written)
#pragma config BSS = NO_FLASH           // Boot Segment Program Flash Code Protection (No Boot program flash segment)
#pragma config RBS = NO_RAM             // Boot Segment RAM Protection (No Boot RAM)

// FSS
#pragma config SWRP = WRPROTECT_OFF     // Secure Segment Program Write Protect (Secure segment may be written)
#pragma config SSS = NO_FLASH           // Secure Segment Program Flash Code Protection (No Secure Segment)
#pragma config RSS = NO_RAM             // Secure Segment Data RAM Protection (No Secure RAM)

// FGS
#pragma config GWRP = OFF               // General Code Segment Write Protect (User program memory is not write-protected)
#pragma config GSS = OFF                // General Segment Code Protection (User program memory is not code-protected)

// FOSCSEL
#pragma config FNOSC = FRC              // Oscillator Mode (Internal Fast RC (FRC))
#pragma config IESO = OFF               // Internal External Switch Over Mode (Start-up device with FRC, then automatically switch to user-selected oscillator source)

// FOSC
#pragma config POSCMD = XT              // Primary Oscillator Source (XT Crystal Oscillator Mode)
#pragma config OSCIOFNC = OFF           // OSC2 Pin Function (OSC2 is clock output)
#pragma config FCKSM = CSECME           // Clock Switching and Monitor (Both Clock Switching and Fail-Safe Clock Monitor are enabled)

// FWDT
#pragma config WDTPOST = PS32768        // Watchdog Timer Postscaler (1:32,768)
#pragma config WDTPRE = PR128           // WDT Prescaler (1:128)
#pragma config WINDIS = OFF             // Watchdog Timer Window (Watchdog Timer in Non-Window mode)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (Watchdog timer enabled/disabled by user software)

// FPOR
#pragma config FPWRT = PWR128           // POR Timer Value (128ms)

// FICD
#pragma config ICS = PGD2               // Comm Channel Select (Communicate on PGD2/EMUC2 and PGC2/EMUD2)
#pragma config JTAGEN = OFF             // JTAG Port Enable (JTAG is Disabled)

// Include after config bits
#include <xc.h>





#include <salvo.h>
#include "p33FJ256GP710.h"
#include "satellite_defs.h"
#include "satellite_utils.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>




void initUART(void);
void initTimer1(void);

int __attribute__((__section__(".libc.write"))) write(int handle, void *buffer, unsigned int len) {
    int i;
    for (i = 0; i < len; i++) {
        while (U1STAbits.UTXBF);  // Wait while TX buffer full
        U1TXREG = *(char*)buffer++;
    }
    return len;
}



void OSIdleHook(void)
{
    ClrWdt();  // Clear (kick) the watchdog timer
}


// HELPER FUNCTIONS

// UART configuration for debugging output
void initUART(void) {
    // Disable UART before configuration
    U1MODEbits.UARTEN = 0;
    
    // Configure UART1
    U1MODEbits.STSEL = 0;    // 1 Stop bit
    U1MODEbits.PDSEL = 0;    // No Parity, 8 data bits
    U1MODEbits.ABAUD = 0;    // Auto-Baud disabled
    U1MODEbits.BRGH = 0;     // Standard Speed mode
    
    // Set Baud Rate to 9600
    U1BRG = ((FCY/9600)/16) - 1;  // Calculate proper BRG value
    
    // Enable UART1
    U1MODEbits.UARTEN = 1;   // Enable UART
    U1STAbits.UTXEN = 1;     // Enable TX
}

// Function to print a character (used by printf)
int putchar(int c) {
    while (U1STAbits.UTXBF);  
    U1TXREG = c;
    return c;
}

// Timer1 initialization
void initTimer1(void) {
    T1CON = 0x0000;
    TMR1 = 0;
    PR1 = 15625; 
    T1CONbits.TCKPS = 0b11; 
    IPC0bits.T1IP = 4;
    IFS0bits.T1IF = 0;
    IEC0bits.T1IE = 1;
    T1CONbits.TON = 1;
    printf("Timer1 initialized: PR1=%u, TCKPS=%u\n", PR1, T1CONbits.TCKPS);
}

// Timer1 Interrupt Service Routine
void __attribute__((interrupt, auto_psv)) _T1Interrupt(void) {
    static unsigned long interrupt_count = 0;
    IFS0bits.T1IF = 0;  
    OSTimer();
    interrupt_count++;
    if (interrupt_count % 100 == 0) {
        printf("Timer1 interrupt count: %lu\n", interrupt_count);
    }
}

// END OF HELPER FUNCTIONS

// MAIN PROJECT TASKS 

void TaskStatusCheck (void) {
    for(;;) {
    //Check component status here using i2c functions I will create
    //if (all components good)
    //  Delay for a period of time
    printf("TaskStatusCheck: Components All Good, Yielding and Delaying Check for 15 Seconds \n");
    OS_Delay(15);
    }
}

void TaskDataPrep(void) {
//    char callsign[] = "KQ4NPQ"; // Bogdan's FCC Callsign
//    char eom[] = "<EOM>"; // Signifies the end of the message
//    char filename[] = "sat_data.csv";
//
//    for(;;) {
//        FILE *fp;
//        // Get the current mission time
//        const char* mission_time = time_elapsed_DDHHMMSSTT();
//        printf("Debug - Current mission time: %s\n", mission_time);
//        
//        fp = fopen(filename, "a"); // Open in append mode
//        if (fp == NULL) {
//            printf("Error opening file %s for appending\n", filename);
//            OS_Delay(30);
//            continue;
//        }
//        
//        // Write to file
//        int result = fprintf(fp, "%s,%s,%s\n", callsign, mission_time, eom);
//        if (result < 0) {
//            printf("Error writing to file %s. Error code: %d\n", filename, result);
//        } else {
//            printf("Data appended to CSV: %s,%s,%s\n", callsign, mission_time, eom);
//        }
//        
//        fclose(fp);
//        
//        printf("TaskDataPrep: Data processing complete at %s\n", mission_time);
//        OSSignalBinSem(BINSEM_DATA_READY);
        OS_Delay(30);
    //}
}


void TaskPowerMGMT(void) { 
    int inLowPowerMode = 0;
    int lowPowerHoldTime = 0;
    
    for(;;) {
        // Check the battery level
        int batteryLevel = checkBatteryLevel();
        
        printf("TaskPowerMGMT: Checking Power Level \n");
        printf("Current Battery Level: %d%%\n", batteryLevel);
        
        // Check if we need to enter low power mode
        if (batteryLevel < 50 && !inLowPowerMode) {
            printf("TaskPowerMGMT: Entering low power mode!\n");
            inLowPowerMode = 1;
            lowPowerHoldTime = 0;
        }
        
        // Handle low power mode
        if (inLowPowerMode) {
            // Stay in low power mode until battery is sufficiently recharged
            if (batteryLevel < 75) {
                printf("TaskPowerMGMT: In low power mode. Holding for recharge...\n");
                
                // Every 10 seconds in low power mode increases battery by 1%
                lowPowerHoldTime += 50; // We're delaying 50 ticks at a time
                if (lowPowerHoldTime >= 10 * TICKS_PER_SECOND) {
                    // Increase battery level
                    setBatteryLevel(batteryLevel + 1);
                    lowPowerHoldTime = 0; // Reset counter
                    printf("TaskPowerMGMT: Battery recharged to %d%%\n", batteryLevel + 1);
                }
                
                // Kick the watchdog to prevent reset while in low power mode
                ClrWdt();
            } else {
                // Battery is sufficiently recharged, exit low power mode
                printf("TaskPowerMGMT: Exiting low power mode. Battery level: %d%%\n", batteryLevel);
                inLowPowerMode = 0;
            }
        }
        
        // Delay for 50 ticks before next check
        OS_Delay(50);
    }
}

void TaskSystemShutDown(void) {
    for(;;) {
        OS_WaitBinSem(BINSEM_SYS_SHUT_DOWN, OSNO_TIMEOUT);
        //Stay Stuck here an infinite loop, kick the watchdog so it never times out
        //I'll put a proper shutdown here now but for the time being this should put our sat into a "dead" state
        ClrWdt();
    }
    
}




// SYSTEM START TASKS

void TaskSystemInit(void) {
    printf("TaskSystemInit: Starting\n");
    OS_Delay(5);
   
    OSSignalBinSem(BINSEM_INIT_COMPLETE);
    printf("TaskSystemInit: Signaled\n\n");
    
    OS_Destroy();
}

void TaskStartSystem(void) {
    printf("TaskStartSystem: Starting\n\n");
    printf("TaskStartSystem: Waiting for BINSEM_INIT_COMPLETE\n");

    OS_WaitBinSem(BINSEM_INIT_COMPLETE, OSNO_TIMEOUT);
    
    printf("TaskStartSystem: BINSEM_INIT_COMPLETE received\n");
    
    OSCreateBinSem(BINSEM_DATA_READY, 0);
    OSCreateBinSem(BINSEM_SYS_SHUT_DOWN, 0);  // Add the initial value parameter
    
    OSCreateTask(TaskStatusCheck, TASK_STATUS_CHECK_P, PRIO_STATUS_CHECK);
    OSCreateTask(TaskPowerMGMT, TASK_POWER_MGMT_P, PRIO_POWER_MGMT_NORMAL);
    OSCreateTask(TaskDataPrep, TASK_DATA_PREP_P, PRIO_DATA_PREP);
    OSCreateTask(TaskSystemShutDown, TASK_SYSTEM_SHUT_DOWN, PRIO_SYSTEM_SHUT_DOWN);
    
    

    printf("TaskStartSystem: System fully initialized\n");
    OS_Destroy();
}

// END OF PROJECT TASKS

int main(void) {
    initUART(); 
    printf("\n\n--- Program Start ---\n");
    
    // CSV file creation
    FILE *fp;
    char filename[] = "sat_data.csv";
    
    // Try to open the file in read mode to check if it exists
    fp = fopen(filename, "r");
    if (fp == NULL) {
        // File doesn't exist, create it and write headers
        fp = fopen(filename, "w");
        if (fp == NULL) {
            printf("Error creating datafile %s\n", filename);
        } else {
            fprintf(fp, "Callsign,TimeStamp,EndOfMessage\n");
            printf("CSV file %s created with headers\n", filename);
            fclose(fp);
        }
    } else {
        // File already exists, close it without modifying
        printf("CSV file %s already exists\n", filename);
        fclose(fp);
    }
    
    //Close the csv file with the headers created only once.
    
    
    
    
    OSInit();
    printf("Salvo initialized\n");
    
    OSCreateBinSem(BINSEM_INIT_COMPLETE, 0);
    printf("Binary semaphore created\n");
    
    OSCreateTask(TaskSystemInit, TASK_SYSTEM_INIT_P, PRIO_SYSTEM_INIT);
    OSCreateTask(TaskStartSystem, TASK_START_SYSTEM_P, PRIO_START_SYSTEM);
    printf("Initial tasks created\n");
    
    initTimer1();
    printf("Timer1 initialized\n");
    
    OSSetTicks(0);  // Initialize system ticks
    
    printf("Starting Salvo scheduler\n");
    printf("Entering main loop\n");  // New debug print
    
    while(1) {
    OSSched();
        if (OSGetTicks() % 50 == 0) {
           printf("Mission Time: %s\n", time_elapsed_DDHHMMSSTT());
           ClrWdt();
        }
    }
}