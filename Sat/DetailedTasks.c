#include "main.h"
#include <salvo.h>

unsigned int counter; //Creates a NULL counter global variable


void TaskCount ( void ) 
{
    for(;;) {
        counter++; //Goes up by 1 every time it runs

        OS_Yield();
    }
}

void TaskShow ( void ) 
{
    InitPORT();

    for(;;) {
        PORT = (PORT & ~0xFE) | ((counter >> 8) & 0xFE); //Outputs the 7 upper bits to an 8-bit port (PORT)
                                                         // with 8 LEDs connected to it. 
        OS_Yield();
    }
}



int main ( void )
{
    Init();

    OSInit();

    OSCreateTask(TaskCount, OSTCBP(1), 10)
    OSCreateTask(TaskShow, OSTCBP(2), 10)

    counter = 0; //Now defines the counter variable to 0

    for(;;) {
        OSSched();
    }
}