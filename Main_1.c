#include <salvo.h>
#include "p24HJ256GP610.h"

// Semaphore handles
#define SEMAPHORE_EXPERIMENTS 0 // Initialize to locked state (0)
#define SEMAPHORE_COMMUNICATION 0 // Initialize to locked state (0)

// Timing Constants
#define SECOND 1
#define MINUTE (60 * SECOND)
#define HOUR (60 * MINUTE)
#define DAY (24 * HOUR)

// Global variables
unsigned int missionTime = 0;  // Mission clock in seconds
unsigned int elapsedTime = 0;  // Elapsed time since system power on
unsigned int batteryLevel = 100; // Battery level in percentage

// Task prototypes
void TaskInitialize(void);
void TaskCheckStatus(void);
void TaskCacheData(void);
void TaskExecuteExperiment(void);
void TaskCommunication(void);
void TaskPowerManagement(void);

int main(void)
{
    OSInit();  // Initialize Salvo RTOS

    // Create tasks
    OSCreateTask(TaskInitialize, TASK_INIT_STACK, PRIO_INIT);
    OSCreateTask(TaskCheckStatus, TASK_STATUS_STACK, PRIO_STATUS);
    OSCreateTask(TaskCacheData, TASK_CACHE_STACK, PRIO_CACHE);
    OSCreateTask(TaskExecuteExperiment, TASK_EXPERIMENT_STACK, PRIO_EXPERIMENT);
    OSCreateTask(TaskCommunication, TASK_COMM_STACK, PRIO_COMM);
    OSCreateTask(TaskPowerManagement, TASK_POWER_STACK, PRIO_POWER);

    // Create semaphores
    semaphoreExperiments = OSCreateBinSem(SEMAPHORE_EXPERIMENTS); // Initialize to locked
    semaphoreCommunication = OSCreateBinSem(SEMAPHORE_COMMUNICATION); // Initialize to locked

    // Start scheduler
    for (;;)
    {
        OSTimer();  // Synthesizes a system tick rate
        OSSched();   // Schedule tasks based on their priorities
    }
}

void TaskInitialize(void)
{
    // Power on and initialize systems
    powerOnSystems();

    // Delay for 30 minutes (convert to seconds)
    OS_Delay(30 * MINUTE);

    // Update mission time
    missionTime = 30 * MINUTE;  // Set mission time to 30 minutes in seconds
    OS_Yield();
}

void TaskCheckStatus(void)
{
    for(;;)
    {
        if (missionTime >= 30 * MINUTE) {
            checkComponentStatus();
            cacheStateVectors();
            cacheSystemErrors();
            missionTime = 30 * MINUTE; // Reset or update as needed
        }
        OS_Yield();
    }
}

void TaskPowerManagement(void)
{
    const unsigned int BATTERY_LOW_THRESHOLD = 30;  // Battery level below which tasks are blocked
    const unsigned int BATTERY_RESUME_THRESHOLD = 50; // Battery level at which tasks are unblocked

    for(;;)
    {
        batteryLevel = getBatteryLevel(); // Read actual battery level
        
        if (batteryLevel < BATTERY_LOW_THRESHOLD)
        {
            // Block tasks
            OSSignalBinSem(semaphoreExperiments);  // Lock semaphore
            OSSignalBinSem(semaphoreCommunication); // Lock semaphore
        }
        else if (batteryLevel > BATTERY_RESUME_THRESHOLD)
        {
            // Unblock tasks
            OS_SignalBinSem(semaphoreExperiments);  // Unlock semaphore
            OS_SignalBinSem(semaphoreCommunication); // Unlock semaphore
        }

        OS_Delay(60 * 60);  // Delay for 1 hour
    }
}

void TaskExecuteExperiment(void)
{
    for(;;)
    {
        // Wait for semaphore to resume execution
        OS_WaitBinSem(semaphoreExperiments, OSNO_TIMEOUT);

        // Perform experiment tasks
        runExperiments();

        // Yield to allow other tasks to run
        OS_Yield();
    }
}

void TaskCommunication(void)
{
    for(;;)
    {
        // Wait for semaphore to resume execution
        OS_WaitBinSem(semaphoreCommunication, OSNO_TIMEOUT);

        // Perform communication tasks
        manageCommunication();

        // Yield to allow other tasks to run
        OS_Yield();
    }
}
