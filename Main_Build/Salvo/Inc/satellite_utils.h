#ifndef SATELLITE_UTILS_H
#define SATELLITE_UTILS_H

#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include "satellite_defs.h"  // Make sure this includes your TICKS_PER_SECOND definition

// Function prototypes
int checkBatteryLevel(void);
const char* time_elapsed_DDHHMMSSTT(void);

#endif // SATELLITE_UTILS_H