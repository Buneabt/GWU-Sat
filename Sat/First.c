#include "main.h"
#include <salvo.h>

void TaskA ( void ) 
{
    for(;;) {
        OS_Yield();
    }
}

void TaskB ( void ) 
{
    for(;;) {
        OS_Yield();
    }
}



int main ( void )
{
    Init();

    OSInit();

    OSCreateTask(TaskA, OSTCBP(1), 10)
    OSCreateTask(TaskB, OSTCBP(2), 10)

    for(;;) {
        OSSched();
    }
}