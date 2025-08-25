#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Tut5pro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Tut5pro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s ../../i2c_driver.c ../../eps_driver.c ../../uart_driver.c ../../timer_driver.c ../../task_data_logging.c ../../task_status_check.c ../../task_system.c ../../task_idle.c ../../main.c ../../../../../../../../../Src/salvoarray.c ../../../../../../../../../Src/salvobinsem.c ../../../../../../../../../Src/salvobinsem2.c ../../../../../../../../../Src/salvochk.c ../../../../../../../../../Src/salvocyclic.c ../../../../../../../../../Src/salvocyclic2.c ../../../../../../../../../Src/salvocyclic3.c ../../../../../../../../../Src/salvocyclic4.c ../../../../../../../../../Src/salvocyclic5.c ../../../../../../../../../Src/salvocyclic6.c ../../../../../../../../../Src/salvocyclic7.c ../../../../../../../../../Src/salvodebug.c ../../../../../../../../../Src/salvodelay.c ../../../../../../../../../Src/salvodelay2.c ../../../../../../../../../Src/salvodelay3.c ../../../../../../../../../Src/salvodestroy.c ../../../../../../../../../Src/salvoeflag.c ../../../../../../../../../Src/salvoeflag2.c ../../../../../../../../../Src/salvoeid.c ../../../../../../../../../Src/salvoevent.c ../../../../../../../../../Src/salvohook_idle.c ../../../../../../../../../Src/salvohook_interrupt.c ../../../../../../../../../Src/salvohook_wdt.c ../../../../../../../../../Src/salvoinit.c ../../../../../../../../../Src/salvoinit2.c ../../../../../../../../../Src/salvoinit3.c ../../../../../../../../../Src/salvoinit4.c ../../../../../../../../../Src/salvolicense.c ../../../../../../../../../Src/salvomem.c ../../../../../../../../../Src/salvomsg.c ../../../../../../../../../Src/salvomsg2.c ../../../../../../../../../Src/salvomsgq.c ../../../../../../../../../Src/salvomsgq2.c ../../../../../../../../../Src/salvomsgq3.c ../../../../../../../../../Src/salvomsgq4.c ../../../../../../../../../Src/salvoprio.c ../../../../../../../../../Src/salvoprio2.c ../../../../../../../../../Src/salvoqdel.c ../../../../../../../../../Src/salvoqins.c ../../../../../../../../../Src/salvorpt.c ../../../../../../../../../Src/salvosched.c ../../../../../../../../../Src/salvosem.c ../../../../../../../../../Src/salvosem2.c ../../../../../../../../../Src/salvostop.c ../../../../../../../../../Src/salvotask.c ../../../../../../../../../Src/salvotask2.c ../../../../../../../../../Src/salvotask3.c ../../../../../../../../../Src/salvotask4.c ../../../../../../../../../Src/salvotask5.c ../../../../../../../../../Src/salvotask6.c ../../../../../../../../../Src/salvotask7.c ../../../../../../../../../Src/salvotask8.c ../../../../../../../../../Src/salvotick.c ../../../../../../../../../Src/salvotid.c ../../../../../../../../../Src/salvotime.c ../../../../../../../../../Src/salvotimer.c ../../../../../../../../../Src/salvoutil.c ../../../../../../../../../Src/salvoversion.c ../../../../../../../../../Src/satellite_utils.c ../../battery_driver.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o ${OBJECTDIR}/_ext/43898991/i2c_driver.o ${OBJECTDIR}/_ext/43898991/eps_driver.o ${OBJECTDIR}/_ext/43898991/uart_driver.o ${OBJECTDIR}/_ext/43898991/timer_driver.o ${OBJECTDIR}/_ext/43898991/task_data_logging.o ${OBJECTDIR}/_ext/43898991/task_status_check.o ${OBJECTDIR}/_ext/43898991/task_system.o ${OBJECTDIR}/_ext/43898991/task_idle.o ${OBJECTDIR}/_ext/43898991/main.o ${OBJECTDIR}/_ext/1353486475/salvoarray.o ${OBJECTDIR}/_ext/1353486475/salvobinsem.o ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o ${OBJECTDIR}/_ext/1353486475/salvochk.o ${OBJECTDIR}/_ext/1353486475/salvocyclic.o ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o ${OBJECTDIR}/_ext/1353486475/salvodebug.o ${OBJECTDIR}/_ext/1353486475/salvodelay.o ${OBJECTDIR}/_ext/1353486475/salvodelay2.o ${OBJECTDIR}/_ext/1353486475/salvodelay3.o ${OBJECTDIR}/_ext/1353486475/salvodestroy.o ${OBJECTDIR}/_ext/1353486475/salvoeflag.o ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o ${OBJECTDIR}/_ext/1353486475/salvoeid.o ${OBJECTDIR}/_ext/1353486475/salvoevent.o ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o ${OBJECTDIR}/_ext/1353486475/salvoinit.o ${OBJECTDIR}/_ext/1353486475/salvoinit2.o ${OBJECTDIR}/_ext/1353486475/salvoinit3.o ${OBJECTDIR}/_ext/1353486475/salvoinit4.o ${OBJECTDIR}/_ext/1353486475/salvolicense.o ${OBJECTDIR}/_ext/1353486475/salvomem.o ${OBJECTDIR}/_ext/1353486475/salvomsg.o ${OBJECTDIR}/_ext/1353486475/salvomsg2.o ${OBJECTDIR}/_ext/1353486475/salvomsgq.o ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o ${OBJECTDIR}/_ext/1353486475/salvoprio.o ${OBJECTDIR}/_ext/1353486475/salvoprio2.o ${OBJECTDIR}/_ext/1353486475/salvoqdel.o ${OBJECTDIR}/_ext/1353486475/salvoqins.o ${OBJECTDIR}/_ext/1353486475/salvorpt.o ${OBJECTDIR}/_ext/1353486475/salvosched.o ${OBJECTDIR}/_ext/1353486475/salvosem.o ${OBJECTDIR}/_ext/1353486475/salvosem2.o ${OBJECTDIR}/_ext/1353486475/salvostop.o ${OBJECTDIR}/_ext/1353486475/salvotask.o ${OBJECTDIR}/_ext/1353486475/salvotask2.o ${OBJECTDIR}/_ext/1353486475/salvotask3.o ${OBJECTDIR}/_ext/1353486475/salvotask4.o ${OBJECTDIR}/_ext/1353486475/salvotask5.o ${OBJECTDIR}/_ext/1353486475/salvotask6.o ${OBJECTDIR}/_ext/1353486475/salvotask7.o ${OBJECTDIR}/_ext/1353486475/salvotask8.o ${OBJECTDIR}/_ext/1353486475/salvotick.o ${OBJECTDIR}/_ext/1353486475/salvotid.o ${OBJECTDIR}/_ext/1353486475/salvotime.o ${OBJECTDIR}/_ext/1353486475/salvotimer.o ${OBJECTDIR}/_ext/1353486475/salvoutil.o ${OBJECTDIR}/_ext/1353486475/salvoversion.o ${OBJECTDIR}/_ext/1353486475/satellite_utils.o ${OBJECTDIR}/_ext/43898991/battery_driver.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o.d ${OBJECTDIR}/_ext/43898991/i2c_driver.o.d ${OBJECTDIR}/_ext/43898991/eps_driver.o.d ${OBJECTDIR}/_ext/43898991/uart_driver.o.d ${OBJECTDIR}/_ext/43898991/timer_driver.o.d ${OBJECTDIR}/_ext/43898991/task_data_logging.o.d ${OBJECTDIR}/_ext/43898991/task_status_check.o.d ${OBJECTDIR}/_ext/43898991/task_system.o.d ${OBJECTDIR}/_ext/43898991/task_idle.o.d ${OBJECTDIR}/_ext/43898991/main.o.d ${OBJECTDIR}/_ext/1353486475/salvoarray.o.d ${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d ${OBJECTDIR}/_ext/1353486475/salvochk.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d ${OBJECTDIR}/_ext/1353486475/salvodebug.o.d ${OBJECTDIR}/_ext/1353486475/salvodelay.o.d ${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d ${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d ${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d ${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d ${OBJECTDIR}/_ext/1353486475/salvoeid.o.d ${OBJECTDIR}/_ext/1353486475/salvoevent.o.d ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d ${OBJECTDIR}/_ext/1353486475/salvoinit.o.d ${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d ${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d ${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d ${OBJECTDIR}/_ext/1353486475/salvolicense.o.d ${OBJECTDIR}/_ext/1353486475/salvomem.o.d ${OBJECTDIR}/_ext/1353486475/salvomsg.o.d ${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d ${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d ${OBJECTDIR}/_ext/1353486475/salvoprio.o.d ${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d ${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d ${OBJECTDIR}/_ext/1353486475/salvoqins.o.d ${OBJECTDIR}/_ext/1353486475/salvorpt.o.d ${OBJECTDIR}/_ext/1353486475/salvosched.o.d ${OBJECTDIR}/_ext/1353486475/salvosem.o.d ${OBJECTDIR}/_ext/1353486475/salvosem2.o.d ${OBJECTDIR}/_ext/1353486475/salvostop.o.d ${OBJECTDIR}/_ext/1353486475/salvotask.o.d ${OBJECTDIR}/_ext/1353486475/salvotask2.o.d ${OBJECTDIR}/_ext/1353486475/salvotask3.o.d ${OBJECTDIR}/_ext/1353486475/salvotask4.o.d ${OBJECTDIR}/_ext/1353486475/salvotask5.o.d ${OBJECTDIR}/_ext/1353486475/salvotask6.o.d ${OBJECTDIR}/_ext/1353486475/salvotask7.o.d ${OBJECTDIR}/_ext/1353486475/salvotask8.o.d ${OBJECTDIR}/_ext/1353486475/salvotick.o.d ${OBJECTDIR}/_ext/1353486475/salvotid.o.d ${OBJECTDIR}/_ext/1353486475/salvotime.o.d ${OBJECTDIR}/_ext/1353486475/salvotimer.o.d ${OBJECTDIR}/_ext/1353486475/salvoutil.o.d ${OBJECTDIR}/_ext/1353486475/salvoversion.o.d ${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d ${OBJECTDIR}/_ext/43898991/battery_driver.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o ${OBJECTDIR}/_ext/43898991/i2c_driver.o ${OBJECTDIR}/_ext/43898991/eps_driver.o ${OBJECTDIR}/_ext/43898991/uart_driver.o ${OBJECTDIR}/_ext/43898991/timer_driver.o ${OBJECTDIR}/_ext/43898991/task_data_logging.o ${OBJECTDIR}/_ext/43898991/task_status_check.o ${OBJECTDIR}/_ext/43898991/task_system.o ${OBJECTDIR}/_ext/43898991/task_idle.o ${OBJECTDIR}/_ext/43898991/main.o ${OBJECTDIR}/_ext/1353486475/salvoarray.o ${OBJECTDIR}/_ext/1353486475/salvobinsem.o ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o ${OBJECTDIR}/_ext/1353486475/salvochk.o ${OBJECTDIR}/_ext/1353486475/salvocyclic.o ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o ${OBJECTDIR}/_ext/1353486475/salvodebug.o ${OBJECTDIR}/_ext/1353486475/salvodelay.o ${OBJECTDIR}/_ext/1353486475/salvodelay2.o ${OBJECTDIR}/_ext/1353486475/salvodelay3.o ${OBJECTDIR}/_ext/1353486475/salvodestroy.o ${OBJECTDIR}/_ext/1353486475/salvoeflag.o ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o ${OBJECTDIR}/_ext/1353486475/salvoeid.o ${OBJECTDIR}/_ext/1353486475/salvoevent.o ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o ${OBJECTDIR}/_ext/1353486475/salvoinit.o ${OBJECTDIR}/_ext/1353486475/salvoinit2.o ${OBJECTDIR}/_ext/1353486475/salvoinit3.o ${OBJECTDIR}/_ext/1353486475/salvoinit4.o ${OBJECTDIR}/_ext/1353486475/salvolicense.o ${OBJECTDIR}/_ext/1353486475/salvomem.o ${OBJECTDIR}/_ext/1353486475/salvomsg.o ${OBJECTDIR}/_ext/1353486475/salvomsg2.o ${OBJECTDIR}/_ext/1353486475/salvomsgq.o ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o ${OBJECTDIR}/_ext/1353486475/salvoprio.o ${OBJECTDIR}/_ext/1353486475/salvoprio2.o ${OBJECTDIR}/_ext/1353486475/salvoqdel.o ${OBJECTDIR}/_ext/1353486475/salvoqins.o ${OBJECTDIR}/_ext/1353486475/salvorpt.o ${OBJECTDIR}/_ext/1353486475/salvosched.o ${OBJECTDIR}/_ext/1353486475/salvosem.o ${OBJECTDIR}/_ext/1353486475/salvosem2.o ${OBJECTDIR}/_ext/1353486475/salvostop.o ${OBJECTDIR}/_ext/1353486475/salvotask.o ${OBJECTDIR}/_ext/1353486475/salvotask2.o ${OBJECTDIR}/_ext/1353486475/salvotask3.o ${OBJECTDIR}/_ext/1353486475/salvotask4.o ${OBJECTDIR}/_ext/1353486475/salvotask5.o ${OBJECTDIR}/_ext/1353486475/salvotask6.o ${OBJECTDIR}/_ext/1353486475/salvotask7.o ${OBJECTDIR}/_ext/1353486475/salvotask8.o ${OBJECTDIR}/_ext/1353486475/salvotick.o ${OBJECTDIR}/_ext/1353486475/salvotid.o ${OBJECTDIR}/_ext/1353486475/salvotime.o ${OBJECTDIR}/_ext/1353486475/salvotimer.o ${OBJECTDIR}/_ext/1353486475/salvoutil.o ${OBJECTDIR}/_ext/1353486475/salvoversion.o ${OBJECTDIR}/_ext/1353486475/satellite_utils.o ${OBJECTDIR}/_ext/43898991/battery_driver.o

