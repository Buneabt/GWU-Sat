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
    OSIdleHook();
    OS_Delay(15);
    }
}

#define USE_FILE_STORAGE 0  // Set to 1 for real hardware, 0 for simulator

void TaskDataPrep(void) {
    char callsign[] = "KQ4NPQ";
    char eom[] = "<EOM>";
    
    #if USE_FILE_STORAGE
    // File-based storage for real hardware
    static int file_initialized = 0;
    
    // First run initialization
    if (!file_initialized) {
        FILE *fp = fopen("sat_data.csv", "r");
        if (fp == NULL) {
            // File doesn't exist, create and add header
            fp = fopen("sat_data.csv", "w");
            if (fp != NULL) {
                fprintf(fp, "Callsign,TimeStamp,EndOfMessage\n");
                fclose(fp);
            }
        } else {
            fclose(fp);
        }
        file_initialized = 1;
    }
    #else
    // In-memory storage for simulator
    static char dataBuffer[2048] = "Callsign,TimeStamp,EndOfMessage\n";
    static int bufferPos = 37;
    #endif
    
    for(;;) {
        const char* mission_time = time_elapsed_DDHHMMSSTT();
        
        #if USE_FILE_STORAGE
        // Real hardware: Write to file
        FILE *fp = fopen("sat_data.csv", "a");
        if (fp != NULL) {
            fprintf(fp, "%s,%s,%s\n", callsign, mission_time, eom);
            fclose(fp);
            printf("Data written to file: %s,%s,%s\n", callsign, mission_time, eom);
        } else {
            printf("Error: Could not open file for writing\n");
        }
        #else
        // Simulator: Store in memory
        char newData[100];
        int dataLen = snprintf(newData, sizeof(newData), "%s,%s,%s\n", 
                               callsign, mission_time, eom);
        
        if (bufferPos + dataLen < sizeof(dataBuffer) - 1) {
            strcpy(&dataBuffer[bufferPos], newData);
            bufferPos += dataLen;
            printf("Data added to in-memory storage: %s", newData);
        } else {
            printf("Warning: In-memory storage full\n");
        }
        #endif
        
        printf("TaskDataPrep: Data processing complete\n");
        OSSignalBinSem(BINSEM_DATA_READY);
        OS_Delay(30);
    }
}


