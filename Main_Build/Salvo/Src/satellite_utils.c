#include "satellite_utils.h"
#include <salvo.h>  

#define SEC_PER_DAY   (24 * 60 * 60)
#define SEC_PER_HOUR  (60 * 60)
#define SEC_PER_MIN   60
#define HOUR_PER_DAY  24
#define MIN_PER_HOUR  60
#define MIN_PER_DAY   (24 * 60)


int checkBatteryLevel(void) {
    // Generate a random number between 0 and 100
    return rand() % 101;
}

const char* time_elapsed_DDHHMMSSTT(void) {
    static char str[48];  // Increased size for debug info
    OStypeTick ticks;
    unsigned long long sec;
    int dd, hh, mm, ss;
    
    ticks = OSGetTicks();
    sec = ticks;  // Since each tick is now a second
    
    dd = sec / SEC_PER_DAY;
    sec %= SEC_PER_DAY;
    
    hh = sec / SEC_PER_HOUR;
    sec %= SEC_PER_HOUR;
    
    mm = sec / SEC_PER_MIN;
    ss = sec % SEC_PER_MIN;
    
    dd %= 100;  // Ensure days don't exceed two digits
    
    sprintf(str, "%02d:%02d:%02d:%02d (Ticks: %lu)", dd, hh, mm, ss, ticks);
    
    return str;
}