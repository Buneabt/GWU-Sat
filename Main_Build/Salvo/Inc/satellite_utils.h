#ifndef SATELLITE_UTILS_H
#define SATELLITE_UTILS_H

#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include "satellite_defs.h"

// Function prototypes
int checkBatteryLevel(void);  // Keep the original signature
void setBatteryLevel(int level); // Function to set battery level manually
const char* time_elapsed_DDHHMMSSTT(void);

#endif // SATELLITE_UTILS_H