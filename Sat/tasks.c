#include <salvo.h>
#include "tasks.h"
#include "config.h"

// Global variables
OSSemID semaphoreExperiments;
OSSemID semaphoreCommunication;

void TaskInitialize(void)
{
    // Initialize hardware and system
    powerOnSystems();

    // Delay for 30 minutes (converted to seconds)
    OS_Delay(30 * 60);  // 30 minutes delay

    // Other initialization tasks
    OS_Yield();
}

void TaskCheckStatus(void)
{
    for(;;)
    {
        checkComponentStatus(); //This will actually call each component using the config defined parameters and calling thw i2C functions.
        cacheStateVectors();
        cacheSystemErrors();

        OS_Yield();
    }
}

void TaskPowerManagement(void)
{
    for(;;)
    {
        unsigned int batteryLevel = GetBatteryLevel(); // Fetch actual battery level

        if (batteryLevel < BATTERY_LOW_THRESHOLD)
        {
            OSSemPost(semaphoreExperiments);    // Pause experiments
            OSSemPost(semaphoreCommunication);  // Pause communications
        }
        else if (batteryLevel > BATTERY_RESUME_THRESHOLD)
        {
            OSSemPend(semaphoreExperiments, OSNO_TIMEOUT);   // Resume experiments
            OSSemPend(semaphoreCommunication, OSNO_TIMEOUT); // Resume communications
        }

        OS_Delay(3600);  // Delay for 1 hour
    }
}

void TaskExecuteExperiment(void)
{
    for(;;)
    {
        OSSemPend(semaphoreExperiments, OSNO_TIMEOUT); // Wait for permission to proceed

        // Execute experiment
        runExperiments();

        OS_Yield();
    }
}

void TaskCommunication(void)
{
    for(;;)
    {
        OSSemPend(semaphoreCommunication, OSNO_TIMEOUT); // Wait for permission to proceed

        // Handle communication tasks
        manageCommunication();

        OS_Yield();
    }
}
