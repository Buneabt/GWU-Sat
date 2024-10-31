#ifndef SALVOCFG_H
#define SALVOCFG_H

// Compiler definition
//#define OSCOMPILER              OSMCC30

// System timer configuration
#define TICKS_PER_SECOND        100
#define OSTIMER_PRESCALAR       1

// Task and event configuration
#define OSTASKS                 20    // Total number of tasks in the system
#define OSEVENTS                20   
#define OSEVENT_FLAGS           0    
#define OSMESSAGE_QUEUES        0    

// Memory configuration
#define OSBYTES_OF_DELAYS       4    // 32-bit delays
#define OSBYTES_OF_TICKS        4    // 32-bit timer ticks
#define OSTCBSIZ                8    
#define OSEVENTSIZ              9    
#define OSPRIORITYSIZ           8    

// Feature enablers
#define OSENABLE_DELAYS         TRUE
#define OSENABLE_BINARY_SEMAPHORES TRUE
#define OSENABLE_TIMEOUTS       TRUE
#define OSENABLE_STACK_CHECKING TRUE

// Error checking and debugging
#define OSENABLE_ERROR_CHECKING TRUE
#define OSENABLE_STACK_CHECKING TRUE
#define OSENABLE_IDLEHOOK        TRUE
#define OSENABLE_WATCHDOG        TRUE
#define OSTASK_STACK_SIZE              256


#endif // SALVOCFG_H