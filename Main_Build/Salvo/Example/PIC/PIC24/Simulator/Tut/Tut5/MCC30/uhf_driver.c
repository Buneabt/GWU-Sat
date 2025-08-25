#include "uhf_driver.h"
#include "i2c_driver.h" //Remove this if UART works
#include "satellite_defs.h"
#include "uart_driver.h"
#include <stdio.h>
#include <string.h>

// Static variables for driver state
static uint8_t uhf_initialized = 0;


uhf_status_t UHF_GetBoardStatus(void) {
    
//    UART_Init(288); //For 115200
//    UART_SendString("eESSA_UhfStatus");
    
}



// Print UHF status in human-readable format
//void UHF_PrintStatus(uhf_status_t telemetry) { //Telem based
//    if (UHF_IsHealthy(telemetry)) {
//        printf("UHF: OK\n");
//        printf("  Uptime: %lu seconds\n", telemetry.uptime);
//        printf("  TX Packets: %u\n", telemetry.tx_packets);
//        printf("  RX Packets: %u\n", telemetry.rx_packets);
//        
//        // Show optional status info
//        if (telemetry.scw & UHF_SCW_BCN) {
//            printf("  Beacon: Enabled\n");
//        }
//        if (telemetry.scw & UHF_SCW_ECHO) {
//            printf("  Echo: Enabled\n");
//        }
//        
//    } else {
//        printf("UHF: FAILURE\n");
//        
//        if (!telemetry.communication_ok) {
//            printf("  Error: No I2C communication\n");
//        }
//        if (!(telemetry.scw & UHF_SCW_RFTS)) {
//            printf("  Error: Radio transceiver failure\n");
//        }
//        if (!(telemetry.scw & UHF_SCW_FRAM)) {
//            printf("  Error: FRAM failure\n");
//        }
//        if (telemetry.scw & UHF_SCW_MODE) {
//            printf("  Error: Stuck in bootloader mode\n");
//        }
//        
//        printf("  SCW: 0x%04X\n", telemetry.scw);
//    }
//}

// Convert status code to string
const char* UHF_StatusToString(uhf_status_t status) {
    switch (status) {
        case UHF_OK: return "OK";
        case UHF_ERROR: return "Error";
        case UHF_ERROR_BAD_DATA: return "Bad Data";
        case UHF_ERROR_NOT_IMPLEMENTED: return "Not Implemented";
        case UHF_ERROR_I2C_NACK: return "I2C NACK";
        case UHF_ERROR_BUSY: return "Busy";
        case UHF_TIMEOUT: return "Timeout";
        case UHF_NOT_INITIALIZED: return "Not Initialized";
        default: return "Unknown";
    }
}
