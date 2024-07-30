#include <salvo.h>
#include "p24HJ256GP610.h"

//This entire file is an example of how everything should flow. Nothing works and all commands are wrong.

// Global variables
unsigned int batteryLevel = 100; // Battery level in percentage
bool experimentsPaused = false;
bool communicationPaused = false;

// Semaphore handles
bool *semaphoreExperiments = &SEMAPHORE_EXPERIMENTS;
bool *semaphoreCommunication = &SEMAPHORE_COMMUNICATION;


#define SEMAPHORE_EXPERIMENTS 0
#define SEMAPHORE_COMMUNICATION 1


// Timing Constants
#define SECOND 1
#define MINUTE (60 * SECOND)
#define HOUR (60 * MINUTE)
#define DAY (24 * HOUR)

// Global variables
unsigned int missionTime = 0;  // Mission clock in seconds
unsigned int elapsedTime = 0;  // Elapsed time since system power on

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
    const unsigned int BATTERY_LOW_THRESHOLD = 30;   // Battery level below which tasks are paused
    const unsigned int BATTERY_RESUME_THRESHOLD = 50; // Battery level at which tasks are resumed

    for(;;)
    {
        // Check battery level (you'll need to replace this with the actual command)
        batteryLevel = getBatteryLevel(); // Replace with actual function to get battery level

        if (batteryLevel < BATTERY_LOW_THRESHOLD)
        {
            // Pause experiments and communication
            if (!experimentsPaused) {
                OSSignalBinSem(semaphoreExperiments);  // Signal semaphore to pause experiments
                experimentsPaused = true;
            }
            if (!communicationPaused) {
                OSSignalBinSem(semaphoreCommunication);  // Signal semaphore to pause communication
                communicationPaused = true;
            }
        }
        else if (batteryLevel > BATTERY_RESUME_THRESHOLD)
        {
            // Resume experiments and communication
            if (experimentsPaused) {
                OS_WaitBinSem(semaphoreExperiments, OSNO_TIMEOUT);  // Wait for semaphore to resume experiments
                experimentsPaused = false;
            }
            if (communicationPaused) {
                OS_WaitBinSem(semaphoreCommunication, OSNO_TIMEOUT);  // Wait for semaphore to resume communication
                communicationPaused = false;
            }
        }

        OS_Delay(60 * 60);  // Check battery level every hour
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
    while (1)
    {
        // Wait for semaphore to resume execution
        OS_WaitBinSem(semaphoreCommunication, OSNO_TIMEOUT);

        // Perform communication tasks
        manageCommunication();

        // Yield to allow other tasks to run
        OS_Yield();
    }
}



