#ifndef TASKS_H
#define TASKS_H

#include <salvo.h>

// External declaration of semaphores
extern OSSemID semaphoreExperiments;
extern OSSemID semaphoreCommunication;

// Task prototypes
void TaskInitialize(void);
void TaskCheckStatus(void);
void TaskCacheData(void);
void TaskExecuteExperiment(void);
void TaskCommunication(void);
void TaskPowerManagement(void);
//Add more tasks down here to declare them

#endif // TASKS_H
