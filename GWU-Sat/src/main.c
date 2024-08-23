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
    // ...
}