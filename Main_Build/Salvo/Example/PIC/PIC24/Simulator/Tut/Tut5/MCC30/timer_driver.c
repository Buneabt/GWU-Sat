#include "timer_driver.h"
#include "satellite_defs.h"
#include <xc.h>
#include <salvo.h>

// Initialize Timer1 for system tick generation
void Timer_Init(void) {
    T1CON = 0x0000;             // Clear timer config
    TMR1 = 0;                   // Clear timer value
    
    // Calculate period register value for desired frequency
    // For FCY=4MHz, want 100Hz tick: FCY / (PRESCALER * FREQUENCY) - 1
    // PR1 = (4000000 / (256 * 100)) - 1 = 155.25 ? 156
    PR1 = 156;
    
    if (PR1 == 0) return;       // Safety check to prevent divide by zero
    
    T1CONbits.TCKPS = 0b11;     // 1:256 prescaler
    IPC0bits.T1IP = 4;          // Interrupt priority 4
    IFS0bits.T1IF = 0;          // Clear interrupt flag
    IEC0bits.T1IE = 1;          // Enable interrupt
}

// Start the timer
void Timer_Start(void) {
    T1CONbits.TON = 1;          // Start timer
}

// Stop the timer
void Timer_Stop(void) {
    T1CONbits.TON = 0;          // Stop timer
}

// Get current system ticks (wrapper for RTOS function)
unsigned long Timer_GetTicks(void) {
    return OSGetTicks();
}

// Delay for specified milliseconds
void Timer_DelayMs(uint16_t milliseconds) {
    // Convert milliseconds to ticks (100 ticks per second = 10ms per tick)
    uint16_t ticks = (milliseconds + 5) / 10;  // Round to nearest tick
    if (ticks == 0) ticks = 1;  // Minimum 1 tick delay
    
    OS_Delay(ticks);
}

// Delay for specified seconds
void Timer_DelaySeconds(uint16_t seconds) {
    uint16_t ticks = seconds * TIMER_FREQUENCY_HZ;
    OS_Delay(ticks);
}

// Timer1 interrupt service routine
void __attribute__((interrupt, auto_psv)) _T1Interrupt(void) {
    IFS0bits.T1IF = 0;          // Clear interrupt flag
    Timer_InterruptHandler();   // Call handler function
}

// Timer interrupt handler function
void Timer_InterruptHandler(void) {
    OSTimer();                  // Call RTOS timer service
}
