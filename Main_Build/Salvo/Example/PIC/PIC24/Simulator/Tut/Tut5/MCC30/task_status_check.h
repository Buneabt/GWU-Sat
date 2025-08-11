#ifndef TASK_STATUS_CHECK_H
#define TASK_STATUS_CHECK_H

#include <salvo.h>
#include "satellite_defs.h"
#include "eps_driver.h"

// Status check configuration
#define STATUS_CHECK_INTERVAL   1500  // 15 seconds in ticks

// Function prototypes
void TaskStatusCheck(void);
void StatusCheck_LogResult(unsigned long mission_time, uint8_t eps_healthy);

#endif // TASK_STATUS_CHECK_H