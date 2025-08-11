#ifndef DATA_STRUCTURES_H
#define DATA_STRUCTURES_H

#include <stdint.h>

// Mission data logging configuration
#define MAX_LOG_ENTRIES 400  // Use maximum available RAM (~1.1 hours of logging)
#define MAX_STATUS_LENGTH 16
#define MAX_CALLSIGN_LENGTH 8

// Mission log entry structure
typedef struct {
    unsigned long mission_time;                     // Mission time in seconds
    char callsign[MAX_CALLSIGN_LENGTH];            // Satellite callsign
    char status[MAX_STATUS_LENGTH];                // Status/event description
} mission_log_entry_t;

// System health status
typedef struct {
    uint8_t eps_healthy;
    uint8_t comms_active;
    uint8_t experiments_running;
    uint8_t power_level;  // 0-100%
    unsigned long uptime_seconds;
} system_health_t;

// Telemetry data structure
typedef struct {
    unsigned long timestamp;
    system_health_t health;
    uint16_t battery_voltage_mv;
    int16_t temperature_c;
    uint16_t current_draw_ma;
} telemetry_packet_t;

// Data logging results
typedef enum {
    LOG_SUCCESS = 0,
    LOG_BUFFER_FULL,
    LOG_INVALID_DATA,
    LOG_SYSTEM_ERROR
} log_result_t;

#endif // DATA_STRUCTURES_H