/************************************************************ 
The contents of this file are subject to the Pumpkin Salvo
License (the "License").  You may not use this file except
in compliance with the License. You may obtain a copy of
the License at http://www.pumpkininc.com, or from
warranty@pumpkininc.com.

Software distributed under the License is distributed on an
"AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express
or implied. See the License for specific language governing
the warranty and the rights and limitations under the
License.

The Original Code is Salvo - The RTOS that runs in tiny
places(TM). Copyright (C) 1995-2016 Pumpkin, Inc. and its
Licensor(s). All Rights Reserved.

$Source: C:\\RCS\\D\\Pumpkin\\Salvo\\Src\\salvotime.c,v $
$Author: aek $
$Revision: 3.5 $
$Date: 2016-03-05 12:45:44-08 $

Elapsed time in human-readable form.

************************************************************/
#include "salvo.h"
#include <string.h>

#if OSENABLE_TICKS

#define HOUR_PER_DAY         24
#define MIN_PER_DAY        1440
#define MIN_PER_HOUR         60
#define SEC_PER_DAY       86400UL
#define SEC_PER_HOUR       3600
#define SEC_PER_MIN          60
#define TICKS_PER_DAY   8640000UL
#define TICKS_PER_HOUR   360000UL
#define TICKS_PER_MIN      6000
#define TICKS_PER_SEC       100




/************************************************************
****                                                     ****
**                                                         **
OSElapsedTime()

Show the elapsed time as tracked by system ticks, in
DD:HH:MM:SS.TT format.

**                                                         **
****                                                     ****
************************************************************/
char * OSElapsedTime(void) {
  OStypeTick ticks, sec;
  int dd, hh, mm, ss, tt;
  static char str[15];
  

  ticks = OSGetTicks();
  sec = ticks/TICKS_PER_SEC;
  dd =                                                              (sec / SEC_PER_DAY);
  hh =                                                              (sec / SEC_PER_HOUR)   - (dd * HOUR_PER_DAY);
  mm =                                       (sec / SEC_PER_MIN)   - (hh * MIN_PER_HOUR)   - (dd * MIN_PER_DAY);
  ss =                                  sec - (mm * SEC_PER_MIN)   - (hh * SEC_PER_HOUR)   - (dd * SEC_PER_DAY);
  tt =  ticks - (ss * TICKS_PER_SEC) - (mm * TICKS_PER_MIN) - (hh * TICKS_PER_HOUR) - (dd * TICKS_PER_DAY);
  // Each field is limited to two bytes ... the math should always yield hh, mm, ss and tt
  //  values under 100, i.e. under two digits. But dd can be more than two digits, once we
  //  go past 99 days. Therefore we play it safe with a modulo on the dd digits ...
  dd %= 100;
  sprintf(str, "%02d:%02d:%02d:%02d.%02d", dd, hh, mm, ss, tt);
   
  return str;
}


#endif /* #if OSENABLE_TICKS */


