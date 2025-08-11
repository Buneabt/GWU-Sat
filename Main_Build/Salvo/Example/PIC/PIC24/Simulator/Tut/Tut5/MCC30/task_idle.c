#include "task_idle.h"
#include "task_data_logging.h"
#include "satellite_defs.h"
#include <stdio.h>
#include <salvo.h>
#include <xc.h>

// Idle task - lowest priority background operations
void TaskIdle(void) {
    static unsigned long last_heartbeat_time = 0;
    unsigned long current_time;
    
    ClrWdt();  // Kick watchdog at start
    printf("TaskIdle: Starting - heartbeat every 10 seconds\n");
    printf("TaskIdle: Using RAM logging system\n");
    
    for(;;) {
        ClrWdt();  // Kick watchdog at start of loop
        
        // Get current system time in ticks
        current_time = OSGetTicks();
        
        // Print heartbeat every 10 seconds (1000 ticks)
        if ((current_time - last_heartbeat_time) >= IDLE_HEARTBEAT_INTERVAL) {
            unsigned long mission_seconds = current_time / 100;  // Convert ticks to seconds
            
            Idle_Heartbeat(mission_seconds);
            last_heartbeat_time = current_time;
        }
        
        ClrWdt();  // Kick watchdog before delay
        
        // Yield to other tasks and delay for 100 ticks (1 second)
        OS_Delay(100);
    }
}

// Perform heartbeat operations
void Idle_Heartbeat(unsigned long mission_time) {
    // Print heartbeat message
    printf("TaskIdle: Heartbeat - Mission Time: %lu seconds, Callsign: %s\n", 
           mission_time, SATELLITE_CALLSIGN);
    
    // Log heartbeat to mission data
    log_result_t log_result = DataLog_LogMissionData(mission_time, "HEARTBEAT");
    if (log_result == LOG_SUCCESS) {
        uint16_t entry_count = DataLog_GetEntryCount();
        printf("TaskIdle: Heartbeat logged (Total entries: %u)\n", entry_count);
        
        // Check if buffer is getting full
        if (entry_count > 0 && (entry_count % MAX_LOG_ENTRIES) == 0) {
            printf("TaskIdle: Log buffer has cycled - oldest data overwritten\n");
        }
    } else {
        printf("TaskIdle: Heartbeat logging failed\n");
    }
}