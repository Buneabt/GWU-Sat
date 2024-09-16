/************************************************************ 
Copyright (C) 1995-2002 Pumpkin, Inc. and its
Licensor(s). Freely distributable.

$Source: C:\\RCS\\D\\Pumpkin\\Salvo\\Example\\PIC\\PIC24\\Simulator\\Tut\\Tut5\\MCC30\\Pro\\salvocfg.h,v $
$Author: aek $
$Revision: 3.0 $
$Date: 2007-06-27 13:29:43-07 $

Header file for tutorial programs.

************************************************************/

#define OSEVENTS                    1
#define OSEVENT_FLAGS               0
#define OSMESSAGE_QUEUES            0
#define OSTASKS                     3

#define OSENABLE_BINARY_SEMAPHORES  TRUE
#define OSENABLE_TIMEOUTS           TRUE
#define OSBYTES_OF_DELAYS           4  //32-byte delays
#define OSBYTES_OF_TICKS            4  //32-byte OStimerTicks
