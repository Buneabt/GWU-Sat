#ifndef TASK_DATA_LOGGING_H
#define TASK_DATA_LOGGING_H

#include "data_structures.h"

// Data logging functions
log_result_t DataLog_LogMissionData(unsigned long mission_time, const char* status);
void DataLog_PrintBuffer(void);
uint16_t DataLog_GetEntryCount(void);
mission_log_entry_t* DataLog_GetEntry(uint16_t index);
void DataLog_Clear(void);

// Task function
void TaskDataLogging(void);

#endif // TASK_DATA_LOGGING_H