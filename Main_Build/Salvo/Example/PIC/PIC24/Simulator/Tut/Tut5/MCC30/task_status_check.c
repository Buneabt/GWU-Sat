#include "task_status_check.h"
#include "task_data_logging.h"
#include "battery_driver.h"
#include "uhf_driver.h"
#include <stdio.h>

// EPS and Battery Status Check Task
void TaskStatusCheck(void) {
    static unsigned long last_check_time = 0;
    unsigned long current_time;
    
    printf("TaskStatusCheck: Starting system monitoring\n");
    
    for(;;) {
        // Get current system time in ticks
        current_time = OSGetTicks();
        
        // Check status every 15 seconds (1500 ticks)
        if ((current_time - last_check_time) >= STATUS_CHECK_INTERVAL) {
            printf("\n--- Status Check ---\n");
            
            // Check EPS status
            printf("TaskStatusCheck: Querying EPS...\n");
            eps_status_t eps_status = EPS_GetBoardStatus();
            EPS_PrintStatus(eps_status);
            uint8_t eps_healthy = EPS_IsHealthy(eps_status);
            
            // Check Battery status
            printf("TaskStatusCheck: Querying Battery...\n");
            battery_status_t battery_status = Battery_GetBoardStatus();
            Battery_PrintStatus(battery_status);
            uint8_t battery_healthy = Battery_IsHealthy(battery_status);
            
            // Check Transceiver Status
            printf("TaskStatusCheck: Querying Transceiver...\n");
            //uhf_status_t uhf_status = UHF_GetBoardStatus();
            
            
            // Log combined power system status
            StatusCheck_LogPowerStatus(current_time / 100, eps_healthy, battery_healthy);
            
            // If either system is unhealthy, get more details
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
            
            
            // Check for critical power failure
            if (!eps_healthy && !battery_healthy) {
                printf("*** CRITICAL: Both power systems failing! ***\n");
                DataLog_LogMissionData(current_time / 100, "POWER_CRITICAL");
            }
            
            printf("--- End Status Check ---\n");
            
            last_check_time = current_time;
        }
        
        // Yield to other tasks and delay for 100 ticks (1 second)
        OS_Delay(100);
    }
}

// Log power system status to mission data
void StatusCheck_LogPowerStatus(unsigned long mission_time, uint8_t eps_healthy, uint8_t battery_healthy) {
    if (eps_healthy && battery_healthy) {
        DataLog_LogMissionData(mission_time, "POWER_OK");
        printf("TaskStatusCheck: Power systems healthy\n");
    } else if (eps_healthy && !battery_healthy) {
        DataLog_LogMissionData(mission_time, "BATTERY_FAIL");
        printf("TaskStatusCheck: Battery unhealthy\n");
    } else if (!eps_healthy && battery_healthy) {
        DataLog_LogMissionData(mission_time, "EPS_FAIL");
        printf("TaskStatusCheck: EPS unhealthy\n");
    } else {
        DataLog_LogMissionData(mission_time, "POWER_FAIL");
        printf("TaskStatusCheck: Both power systems unhealthy\n");
    }
}