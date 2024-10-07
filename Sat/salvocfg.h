/************************************************************ 
Copyright (C) 1995-2002 Pumpkin, Inc. and its
Licensor(s). Freely distributable.

$Source: C:\\RCS\\D\\Pumpkin\\Salvo\\Example\\PIC\\PIC24\\Simulator\\Tut\\Tut5\\MCC30\\Pro\\salvocfg.h,v $
$Author: aek $
$Revision: 3.0 $
$Date: 2007-06-27 13:29:43-07 $

Header file for tutorial programs.

************************************************************/

#define OSCOMPILER OSMCC30


#define OSEVENTS                    7
#define OSEVENT_FLAGS               0
#define OSMESSAGE_QUEUES            0
#define OSTASKS                     7


#define OSENABLE_BINARY_SEMAPHORES  TRUE
#define OSENABLE_TIMEOUTS           TRUE
#define OSBYTES_OF_DELAYS           4  //32-byte delays
#define OSBYTES_OF_TICKS            4  //32-byte OStimerTicks

#define OSTCBSIZ 8  // At least 8 for your current tasks
#define OSEVENTSIZ 9  // At least 9 for your current semaphores
#define OSPRIORITYSIZ 7  // At least 7 for your current priority levels
