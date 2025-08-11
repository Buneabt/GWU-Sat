#include "task_system.h"
#include "satellite_defs.h"
#include "eps_driver.h"
#include "task_data_logging.h"
#include "task_status_check.h"
#include "task_idle.h"
#include <stdio.h>

// System initialization task
void TaskSystemInit(void) {
    printf("TaskSystemInit: Hardware initialization starting\n");
    
    // Initialize all hardware subsystems
    System_InitializeHardware();
    
    // Perform basic self-test
    uint8_t self_test_result = System_SelfTest();
    if (self_test_result) {
        printf("TaskSystemInit: Self-test passed\n");
    } else {
        printf("TaskSystemInit: Self-test failed - continuing with caution\n");
    }
    
    printf("TaskSystemInit: Hardware initialization complete\n");
    
    // Signal initialization complete
    OSSignalBinSem(BINSEM_INIT_COMPLETE);
    printf("TaskSystemInit: Initialization signal sent\n");
    
    // Task complete - destroy self
    OS_Destroy();
}

// System startup task
void TaskStartSystem(void) {
    printf("TaskStartSystem: Waiting for initialization\n");
    
    // Wait for initialization to complete
    OS_WaitBinSem(BINSEM_INIT_COMPLETE, OSNO_TIMEOUT);
    printf("TaskStartSystem: Initialization confirmed\n");
    
    // Create all operational tasks
    System_CreateOperationalTasks();
    
    printf("TaskStartSystem: System startup complete\n");
    
    // Task complete - destroy self  
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
    uint8_t test_passed = 1;
    
    printf("System: Starting self-test...\n");
    
    // Test 1: EPS Communication
    eps_status_t eps_status = EPS_GetBoardStatus();
    if (EPS_IsHealthy(eps_status)) {
        printf("System: EPS self-test PASSED\n");
    } else {
        printf("System: EPS self-test FAILED\n");
        test_passed = 0;
    }
    
    // Test 2: Data Logging System
    log_result_t log_test = DataLog_LogMissionData(0, "SELF_TEST");
    if (log_test == LOG_SUCCESS) {
        printf("System: Data logging self-test PASSED\n");
    } else {
        printf("System: Data logging self-test FAILED\n");
        test_passed = 0;
    }
    
    // Test 3: RTOS Tick System
    unsigned long start_ticks = OSGetTicks();
    OS_Delay(10);  // Wait 100ms
    unsigned long end_ticks = OSGetTicks();
    if ((end_ticks - start_ticks) >= 9 && (end_ticks - start_ticks) <= 11) {
        printf("System: Timer self-test PASSED\n");
    } else {
        printf("System: Timer self-test FAILED (expected ~10 ticks, got %lu)\n", 
               end_ticks - start_ticks);
        test_passed = 0;
    }
    
    // Test 4: Memory integrity check
    uint16_t log_count = DataLog_GetEntryCount();
    if (log_count >= 1) {  // Should have at least the SELF_TEST entry
        printf("System: Memory self-test PASSED\n");
    } else {
        printf("System: Memory self-test FAILED\n");
        test_passed = 0;
    }
    
    return test_passed;
}