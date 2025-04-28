#include "satellite_utils.h"
#include <salvo.h>

// Constants as unsigned long long to prevent overflow
#define SEC_PER_DAY   (24ULL * 60ULL * 60ULL)
#define SEC_PER_HOUR  (60ULL * 60ULL)
#define SEC_PER_MIN   60ULL
#define HOUR_PER_DAY  24ULL
#define MIN_PER_HOUR  60ULL
#define MIN_PER_DAY   (24ULL * 60ULL)

// Battery simulation variables
static int g_batteryLevel = 55;
static unsigned long lastBatteryUpdate = 0;
static const unsigned long BATTERY_UPDATE_INTERVAL = 10 * TICKS_PER_SECOND;

// Function to format the elapsed time
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

// Function to set battery level manually
void setBatteryLevel(int level) {
    if (level >= 0 && level <= 100) {
        g_batteryLevel = level;
    }
}

// Battery simulator
int checkBatteryLevel(void) {
    unsigned long currentTicks = OSGetTicks();
    unsigned long elapsedTicks = currentTicks - lastBatteryUpdate;
    
    // Only update if some time has passed
    if (elapsedTicks > 0) {
        // Calculate decrease - make it 5% per second for faster testing
        int decreaseAmount = 5 * (elapsedTicks / TICKS_PER_SECOND);
        
        if (decreaseAmount > 0) {
            if (decreaseAmount > g_batteryLevel) {
                decreaseAmount = g_batteryLevel; // Don't go below 0
            }
            
            // Decrease the battery level
            g_batteryLevel -= decreaseAmount;
            
            // Print debug info
            if (decreaseAmount > 0) {
                printf("Battery decreased by %d%% to %d%% (elapsed time: %lu ticks)\n", 
                       decreaseAmount, g_batteryLevel, elapsedTicks);
            }
            
            // Update the last update time
            lastBatteryUpdate = currentTicks;
        }
    }
    
    return g_batteryLevel;
}