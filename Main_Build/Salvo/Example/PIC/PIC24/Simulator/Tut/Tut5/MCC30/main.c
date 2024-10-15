#include <salvo.h>
#include "p33FJ256GP710.h"
#include "satellite_defs.h"
#include "satellite_utils.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <xc.h>


void initUART(void);
void initTimer1(void);

void OSIdleHook(void)
{
    ClrWdt();  // Clear (kick) the watchdog timer
}


// HELPER FUNCTIONS

// UART configuration for debugging output
void initUART(void) {
    printf("Initializing UART...\n");
    U1MODEbits.STSEL = 0; // 1 Stop bit
    U1MODEbits.PDSEL = 0; // No Parity, 8 data bits
    U1MODEbits.ABAUD = 0; // Autobaud disabled
    U1MODEbits.BRGH = 0;  // Low Speed mode
    U1BRG = 25;           // Baud Rate setting for 9600
    U1MODEbits.UARTEN = 1; // Enable UART
    U1STAbits.UTXEN = 1;   // Enable UART Tx
    printf("UART initialized\n");
    srand((unsigned int)OSGetTicks());  // Seed the random number generator
    printf("Random number generator seeded\n");
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
void TaskRepeat (void) {
    static int counter = 0;
    for(;;) {
        counter++;
        printf("TaskRepeat: Running (iteration %d)\n", counter);
        printf("TaskRepeat: Repeating and Delaying for 10 seconds\n");
        OS_Delay(10);
    }
}

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
    char callsign[] = "KQ4NPQ"; // Bogdan's FCC Callsign
    char eom[] = "<EOM>"; // Signifies the end of the message
    char filename[] = "sat_data.csv";

    for(;;) {
        FILE *fp;
        // Get the current mission time
        const char* mission_time = time_elapsed_DDHHMMSSTT();
        printf("Debug - Current mission time: %s\n", mission_time);
        
        fp = fopen(filename, "a"); // Open in append mode
        if (fp == NULL) {
            printf("Error opening file %s for appending\n", filename);
            OS_Delay(30);
            continue;
        }
        
        // Write to file
        int result = fprintf(fp, "%s,%s,%s\n", callsign, mission_time, eom);
        if (result < 0) {
            printf("Error writing to file %s. Error code: %d\n", filename, result);
        } else {
            printf("Data appended to CSV: %s,%s,%s\n", callsign, mission_time, eom);
        }
        
        fclose(fp);
        
        printf("TaskDataPrep: Data processing complete at %s\n", mission_time);
        OSSignalBinSem(BINSEM_DATA_READY);
        OS_Delay(30);
    }
}



void TaskCommunication (void) {
    for(;;) {
    //Check component status here using i2c functions I will create
    //if (all components good)
    // Delay for a period of time
    printf("TaskCommunication: Waiting For Data \n");
    OS_WaitBinSem(BINSEM_DATA_READY, OSNO_TIMEOUT);
    printf("TaskCommunication: Data Received Sending \n");
    
    //performCommunication();
    
    OSSignalBinSem(BINSEM_DATA_READY);
    OS_Delay(35); //Seconds
    }
}

void TaskPowerMGMT(void) { 
    for(;;) {
        printf("TaskPowerMGMT: Checking Power Level \n");
        
        printf("Current Battery Level: %d%%\n", checkBatteryLevel());
        OS_Delay(50);
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
    
    OSCreateTask(TaskRepeat, TASK_REPEAT_P, PRIO_REPEAT);
    OSCreateTask(TaskStatusCheck, TASK_STATUS_CHECK_P, PRIO_STATUS_CHECK);
    OSCreateTask(TaskCommunication, TASK_COMMUNICATION_P, PRIO_COMMUNICATION);
    OSCreateTask(TaskPowerMGMT, TASK_POWER_MGMT_P, PRIO_POWER_MGMT_NORMAL);
    OSCreateTask(TaskDataPrep, TASK_DATA_PREP_P, PRIO_DATA_PREP);
    

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
        if (OSGetTicks() % 5 == 0) {
           printf("Mission Time: %s\n", time_elapsed_DDHHMMSSTT());
           ClrWdt();
        }
    }
}