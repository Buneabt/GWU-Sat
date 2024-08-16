#include "main.h"
#include <salvo.h>

//When Programming make sure to define everything at the top in order to make the code more legible
#define TASK_COUNT_P OSTCBP(1)
#define TASK_SHOW_P OSTCBP(2)
#define PRIO_COUNT 10
#define PRIO_SHOW 10
#define BINSEM_UPDATE_PORT_P OSECBP(1) /* binsem #1 */

unsigned int counter;


void TaskCount( void )
{
  while (1) {
    counter++;
    if (!(counter & 0x01FF)) {
        OSSignalBinSem(BINSEM_UPDATE_PORT_P); 
    }
       OS_Yield();
  }
}
   
void TaskShow( void )
{
  InitPORT();
  while (1) { 
    OS_WaitBinSem(BINSEM_UPDATE_PORT_P, OSNO_TIMEOUT);
    
    PORT = (PORT & ~0xFE)|((counter >> 8) & 0xFE);
  }
}

int main( void )
{
  Init();
  OSInit();
  OSCreateTask(TaskCount, TASK_COUNT_P, PRIO_COUNT);
  OSCreateTask(TaskShow, TASK_SHOW_P,  PRIO_SHOW);

  OSCreateBinSem(BINSEM_UPDATE_PORT_P, 0);

  counter = 0;
  while (1) {
       OSSched();
  } 
}
