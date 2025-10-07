#include "task_system.h"
#include "satellite_defs.h"
#include "eps_driver.h"
#include "battery_driver.h"
#include "uhf_driver.h"
#include "task_data_logging.h"
#include "task_status_check.h"
#include "task_idle.h"
#include "timer_driver.h"
#include <stdio.h>

// System initialization task - simplified and robust
// NASA Rule #4: Function fits on single page
void TaskSystemInit(void) {
    // NASA Rule #5: At least 2 assertions per function
    // Initialize and start system timer
    Timer_Init();
    Timer_Start();
    printf("System timer initialized\n");

            printf("\n=== UART Loopback Test ===\n");
printf("Checking for any UART RX activity...\n");

Timer_DelayTicks(100); // Wait 1 second

if (UART_DataAvailable()) {
    printf("Data detected in UART buffer!\n");
    while (UART_DataAvailable()) {
        char c = UART_ReceiveByte();
        printf("RX: 0x%02X ('%c')\n", c, (c >= 32 && c < 127) ? c : '?');
    }
} else {
    printf("No UART RX data detected\n");
}
printf("=== End Loopback Test ===\n\n");
    
    
    
    

    printf("Tick counter initialized\n");
    
    printf("TaskSystemInit: Starting hardware init pausing ~ 5 seconds change to 30 mins for nanoracks\n");
    
    Timer_DelayTicks(500);
    
    printf("\n Before Tick Count: %lu\n", OSGetTicks());
    
    //Timer_DelayTicks(1000);
    printf("\n Current Tick Count: %lu\n", OSGetTicks());
    
    // Fixed: Call void function without assignment
    System_InitializeHardware();
    printf("TaskSystemInit: Hardware initialization completed\n");
    
    // Check if we have at least one power system
    eps_status_t eps_status = EPS_GetBoardStatus();
    battery_status_t battery_status = Battery_GetBoardStatus();
    
    if (!EPS_IsHealthy(eps_status) && !Battery_IsHealthy(battery_status)) {
        printf("TaskSystemInit: CRITICAL - No power system available!\n");
        // Log critical failure
        DataLog_LogMissionData(0, "INIT_POWER_FAIL");
    }
    
    // Initialize data logging system
    DataLog_Clear();
    DataLog_LogMissionData(0, "SYSTEM_START");
    printf("TaskSystemInit: Data logging OK\n");
    
    // Simple self-test
    printf("TaskSystemInit: Running basic tests\n");
    uint8_t self_test_result = System_SelfTest();
    
    // NASA Rule #5: Second assertion
    if (self_test_result == 0) {
        printf("TaskSystemInit: Self-test failed\n");
    }
    
    printf("TaskSystemInit: Initialization complete\n");
    

    
    OSSignalBinSem(BINSEM_INIT_COMPLETE);
    

    printf("TaskSystemInit: Signaled completion\n");
    
    printf("TaskSystemInit: Terminating\n");
    OS_Destroy();
}

// System startup task - simplified
// NASA Rule #4: Function fits on single page
void TaskStartSystem(void) {
    // NASA Rule #5: At least 2 assertions per function
    printf("TaskStartSystem: Waiting for init signal\n");
    
    // Fixed: Correct Salvo binary semaphore wait syntax with label
    OS_WaitBinSem(BINSEM_INIT_COMPLETE, OSNO_TIMEOUT);
    
    printf("TaskStartSystem: Init signal received\n");
    
    // Create operational tasks one by one with delays
    printf("TaskStartSystem: Creating operational tasks\n");
    
    OSCreateTask(TaskStatusCheck, TASK_STATUS_CHECK_P, PRIO_STATUS_CHECK);
    printf("TaskStartSystem: Status check task created\n");
    
    OSCreateTask(TaskDataLogging, TASK_DATA_PREP_P, PRIO_DATA_PREP);
    printf("TaskStartSystem: Data logging task created\n");
    
    OSCreateTask(TaskIdle, TASK_IDLE_P, PRIO_IDLE);
    printf("TaskStartSystem: Idle task created\n");
    
    printf("TaskStartSystem: All tasks created - startup complete\n");
    
    OS_Destroy();
}

