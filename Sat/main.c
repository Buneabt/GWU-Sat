#include <salvo.h>
#include "tasks.h"
#include "config.h"
#include "i2c_comm.h"

int main(void)
{
    OSInit();  // Initialize Salvo RTOS
    I2C_Init(); // Initialized the i2C bus

    // Create semaphores
    OSSemCreate(semaphoreExperiments, 1);  // Semaphore initialized to available
    OSSemCreate(semaphoreCommunication, 1); // Semaphore initialized to available

    // Create tasks
    OSCreateTask(TaskInitialize, TASK_INIT_STACK, PRIO_INIT);
    OSCreateTask(TaskCheckStatus, TASK_STATUS_STACK, PRIO_STATUS);
    OSCreateTask(TaskPowerManagement, TASK_POWER_STACK, PRIO_POWER);
    OSCreateTask(TaskExecuteExperiment, TASK_EXPERIMENT_STACK, PRIO_EXPERIMENT);
    OSCreateTask(TaskCommunication, TASK_COMM_STACK, PRIO_COMM);

    // Start the scheduler
    for (;;)
    {
        OSTimer();  // Synthesizes a system tick rate
        OSSched();  // Schedules tasks based on priority
    }

    return 0; // Not reached
}
