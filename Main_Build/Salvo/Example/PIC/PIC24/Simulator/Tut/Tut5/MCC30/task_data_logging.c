#include "task_data_logging.h"
#include "satellite_defs.h"
#include <salvo.h>
#include <stdio.h>
#include <string.h>

// Global data logging variables
static mission_log_entry_t mission_log[MAX_LOG_ENTRIES];
static uint16_t log_index = 0;

// Log mission data with circular buffer
log_result_t DataLog_LogMissionData(unsigned long mission_time, const char* status) {
    if (status == NULL) {
        return LOG_INVALID_DATA;
    }
    
    // Use circular buffer (overwrites oldest data when full)
    uint16_t write_index = log_index % MAX_LOG_ENTRIES;
    
    mission_log[write_index].mission_time = mission_time;
    strncpy(mission_log[write_index].callsign, SATELLITE_CALLSIGN, MAX_CALLSIGN_LENGTH - 1);
    mission_log[write_index].callsign[MAX_CALLSIGN_LENGTH - 1] = '\0';
    strncpy(mission_log[write_index].status, status, MAX_STATUS_LENGTH - 1);
    mission_log[write_index].status[MAX_STATUS_LENGTH - 1] = '\0';
    
    log_index++;  // Always increment (used for circular indexing)
    
    return LOG_SUCCESS;
}

// Print logged data summary
void DataLog_PrintBuffer(void) {
    uint16_t total_entries = (log_index < MAX_LOG_ENTRIES) ? log_index : MAX_LOG_ENTRIES;
    uint16_t start_index = (log_index >= MAX_LOG_ENTRIES) ? (log_index % MAX_LOG_ENTRIES) : 0;
    
    printf("=== Mission Log (RAM) ===\n");
    printf("Total entries logged: %u\n", log_index);
    printf("Entries in buffer: %u\n", total_entries);
    
    if (log_index >= MAX_LOG_ENTRIES) {
        printf("Buffer full - showing most recent %u entries\n", MAX_LOG_ENTRIES);
    }
    
    // Print up to 5 most recent entries
    uint16_t entries_to_show = (total_entries < 5) ? total_entries : 5;
    for (uint16_t i = 0; i < entries_to_show; i++) {
        uint16_t display_index = (start_index + total_entries - entries_to_show + i) % MAX_LOG_ENTRIES;
        printf("Entry: Time=%lu, Call=%s, Status=%s\n", 
               mission_log[display_index].mission_time, 
               mission_log[display_index].callsign, 
               mission_log[display_index].status);
    }
    
    if (total_entries > 5) {
        printf("... and %u more entries in buffer\n", total_entries - 5);
    }
    
    printf("========================\n");
}

// Get total number of entries logged
uint16_t DataLog_GetEntryCount(void) {
    return log_index;
}

// Get specific log entry (returns NULL if invalid index)
mission_log_entry_t* DataLog_GetEntry(uint16_t index) {
    if (index >= MAX_LOG_ENTRIES) {
        return NULL;
    }
    
    // For circular buffer, calculate actual index
    if (log_index >= MAX_LOG_ENTRIES) {
        uint16_t start_index = log_index % MAX_LOG_ENTRIES;
        uint16_t actual_index = (start_index + index) % MAX_LOG_ENTRIES;
        return &mission_log[actual_index];
    } else {
        if (index >= log_index) {
            return NULL;
        }
        return &mission_log[index];
    }
}

// Clear all logged data
void DataLog_Clear(void) {
    log_index = 0;
    memset(mission_log, 0, sizeof(mission_log));
    printf("Mission log cleared\n");
}

// Data logging task (currently integrated into other tasks)
void TaskDataLogging(void) {
    // This task could be used for periodic data logging operations
    // For now, data logging is handled by individual tasks
    
    static unsigned long last_summary_time = 0;
    unsigned long current_time;
    
    printf("TaskDataLogging: Background data management started\n");
    
    for(;;) {
        current_time = OSGetTicks();
        
        // Print data summary every 2 minutes (12000 ticks)
        if ((current_time - last_summary_time) >= 12000) {
            DataLog_PrintBuffer();
            last_summary_time = current_time;
        }
        
        // Check if log buffer is getting full and log a warning
        if (log_index > 0 && (log_index % 100) == 0) {
            unsigned long mission_seconds = current_time / 100;
            DataLog_LogMissionData(mission_seconds, "LOG_MILESTONE");
        }
        
        // Yield to other tasks and delay for 5 seconds
        OS_Delay(500);
    }
}