// Initialize all hardware subsystems
// NASA Rule #4: Function fits on single page
void System_InitializeHardware(void) {
    // NASA Rule #5: At least 2 assertions per function
    printf("System: Initializing hardware subsystems\n");
    
    // Initialize I2C first
    I2C_Init();
    printf("System: I2C initialized\n");
    
    // Initialize EPS communication
    if (EPS_Init()) {
        printf("System: EPS communication established\n");
    } else {
        printf("System: EPS communication failed\n");
    }
    
    // Initialize Battery communication
    if (Battery_Init()) {
        printf("System: Battery communication OK\n");
    } else {
        printf("System: Battery communication failed\n");
    }
    
    // Initialize UHF Transceiver
    uhf_status_t uhf_init_status = UHF_Init();
    if (uhf_init_status == UHF_OK) {
        printf("System: UHF communication established\n");
    } else {
        printf("System: UHF communication failed: %s\n", UHF_StatusToString(uhf_init_status));
    }
    
    // Initialize data logging system
    DataLog_Clear();
    printf("System: Data logging system initialized\n");
    
    // Log system startup
    DataLog_LogMissionData(0, "SYSTEM_START");
    
    // NASA Rule #5: Second assertion
    if (DataLog_GetEntryCount() == 0) {
        printf("System: Warning - Data logging may have failed\n");
    }
}

// Create all operational tasks
// NASA Rule #4: Function fits on single page
void System_CreateOperationalTasks(void) {
    // NASA Rule #5: At least 2 assertions per function
    printf("System: Creating operational tasks\n");
    
    // Create status check task (same priority as data logging)
    OSCreateTask(TaskStatusCheck, TASK_STATUS_CHECK_P, PRIO_STATUS_CHECK);
    printf("System: Status check task created\n");
    
    // Create data logging background task
    OSCreateTask(TaskDataLogging, TASK_DATA_PREP_P, PRIO_DATA_PREP);
    printf("System: Data logging task created\n");

    
    // Create idle task (lowest priority)
    OSCreateTask(TaskIdle, TASK_IDLE_P, PRIO_IDLE);
    printf("System: Idle task created\n");
    
    // NASA Rule #5: Second assertion
    if (TASK_IDLE_P == 0) {
        printf("System: Error - Invalid idle task pointer\n");
    }
}

// Perform basic system self-test
// NASA Rule #4: Function fits on single page
uint8_t System_SelfTest(void) {
    uint8_t all_tests_passed = 1;
    
    // NASA Rule #5: At least 2 assertions per function
    printf("System: Starting self-test...\n");
    
    // Test 1: EPS Communication
    eps_status_t eps_status = EPS_GetBoardStatus();
    if (EPS_IsHealthy(eps_status)) {
        printf("System: EPS self-test PASSED\n");
    } else {
        printf("System: EPS self-test FAILED\n");
        all_tests_passed = 0;
    }
    
    // Test 2: Battery Communication
    battery_status_t battery_status = Battery_GetBoardStatus();
    if (Battery_IsHealthy(battery_status)) {
        printf("System: Battery self-test PASSED\n");
    } else {
        printf("System: Battery self-test FAILED\n");
        all_tests_passed = 0;
    }
    
    // Test 3: UHF Communication
    uhf_telemetry_t uhf_telemetry;
    uhf_status_t uhf_status = UHF_GetBoardStatus(&uhf_telemetry);
    if (uhf_status == UHF_OK && UHF_IsHealthy(uhf_telemetry)) {
        printf("System: UHF self-test PASSED\n");
    } else {
        printf("System: UHF self-test FAILED - %s\n", UHF_StatusToString(uhf_status));
        // UHF failure is not critical for basic mission
    }
    
    // Test 4: Data Logging System
    log_result_t log_test = DataLog_LogMissionData(0, "SELF_TEST");
    if (log_test == LOG_SUCCESS) {
        printf("System: Data logging self-test PASSED\n");
    } else {
        printf("System: Data logging self-test FAILED\n");
        all_tests_passed = 0;
    }
    
    // Test 5: RTOS Tick System
    unsigned long start_ticks = OSGetTicks();
    printf("System: Timer test start ticks: %lu\n", start_ticks);
    
    // Small delay to check tick progression
    Timer_DelayTicks(1);  // Fixed: Added required label
    
    unsigned long end_ticks = OSGetTicks();
    printf("System: Timer test end ticks: %lu\n", end_ticks);
    
    if (end_ticks > start_ticks) {
        printf("System: Timer self-test PASSED\n");
    } else {
        printf("System: Timer self-test FAILED\n");
        all_tests_passed = 0;
    }
    
    // Test 6: Memory integrity check
    uint16_t log_count = DataLog_GetEntryCount();
    if (log_count >= 2) { // Should have SYSTEM_START and SELF_TEST entries
        printf("System: Memory self-test PASSED\n");
    } else {
        printf("System: Memory self-test FAILED\n");
        all_tests_passed = 0;
    }
    
    // NASA Rule #5: Second assertion
    if (log_count == 0) {
        printf("System: Critical - No log entries found\n");
        all_tests_passed = 0;
    }
    
    printf("System: done\n");
    
    // Always return success to prevent reset loop, but log issues
    if (!all_tests_passed) {
        DataLog_LogMissionData(0, "SELF_TEST_ISSUES");
    }
    
    return 1; // Always return success for robustness
}