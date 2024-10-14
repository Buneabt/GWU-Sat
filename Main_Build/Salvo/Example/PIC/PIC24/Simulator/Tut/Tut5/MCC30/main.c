#include <salvo.h>
#include "p33FJ256GP710.h"
#include "satellite_defs.h"
#include "satellite_utils.h"
#include <stdio.h>
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
    U1MODEbits.STSEL = 0; // 1 Stop bit
    U1MODEbits.PDSEL = 0; // No Parity, 8 data bits
    U1MODEbits.ABAUD = 0; // Autobaud disabled
    U1MODEbits.BRGH = 0;  // Low Speed mode
    U1BRG = 25;           // Baud Rate setting for 9600
    U1MODEbits.UARTEN = 1; // Enable UART
    U1STAbits.UTXEN = 1;   // Enable UART Tx
    srand((unsigned int)OSGetTicks());  // Seed the random number generator
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
}

// Timer1 Interrupt Service Routine
void __attribute__((interrupt, auto_psv)) _T1Interrupt(void) {
    IFS0bits.T1IF = 0;  
    OSTimer();          
    
    static int tick_count = 0;
    if (++tick_count >= TICKS_PER_SECOND) {
        printf("System ticks: %lu\n", OSGetTicks());
        tick_count = 0;
    }
}

unsigned long SecondsToTicks(unsigned long seconds) {
    return seconds * TICKS_PER_SECOND;
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
    // Delay for a period of time
    printf("TaskStatusCheck: Components All Good, Yielding and Delaying Check for 15 Seconds \n");

    OS_Delay(15);
    }
}

void TaskDataPrep (void) {
    for(;;) {
        //get component data and formulate
        
        //Make some dummy data here and practice sending it over to the comms task
        
        //Send over data and signal the semaphore
        printf("TaskDataPrepped: Data is ready, alerting TaskComm \n");
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
    
    
    OS_Delay(35); //Seconds
    }
}

void TaskPowerMGMT(void) {
    int powerLvl;
    for(;;) {
        printf("TaskPowerMGMT: Checking Power Level \n");
        
        powerLvl = checkBatteryLevel();
        
        
        printf("Current Battery Level: %d%%\n", powerLvl);
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
    
    unsigned long main_counter = 0;
    while(1) {
        OSSched();
        main_counter++;
        if (main_counter % 10000 == 0) {
            printf("Main loop iteration: %lu\n", main_counter);
            printf("Mission Time: %s\n", time_elapsed_DDHHMMSSTT());
            printf("Current system ticks: %lu\n", OSGetTicks());
            ClrWdt();  // Kick the watchdog in the main loop
        }
        // Add a small delay to prevent tight loops
        __delay_ms(1);
    }
}