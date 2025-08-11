#include "task_status_check.h"
#include "task_data_logging.h"
#include <stdio.h>

// EPS Status Check Task
void TaskStatusCheck(void) {
    static unsigned long last_check_time = 0;
    unsigned long current_time;
    
    printf("TaskStatusCheck: Starting EPS monitoring\n");
    
    for(;;) {
        // Get current system time in ticks
        current_time = OSGetTicks();
        
        // Check EPS status every 15 seconds (1500 ticks)
        if ((current_time - last_check_time) >= STATUS_CHECK_INTERVAL) {
            printf("TaskStatusCheck: Querying EPS...\n");
            
            // Get EPS board status
            eps_status_t eps_status = EPS_GetBoardStatus();
            
            // Print detailed status
            EPS_PrintStatus(eps_status);
            
            // Check if EPS is healthy and log result
            uint8_t eps_healthy = EPS_IsHealthy(eps_status);
            StatusCheck_LogResult(current_time / 100, eps_healthy);
            
            // If EPS is unhealthy, try to get more information
            if (!eps_healthy) {
                printf("TaskStatusCheck: EPS unhealthy - getting telemetry\n");
                i2c_result_t telemetry = EPS_GetTelemetry();
                if (telemetry.success) {
                    printf("EPS Telemetry: ");
                    for (uint8_t i = 0; i < telemetry.bytes_received; i++) {
                        printf("0x%02X ", telemetry.data[i]);
                    }
                    printf("\n");
                }
            }
            
            last_check_time = current_time;
        }
        
        // Yield to other tasks and delay for 100 ticks (1 second)
        OS_Delay(100);
    }
}

// Log status check result to mission data
void StatusCheck_LogResult(unsigned long mission_time, uint8_t eps_healthy) {
    if (eps_healthy) {
        DataLog_LogMissionData(mission_time, "EPS_OK");
        printf("TaskStatusCheck: EPS healthy - logged to mission data\n");
    } else {
        DataLog_LogMissionData(mission_time, "EPS_FAIL");
        printf("TaskStatusCheck: EPS unhealthy - logged to mission data\n");
    }
}
