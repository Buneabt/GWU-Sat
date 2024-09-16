#ifndef CONFIG_H
#define CONFIG_H

// CONFIG3
#pragma config WPFP = WPFP511    // Write Protection Flash Page Segment Boundary (Highest Page (same as page 170))
#pragma config WPDIS = WPDIS     // Segment Write Protection Disable bit (Segmented code protection disabled)
#pragma config WPCFG = WPCFGDIS  // Configuration Word Code Page Protection Select bit (Last page and Flash configuration words are not protected)
#pragma config WPEND = WPENDMEM  // Segment Write Protection End Page Select bit (Write Protect from WPFP to the last page of memory)

// CONFIG2
#pragma config POSCMOD = XT      // Primary Oscillator Select (XT oscillator mode selected)
#pragma config IESO = OFF        // Internal External Switch Over Mode (IESO mode (Two-speed start-up) disabled)
#pragma config FNOSC = PRI       // Initial Oscillator Select (Primary oscillator (XT, HS, EC))
#pragma config FCKSM = CSDCMD    // Clock Switching and Monitor (Both Clock Switching and Fail-safe Clock Monitor are disabled)

// CONFIG1
#pragma config JTAGEN = OFF      // JTAG Port Enable (JTAG port is disabled)
#pragma config GCP = OFF         // General Code Segment Code Protect (Code protection is disabled)
#pragma config GWRP = OFF        // General Segment Write Protect (Writes to program memory are allowed)

#endif // CONFIG_H