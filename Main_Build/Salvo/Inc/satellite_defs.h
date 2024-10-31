#ifndef SATELLITE_DEFS_H
#define SATELLITE_DEFS_H

// System clock definition
#define TICKS_PER_MINUTE       (TICKS_PER_SECOND * 60)

// Battery Definitions
#define LOW_POWER_THRESHOLD 15000


// Task Control Block Pointers

#define TASK_SYSTEM_INIT_P     OSTCBP(1)
#define TASK_START_SYSTEM_P    OSTCBP(2)
#define TASK_STATUS_CHECK_P    OSTCBP(3)
#define TASK_COMMUNICATION_P   OSTCBP(4)
#define TASK_POWER_MGMT_P      OSTCBP(5)
#define TASK_EXPERIMENT_CTRL_P OSTCBP(6)
#define TASK_DATA_PREP_P       OSTCBP(7)  
#define TASK_COMM_READ_P       OSTCBP(8)

#define TASK_SYSTEM_SHUT_DOWN  OSTCBP(9)


// ... add more task pointers as needed

// Task Priorities
#define PRIO_SYSTEM_INIT       0 //This will always be 0 and 1
#define PRIO_START_SYSTEM      1

#define PRIO_SYSTEM_SHUT_DOWN 3

#define PRIO_STATUS_CHECK      4
#define PRIO_COMMUNICATION     5
#define PRIO_POWER_MGMT_NORMAL 6
#define PRIO_POWER_MGMT_LOW    3 
#define PRIO_EXPERIMENT_CTRL   7
#define PRIO_DATA_PREP 8

#define PRIO_COMM_READ 2; //Have this be the same level as low power level because receiving power is passive.
// will add more

// Timing Definitions
#define INIT_DELAY             (30 * TICKS_PER_MINUTE)  // 30 minutes
#define ORBIT_PERIOD           (93 * TICKS_PER_MINUTE)  // 93 minutes

// Binary Semaphore Control Block Pointers
#define BINSEM_INIT_COMPLETE       OSECBP(1)
#define BINSEM_OVER_GROUND_STATION OSECBP(2)
#define BINSEM_STATUS_CHECKED      OSECBP(3)
#define BINSEM_COMMS_COMPLETE      OSECBP(4)
#define BINSEM_EXPERIMENT_WINDOW   OSECBP(5)
#define BINSEM_EXPERIMENT_COMPLETE OSECBP(6)
#define BINSEM_DATA_NEEDED         OSECBP(7) 
#define BINSEM_DATA_READY          OSECBP(8)
#define BINSEM_SYS_SHUT_DOWN       OSECBP(9)
// will add more

// Helper function prototypes
unsigned long SecondsToTicks(unsigned long seconds);
unsigned long MinutesToTicks(unsigned long minutes);

#endif // SATELLITE_DEFS_H
