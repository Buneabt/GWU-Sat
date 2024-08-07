#ifndef CONFIG_H
#define CONFIG_H

#include <time.h>

#define FCY 16000000UL
#define I2C_BAUD 100000UL

extern double Mission_Time;

//Put all possible board commands for each component here along with a comment of what it does

//Battery
#define CMD_Board_Status 0x01

//Eps

//Transceiver

//Antenna



//--Definitions--//

#define BATTERY_LOW_THRESHOLD 30  // Battery level threshold to pause tasks
#define BATTERY_RESUME_THRESHOLD 50 // Battery level threshold to resume tasks

// Define priorities for tasks
#define PRIO_INIT         1
#define PRIO_STATUS       1
#define PRIO_POWER        1
#define PRIO_EXPERIMENT   1
#define PRIO_COMM         1

// Define stack sizes for tasks
#define TASK_INIT_STACK         128
#define TASK_STATUS_STACK       128
#define TASK_POWER_STACK        128
#define TASK_EXPERIMENT_STACK   128
#define TASK_COMM_STACK         128

// Other configuration constants can go here

#endif // CONFIG_H

