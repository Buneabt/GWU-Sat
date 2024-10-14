#include "satellite_utils.h"

int checkBatteryLevel(void) {
    // Generate a random number between 0 and 100
    return rand() % 101;
}

//char * time_elapsed_DDHHMMSSTT (void) {
//    OStypeTick sec, tt;
//    int dd, hh, mm, ss;
//    static char str[15];
//    
//    tt = OSGetTicks();
//    sec = (tt / TICKS_PER_SEC);
//    dd = (sec / SEC_PER_DAY);
//    hh = (sec / SEC_PER_HOUR) - (DD * HOUR_PER_DAY);
//    mm = (sec / SEC_PER_MIN) - (hh * MIN_PER_HOUR) - ( dd * MIN_PER_DAY);
//    ss = sec - (mm * SEC_PER_MIN) - (hh * SEC_PER_HOUR) - (dd * SEC_PER_DAY);
//    tt = tt%TICKS_PER_SEC;
//    dd %= 100;
//    sprintf(str, "%02d:%02d:%02d:%02")
//    
//    
//    
//}



// Add other utility function implementations here in the future