# Source Files
SOURCEFILES=../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s ../../i2c_driver.c ../../eps_driver.c ../../uart_driver.c ../../timer_driver.c ../../task_data_logging.c ../../task_status_check.c ../../task_system.c ../../task_idle.c ../../main.c ../../../../../../../../../Src/salvoarray.c ../../../../../../../../../Src/salvobinsem.c ../../../../../../../../../Src/salvobinsem2.c ../../../../../../../../../Src/salvochk.c ../../../../../../../../../Src/salvocyclic.c ../../../../../../../../../Src/salvocyclic2.c ../../../../../../../../../Src/salvocyclic3.c ../../../../../../../../../Src/salvocyclic4.c ../../../../../../../../../Src/salvocyclic5.c ../../../../../../../../../Src/salvocyclic6.c ../../../../../../../../../Src/salvocyclic7.c ../../../../../../../../../Src/salvodebug.c ../../../../../../../../../Src/salvodelay.c ../../../../../../../../../Src/salvodelay2.c ../../../../../../../../../Src/salvodelay3.c ../../../../../../../../../Src/salvodestroy.c ../../../../../../../../../Src/salvoeflag.c ../../../../../../../../../Src/salvoeflag2.c ../../../../../../../../../Src/salvoeid.c ../../../../../../../../../Src/salvoevent.c ../../../../../../../../../Src/salvohook_idle.c ../../../../../../../../../Src/salvohook_interrupt.c ../../../../../../../../../Src/salvohook_wdt.c ../../../../../../../../../Src/salvoinit.c ../../../../../../../../../Src/salvoinit2.c ../../../../../../../../../Src/salvoinit3.c ../../../../../../../../../Src/salvoinit4.c ../../../../../../../../../Src/salvolicense.c ../../../../../../../../../Src/salvomem.c ../../../../../../../../../Src/salvomsg.c ../../../../../../../../../Src/salvomsg2.c ../../../../../../../../../Src/salvomsgq.c ../../../../../../../../../Src/salvomsgq2.c ../../../../../../../../../Src/salvomsgq3.c ../../../../../../../../../Src/salvomsgq4.c ../../../../../../../../../Src/salvoprio.c ../../../../../../../../../Src/salvoprio2.c ../../../../../../../../../Src/salvoqdel.c ../../../../../../../../../Src/salvoqins.c ../../../../../../../../../Src/salvorpt.c ../../../../../../../../../Src/salvosched.c ../../../../../../../../../Src/salvosem.c ../../../../../../../../../Src/salvosem2.c ../../../../../../../../../Src/salvostop.c ../../../../../../../../../Src/salvotask.c ../../../../../../../../../Src/salvotask2.c ../../../../../../../../../Src/salvotask3.c ../../../../../../../../../Src/salvotask4.c ../../../../../../../../../Src/salvotask5.c ../../../../../../../../../Src/salvotask6.c ../../../../../../../../../Src/salvotask7.c ../../../../../../../../../Src/salvotask8.c ../../../../../../../../../Src/salvotick.c ../../../../../../../../../Src/salvotid.c ../../../../../../../../../Src/salvotime.c ../../../../../../../../../Src/salvotimer.c ../../../../../../../../../Src/salvoutil.c ../../../../../../../../../Src/salvoversion.c ../../../../../../../../../Src/satellite_utils.c ../../battery_driver.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Tut5pro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ256GP710
MP_LINKER_FILE_OPTION=,--script=p33FJ256GP710.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/43898991/i2c_driver.o: ../../i2c_driver.c  .generated_files/flags/default/1f4b8280646738ae7d1afcc5f50c156c37fa9009 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/i2c_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/i2c_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../i2c_driver.c  -o ${OBJECTDIR}/_ext/43898991/i2c_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/i2c_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/eps_driver.o: ../../eps_driver.c  .generated_files/flags/default/691a462425fc741d3d868ae13b2b8c5a2180ad5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/eps_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/eps_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../eps_driver.c  -o ${OBJECTDIR}/_ext/43898991/eps_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/eps_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/uart_driver.o: ../../uart_driver.c  .generated_files/flags/default/7356e59faf91cbf387bac3143699a6c04a3a8c4b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/uart_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/uart_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../uart_driver.c  -o ${OBJECTDIR}/_ext/43898991/uart_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/uart_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/timer_driver.o: ../../timer_driver.c  .generated_files/flags/default/6769a73dc82a223c243c91631df5c362a6e0776b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/timer_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/timer_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../timer_driver.c  -o ${OBJECTDIR}/_ext/43898991/timer_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/timer_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/task_data_logging.o: ../../task_data_logging.c  .generated_files/flags/default/c0dfeb58f0250dda58473d5ba594f6dc92536b81 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_data_logging.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_data_logging.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../task_data_logging.c  -o ${OBJECTDIR}/_ext/43898991/task_data_logging.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/task_data_logging.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/task_status_check.o: ../../task_status_check.c  .generated_files/flags/default/4b424d19260cbf43982350f7252feea8120fa7f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_status_check.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_status_check.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../task_status_check.c  -o ${OBJECTDIR}/_ext/43898991/task_status_check.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/task_status_check.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/task_system.o: ../../task_system.c  .generated_files/flags/default/7c98ecc0528734865a42f1681e03f7c584f4b020 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_system.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../task_system.c  -o ${OBJECTDIR}/_ext/43898991/task_system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/task_system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/task_idle.o: ../../task_idle.c  .generated_files/flags/default/508fafdc91c56b84180639b8fab9107d9498eccf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_idle.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_idle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../task_idle.c  -o ${OBJECTDIR}/_ext/43898991/task_idle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/task_idle.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/main.o: ../../main.c  .generated_files/flags/default/b4b2863d39ee1b85dd2e975d795506a0b31d9cad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../main.c  -o ${OBJECTDIR}/_ext/43898991/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoarray.o: ../../../../../../../../../Src/salvoarray.c  .generated_files/flags/default/a5a8a8727047739fba3381c3eb58e8674f369a28 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoarray.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoarray.c  -o ${OBJECTDIR}/_ext/1353486475/salvoarray.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoarray.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvobinsem.o: ../../../../../../../../../Src/salvobinsem.c  .generated_files/flags/default/ba1d1ee1bfda1eb6fbb0408c5d4afa679b5bccf1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvobinsem.c  -o ${OBJECTDIR}/_ext/1353486475/salvobinsem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvobinsem2.o: ../../../../../../../../../Src/salvobinsem2.c  .generated_files/flags/default/40e8842e24da05abd94b3f446e774690239e330f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvobinsem2.c  -o ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvochk.o: ../../../../../../../../../Src/salvochk.c  .generated_files/flags/default/afe42a8f27824464e871178618fe40ead0ab620e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvochk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvochk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvochk.c  -o ${OBJECTDIR}/_ext/1353486475/salvochk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvochk.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic.o: ../../../../../../../../../Src/salvocyclic.c  .generated_files/flags/default/85be94e3a022f765ca63517c7829d09013b237a2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic2.o: ../../../../../../../../../Src/salvocyclic2.c  .generated_files/flags/default/990c7176a5255a1ab93420865b657700dbda8ff5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic2.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic3.o: ../../../../../../../../../Src/salvocyclic3.c  .generated_files/flags/default/2de354dd144e07706ab6ccb2f910d48e0f8a2981 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic3.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic4.o: ../../../../../../../../../Src/salvocyclic4.c  .generated_files/flags/default/f3ff38fade38a961a071f817b8bfb7e1ab14fb22 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic4.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic5.o: ../../../../../../../../../Src/salvocyclic5.c  .generated_files/flags/default/86340381cb90791e690776bb858e68fe8a4a1258 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic5.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic6.o: ../../../../../../../../../Src/salvocyclic6.c  .generated_files/flags/default/69417be093fe211216f7abbe84e1f58d48ab1b39 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic6.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic7.o: ../../../../../../../../../Src/salvocyclic7.c  .generated_files/flags/default/36b2e4501b93bcd98971518064fbf0c4d0e869a0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic7.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodebug.o: ../../../../../../../../../Src/salvodebug.c  .generated_files/flags/default/ed815389b978e3d1266d424a8dd35f97f57e46c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodebug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodebug.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodebug.c  -o ${OBJECTDIR}/_ext/1353486475/salvodebug.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodebug.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay.o: ../../../../../../../../../Src/salvodelay.c  .generated_files/flags/default/41a75975c6e94eae2358d810848b25f50f7663d0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay2.o: ../../../../../../../../../Src/salvodelay2.c  .generated_files/flags/default/9483313760451cd6cbd3a29e1cb0239608df2e0d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay2.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay3.o: ../../../../../../../../../Src/salvodelay3.c  .generated_files/flags/default/d7abae6adc2a5f5122ac22d9defc1c1b81d6cf3f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay3.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodestroy.o: ../../../../../../../../../Src/salvodestroy.c  .generated_files/flags/default/3be0073f84e33afd79b0d1db1802e2bbb3255611 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodestroy.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodestroy.c  -o ${OBJECTDIR}/_ext/1353486475/salvodestroy.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeflag.o: ../../../../../../../../../Src/salvoeflag.c  .generated_files/flags/default/1d7b9b4f9177a5a5d3627b61ed5c0a2ceb4b80e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeflag.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeflag.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeflag2.o: ../../../../../../../../../Src/salvoeflag2.c  .generated_files/flags/default/88d8dc8ea17f82c90f95b41f5d1fcb1ca558f98b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeflag2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeid.o: ../../../../../../../../../Src/salvoeid.c  .generated_files/flags/default/49e131bda679c4a49f9a722b5ad56461e7bab822 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeid.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoevent.o: ../../../../../../../../../Src/salvoevent.c  .generated_files/flags/default/9123f4bf95915cf0e4badd4fe0beb96085f6f2b1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoevent.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoevent.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoevent.c  -o ${OBJECTDIR}/_ext/1353486475/salvoevent.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoevent.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_idle.o: ../../../../../../../../../Src/salvohook_idle.c  .generated_files/flags/default/8a06b852a9dffeaae4a37ab5690fb6146433434f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_idle.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o: ../../../../../../../../../Src/salvohook_interrupt.c  .generated_files/flags/default/f84e2e18c78a4a6a2eb95210b4f283cc3206ec7a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_interrupt.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o: ../../../../../../../../../Src/salvohook_wdt.c  .generated_files/flags/default/8109abec6c06e632434c2d4631a6a4cccecf47a3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_wdt.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit.o: ../../../../../../../../../Src/salvoinit.c  .generated_files/flags/default/ac8048f253eac6fcf1069c22e9578564bdbc454d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit2.o: ../../../../../../../../../Src/salvoinit2.c  .generated_files/flags/default/b974f075c0697e9821885300b92ac83a05e23a06 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit3.o: ../../../../../../../../../Src/salvoinit3.c  .generated_files/flags/default/90a6ad2f440b8a820d53a8e67a9de04be6a4c75a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit3.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit4.o: ../../../../../../../../../Src/salvoinit4.c  .generated_files/flags/default/cf8ce59625d746e3afe4c9919950cfd544592bb9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit4.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvolicense.o: ../../../../../../../../../Src/salvolicense.c  .generated_files/flags/default/5d1a08da2fa5a7179e1acd6886877f73ab97e604 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvolicense.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvolicense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvolicense.c  -o ${OBJECTDIR}/_ext/1353486475/salvolicense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvolicense.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomem.o: ../../../../../../../../../Src/salvomem.c  .generated_files/flags/default/1fb1e6e1d2add70c4f92ba708faf9cf4477b2247 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomem.c  -o ${OBJECTDIR}/_ext/1353486475/salvomem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsg.o: ../../../../../../../../../Src/salvomsg.c  .generated_files/flags/default/257504a6954ecb4d773789c781867c4af722ad65 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsg.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsg.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsg2.o: ../../../../../../../../../Src/salvomsg2.c  .generated_files/flags/default/2d203e6d9fc10abc88b4624096f9fc55f56035e3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsg2.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsg2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq.o: ../../../../../../../../../Src/salvomsgq.c  .generated_files/flags/default/d17f4e9757c953f78c0433f275e4630b67dbf15a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq2.o: ../../../../../../../../../Src/salvomsgq2.c  .generated_files/flags/default/668d0a3b42dc5e3f7d6c250fa26d3ddfc9bf138a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq2.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq3.o: ../../../../../../../../../Src/salvomsgq3.c  .generated_files/flags/default/9c4d3ede2833a9865e27fdf4db53bcb74011266f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq3.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq4.o: ../../../../../../../../../Src/salvomsgq4.c  .generated_files/flags/default/9de0f56ea927412f4fd2a993660e3d060d11b2ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq4.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoprio.o: ../../../../../../../../../Src/salvoprio.c  .generated_files/flags/default/63ab1ef994dbd3435a9da4bdab56e73c9c60a43f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoprio.c  -o ${OBJECTDIR}/_ext/1353486475/salvoprio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoprio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoprio2.o: ../../../../../../../../../Src/salvoprio2.c  .generated_files/flags/default/1307b360574507cacda6c2cbbb32da5915694232 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoprio2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoprio2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoqdel.o: ../../../../../../../../../Src/salvoqdel.c  .generated_files/flags/default/96c4ee548c99ded6d13411e4877993baca671a84 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqdel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoqdel.c  -o ${OBJECTDIR}/_ext/1353486475/salvoqdel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoqins.o: ../../../../../../../../../Src/salvoqins.c  .generated_files/flags/default/615ac4f9cfd3302fb3f7f41f318c2a7adbda2d99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoqins.c  -o ${OBJECTDIR}/_ext/1353486475/salvoqins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoqins.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvorpt.o: ../../../../../../../../../Src/salvorpt.c  .generated_files/flags/default/6cb2fea13cb7f164f93123eee5dbb01ecba58f3a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvorpt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvorpt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvorpt.c  -o ${OBJECTDIR}/_ext/1353486475/salvorpt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvorpt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosched.o: ../../../../../../../../../Src/salvosched.c  .generated_files/flags/default/a508b62f0aac7375ffabf4079954e2167276ee43 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosched.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosched.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosched.c  -o ${OBJECTDIR}/_ext/1353486475/salvosched.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosched.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosem.o: ../../../../../../../../../Src/salvosem.c  .generated_files/flags/default/d3a67bdb229d221c3dae5b6464aaad14eae46316 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosem.c  -o ${OBJECTDIR}/_ext/1353486475/salvosem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosem2.o: ../../../../../../../../../Src/salvosem2.c  .generated_files/flags/default/90ebc7cf6c061bed82941e48db8e9862c03b3822 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosem2.c  -o ${OBJECTDIR}/_ext/1353486475/salvosem2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosem2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvostop.o: ../../../../../../../../../Src/salvostop.c  .generated_files/flags/default/39a7dcf8e46da61ab02ceb2d4b37b6d15e1ec37a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvostop.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvostop.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvostop.c  -o ${OBJECTDIR}/_ext/1353486475/salvostop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvostop.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask.o: ../../../../../../../../../Src/salvotask.c  .generated_files/flags/default/a32486471bfddefb680872872094c51eceee50b5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask2.o: ../../../../../../../../../Src/salvotask2.c  .generated_files/flags/default/d3dbbc82194c411bb99854a986e8173adddc561 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask2.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask3.o: ../../../../../../../../../Src/salvotask3.c  .generated_files/flags/default/83a229ad8de88cd88106dab2acf1122b634a10b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask3.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask4.o: ../../../../../../../../../Src/salvotask4.c  .generated_files/flags/default/a9525a0131d63488194ae4a9aa22f71f20ed2818 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask4.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask5.o: ../../../../../../../../../Src/salvotask5.c  .generated_files/flags/default/6699fd91c42b12376096b7addfd923dee8e7e57d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask5.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask5.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask6.o: ../../../../../../../../../Src/salvotask6.c  .generated_files/flags/default/903f30a3210c4585637b51782ae03b7159573c5c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask6.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask6.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask7.o: ../../../../../../../../../Src/salvotask7.c  .generated_files/flags/default/e9a5e9b9f8fba3a1eaffb8dbd642e74ceb30dcd1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask7.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask7.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask7.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask8.o: ../../../../../../../../../Src/salvotask8.c  .generated_files/flags/default/5cf02917f59bebc7da58011a3c2b9b5e25799fd1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask8.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask8.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotick.o: ../../../../../../../../../Src/salvotick.c  .generated_files/flags/default/efa4de99f24eab6fdc92ab2e936a0c74894a93 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotick.c  -o ${OBJECTDIR}/_ext/1353486475/salvotick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotid.o: ../../../../../../../../../Src/salvotid.c  .generated_files/flags/default/66cde68b0734b8612151b2edc635552baf2a9e80 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotid.c  -o ${OBJECTDIR}/_ext/1353486475/salvotid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotime.o: ../../../../../../../../../Src/salvotime.c  .generated_files/flags/default/cc4a919d445d9b0e21cfcea83fec94e1993c5b20 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotime.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotime.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotime.c  -o ${OBJECTDIR}/_ext/1353486475/salvotime.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotime.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotimer.o: ../../../../../../../../../Src/salvotimer.c  .generated_files/flags/default/b8fc6e0a0f86c16cdfea9177b76775d66e159a06 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotimer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotimer.c  -o ${OBJECTDIR}/_ext/1353486475/salvotimer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotimer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoutil.o: ../../../../../../../../../Src/salvoutil.c  .generated_files/flags/default/3bad82cc1c003442f22cbcc740c18eb938a78175 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoutil.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoutil.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoutil.c  -o ${OBJECTDIR}/_ext/1353486475/salvoutil.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoutil.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoversion.o: ../../../../../../../../../Src/salvoversion.c  .generated_files/flags/default/8578c0e62629a6174e99dbb56d8ca02c7b27953a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoversion.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoversion.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoversion.c  -o ${OBJECTDIR}/_ext/1353486475/salvoversion.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoversion.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/satellite_utils.o: ../../../../../../../../../Src/satellite_utils.c  .generated_files/flags/default/f83c911c3cc4d613fe072a30ea2c1e07b4660b5d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/satellite_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/satellite_utils.c  -o ${OBJECTDIR}/_ext/1353486475/satellite_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/battery_driver.o: ../../battery_driver.c  .generated_files/flags/default/86018e0782778c4055ef961586fb390230be5b8f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/battery_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/battery_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../battery_driver.c  -o ${OBJECTDIR}/_ext/43898991/battery_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/battery_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/43898991/i2c_driver.o: ../../i2c_driver.c  .generated_files/flags/default/3288fff397eb4b5cdf164e700e3d25272d26d83e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/i2c_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/i2c_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../i2c_driver.c  -o ${OBJECTDIR}/_ext/43898991/i2c_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/i2c_driver.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/eps_driver.o: ../../eps_driver.c  .generated_files/flags/default/bb3ed7dd5872d2d99e1453a009851ae4e01b33b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/eps_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/eps_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../eps_driver.c  -o ${OBJECTDIR}/_ext/43898991/eps_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/eps_driver.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/uart_driver.o: ../../uart_driver.c  .generated_files/flags/default/398ce2dba192132ee578a9d4b7d71eaeec19cb5e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/uart_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/uart_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../uart_driver.c  -o ${OBJECTDIR}/_ext/43898991/uart_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/uart_driver.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/timer_driver.o: ../../timer_driver.c  .generated_files/flags/default/ee985611819969925e8a2883b1aa4b99467a0a9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/timer_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/timer_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../timer_driver.c  -o ${OBJECTDIR}/_ext/43898991/timer_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/timer_driver.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/task_data_logging.o: ../../task_data_logging.c  .generated_files/flags/default/3f7071cf2f300fb95569e073c8292d1954b7a991 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_data_logging.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_data_logging.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../task_data_logging.c  -o ${OBJECTDIR}/_ext/43898991/task_data_logging.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/task_data_logging.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/task_status_check.o: ../../task_status_check.c  .generated_files/flags/default/f65406dbd941f29fc1d2b25162f6108b036c19e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_status_check.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_status_check.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../task_status_check.c  -o ${OBJECTDIR}/_ext/43898991/task_status_check.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/task_status_check.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/task_system.o: ../../task_system.c  .generated_files/flags/default/f2c26524928ae489be22adb5d552f5511512cf1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_system.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../task_system.c  -o ${OBJECTDIR}/_ext/43898991/task_system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/task_system.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/task_idle.o: ../../task_idle.c  .generated_files/flags/default/b8964b287c5eaed4c396c4fc860327b6060151f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_idle.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/task_idle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../task_idle.c  -o ${OBJECTDIR}/_ext/43898991/task_idle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/task_idle.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/main.o: ../../main.c  .generated_files/flags/default/533e0a5da81be8015dbc98491719d663d753ebaf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../main.c  -o ${OBJECTDIR}/_ext/43898991/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoarray.o: ../../../../../../../../../Src/salvoarray.c  .generated_files/flags/default/ef52a7b5472bdedc98adfd087ae9d19a13a1727 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoarray.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoarray.c  -o ${OBJECTDIR}/_ext/1353486475/salvoarray.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoarray.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvobinsem.o: ../../../../../../../../../Src/salvobinsem.c  .generated_files/flags/default/8a9e0db41d5b5f531965654c18b0204c008b4e86 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvobinsem.c  -o ${OBJECTDIR}/_ext/1353486475/salvobinsem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvobinsem2.o: ../../../../../../../../../Src/salvobinsem2.c  .generated_files/flags/default/9c52fd8937caaac980c11cf85281ec1664d515fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvobinsem2.c  -o ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvochk.o: ../../../../../../../../../Src/salvochk.c  .generated_files/flags/default/81e484b623561a6493d17393ab94a676d6fbb9be .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvochk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvochk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvochk.c  -o ${OBJECTDIR}/_ext/1353486475/salvochk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvochk.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic.o: ../../../../../../../../../Src/salvocyclic.c  .generated_files/flags/default/fef4b080cbe8ffbd2b9bd1d893d3da49b12a0997 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic2.o: ../../../../../../../../../Src/salvocyclic2.c  .generated_files/flags/default/310e0b749abbefd5988517ae75add00969720d6b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic2.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic3.o: ../../../../../../../../../Src/salvocyclic3.c  .generated_files/flags/default/323e7eabc6b2558f009cc92b2a5c6959d710ba2c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic3.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic4.o: ../../../../../../../../../Src/salvocyclic4.c  .generated_files/flags/default/f2b2ec8c0d1b4722bf31fe694eb6a22573c4eb6f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic4.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic5.o: ../../../../../../../../../Src/salvocyclic5.c  .generated_files/flags/default/79569ca15fc2ef3e22f377e0f9035297c086b292 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic5.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic6.o: ../../../../../../../../../Src/salvocyclic6.c  .generated_files/flags/default/a671b5d9babe5021a76f46a4000d1086b6e485e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic6.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic7.o: ../../../../../../../../../Src/salvocyclic7.c  .generated_files/flags/default/cc3a8323d62c6bfa847b9b71ce9534f237e77d92 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic7.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodebug.o: ../../../../../../../../../Src/salvodebug.c  .generated_files/flags/default/9aad636aa61fce32fd8b5152efc54de2eb6a1485 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodebug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodebug.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodebug.c  -o ${OBJECTDIR}/_ext/1353486475/salvodebug.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodebug.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay.o: ../../../../../../../../../Src/salvodelay.c  .generated_files/flags/default/b915002ff3b4e93ae69e7a5f127a48ed107e12a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay2.o: ../../../../../../../../../Src/salvodelay2.c  .generated_files/flags/default/1633398c8432a150757e7ade600bf63b55814e2a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay2.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay3.o: ../../../../../../../../../Src/salvodelay3.c  .generated_files/flags/default/a6b6504b8831e85180f6bdc7e6e28a5b630057be .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay3.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodestroy.o: ../../../../../../../../../Src/salvodestroy.c  .generated_files/flags/default/fa188f9775d942fefd9d6b876ceddc45d1557387 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodestroy.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodestroy.c  -o ${OBJECTDIR}/_ext/1353486475/salvodestroy.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeflag.o: ../../../../../../../../../Src/salvoeflag.c  .generated_files/flags/default/b39c454caa03f987695d8899685e708aa550245a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeflag.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeflag.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeflag2.o: ../../../../../../../../../Src/salvoeflag2.c  .generated_files/flags/default/4f1cf4682159cd276c1ec44206855970f9ee02c1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeflag2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeid.o: ../../../../../../../../../Src/salvoeid.c  .generated_files/flags/default/ef14790fb377a65f260502f5825de69f516709e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeid.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeid.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoevent.o: ../../../../../../../../../Src/salvoevent.c  .generated_files/flags/default/ee8180666a2ce68eaa97a6b4cdd10a55985f2dfd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoevent.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoevent.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoevent.c  -o ${OBJECTDIR}/_ext/1353486475/salvoevent.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoevent.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_idle.o: ../../../../../../../../../Src/salvohook_idle.c  .generated_files/flags/default/659181da668acedadc7761e89cbb38edfc2af .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_idle.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o: ../../../../../../../../../Src/salvohook_interrupt.c  .generated_files/flags/default/982fc50285882692377567c80c5e311dfb747f74 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_interrupt.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o: ../../../../../../../../../Src/salvohook_wdt.c  .generated_files/flags/default/3c7966334f0ea9c0fcb3578acc00ec8848d1bf65 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_wdt.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit.o: ../../../../../../../../../Src/salvoinit.c  .generated_files/flags/default/96b0697d74abb1e77e87392c58a8547ec6ed9ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit2.o: ../../../../../../../../../Src/salvoinit2.c  .generated_files/flags/default/db9185977610d813e9b788b75213639e71e7e74c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit3.o: ../../../../../../../../../Src/salvoinit3.c  .generated_files/flags/default/52e8d258ad26e02b2e57f7565d002980d77269e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit3.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit4.o: ../../../../../../../../../Src/salvoinit4.c  .generated_files/flags/default/b3dd013b850053f527ebe75d760f0ad2634ef1b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit4.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvolicense.o: ../../../../../../../../../Src/salvolicense.c  .generated_files/flags/default/18ca5841308674c82a7b19499662dd03a00205aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvolicense.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvolicense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvolicense.c  -o ${OBJECTDIR}/_ext/1353486475/salvolicense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvolicense.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomem.o: ../../../../../../../../../Src/salvomem.c  .generated_files/flags/default/4a8c35c92db36fa1171a9bb95415462c044e1624 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomem.c  -o ${OBJECTDIR}/_ext/1353486475/salvomem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomem.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsg.o: ../../../../../../../../../Src/salvomsg.c  .generated_files/flags/default/60e5c90c79199bf40d9430d0cc2d79020ceaff85 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsg.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsg.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsg2.o: ../../../../../../../../../Src/salvomsg2.c  .generated_files/flags/default/f88949416cbacaaf24556620ea8a6a571f8c5bfc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsg2.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsg2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq.o: ../../../../../../../../../Src/salvomsgq.c  .generated_files/flags/default/a1f34f7eaaf73837a5faa83fa7ebe8d9c90b270c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq2.o: ../../../../../../../../../Src/salvomsgq2.c  .generated_files/flags/default/7746a265b92325d938ee18a2b37b564e54ad8f22 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq2.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq3.o: ../../../../../../../../../Src/salvomsgq3.c  .generated_files/flags/default/4656055646005967d31cc244b9b55e332e887ee3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq3.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq4.o: ../../../../../../../../../Src/salvomsgq4.c  .generated_files/flags/default/dc051d3ae6e76667e99d83e4742c44a397b23b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq4.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoprio.o: ../../../../../../../../../Src/salvoprio.c  .generated_files/flags/default/7f743627c1371945a5068703bc8a17ada0246a38 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoprio.c  -o ${OBJECTDIR}/_ext/1353486475/salvoprio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoprio.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoprio2.o: ../../../../../../../../../Src/salvoprio2.c  .generated_files/flags/default/f84bb36e82e0fadbe763fd12426e1563ce90bd8c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoprio2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoprio2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoqdel.o: ../../../../../../../../../Src/salvoqdel.c  .generated_files/flags/default/42834d96d21f0f4fc2dd766bcf4ab123a785c4e7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqdel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoqdel.c  -o ${OBJECTDIR}/_ext/1353486475/salvoqdel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoqins.o: ../../../../../../../../../Src/salvoqins.c  .generated_files/flags/default/3801ae47bbf56e97b13f4b084d61b97ab8eeb6e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoqins.c  -o ${OBJECTDIR}/_ext/1353486475/salvoqins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoqins.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvorpt.o: ../../../../../../../../../Src/salvorpt.c  .generated_files/flags/default/68590ad8b5faeb0106b86fbc32a50c2a50ebb91d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvorpt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvorpt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvorpt.c  -o ${OBJECTDIR}/_ext/1353486475/salvorpt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvorpt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosched.o: ../../../../../../../../../Src/salvosched.c  .generated_files/flags/default/b31a351a1df6f01745a8018e2e153ccf0d04c9c7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosched.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosched.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosched.c  -o ${OBJECTDIR}/_ext/1353486475/salvosched.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosched.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosem.o: ../../../../../../../../../Src/salvosem.c  .generated_files/flags/default/390b55bb96887517a34615cfca3414cb4f9b0232 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosem.c  -o ${OBJECTDIR}/_ext/1353486475/salvosem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosem.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosem2.o: ../../../../../../../../../Src/salvosem2.c  .generated_files/flags/default/c5de7769bec2ec865a2019c8c058fc2b4a3ae72e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosem2.c  -o ${OBJECTDIR}/_ext/1353486475/salvosem2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosem2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvostop.o: ../../../../../../../../../Src/salvostop.c  .generated_files/flags/default/5d68a4c98dcb3eb13fd2c7305afa09962e0ba3f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvostop.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvostop.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvostop.c  -o ${OBJECTDIR}/_ext/1353486475/salvostop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvostop.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask.o: ../../../../../../../../../Src/salvotask.c  .generated_files/flags/default/997ed6000e625dd057bf698f78dbf8bd506f8f56 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask2.o: ../../../../../../../../../Src/salvotask2.c  .generated_files/flags/default/1d91a72ed5e753042eb955e377ab18b57b9faec0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask2.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask3.o: ../../../../../../../../../Src/salvotask3.c  .generated_files/flags/default/fabb8cc9f638d373a82a9734dd3f950ed2192e2e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask3.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask4.o: ../../../../../../../../../Src/salvotask4.c  .generated_files/flags/default/d379ce818aabe60bd0bcde44df4d96070612b17d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask4.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask4.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask5.o: ../../../../../../../../../Src/salvotask5.c  .generated_files/flags/default/d71c7c6ad146523bd70863072a5b93ea390dc2bd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask5.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask5.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask6.o: ../../../../../../../../../Src/salvotask6.c  .generated_files/flags/default/b17966abc62047b20b0e62ddb3aea87fc26acb69 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask6.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask6.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask7.o: ../../../../../../../../../Src/salvotask7.c  .generated_files/flags/default/39230da13a7001344770c3e97fe7813cf446e5ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask7.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask7.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask7.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask8.o: ../../../../../../../../../Src/salvotask8.c  .generated_files/flags/default/d571c0c19932b86430b2bc0218e3dd4c3ef13fa7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask8.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask8.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotick.o: ../../../../../../../../../Src/salvotick.c  .generated_files/flags/default/a45dab812f435dcf0a18cecd5d81deb0490ba320 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotick.c  -o ${OBJECTDIR}/_ext/1353486475/salvotick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotick.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotid.o: ../../../../../../../../../Src/salvotid.c  .generated_files/flags/default/d704313a937511eff15d37f578ba3d222de6e756 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotid.c  -o ${OBJECTDIR}/_ext/1353486475/salvotid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotid.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotime.o: ../../../../../../../../../Src/salvotime.c  .generated_files/flags/default/69f497b10b8cbfe05841c459cd1788549f8c197c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotime.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotime.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotime.c  -o ${OBJECTDIR}/_ext/1353486475/salvotime.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotime.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotimer.o: ../../../../../../../../../Src/salvotimer.c  .generated_files/flags/default/6c2e699d625a231d41ce90289d5a73bded0eb031 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotimer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotimer.c  -o ${OBJECTDIR}/_ext/1353486475/salvotimer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotimer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoutil.o: ../../../../../../../../../Src/salvoutil.c  .generated_files/flags/default/ff566ebfc951475e1af82acda25e53e655f6d5f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoutil.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoutil.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoutil.c  -o ${OBJECTDIR}/_ext/1353486475/salvoutil.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoutil.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoversion.o: ../../../../../../../../../Src/salvoversion.c  .generated_files/flags/default/3d29f36bd95d2f377cd85a983595afb9e89af91c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoversion.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoversion.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoversion.c  -o ${OBJECTDIR}/_ext/1353486475/salvoversion.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoversion.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/satellite_utils.o: ../../../../../../../../../Src/satellite_utils.c  .generated_files/flags/default/b193f0674e8abdccb9b5386a7602e59831f1702f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/satellite_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/satellite_utils.c  -o ${OBJECTDIR}/_ext/1353486475/satellite_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/43898991/battery_driver.o: ../../battery_driver.c  .generated_files/flags/default/e69c8fe1b138e2dc4dacd7bdd5b853dc09d68387 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/battery_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/battery_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../battery_driver.c  -o ${OBJECTDIR}/_ext/43898991/battery_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/battery_driver.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o: ../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s  .generated_files/flags/default/b2f23d89d9469bb2f6cb005642ceb41cfe0e9c11 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/91385488" 
	@${RM} ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o.d 
	@${RM} ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s  -o ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"../../../../../../../../../Src" -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o: ../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s  .generated_files/flags/default/41e833d21f14140e3348ea270eb2bc7323cffb24 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/91385488" 
	@${RM} ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o.d 
	@${RM} ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s  -o ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"../../../../../../../../../Src" -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Tut5pro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/Tut5pro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src"  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/Tut5pro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/Tut5pro.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc16-bin2hex ${DISTDIR}/Tut5pro.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
