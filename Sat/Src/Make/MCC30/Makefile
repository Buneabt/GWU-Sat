###########################################################################################
#
#  Salvo Library Makefiles for Microchip MPLAB C30
#
# $ Pumpkin/Salvo/Src> make MCC30 CVER=2
# $ Pumpkin/Salvo/Src> make MCC30 CVER=3
#
# Notes on CPU specification:
#
#  Omitting -mcpu yields libraries that appear to work for all PIC24 and dsPIC33 devices,
#   but no EP devices (e.g. PIC24EP256MC206)
#  Using -mcpu=generic-16bit yields a library slightly larger than that above, but still
#   doesn't work with EP devices
#  Using -mcpu=generic-16bit-EP yields a library that works with EP devices.
#  There is also an -mcpu=genereic-16bit-DA -- haven't tried it.
#



###########################################################################################
#
#  "Include Guard"
#
BUILD_FOR_MCC30 = FALSE

ifeq ($(F),mcc30)
  BUILD_FOR_MCC30 = TRUE
endif

ifeq ($(F),mcc30e)
  BUILD_FOR_MCC30 = TRUE
endif

ifeq ($(BUILD_FOR_MCC30),TRUE)



###########################################################################################
#
#  Overrides, etc.
#
CUSTOM_CC_RULES     =1


###########################################################################################
#
#  Home directory & executables used
#
MCC30-V2-HOME      ="c:/Program Files/Microchip/MPLAB C30-v2"
MCC30-V3-HOME      ="c:/Program Files/Microchip/MPLAB C30"
PUMPKIN            ="c:/Pumpkin"

MCC30-CC-V2        =$(MCC30-V2-HOME)/bin/pic30-gcc
MCC30-AS-V2        =$(MCC30-V2-HOME)/bin/pic30-as
MCC30-LIB-V2       =$(MCC30-V2-HOME)/bin/pic30-ar
MCC30-CC-V3        =$(MCC30-V3-HOME)/bin/pic30-gcc
MCC30-AS-V3        =$(MCC30-V3-HOME)/bin/pic30-as
MCC30-LIB-V3       =$(MCC30-V3-HOME)/bin/pic30-ar

###########################################################################################
#
#  Default command-line options
#
MCC30-CC-V2-OPTS      =$(LIBRARY-OPTS-E) -I$(INC)/ -I$(INC2)/ -I$(MCC30-V2-HOME)/include/
MCC30-CC-V3-OPTS      =$(LIBRARY-OPTS-E) -I$(PUMPKIN)/Salvo/Inc -I$(MCC30-V3-HOME)/include/


