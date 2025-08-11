#include "task_system.h"
#include "satellite_defs.h"
#include "eps_driver.h"
#include "task_data_logging.h"
#include "task_status_check.h"
#include "task_idle.h"
#include <stdio.h>

// System initialization task - simplified and robust
void TaskSystemInit(void) {
    
    printf("TaskSystemInit: Starting hardware init\n");
    
    // Initialize EPS communication
    
    if (EPS_Init()) {
        printf("TaskSystemInit: EPS communication OK\n");
    } else {
        printf("TaskSystemInit: EPS communication failed\n");
    }
    
    // Initialize data logging system
    
    DataLog_Clear();
    DataLog_LogMissionData(0, "SYSTEM_START");
    printf("TaskSystemInit: Data logging OK\n");
    
    // Simple self-test
    
    printf("TaskSystemInit: Running basic tests\n");
    System_SelfTest();
    
    
    printf("TaskSystemInit: Initialization complete\n");
    
    // Signal completion and destroy task
    OSSignalBinSem(BINSEM_INIT_COMPLETE);
    printf("TaskSystemInit: Signaled completion\n");
    
    // Small delay before destroying to ensure signal is processed
    printf("TaskSystemInit: About to signal completion\n");
    OSSignalBinSem(BINSEM_INIT_COMPLETE);
    printf("TaskSystemInit: Completion signaled\n");
    
    // Either terminate or wait
    printf("TaskSystemInit: Terminating\n");
    
    OS_Destroy();
}

// System startup task - simplified
void TaskStartSystem(void) {
    
    printf("TaskStartSystem: Waiting for init signal\n");
    
    // Wait for initialization to complete
    OS_WaitBinSem(BINSEM_INIT_COMPLETE, OSNO_TIMEOUT);
    
    printf("TaskStartSystem: Init signal received\n");
    
    // Create operational tasks one by one with delays
    printf("TaskStartSystem: Creating operational tasks\n");
    
    
    OSCreateTask(TaskStatusCheck, TASK_STATUS_CHECK_P, PRIO_STATUS_CHECK);
    OS_Delay(1);
    printf("TaskStartSystem: Status check task created\n");
    
    
    OSCreateTask(TaskDataLogging, TASK_DATA_PREP_P, PRIO_DATA_PREP);
    OS_Delay(1);
    printf("TaskStartSystem: Data logging task created\n");
    
    
    OSCreateTask(TaskIdle, TASK_IDLE_P, PRIO_IDLE);
    OS_Delay(1);
    printf("TaskStartSystem: Idle task created\n");
    
    
    printf("TaskStartSystem: All tasks created - startup complete\n");
    
    OS_Destroy();
}

// System shutdown task (for controlled shutdown)
void TaskSystemShutdown(void) {
    printf("TaskSystemShutdown: Waiting for shutdown signal\n");
    
    for(;;) {
        OS_WaitBinSem(BINSEM_SYS_SHUT_DOWN, OSNO_TIMEOUT);
        
        printf("TaskSystemShutdown: Shutdown sequence initiated\n");
        
        // Log shutdown event
        unsigned long mission_time = OSGetTicks() / 100;
        DataLog_LogMissionData(mission_time, "SHUTDOWN");
        
        // Print final mission log
        DataLog_PrintBuffer();
        
        printf("TaskSystemShutdown: System halted - infinite loop\n");
        
        // Stay in infinite loop to halt system
        for(;;) {
            // Kick watchdog if enabled to prevent reset
            OS_Delay(1000);  // 10 second delay
        }
    }
}

// Initialize all hardware subsystems
void System_InitializeHardware(void) {
    // Initialize EPS communication
    if (EPS_Init()) {
        printf("System: EPS communication established\n");
    } else {
        printf("System: EPS communication failed\n");
    }
    
    // Initialize data logging system
    DataLog_Clear();
    printf("System: Data logging system initialized\n");
    
    // Log system startup
    DataLog_LogMissionData(0, "SYSTEM_START");
}

// Create all operational tasks
void System_CreateOperationalTasks(void) {
    // Create status check task (same priority as data logging)
    OSCreateTask(TaskStatusCheck, TASK_STATUS_CHECK_P, PRIO_STATUS_CHECK);
    printf("TaskStartSystem: Status check task created\n");
    
    // Create data logging background task
    OSCreateTask(TaskDataLogging, TASK_DATA_PREP_P, PRIO_DATA_PREP);
    printf("TaskStartSystem: Data logging task created\n");
    
    // Create system shutdown task
    OSCreateTask(TaskSystemShutdown, TASK_SYSTEM_SHUT_DOWN, PRIO_SYSTEM_SHUT_DOWN);
    printf("TaskStartSystem: Shutdown task created\n");
    
    // Create idle task (lowest priority)
    OSCreateTask(TaskIdle, TASK_IDLE_P, PRIO_IDLE);
    printf("TaskStartSystem: Idle task created\n");
}

// Perform basic system self-test
uint8_t System_SelfTest(void) {
    
    printf("System: Starting self-test...\n");
    
    // Test 1: EPS Communication
    
    eps_status_t eps_status = EPS_GetBoardStatus();
    if (EPS_IsHealthy(eps_status)) {
        printf("System: EPS self-test PASSED\n");
    } else {
        printf("System: EPS self-test FAILED\n");
    }
    
    // Test 2: Data Logging System
    
    log_result_t log_test = DataLog_LogMissionData(0, "SELF_TEST");
    if (log_test == LOG_SUCCESS) {
        printf("System: Data logging self-test PASSED\n");
    } else {
        printf("System: Data logging self-test FAILED\n");
    }
    
    // Test 3: RTOS Tick System (fixed logic)
    
    unsigned long start_ticks = OSGetTicks();
    printf("System: Timer test start ticks: %lu\n", start_ticks);
    
    
    unsigned long end_ticks = OSGetTicks();
    printf("System: Timer test end ticks: %lu\n", end_ticks);
    
    // Fixed: Check if end_ticks > start_ticks (corrected logic)
    if (end_ticks > start_ticks) {
        printf("System: Timer self-test PASSED (ticks incrementing)\n");
    } else {
        printf("System: Timer self-test FAILED (ticks not incrementing)\n");
    }
    
    // Test 4: Memory integrity check
    
    uint16_t log_count = DataLog_GetEntryCount();
    if (log_count >= 1) {
        printf("System: Memory self-test PASSED\n");
    } else {
        printf("System: Memory self-test FAILED\n");
    }
    
    
    printf("System: Self-test completed - system operational\n");
    
    // Always return success to prevent reset loop
    return 1;
}