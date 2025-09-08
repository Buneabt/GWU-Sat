#ifndef TASK_STATUS_CHECK_H
#define TASK_STATUS_CHECK_H

#include <salvo.h>
#include "satellite_defs.h"
#include "eps_driver.h"
#include "battery_driver.h"

// Status check interval (15 seconds = 1500 ticks at 100Hz)
#define STATUS_CHECK_INTERVAL  1500

// Task function
void TaskStatusCheck(void);


#endif // TASK_STATUS_CHECK_H