void TaskPowerMGMT(void) { 
    int powerMode = 0;        // 0 = normal, 1 = low power, 2 = extreme low power
    int lowPowerHoldTime = 0;
    int lastPrintTime = 0;    // For controlling print frequency in extreme low power mode
    
    printf("TaskPowerMGMT: Starting in normal power mode\n");
    
    for(;;) {
        // Check the battery level
        int batteryLevel = checkBatteryLevel();
        
        // Only print status in extreme low power mode occasionally
        unsigned long currentTicks = OSGetTicks();
        int shouldPrint = (powerMode < 2) || (currentTicks - lastPrintTime >= 10 * TICKS_PER_SECOND);
        
        if (shouldPrint) {
            printf("TaskPowerMGMT: Checking Power Level \n");
            printf("Current Battery Level: %d%%\n", batteryLevel);
            lastPrintTime = currentTicks;
        }
        
        // Check if we need to enter extreme low power mode (under 5%)
        if (batteryLevel <= 5 && powerMode != 2) {
            printf("\n*** TaskPowerMGMT: ENTERING EXTREME LOW POWER MODE! ***\n\n");
            powerMode = 2;
            lowPowerHoldTime = 0;
            
            // Set to highest priority
            OSSetPrio(PRIO_SYSTEM_SHUT_DOWN);
        }
        // Check if we need to enter low power mode (5-50%)
        else if (batteryLevel <= 50 && batteryLevel > 5 && powerMode != 1 && powerMode != 2) {
            printf("\n*** TaskPowerMGMT: ENTERING LOW POWER MODE! ***\n\n");
            powerMode = 1;
            lowPowerHoldTime = 0;
            
            // Change priority of this task to higher priority
            OSSetPrio(PRIO_POWER_MGMT_LOW);
        }
        
        // Handle extreme low power mode
        if (powerMode == 2) {
            // Stay in extreme low power mode until battery reaches 20%
            if (batteryLevel < 20) {
                if (shouldPrint) {
                    printf("TaskPowerMGMT: In EXTREME low power mode. Holding for recharge...\n");
                }
                
                // Every 10 seconds in extreme low power mode increases battery by 1%
                lowPowerHoldTime += 1; 
                if (lowPowerHoldTime >= 10 * TICKS_PER_SECOND) {
                    // Increase battery level
                    int newLevel = batteryLevel + 1;
                    setBatteryLevel(newLevel);
                    lowPowerHoldTime = 0;
                    
                    if (shouldPrint) {
                        printf("TaskPowerMGMT: Battery recharged to %d%%\n", newLevel);
                    }
                }
                
                // Kick the watchdog to prevent reset
                ClrWdt();
                
                // No delay - this task has complete control
            } else {
                // Battery reached 20%, switch to normal low power mode
                printf("\n*** TaskPowerMGMT: EXITING EXTREME LOW POWER MODE. Battery level: %d%% ***\n", batteryLevel);
                printf("*** TaskPowerMGMT: ENTERING LOW POWER MODE ***\n\n");
                powerMode = 1;
                
                // Set priority back to low power level
                OSSetPrio(PRIO_POWER_MGMT_LOW);
            }
        }
        // Handle low power mode
        else if (powerMode == 1) {
            // Stay in low power mode until battery is sufficiently recharged
            if (batteryLevel < 75) {
                printf("TaskPowerMGMT: In low power mode. Holding for recharge...\n");
                
                // Every 10 seconds in low power mode increases battery by 1%
                lowPowerHoldTime += 10;
                if (lowPowerHoldTime >= 10 * TICKS_PER_SECOND) {
                    // Increase battery level
                    int newLevel = batteryLevel + 1;
                    setBatteryLevel(newLevel);
                    lowPowerHoldTime = 0;
                    printf("TaskPowerMGMT: Battery recharged to %d%%\n", newLevel);
                }
                
                // Check if we need to drop to extreme low power mode
                if (batteryLevel <= 5) {
                    printf("\n*** TaskPowerMGMT: ENTERING EXTREME LOW POWER MODE! ***\n\n");
                    powerMode = 2;
                    OSSetPrio(PRIO_SYSTEM_SHUT_DOWN);
                    continue;  // Skip the delay and go back to top of loop
                }
                
                // Kick the watchdog to prevent reset
                ClrWdt();
                
                // Allow other tasks to run
                OS_Delay(10);
            } else {
                // Battery is sufficiently recharged, exit low power mode
                printf("\n*** TaskPowerMGMT: EXITING LOW POWER MODE. Battery level: %d%% ***\n\n", batteryLevel);
                powerMode = 0;
                
                // Restore original priority
                OSSetPrio(PRIO_POWER_MGMT_NORMAL);
                OS_Delay(10);
            }
        } else {
            // Normal operation mode
            printf("TaskPowerMGMT: Normal operation mode, battery level: %d%%\n", batteryLevel);
            
            // Check if we need to drop to extreme low power mode
            if (batteryLevel <= 5) {
                printf("\n*** TaskPowerMGMT: ENTERING EXTREME LOW POWER MODE! ***\n\n");
                powerMode = 2;
                OSSetPrio(PRIO_SYSTEM_SHUT_DOWN);
                continue;  // Skip the delay and go back to top of loop
            }
            
            // Allow other tasks to run
            OS_Delay(10);
        }
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
    
    static unsigned long lastPrintTime = 0; // Add this at the top of main.c or just before your main loop

    while(1) {
        OSSched();

        // Only print mission time once every 50 ticks
        unsigned long currentTicks = OSGetTicks();
        if ((currentTicks % 50 == 0) && (currentTicks != lastPrintTime)) {
            printf("Mission Time: %s\n", time_elapsed_DDHHMMSSTT());
            lastPrintTime = currentTicks;
            OSIdleHook();
        }
    }
}