#ifndef TASK_SYSTEM_H
#define TASK_SYSTEM_H

#include <salvo.h>

// System task functions
void TaskSystemInit(void);
void TaskStartSystem(void);
void TaskSystemShutdown(void);

// System state functions
void System_InitializeHardware(void);
void System_CreateOperationalTasks(void);
uint8_t System_SelfTest(void);

#endif // TASK_SYSTEM_H