#include <salvo.h>
#include "tasks.h"
#include "config.h"
#include "battery.h"


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

//Exp Tasks Below, instead of using semaphores for each task make it time based?

void TaskExecuteExperiment1(void)
{
    for(;;)
    {
        OSSemPend(semaphoreExperiments, OSNO_TIMEOUT); // Wait for permission to proceed

        // Execute experiment
        runExperiments();

        OS_Yield();
    }
}

void TaskExecuteExperiment2(void)
{
    for(;;)
    {
        OSSemPend(semaphoreExperiments, OSNO_TIMEOUT); // Wait for permission to proceed

        // Execute experiment
        runExperiments();

        OS_Yield();
    }
}

void TaskExecuteExperiment3(void)
{
    for(;;)
    {
        OSSemPend(semaphoreExperiments, OSNO_TIMEOUT); // Wait for permission to proceed

        // Execute experiment
        runExperiments();

        OS_Yield();
    }
}

void TaskExecuteExperiment4(void)
{
    for(;;)
    {
        OSSemPend(semaphoreExperiments, OSNO_TIMEOUT); // Wait for permission to proceed

        // Execute experiment
        runExperiments();

        OS_Yield();
    }
}

void TaskExecuteExperiment5(void)
{
    for(;;)
    {
        OSSemPend(semaphoreExperiments, OSNO_TIMEOUT); // Wait for permission to proceed

        // Execute experiment
        runExperiments();

        OS_Yield();
    }
}

void TaskExecuteExperiment6(void)
{
    for(;;)
    {
        OSSemPend(semaphoreExperiments, OSNO_TIMEOUT); // Wait for permission to proceed

        // Execute experiment
        runExperiments();

        OS_Yield();
    }
}



