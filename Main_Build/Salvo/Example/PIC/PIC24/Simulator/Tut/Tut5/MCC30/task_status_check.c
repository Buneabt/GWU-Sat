#include "task_status_check.h"
#include "task_data_logging.h"
#include "battery_driver.h"
#include "eps_driver.h"
#include "uhf_driver.h"
#include <stdio.h>
#include <salvo.h>

// Define UHF beacon interval if not defined elsewhere (5 minutes in ticks)
#ifndef UHF_BEACON_INTERVAL
#define UHF_BEACON_INTERVAL 30000
#endif

// EPS, Battery, and UHF Status Check Task
// NASA Rule #4: Function fits on single page
void TaskStatusCheck(void) {
    static unsigned long last_check_time = 0;
    unsigned long current_time;
    eps_status_t eps_status;
    uint8_t eps_healthy;
    battery_status_t battery_status;
    uint8_t battery_healthy;
    uhf_telemetry_t uhf_telemetry;
    uhf_status_t uhf_status;
    i2c_result_t telemetry;
    uint8_t i;
    
    // NASA Rule #5: At least 2 assertions per function
    printf("TaskStatusCheck: Starting system monitoring\n");
    
    if (STATUS_CHECK_INTERVAL == 0) {
        printf("TaskStatusCheck: Error - Invalid check interval\n");
        return;
    }
    
    for(;;) {
        // Get current system time in ticks
        current_time = OSGetTicks();
        
        // Check status every 15 seconds (1500 ticks)
        if ((current_time - last_check_time) >= STATUS_CHECK_INTERVAL) {
            printf("\n--- Status Check --- + %lu seconds\n", current_time/100);
            
            // Check EPS status
            printf("TaskStatusCheck: Querying EPS...\n");
            eps_status = EPS_GetBoardStatus();
            EPS_PrintStatus(eps_status);
            eps_healthy = EPS_IsHealthy(eps_status);
            
            // Check Battery status
            printf("TaskStatusCheck: Querying Battery...\n");
            battery_status = Battery_GetBoardStatus();
            Battery_PrintStatus(battery_status);
            battery_healthy = Battery_IsHealthy(battery_status);
            
            // Check UHF Transceiver Status - BASIC PING ONLY
            printf("TaskStatusCheck: Pinging UHF Transceiver...\n");
            uhf_status = UHF_GetBoardStatus(&uhf_telemetry);
            
            if (uhf_status == UHF_OK) {
                printf("UHF: Responding\n");
            } else {
                printf("UHF: No response - %s\n", UHF_StatusToString(uhf_status));
            }
            
            // Get detailed telemetry for unhealthy systems
            if (!eps_healthy) {
                printf("TaskStatusCheck: EPS unhealthy - getting telemetry\n");
                telemetry = EPS_GetTelemetry();
                if (telemetry.success) {
                    printf("EPS Telemetry: ");
                    for (i = 0; i < telemetry.bytes_received && i < 8; i++) {
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
        
        // NASA Rule #5: Second assertion
        if (current_time < last_check_time) {
            printf("TaskStatusCheck: Warning - Time rollover detected\n");
            last_check_time = current_time;
        }
        
        OS_Delay(100);
    }
}

// Log power system status to mission data
// NASA Rule #4: Function fits on single page
void StatusCheck_LogPowerStatus(unsigned long mission_time, uint8_t eps_healthy, uint8_t battery_healthy) {
    // NASA Rule #5: At least 2 assertions per function
    if (mission_time > 1000000) { // Sanity check on mission time (< 11.5 days)
        printf("StatusCheck_LogPowerStatus: Warning - Large mission time: %lu\n", mission_time);
    }
    
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
    
    // NASA Rule #5: Second assertion
    if (DataLog_GetEntryCount() == 0) {
        printf("StatusCheck_LogPowerStatus: Warning - No log entries found\n");
    }
}