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

void TaskExecuteExperiment0(void); // Experiment 0: Initial Thruster Tests
void TaskExecuteExperiment1(void); // Experiment 1: Using Rotation for Translational Motion
void TaskExecuteExperiment2(void); // Experiment 2: Rate of Alignment Success for Point on Earth
void TaskExecuteExperiment3(void); // Experiment 3: Affect of Rotation on Solar Panel Intake
void TaskExecuteExperiment4(void); // Experiment 4: Rate of Deviation from Thruster Force Differences
void TaskExecuteExperiment5(void); // Experiment 5: General Lifetime Monitoring (Semaphore should always be set to "1" once experiments begin)
void TaskExecuteExperiment6(void); // Experiment 6: Hull Deterioration from Plasma Arc Emissions


//Add more tasks down here to declare them

#endif // TASKS_H
