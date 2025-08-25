#ifndef UHF_DRIVER_H
#define UHF_DRIVER_H

#include <stdint.h>
#include "satellite_defs.h"
#include "i2c_driver.h"


// UHF Status enumeration (matches EnduroSat eESSA_UhfStatus)
typedef enum {
    UHF_OK = 0,                     // Operation successful
    UHF_ERROR = 1,                  // Operation could not be executed
    UHF_ERROR_BAD_DATA = 2,         // Invalid data provided
    UHF_ERROR_NOT_IMPLEMENTED = 3,  // Operation not implemented
    UHF_ERROR_I2C_NACK = 4,         // No NACK in I2C operation
    UHF_ERROR_BUSY = 5,             // Transceiver busy with previous transfer
    UHF_TIMEOUT = 6,                // Communication timeout
    UHF_NOT_INITIALIZED = 7         // Driver not initialized
} uhf_status_t;

// Function prototypes following your project's naming conventions

// Initialization and basic control
//uint8_t UHF_Init(void);
uhf_status_t UHF_GetBoardStatus(void);

// Status Control Word operations
uhf_status_t UHF_ReadSCW(uint16_t *scw);
uhf_status_t UHF_WriteSCW(uint16_t scw);


#endif // UHF_DRIVER_H