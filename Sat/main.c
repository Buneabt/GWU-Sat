#include "salvo.h"
#include "satellite_defs.h"
#include <p24HJ256GP610.h>  // will need to change this

unsigned long SecondsToTicks(unsigned long seconds) {
    return seconds * TICKS_PER_SECOND;
}

unsigned long MinutesToTicks(unsigned long minutes) {
    return minutes * TICKS_PER_MINUTE;
}


// Your task definitions and main function go here
void TaskSystemInit(void) {
    // ...
}

// ... other tasks ...

int main(void) {
     OSInit()
     OSCreateBinSem(BINSEM_INIT_COMPLETE, 0)

    OSCreateTask(TaskSystemInit, PRIO_SYSTEM_INIT, TASK_SYSTEM_INIT_P)
    OSCreateTask(TaskStartSystem, PRIO_START_SYSTEM, TASK_START_SYSTEM_P)

    EnableIntruppts();

    for(;;) {
        OSSched();
    }

}