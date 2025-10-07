#ifndef UHF_DRIVER_H
#define UHF_DRIVER_H

#include <stdint.h>

// UHF I2C Configuration (if needed later)
#define UHF_I2C_ADDR_DEFAULT  0x22  // Default 7-bit I2C address

// UHF Commands (ESTTC protocol)
#define UHF_CMD_STATUS         "ES+R2200"  // Status Control Word
#define UHF_CMD_UPTIME         "ES+R2202"  // Read uptime
#define UHF_CMD_TEMPERATURE    "ES+R220A"  // Read temperature
#define UHF_CMD_FORCE_BEACON   "ES+W22EE"  // Force beacon transmission

// UHF Status Return Codes (similar to your i2c_result pattern)
typedef enum {
    UHF_OK = 0,
    UHF_ERROR_NO_RESPONSE,
    UHF_ERROR_INVALID_RESPONSE,
    UHF_ERROR_TIMEOUT,
    UHF_ERROR_INVALID_PARAM,
    UHF_ERROR_I2C_FAIL
} uhf_status_t;

// UHF Telemetry Structure (like battery_telemetry_t)
typedef struct {
    uint32_t uptime_seconds;
    int16_t temperature_c;
    uint8_t is_responding;
} uhf_telemetry_t;

/**
 * @brief Initialize UHF transceiver
 * @return UHF status code
 */
uhf_status_t UHF_Init(void);

/**
 * @brief Get UHF board status with telemetry data
 * @param telemetry Pointer to telemetry structure to fill
 * @return UHF status code
 */
uhf_status_t UHF_GetBoardStatus(uhf_telemetry_t *telemetry);

/**
 * @brief Check if UHF telemetry indicates healthy status
 * @param telemetry Telemetry structure to check
 * @return 1 if healthy, 0 if not
 */
uint8_t UHF_IsHealthy(uhf_telemetry_t telemetry);

/**
 * @brief Send beacon message via UHF
 * @param message Message string to send
 * @return UHF status code
 */
uhf_status_t UHF_SendBeacon(const char *message);

/**
 * @brief Get uptime from UHF transceiver
 * @param uptime_seconds Pointer to store uptime value
 * @return UHF status code
 */
uhf_status_t UHF_GetUptime(uint32_t *uptime_seconds);

/**
 * @brief Convert UHF status code to string
 * @param status Status code to convert
 * @return String representation of status
 */
const char* UHF_StatusToString(uhf_status_t status);

#endif /* UHF_DRIVER_H */