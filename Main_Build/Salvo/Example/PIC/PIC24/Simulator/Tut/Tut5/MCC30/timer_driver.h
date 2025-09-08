#ifndef TIMER_DRIVER_H
#define TIMER_DRIVER_H

#include <stdint.h>

// Timer configuration
#define TIMER_FREQUENCY_HZ  100     // 100Hz system tick
#define TIMER_PRESCALER     256     // Timer prescaler value

// Function prototypes
void Timer_Init(void);
void Timer_Start(void);
void Timer_Stop(void);
void Timer_DelayTicks(uint16_t milliseconds);

// Timer interrupt handler (called by RTOS)
void Timer_InterruptHandler(void);

#endif // TIMER_DRIVER_H