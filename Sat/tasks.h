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
void TaskCommunication(void);
void TaskPowerManagement(void);

void TaskExecuteExperiment1(void); //Comment what each exp does.
void TaskExecuteExperiment2(void);
void TaskExecuteExperiment3(void);
void TaskExecuteExperiment4(void);
void TaskExecuteExperiment5(void);
void TaskExecuteExperiment6(void);


//Add more tasks down here to declare them

#endif // TASKS_H
