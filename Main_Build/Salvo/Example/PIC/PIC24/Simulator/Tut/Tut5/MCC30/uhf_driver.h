#ifndef UHF_DRIVER_H
#define UHF_DRIVER_H

#include <stdint.h>
#include "satellite_defs.h"

// UHF Status enumeration (matches EnduroSat eESSA_UhfStatus)
typedef enum {
    UHF_OK = 0,                     // Operation successful
    UHF_ERROR = 1,                  // Operation could not be executed
    UHF_ERROR_BAD_DATA = 2,         // Invalid data provided
    UHF_ERROR_NOT_IMPLEMENTED = 3,  // Operation not implemented
    UHF_ERROR_I2C_NACK = 4,         // No ACK in I2C operation
    UHF_ERROR_BUSY = 5,             // Transceiver busy with previous transfer
    UHF_TIMEOUT = 6,                // Communication timeout
    UHF_NOT_INITIALIZED = 7         // Driver not initialized
} uhf_status_t;

// UHF telemetry structure for board status
typedef struct {
    uint8_t communication_ok;       // 1 = I2C communication working
    uint8_t board_status_valid;     // 1 = Board status data is valid
    uint16_t scw;                   // Status Control Word
    int16_t temperature_tenths;     // Temperature in tenths of degrees C
    uint32_t uptime_seconds;        // System uptime in seconds
    uint16_t tx_packets;            // Number of transmitted packets
    uint16_t rx_packets;            // Number of received packets
    uint8_t beacon_enabled;         // 1 = Beacon transmission enabled
    uint8_t echo_enabled;           // 1 = Echo mode enabled
    uint8_t rfts_ok;               // 1 = Radio transceiver OK
    uint8_t fram_ok;               // 1 = FRAM memory OK
    uint8_t bootloader_mode;       // 1 = Stuck in bootloader mode
} uhf_telemetry_t;

// Status Control Word (SCW) bit definitions from UHF manual
#define UHF_SCW_RFTS    0x0001      // Radio transceiver status
#define UHF_SCW_FRAM    0x0002      // FRAM status  
#define UHF_SCW_MODE    0x0004      // Mode (0=app, 1=bootloader)
#define UHF_SCW_BCN     0x0008      // Beacon enable
#define UHF_SCW_ECHO    0x0010      // Echo enable

// Function prototypes following NASA safety-critical rules

/**
 * Initialize UHF driver and verify device presence
 * @return UHF_OK on success, error code on failure
 * NASA Rule #4: Function fits on single page
 * NASA Rule #5: Contains runtime assertions
 */
uhf_status_t UHF_Init(void);

/**
 * Get UHF board status and telemetry
 * @param telemetry: Pointer to telemetry structure to fill (must not be NULL)
 * @return UHF_OK on success, error code on failure  
 * NASA Rule #7: Return value must be checked
 */
uhf_status_t UHF_GetBoardStatus(uhf_telemetry_t* telemetry);

/**
 * Read Status Control Word (SCW)
 * @param scw: Pointer to store SCW value (must not be NULL)
 * @return UHF_OK on success, error code on failure
 * NASA Rule #6: Minimize scope - scw is output parameter
 */
uhf_status_t UHF_ReadSCW(uint16_t* scw);

/**
 * Write Status Control Word (SCW)
 * @param scw: SCW value to write
 * @return UHF_OK on success, error code on failure
 * NASA Rule #7: Return value must be checked
 */
uhf_status_t UHF_WriteSCW(uint16_t scw);

/**
 * Read internal temperature sensor
 * @param temperature_tenths: Pointer to store temperature in tenths of degrees C
 * @return UHF_OK on success, error code on failure
 * NASA Rule #6: Minimize scope - temperature is output parameter
 */
uhf_status_t UHF_ReadTemperature(int16_t* temperature_tenths);

/**
 * Send beacon message immediately
 * @param message: Beacon message string (must not be NULL, max 96 chars)
 * @return UHF_OK on success, error code on failure
 * NASA Rule #7: Return value must be checked
 */
uhf_status_t UHF_SendBeacon(const char* message);

/**
 * Reset UHF configuration to factory defaults
 * @return UHF_OK on success, error code on failure
 * NASA Rule #7: Return value must be checked
 */
uhf_status_t UHF_ResetToDefaults(void);

/**
 * Convert UHF status code to human-readable string
 * @param status: Status code to convert
 * @return Pointer to status string (never NULL)
 * NASA Rule #6: Minimize scope - returns const string
 */
const char* UHF_StatusToString(uhf_status_t status);

/**
 * Check if UHF system is healthy based on telemetry
 * @param telemetry: Telemetry data to evaluate
 * @return 1 if healthy, 0 if unhealthy
 * NASA Rule #6: Minimize scope - pure function
 */
uint8_t UHF_IsHealthy(uhf_telemetry_t telemetry);

// Additional ESTTC command functions can be added here following the same pattern:
// - UHF_ConfigureBeacon()
// - UHF_ReadCallSign() 
// - UHF_WriteCallSign()
// - UHF_EnableTransparentMode()
// - UHF_ReadFRAM()
// - UHF_WriteFRAM()
// etc.

#endif // UHF_DRIVER_H