#include "timer_driver.h"
#include "satellite_defs.h"
#include <xc.h>
#include <salvo.h>

// Initialize Timer1 for system tick generation

void Timer_Init(void) {
    T1CON = 0x0000;             
    TMR1 = 0;                   
    
    // For FCY = 4MHz exactly (from 8MHz crystal)
    // PR1 = (4000000 / (256 * 100)) - 1 = 155.25, use 155
    PR1 = 155;
   
    T1CONbits.TCKPS = 0b11;     // 1:256 prescaler
    IPC0bits.T1IP = 4;          
    IFS0bits.T1IF = 0;          
    IEC0bits.T1IE = 1;          
}
// Start the timer
void Timer_Start(void) {
    T1CONbits.TON = 1;          // Start timer
}

// Stop the timer
void Timer_Stop(void) {
    T1CONbits.TON = 0;          // Stop timer
}

// Delay for specified ticks (non-RTOS blocking delay)
void Timer_DelayTicks(uint16_t ticks) {
    unsigned long startTicks = OSGetTicks();
    unsigned long targetTicks = startTicks + ticks;
    
    // Handle potential overflow case
    if (targetTicks < startTicks) {
        // Overflow occurred, wait for wraparound
        while (OSGetTicks() >= startTicks) {
            // Wait for tick counter to wrap around
        }
        // Now wait for target
        while (OSGetTicks() < targetTicks) {
            // Wait until we reach target
        }
    } else {
        // Normal case - no overflow
        while (OSGetTicks() < targetTicks) {
            // Wait until we reach target
        }
    }
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