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
    static char str[16];  // DD:HH:MM:SS\0
    OStypeTick ticks;
    unsigned long long sec;
    int dd, hh, mm, ss;
    
    ticks = OSGetTicks();
    sec = (unsigned long long)ticks;  // Each tick is a second
    
    dd = (int)(sec / SEC_PER_DAY);
    sec %= SEC_PER_DAY;
    
    hh = (int)(sec / SEC_PER_HOUR);
    sec %= SEC_PER_HOUR;
    
    mm = (int)(sec / SEC_PER_MIN);
    ss = (int)(sec % SEC_PER_MIN);
    
    dd %= 100;  // Ensure days don't exceed two digits
    
    snprintf(str, sizeof(str), "%02d:%02d:%02d:%02d", dd, hh, mm, ss);
    
    return str;
}