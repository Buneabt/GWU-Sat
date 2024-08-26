#include "salvo.h"
#include "satellite_defs.h"
#include "i2c_comm.h"
#include <p33FJ256GP710.h> 

unsigned long SecondsToTicks(unsigned long seconds) {
    return seconds * TICKS_PER_SECOND;
}

unsigned long MinutesToTicks(unsigned long minutes) {
    return minutes * TICKS_PER_MINUTE;
}

// These two tasks get destroyed after setup

void TaskSystemInit(void) //Performs start-up and initial system delay before going to regular sys operations
{
    //Check Component status here

    OS_Delay(MinutesToTicks(30));
    OSSignalBinSem(BINSEM_INIT_COMPLETE);
    OSDestroy();
}

void TaskStartSystem(void)
{
    OS_WaitBinSem(BINSEM_INIT_COMPLETE, OSNO_TIMEOUT);
    
    // Create other tasks
    OSCreateTask(TaskStatusCheck, TASK_STATUS_CHECK_P, PRIO_STATUS_CHECK);
    OSCreateTask(TaskCommunication, TASK_COMMUNICATION_P, PRIO_COMMUNICATION);
    OSCreateTask(TaskPowerManagement, TASK_POWER_MGMT_P, PRIO_POWER_MGMT_NORMAL);
    OSCreateTask(TaskExperimentControl, TASK_EXPERIMENT_CTRL_P, PRIO_EXPERIMENT_CTRL);
    OSCreateTask(TaskDataPreparation, TASK_DATA_PREP_P, PRIO_DATA_PREP);

    OSDestroy();
}

//----------------------------------------------------------------------------------------------------------------------------------//

// COMMS & DATA SECTION TASKS

void TaskStatusCheck(void)
{
    while(1)
    {
        // Perform system status check
        // Use I2C to communicate with other components if needed
        uint16_t status = I2C_ReadTelemetry(0x01);  // Example command
        // Process status...

        OSSignalBinSem(BINSEM_STATUS_CHECKED);
        OS_Delay(ORBIT_PERIOD);
    }
}

void TaskCommunication(void)
{
    while(1)
    {
        // Wait for data to be ready
        OS_WaitBinSem(BINSEM_DATA_READY, OSNO_TIMEOUT);
        
        // Now wait until we're over the ground station
        OS_WaitBinSem(BINSEM_OVER_GROUND_STATION, OSNO_TIMEOUT);
        
        //Here we will call i2c to send down our signal
        performCommunication();
        
        // After communication, signal that we need new data
        OSSignalBinSem(BINSEM_DATA_NEEDED);
        
        // Yield to other tasks
        OS_Yield();
    }
}


void TaskDataPreparation(void)
{
    while(1)
    {
        // Wait for signal that new data is needed
        OS_WaitBinSem(BINSEM_DATA_NEEDED, OSNO_TIMEOUT);
        
        // Prepare data (e.g., collect system data, create CSV)
        prepareDataForTransmission();
        
        // Signal that data is ready
        OSSignalBinSem(BINSEM_DATA_READY);
        
        // Yield to other tasks
        OS_Yield();
    }
}

//----------------------------------------------------------------------------------------------------------------------------------//

// BATTERY MANAGEMENT TASKS

void TaskPowerManagement(void)
{
    OStypePrio originalPriority = PRIO_POWER_MGMT_NORMAL;
    OStypeBoolean isLowPower = FALSE;

    while(1)
    {
        // Check power levels using I2C
        uint16_t powerLevel = I2C_ReadTelemetry(0x02);  // Example command

        //Change these conditions to reflect more accurately on what will be needed
        if (powerLevel < LOW_POWER_THRESHOLD && !isLowPower)
        {
            OSSetPrio(PRIO_POWER_MGMT_LOW);
            isLowPower = TRUE;
            // Enter low power mode
        }
        else if (powerLevel >= LOW_POWER_THRESHOLD && isLowPower)
        {
            OSSetPrio(originalPriority);
            isLowPower = FALSE;
            // Exit low power mode
        }

        OS_Delay(isLowPower ? SecondsToTicks(30) : TICKS_PER_MINUTE);
    }
}

//----------------------------------------------------------------------------------------------------------------------------------//

// EXPERIMENTS SECTIONS

void TaskExperimentControl(void)
{
    while(1)
    {
        OS_WaitBinSem(BINSEM_EXPERIMENT_WINDOW, OSNO_TIMEOUT);
        // Determine which experiment to run
        // Run experiment
        // Use I2C to control experiment hardware if needed
        I2C_SendCommand(0x03, 0x01);  // Example command
        OSSignalBinSem(BINSEM_EXPERIMENT_COMPLETE);
    }
}








//----------------------------------------------------------------------------------------------------------------------------------//

// MAIN FUNC

int main(void)
{
    // Initialize the system clock and other hardware

    // Initialize I2C
    I2C_Init();

    // Initialize Salvo
    OSInit();
    
    // Create binary semaphores
    OSCreateBinSem(BINSEM_INIT_COMPLETE, 0);
    OSCreateBinSem(BINSEM_OVER_GROUND_STATION, 0);
    OSCreateBinSem(BINSEM_STATUS_CHECKED, 0);
    OSCreateBinSem(BINSEM_EXPERIMENT_WINDOW, 0);
    OSCreateBinSem(BINSEM_EXPERIMENT_COMPLETE, 0);
    OSCreateBinSem(BINSEM_DATA_READY, 0);
    OSCreateBinSem(BINSEM_DATA_NEEDED, 1);

    // Create initial tasks
    OSCreateTask(TaskSystemInit, TASK_SYSTEM_INIT_P, PRIO_SYSTEM_INIT);
    OSCreateTask(TaskStartSystem, TASK_START_SYSTEM_P, PRIO_START_SYSTEM);

    // Start Salvo scheduler
    while(1)
    {
        OSSched();
    }

    return 0;
}
