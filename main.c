#include <salvo.h>
#include "p33FJ256GP710.h"
#include "satellite_defs.h"
#include <stdio.h>

//----------------------------------------------------------------------------------------------------------------------------------//

// Function prototypes
void TaskStatusCheck(void);
void TaskCommunication(void);
void TaskPowerManagement(void);
void TaskExperimentControl(void);
void TaskDataPreparation(void);
void TaskSystemInit(void);
void TaskStartSystem(void);

// Helper functions
unsigned long SecondsToTicks(unsigned long seconds) {
    return seconds * TICKS_PER_SECOND;
}

unsigned long MinutesToTicks(unsigned long minutes) {
    return minutes * TICKS_PER_MINUTE;
}

//----------------------------------------------------------------------------------------------------------------------------------//

// UART configuration for debugging output
void initUART(void) {
    U1MODEbits.STSEL = 0; // 1 Stop bit
    U1MODEbits.PDSEL = 0; // No Parity, 8 data bits
    U1MODEbits.ABAUD = 0; // Autobaud disabled
    U1MODEbits.BRGH = 0;  // Low Speed mode
    U1BRG = 25;           // Baud Rate setting for 9600
    U1MODEbits.UARTEN = 1; // Enable UART
    U1STAbits.UTXEN = 1;   // Enable UART Tx
}

// Function to print a character (used by printf)
int putchar(int c) {
    while (U1STAbits.UTXBF);  // Wait if Transmit buffer is full
    U1TXREG = c;
    return c;
}

//----------------------------------------------------------------------------------------------------------------------------------//

// Project Tasks
void TaskStatusCheck(void) {
    for(;;) {
        printf("TaskStatusCheck: Performing status check\n");
        OS_Delay(SecondsToTicks(60)); // Check status every minute
    }
}

void TaskCommunication(void) {
    for(;;) {
        printf("TaskCommunication: Performing communication operations\n");
        OS_Delay(SecondsToTicks(300)); // Communicate every 5 minutes
    }
}

void TaskPowerManagement(void) {
    for(;;) {
        printf("TaskPowerManagement: Performing power management operations\n");
        OS_Delay(SecondsToTicks(120)); // Check power every 2 minutes
    }
}

void TaskExperimentControl(void) {
    for(;;) {
        printf("TaskExperimentControl: Controlling experiment operations\n");
        OS_Delay(SecondsToTicks(600)); // Check experiment every 10 minutes
    }
}

void TaskDataPreparation(void) {
    for(;;) {
        printf("TaskDataPreparation: Preparing data for transmission\n");
        OS_Delay(SecondsToTicks(180)); // Prepare data every 3 minutes
    }
}

//----------------------------------------------------------------------------------------------------------------------------------//

// BEGINNING TASKS - Used to Initialize the system

void TaskSystemInit(void) {
    printf("TaskSystemInit: Starting\n");
    for (int i = 0; i < 5; i++) {
        printf("TaskSystemInit: Waiting... %d seconds\n", i+1);
        OS_Delay(SecondsToTicks(1)); // Wait for 1 second, 5 times
    }
    printf("TaskSystemInit: Signaling BINSEM_INIT_COMPLETE\n");
    OSSignalBinSem(BINSEM_INIT_COMPLETE);
    printf("TaskSystemInit: Destroying itself\n");
    OS_Destroy();
}

void TaskStartSystem(void) {
    printf("TaskStartSystem: Starting\n");
    printf("TaskStartSystem: Waiting for BINSEM_INIT_COMPLETE\n");
    OS_WaitBinSem(BINSEM_INIT_COMPLETE, OSNO_TIMEOUT);
    printf("TaskStartSystem: BINSEM_INIT_COMPLETE received\n");
    printf("TaskStartSystem: Creating other tasks\n");
    
    OSCreateTask(TaskStatusCheck, TASK_STATUS_CHECK_P, PRIO_STATUS_CHECK);
    OSCreateTask(TaskCommunication, TASK_COMMUNICATION_P, PRIO_COMMUNICATION);
    OSCreateTask(TaskPowerManagement, TASK_POWER_MGMT_P, PRIO_POWER_MGMT_NORMAL);
    OSCreateTask(TaskExperimentControl, TASK_EXPERIMENT_CTRL_P, PRIO_EXPERIMENT_CTRL);
    OSCreateTask(TaskDataPreparation, TASK_DATA_PREP_P, PRIO_DATA_PREP);
    
    printf("TaskStartSystem: All tasks created, destroying itself\n");
    OS_Destroy();
}

//----------------------------------------------------------------------------------------------------------------------------------//

// PRINTING SECTION FOR DEBUGGING

// Timer1 initialization
void initTimer1(void) {
    T1CON = 0x0000;           // Stop Timer1, clock source = internal
    TMR1 = 0;                 // Clear Timer1
    PR1 = 250;              // Set period for 1 second interrupt at 16MHz with 1:256 prescaler
    T1CONbits.TCKPS = 0b11;   // Set prescaler to 1:256
    IPC0bits.T1IP = 4;        // Set Timer1 interrupt priority
    IFS0bits.T1IF = 0;        // Clear Timer1 interrupt flag
    IEC0bits.T1IE = 1;        // Enable Timer1 interrupt
    T1CONbits.TON = 1;        // Start Timer1
}

// Timer1 Interrupt Service Routine
void __attribute__((interrupt, auto_psv)) _T1Interrupt(void) {
    IFS0bits.T1IF = 0;  // Clear Timer1 interrupt flag
    OSTimer();          // Call Salvo's timer function
}

//----------------------------------------------------------------------------------------------------------------------------------//

// MAIN FUNCTION 

int main(void) {
    static int initialized = 0;
    if (!initialized) {
        initialized = 1;
        
        initUART();
        printf("Main: Starting...\n");

        OSInit();
        printf("Main: Salvo initialized\n");
        
        // Create binary semaphores
        OSCreateBinSem(BINSEM_INIT_COMPLETE, 0);
        // ... (other semaphore creations)
        printf("Main: Semaphores Created\n");
        
        // Create initial tasks
        OSCreateTask(TaskSystemInit, TASK_SYSTEM_INIT_P, PRIO_SYSTEM_INIT);
        OSCreateTask(TaskStartSystem, TASK_START_SYSTEM_P, PRIO_START_SYSTEM);
        printf("Main: Initial tasks created\n");
        
        initTimer1();
        printf("Main: Timer1 initialized\n");

        printf("Main: Starting Salvo scheduler\n");
    } else {
        printf("Main: Unexpected re-entry into main()\n");
        while(1);
    }
    
    // Start Salvo scheduler
    printf("Main: Entering scheduler loop\n");
    while(1) {
        OSSched();
    }

    return 0;
}