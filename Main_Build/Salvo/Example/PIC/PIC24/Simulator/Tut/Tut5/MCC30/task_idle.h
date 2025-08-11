#ifndef TASK_IDLE_H
#define TASK_IDLE_H

#include <salvo.h>

// Idle task configuration
#define IDLE_HEARTBEAT_INTERVAL 1000  // 10 seconds in ticks

// Function prototypes
void TaskIdle(void);
void Idle_Heartbeat(unsigned long mission_time);

#endif // TASK_IDLE_H