###########################################################################################
#
#  Compile & Assemble Each Salvo Source-code Module (C & Assembly)
#
#  Microchip MPLAB C30 C compiler
#
#  libsalvo[f|l][mcc30|mcc30e][s|l][-|i][a|d|e|m|t].a
#
#
ifeq ($(F),mcc30)

  ifeq ($(CVER),2)
    CC        =$(MCC30-CC-V2)
    CFLAGS    =$(MCC30-CC-V2-OPTS) -mcpu=generic-16bit
    ASSEMBLER =$(MCC30-AS-V2)
    LIBDIR    =MCC30-v$(CVER)
    LIBRARIAN =$(MCC30-LIB-V2)
  endif

  ifeq ($(CVER),3)
    CC        =$(MCC30-CC-V3)
    CFLAGS    =$(MCC30-CC-V3-OPTS) -mcpu=generic-16bit
    ASSEMBLER =$(MCC30-AS-V3)
    LIBDIR    =MCC30-v$(CVER)
    LIBRARIAN =$(MCC30-LIB-V3)
  endif
  
  # SMALL memory model
  ifeq ($(M),OSS)
    CTXSW_SRC =MCC30/salvoportmcc30-sm.s
    CTXSW_OBJ =MCC30/salvoportmcc30.o  
  endif
  
  # LARGE memory model
  ifeq ($(M),OSL)
		CFLAGS +=-mlarge-code -mlarge-data -DOSMCC30_LARGE_CM
		CTXSW_SRC =MCC30/salvoportmcc30-lm.s
		CTXSW_OBJ =MCC30/salvoportmcc30.o  
  endif
  
 
  V         =OSNONE
  CC_OPT1   =-c
  CC_OPT2   = 
  AFLAGS    =
  LIB_FLY   =1
  LIB_NAME  =libsalvomcc30.a
  LIBFLAGS  =-a $(LIB_NAME) $@
  EXTRA_OBJS=MCC30/salvohook_idle MCC30/salvohook_interrupt MCC30/salvohook_wdt
  RMOBJS_LIST=*.o MCC30/*.o
  OBJ_SUFFIX=.o
  LIB_SUFFIX=.a
  
  ifeq ($(O),OSI)
    CC_OPT2 +=-g
    AFLAGS  +=-g
  endif
 
endif  



ifeq ($(F),mcc30e)

  ifeq ($(CVER),2)
    CC        =$(MCC30-CC-V2)
    CFLAGS    =$(MCC30-CC-V2-OPTS) -mcpu=generic-16bit-EP
    ASSEMBLER =$(MCC30-AS-V2)
    LIBDIR    =MCC30-v$(CVER)
    LIBRARIAN =$(MCC30-LIB-V2)
  endif

  ifeq ($(CVER),3)
    CC        =$(MCC30-CC-V3)
    CFLAGS    =$(MCC30-CC-V3-OPTS) -mcpu=generic-16bit-EP 
    ASSEMBLER =$(MCC30-AS-V3)
    LIBDIR    =MCC30-v$(CVER)
    LIBRARIAN =$(MCC30-LIB-V3)
  endif
  
  # SMALL memory model
  ifeq ($(M),OSS)
    CTXSW_SRC =MCC30/salvoportmcc30-sm.s
    CTXSW_OBJ =MCC30/salvoportmcc30.o  
  endif
  
  # LARGE memory model
  ifeq ($(M),OSL)
		CFLAGS +=-mlarge-code -mlarge-data -DOSMCC30_LARGE_CM
		CTXSW_SRC =MCC30/salvoportmcc30-lm.s
		CTXSW_OBJ =MCC30/salvoportmcc30.o  
  endif
  
 
  V         =OSNONE
  CC_OPT1   =-c
  CC_OPT2   = 
  AFLAGS    =
  LIB_FLY   =1
  LIB_NAME  =libsalvomcc30.a
  LIBFLAGS  =-a $(LIB_NAME) $@
  EXTRA_OBJS=MCC30/salvohook_idle MCC30/salvohook_interrupt MCC30/salvohook_wdt
  RMOBJS_LIST=*.o MCC30/*.o
  OBJ_SUFFIX=.o
  LIB_SUFFIX=.a
  
  ifeq ($(O),OSI)
    CC_OPT2 +=-g
    AFLAGS  +=-g
  endif
 
endif 


###########################################################################################
#
#  Rules for Assembly-language Context Switcher   
# 
# 2010-01-29 Added -sm (small model) and -lm (large model) versions of the context switcher
#  to the rules -- they will supercede original salvoportmcc30.
# 
ifeq ($(M),OSS)
  salvoportmcc30.o : MCC30/salvoportmcc30-sm.s
		$(ASSEMBLER) MCC30/salvoportmcc30-sm.s -o salvoportmcc30.o $(AFLAGS)
endif	# small model

ifeq ($(M),OSL)
  salvoportmcc30.o : MCC30/salvoportmcc30-lm.s
		$(ASSEMBLER) MCC30/salvoportmcc30-lm.s -o salvoportmcc30.o $(AFLAGS)
endif # large model

  
###########################################################################################
#
#  Custom CC Rules
#
ifeq ($(CUSTOM_CC_RULES),1)

%.o: %.c $(INC)/salvo.h
	$(CC) $(CC_OPT1) $< -o $*.o $(CC_OPT2) $(CFLAGS)
  
endif


###########################################################################################
#
#  Build libraries.
#
#$(GCC_ARM_STD_LIBRARIES) \
#$(GCC_ARM_OPT_LIBRARIES) : rmobjs rmlib $(OBJS_LIST) $(LIBDIR)/salvoportgccarm.o
#  $(LIBRARIAN) rcs $(LIB_NAME) $(OBJS_LIST)
#  $(LIBRARIAN2) $(LIB_NAME)
#  @mv $(LIB_NAME) $(LIB_FILE)
#  @ls -al $(LIB_FILE)    
  
      
###########################################################################################
#
#  Compiler Example
#
#  "C:\Program Files\Microchip\MPLAB C30\bin\pic30-gcc.exe" 
#    -mcpu=24HJ256GP610 
#    -c 
#    -x c  
#    -I"c:\TEST\SALVOT~1" 
#    -I"C:\Pumpkin\Salvo\Inc" 
#    "salvomem.c" 
#    -o"salvomem.o" 
#    -g
#
#  Assembler Example:
#
#  "C:\Program Files\Microchip\MPLAB C30\bin\pic30-as.exe" 
#    -p=24HJ256GP610 
#    "salvoportmcc30.s" 
#    -o"salvoportmcc30.o" 
#    -g
#
#  Archiving Example:
#
#  Executing: "C:\Program Files\Microchip\MPLAB C30\bin\pic30-ar.exe" 
#  q 
#  "salvotest.a" 
#  "C:\Pumpkin\Salvo\Src\salvomem.o" 
#  "C:\test\salvotest\main.o" 
#  "C:\Pumpkin\Salvo\Src\salvosched.o" 
#  "C:\Pumpkin\Salvo\Src\salvoinit.o" 
#  "C:\Pumpkin\Salvo\Src\salvohook_idle.o" 
#  "C:\Pumpkin\Salvo\Src\salvohook_wdt.o" 
#  "C:\Pumpkin\Salvo\Src\MCC30\salvoportmcc30.o" 
#  "C:\Pumpkin\Salvo\Src\salvohook_interrupt.o" 
#  "C:\Pumpkin\Salvo\Src\salvoqins.o"

###########################################################################################
#
# End of "Include Guard"
#
endif
