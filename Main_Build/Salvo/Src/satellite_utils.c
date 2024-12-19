#include "satellite_utils.h"
#include <stdlib.h>
#include <stdio.h>
#include <salvo.h>

// Constants as unsigned long long to prevent overflow
#define SEC_PER_DAY   (24ULL * 60ULL * 60ULL)
#define SEC_PER_HOUR  (60ULL * 60ULL)
#define SEC_PER_MIN   60ULL
#define HOUR_PER_DAY  24ULL
#define MIN_PER_HOUR  60ULL
#define MIN_PER_DAY   (24ULL * 60ULL)

int checkBatteryLevel(void) {
    // Generate a random number between 0 and 100
    return rand() % 101;
}

const char* time_elapsed_DDHHMMSSTT(void) {
    static char str[16];  // DD:HH:MM:SS\0
    OStypeTick ticks;
    unsigned long long total_seconds;
    unsigned long long remaining_seconds;
    int dd, hh, mm, ss;
    
    ticks = OSGetTicks();
    total_seconds = (unsigned long long)ticks;  // Each tick is a second
    
    dd = (int)(total_seconds / SEC_PER_DAY);
    remaining_seconds = total_seconds % SEC_PER_DAY;
    
    hh = (int)(remaining_seconds / SEC_PER_HOUR);
    remaining_seconds %= SEC_PER_HOUR;
    
    mm = (int)(remaining_seconds / SEC_PER_MIN);
    ss = (int)(remaining_seconds % SEC_PER_MIN);
    
    dd %= 100;  // Ensure days don't exceed two digits
    
    snprintf(str, sizeof(str), "%02d:%02d:%02d:%02d", dd, hh, mm, ss);
    
    return str;
}