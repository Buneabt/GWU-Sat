#include <stdio.h>
#include <time.h>
#include <salvo.h>
#include "tasks.h"
#include "config.h"
#include "i2c_comm.h"

// Define the global variable
double Mission_Time = 0;

int main(void)
{
    OSInit();  // Initialize Salvo RTOS
    I2C_Init(); // Initialize the I2C bus

    // Create semaphores
    OSCreateBinSem(semaphoreExperiments, 1);  // Semaphore initialized to available
    OSCreateBinSem(semaphoreCommunication, 1); // Semaphore initialized to available

    // Create tasks - This list will be very very long in the end, also priorities need to be shifted obviously
    OSCreateTask(TaskInitialize, TASK_INIT_STACK, PRIO_INIT);
    OSCreateTask(TaskCheckStatus, TASK_STATUS_STACK, PRIO_STATUS);
    OSCreateTask(TaskPowerManagement, TASK_POWER_STACK, PRIO_POWER);
    OSCreateTask(TaskExecuteExperiment, TASK_EXPERIMENT_STACK, PRIO_EXPERIMENT);
    OSCreateTask(TaskCommunication, TASK_COMM_STACK, PRIO_COMM);

    // Initialize mission time
    time_t missionStartTime = time(NULL);

    // Start the scheduler
    for (;;)
    {
        OSTimer();  // Synthesizes a system tick rate
        OSSched();  // Schedules tasks based on priority

        // Update mission time
        time_t currentTime = time(NULL); //Starts counter at 1970 Unix start date
        Mission_Time = difftime(currentTime, missionStartTime);
    }
    return 0; // Not reached
}
