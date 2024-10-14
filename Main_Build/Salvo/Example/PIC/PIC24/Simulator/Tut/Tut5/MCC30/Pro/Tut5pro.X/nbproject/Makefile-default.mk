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
SOURCEFILES_QUOTED_IF_SPACED=../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s ../../main.c ../../../../../../../../../Src/salvoarray.c ../../../../../../../../../Src/salvobinsem.c ../../../../../../../../../Src/salvobinsem2.c ../../../../../../../../../Src/salvochk.c ../../../../../../../../../Src/salvocyclic.c ../../../../../../../../../Src/salvocyclic2.c ../../../../../../../../../Src/salvocyclic3.c ../../../../../../../../../Src/salvocyclic4.c ../../../../../../../../../Src/salvocyclic5.c ../../../../../../../../../Src/salvocyclic6.c ../../../../../../../../../Src/salvocyclic7.c ../../../../../../../../../Src/salvodebug.c ../../../../../../../../../Src/salvodelay.c ../../../../../../../../../Src/salvodelay2.c ../../../../../../../../../Src/salvodelay3.c ../../../../../../../../../Src/salvodestroy.c ../../../../../../../../../Src/salvoeflag.c ../../../../../../../../../Src/salvoeflag2.c ../../../../../../../../../Src/salvoeid.c ../../../../../../../../../Src/salvoevent.c ../../../../../../../../../Src/salvohook_idle.c ../../../../../../../../../Src/salvohook_interrupt.c ../../../../../../../../../Src/salvohook_wdt.c ../../../../../../../../../Src/salvoinit.c ../../../../../../../../../Src/salvoinit2.c ../../../../../../../../../Src/salvoinit3.c ../../../../../../../../../Src/salvoinit4.c ../../../../../../../../../Src/salvolicense.c ../../../../../../../../../Src/salvomem.c ../../../../../../../../../Src/salvomsg.c ../../../../../../../../../Src/salvomsg2.c ../../../../../../../../../Src/salvomsgq.c ../../../../../../../../../Src/salvomsgq2.c ../../../../../../../../../Src/salvomsgq3.c ../../../../../../../../../Src/salvomsgq4.c ../../../../../../../../../Src/salvoprio.c ../../../../../../../../../Src/salvoprio2.c ../../../../../../../../../Src/salvoqdel.c ../../../../../../../../../Src/salvoqins.c ../../../../../../../../../Src/salvorpt.c ../../../../../../../../../Src/salvosched.c ../../../../../../../../../Src/salvosem.c ../../../../../../../../../Src/salvosem2.c ../../../../../../../../../Src/salvostop.c ../../../../../../../../../Src/salvotask.c ../../../../../../../../../Src/salvotask2.c ../../../../../../../../../Src/salvotask3.c ../../../../../../../../../Src/salvotask4.c ../../../../../../../../../Src/salvotask5.c ../../../../../../../../../Src/salvotask6.c ../../../../../../../../../Src/salvotask7.c ../../../../../../../../../Src/salvotask8.c ../../../../../../../../../Src/salvotick.c ../../../../../../../../../Src/salvotid.c ../../../../../../../../../Src/salvotime.c ../../../../../../../../../Src/salvotimer.c ../../../../../../../../../Src/salvoutil.c ../../../../../../../../../Src/salvoversion.c ../../../../../../../../../Src/satellite_utils.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o ${OBJECTDIR}/_ext/43898991/main.o ${OBJECTDIR}/_ext/1353486475/salvoarray.o ${OBJECTDIR}/_ext/1353486475/salvobinsem.o ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o ${OBJECTDIR}/_ext/1353486475/salvochk.o ${OBJECTDIR}/_ext/1353486475/salvocyclic.o ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o ${OBJECTDIR}/_ext/1353486475/salvodebug.o ${OBJECTDIR}/_ext/1353486475/salvodelay.o ${OBJECTDIR}/_ext/1353486475/salvodelay2.o ${OBJECTDIR}/_ext/1353486475/salvodelay3.o ${OBJECTDIR}/_ext/1353486475/salvodestroy.o ${OBJECTDIR}/_ext/1353486475/salvoeflag.o ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o ${OBJECTDIR}/_ext/1353486475/salvoeid.o ${OBJECTDIR}/_ext/1353486475/salvoevent.o ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o ${OBJECTDIR}/_ext/1353486475/salvoinit.o ${OBJECTDIR}/_ext/1353486475/salvoinit2.o ${OBJECTDIR}/_ext/1353486475/salvoinit3.o ${OBJECTDIR}/_ext/1353486475/salvoinit4.o ${OBJECTDIR}/_ext/1353486475/salvolicense.o ${OBJECTDIR}/_ext/1353486475/salvomem.o ${OBJECTDIR}/_ext/1353486475/salvomsg.o ${OBJECTDIR}/_ext/1353486475/salvomsg2.o ${OBJECTDIR}/_ext/1353486475/salvomsgq.o ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o ${OBJECTDIR}/_ext/1353486475/salvoprio.o ${OBJECTDIR}/_ext/1353486475/salvoprio2.o ${OBJECTDIR}/_ext/1353486475/salvoqdel.o ${OBJECTDIR}/_ext/1353486475/salvoqins.o ${OBJECTDIR}/_ext/1353486475/salvorpt.o ${OBJECTDIR}/_ext/1353486475/salvosched.o ${OBJECTDIR}/_ext/1353486475/salvosem.o ${OBJECTDIR}/_ext/1353486475/salvosem2.o ${OBJECTDIR}/_ext/1353486475/salvostop.o ${OBJECTDIR}/_ext/1353486475/salvotask.o ${OBJECTDIR}/_ext/1353486475/salvotask2.o ${OBJECTDIR}/_ext/1353486475/salvotask3.o ${OBJECTDIR}/_ext/1353486475/salvotask4.o ${OBJECTDIR}/_ext/1353486475/salvotask5.o ${OBJECTDIR}/_ext/1353486475/salvotask6.o ${OBJECTDIR}/_ext/1353486475/salvotask7.o ${OBJECTDIR}/_ext/1353486475/salvotask8.o ${OBJECTDIR}/_ext/1353486475/salvotick.o ${OBJECTDIR}/_ext/1353486475/salvotid.o ${OBJECTDIR}/_ext/1353486475/salvotime.o ${OBJECTDIR}/_ext/1353486475/salvotimer.o ${OBJECTDIR}/_ext/1353486475/salvoutil.o ${OBJECTDIR}/_ext/1353486475/salvoversion.o ${OBJECTDIR}/_ext/1353486475/satellite_utils.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o.d ${OBJECTDIR}/_ext/43898991/main.o.d ${OBJECTDIR}/_ext/1353486475/salvoarray.o.d ${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d ${OBJECTDIR}/_ext/1353486475/salvochk.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d ${OBJECTDIR}/_ext/1353486475/salvodebug.o.d ${OBJECTDIR}/_ext/1353486475/salvodelay.o.d ${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d ${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d ${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d ${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d ${OBJECTDIR}/_ext/1353486475/salvoeid.o.d ${OBJECTDIR}/_ext/1353486475/salvoevent.o.d ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d ${OBJECTDIR}/_ext/1353486475/salvoinit.o.d ${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d ${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d ${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d ${OBJECTDIR}/_ext/1353486475/salvolicense.o.d ${OBJECTDIR}/_ext/1353486475/salvomem.o.d ${OBJECTDIR}/_ext/1353486475/salvomsg.o.d ${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d ${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d ${OBJECTDIR}/_ext/1353486475/salvoprio.o.d ${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d ${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d ${OBJECTDIR}/_ext/1353486475/salvoqins.o.d ${OBJECTDIR}/_ext/1353486475/salvorpt.o.d ${OBJECTDIR}/_ext/1353486475/salvosched.o.d ${OBJECTDIR}/_ext/1353486475/salvosem.o.d ${OBJECTDIR}/_ext/1353486475/salvosem2.o.d ${OBJECTDIR}/_ext/1353486475/salvostop.o.d ${OBJECTDIR}/_ext/1353486475/salvotask.o.d ${OBJECTDIR}/_ext/1353486475/salvotask2.o.d ${OBJECTDIR}/_ext/1353486475/salvotask3.o.d ${OBJECTDIR}/_ext/1353486475/salvotask4.o.d ${OBJECTDIR}/_ext/1353486475/salvotask5.o.d ${OBJECTDIR}/_ext/1353486475/salvotask6.o.d ${OBJECTDIR}/_ext/1353486475/salvotask7.o.d ${OBJECTDIR}/_ext/1353486475/salvotask8.o.d ${OBJECTDIR}/_ext/1353486475/salvotick.o.d ${OBJECTDIR}/_ext/1353486475/salvotid.o.d ${OBJECTDIR}/_ext/1353486475/salvotime.o.d ${OBJECTDIR}/_ext/1353486475/salvotimer.o.d ${OBJECTDIR}/_ext/1353486475/salvoutil.o.d ${OBJECTDIR}/_ext/1353486475/salvoversion.o.d ${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o ${OBJECTDIR}/_ext/43898991/main.o ${OBJECTDIR}/_ext/1353486475/salvoarray.o ${OBJECTDIR}/_ext/1353486475/salvobinsem.o ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o ${OBJECTDIR}/_ext/1353486475/salvochk.o ${OBJECTDIR}/_ext/1353486475/salvocyclic.o ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o ${OBJECTDIR}/_ext/1353486475/salvodebug.o ${OBJECTDIR}/_ext/1353486475/salvodelay.o ${OBJECTDIR}/_ext/1353486475/salvodelay2.o ${OBJECTDIR}/_ext/1353486475/salvodelay3.o ${OBJECTDIR}/_ext/1353486475/salvodestroy.o ${OBJECTDIR}/_ext/1353486475/salvoeflag.o ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o ${OBJECTDIR}/_ext/1353486475/salvoeid.o ${OBJECTDIR}/_ext/1353486475/salvoevent.o ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o ${OBJECTDIR}/_ext/1353486475/salvoinit.o ${OBJECTDIR}/_ext/1353486475/salvoinit2.o ${OBJECTDIR}/_ext/1353486475/salvoinit3.o ${OBJECTDIR}/_ext/1353486475/salvoinit4.o ${OBJECTDIR}/_ext/1353486475/salvolicense.o ${OBJECTDIR}/_ext/1353486475/salvomem.o ${OBJECTDIR}/_ext/1353486475/salvomsg.o ${OBJECTDIR}/_ext/1353486475/salvomsg2.o ${OBJECTDIR}/_ext/1353486475/salvomsgq.o ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o ${OBJECTDIR}/_ext/1353486475/salvoprio.o ${OBJECTDIR}/_ext/1353486475/salvoprio2.o ${OBJECTDIR}/_ext/1353486475/salvoqdel.o ${OBJECTDIR}/_ext/1353486475/salvoqins.o ${OBJECTDIR}/_ext/1353486475/salvorpt.o ${OBJECTDIR}/_ext/1353486475/salvosched.o ${OBJECTDIR}/_ext/1353486475/salvosem.o ${OBJECTDIR}/_ext/1353486475/salvosem2.o ${OBJECTDIR}/_ext/1353486475/salvostop.o ${OBJECTDIR}/_ext/1353486475/salvotask.o ${OBJECTDIR}/_ext/1353486475/salvotask2.o ${OBJECTDIR}/_ext/1353486475/salvotask3.o ${OBJECTDIR}/_ext/1353486475/salvotask4.o ${OBJECTDIR}/_ext/1353486475/salvotask5.o ${OBJECTDIR}/_ext/1353486475/salvotask6.o ${OBJECTDIR}/_ext/1353486475/salvotask7.o ${OBJECTDIR}/_ext/1353486475/salvotask8.o ${OBJECTDIR}/_ext/1353486475/salvotick.o ${OBJECTDIR}/_ext/1353486475/salvotid.o ${OBJECTDIR}/_ext/1353486475/salvotime.o ${OBJECTDIR}/_ext/1353486475/salvotimer.o ${OBJECTDIR}/_ext/1353486475/salvoutil.o ${OBJECTDIR}/_ext/1353486475/salvoversion.o ${OBJECTDIR}/_ext/1353486475/satellite_utils.o

# Source Files
SOURCEFILES=../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s ../../main.c ../../../../../../../../../Src/salvoarray.c ../../../../../../../../../Src/salvobinsem.c ../../../../../../../../../Src/salvobinsem2.c ../../../../../../../../../Src/salvochk.c ../../../../../../../../../Src/salvocyclic.c ../../../../../../../../../Src/salvocyclic2.c ../../../../../../../../../Src/salvocyclic3.c ../../../../../../../../../Src/salvocyclic4.c ../../../../../../../../../Src/salvocyclic5.c ../../../../../../../../../Src/salvocyclic6.c ../../../../../../../../../Src/salvocyclic7.c ../../../../../../../../../Src/salvodebug.c ../../../../../../../../../Src/salvodelay.c ../../../../../../../../../Src/salvodelay2.c ../../../../../../../../../Src/salvodelay3.c ../../../../../../../../../Src/salvodestroy.c ../../../../../../../../../Src/salvoeflag.c ../../../../../../../../../Src/salvoeflag2.c ../../../../../../../../../Src/salvoeid.c ../../../../../../../../../Src/salvoevent.c ../../../../../../../../../Src/salvohook_idle.c ../../../../../../../../../Src/salvohook_interrupt.c ../../../../../../../../../Src/salvohook_wdt.c ../../../../../../../../../Src/salvoinit.c ../../../../../../../../../Src/salvoinit2.c ../../../../../../../../../Src/salvoinit3.c ../../../../../../../../../Src/salvoinit4.c ../../../../../../../../../Src/salvolicense.c ../../../../../../../../../Src/salvomem.c ../../../../../../../../../Src/salvomsg.c ../../../../../../../../../Src/salvomsg2.c ../../../../../../../../../Src/salvomsgq.c ../../../../../../../../../Src/salvomsgq2.c ../../../../../../../../../Src/salvomsgq3.c ../../../../../../../../../Src/salvomsgq4.c ../../../../../../../../../Src/salvoprio.c ../../../../../../../../../Src/salvoprio2.c ../../../../../../../../../Src/salvoqdel.c ../../../../../../../../../Src/salvoqins.c ../../../../../../../../../Src/salvorpt.c ../../../../../../../../../Src/salvosched.c ../../../../../../../../../Src/salvosem.c ../../../../../../../../../Src/salvosem2.c ../../../../../../../../../Src/salvostop.c ../../../../../../../../../Src/salvotask.c ../../../../../../../../../Src/salvotask2.c ../../../../../../../../../Src/salvotask3.c ../../../../../../../../../Src/salvotask4.c ../../../../../../../../../Src/salvotask5.c ../../../../../../../../../Src/salvotask6.c ../../../../../../../../../Src/salvotask7.c ../../../../../../../../../Src/salvotask8.c ../../../../../../../../../Src/salvotick.c ../../../../../../../../../Src/salvotid.c ../../../../../../../../../Src/salvotime.c ../../../../../../../../../Src/salvotimer.c ../../../../../../../../../Src/salvoutil.c ../../../../../../../../../Src/salvoversion.c ../../../../../../../../../Src/satellite_utils.c



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
${OBJECTDIR}/_ext/43898991/main.o: ../../main.c  .generated_files/flags/default/2e939e4a0f72cb506d83a33ee21a1665377c80ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../main.c  -o ${OBJECTDIR}/_ext/43898991/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoarray.o: ../../../../../../../../../Src/salvoarray.c  .generated_files/flags/default/da32b9587b44b70ec997c6a7e183eecf6c8b9862 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoarray.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoarray.c  -o ${OBJECTDIR}/_ext/1353486475/salvoarray.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoarray.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvobinsem.o: ../../../../../../../../../Src/salvobinsem.c  .generated_files/flags/default/a7161c19295c865daaa46e1a0a5bcaf6a57f0708 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvobinsem.c  -o ${OBJECTDIR}/_ext/1353486475/salvobinsem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvobinsem2.o: ../../../../../../../../../Src/salvobinsem2.c  .generated_files/flags/default/6290bc4b5a87635847ad580d8ba342e6a30a0259 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvobinsem2.c  -o ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvochk.o: ../../../../../../../../../Src/salvochk.c  .generated_files/flags/default/27fba5af2a7792e3faa8d5b518e023989555e00e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvochk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvochk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvochk.c  -o ${OBJECTDIR}/_ext/1353486475/salvochk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvochk.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic.o: ../../../../../../../../../Src/salvocyclic.c  .generated_files/flags/default/5bf7335c2994cb111dd38ed133fa03f9411b1078 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic2.o: ../../../../../../../../../Src/salvocyclic2.c  .generated_files/flags/default/7fd4c0ed082c16acefd2bc0384d0174e5e287ee9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic2.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic3.o: ../../../../../../../../../Src/salvocyclic3.c  .generated_files/flags/default/71b6b5923625f237222aef5ce0c63e188690278a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic3.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic4.o: ../../../../../../../../../Src/salvocyclic4.c  .generated_files/flags/default/3c0436ec0ae55349c71dc63e03fc4857d69fc6e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic4.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic5.o: ../../../../../../../../../Src/salvocyclic5.c  .generated_files/flags/default/b7f8c5a0c379fa898c40d989be77cf2f7f0fcd9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic5.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic6.o: ../../../../../../../../../Src/salvocyclic6.c  .generated_files/flags/default/112c99839b587f61c971acc20c25379209c67c9b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic6.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic7.o: ../../../../../../../../../Src/salvocyclic7.c  .generated_files/flags/default/7b73499278fadcbf85b62a2c7cf60bc061a86326 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic7.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodebug.o: ../../../../../../../../../Src/salvodebug.c  .generated_files/flags/default/faee3d2d593cf472312b3c63bf81b0bada53875 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodebug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodebug.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodebug.c  -o ${OBJECTDIR}/_ext/1353486475/salvodebug.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodebug.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay.o: ../../../../../../../../../Src/salvodelay.c  .generated_files/flags/default/302980a52903296bce397c7de35ebf07a3a729e5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay2.o: ../../../../../../../../../Src/salvodelay2.c  .generated_files/flags/default/66598df2a34a8a68d7ccbfbacc4c4986a0b05867 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay2.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay3.o: ../../../../../../../../../Src/salvodelay3.c  .generated_files/flags/default/9bc8ec05249a00fa61ee24a93906a4008d6aa8bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay3.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodestroy.o: ../../../../../../../../../Src/salvodestroy.c  .generated_files/flags/default/d0b02d9db9cd62b5735779864215fea3d83ca90f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodestroy.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodestroy.c  -o ${OBJECTDIR}/_ext/1353486475/salvodestroy.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeflag.o: ../../../../../../../../../Src/salvoeflag.c  .generated_files/flags/default/695902145dae1413bcb618f0df91a12695d7831d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeflag.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeflag.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeflag2.o: ../../../../../../../../../Src/salvoeflag2.c  .generated_files/flags/default/99514bd2c8d5754efc16d1c311d01a4d0ab3b2ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeflag2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeid.o: ../../../../../../../../../Src/salvoeid.c  .generated_files/flags/default/75e728870472a094be79356efa749c6cea4577b4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeid.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoevent.o: ../../../../../../../../../Src/salvoevent.c  .generated_files/flags/default/afdfbd4ac36e6405a858a921ae69cbc5bab4f60f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoevent.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoevent.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoevent.c  -o ${OBJECTDIR}/_ext/1353486475/salvoevent.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoevent.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_idle.o: ../../../../../../../../../Src/salvohook_idle.c  .generated_files/flags/default/6b064d58f24f9ac19ed02a5cc941ff685f3c4222 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_idle.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o: ../../../../../../../../../Src/salvohook_interrupt.c  .generated_files/flags/default/8d4ff5a9287898c67ad3de652b6feef26a18e868 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_interrupt.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o: ../../../../../../../../../Src/salvohook_wdt.c  .generated_files/flags/default/8c6a774f5da464993f1682902833c45387c1e6e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_wdt.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit.o: ../../../../../../../../../Src/salvoinit.c  .generated_files/flags/default/9d8a6935c0e59f8e5423b84cd7be066354cafe10 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit2.o: ../../../../../../../../../Src/salvoinit2.c  .generated_files/flags/default/ea39afda1055772586b98a8043356c5bf8059d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit3.o: ../../../../../../../../../Src/salvoinit3.c  .generated_files/flags/default/e3c1fe44bb7ac45103a7c9cf9e4865c2064e73f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit3.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit4.o: ../../../../../../../../../Src/salvoinit4.c  .generated_files/flags/default/770624979802eb6c441bd91917e4e02b36cc00d3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit4.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvolicense.o: ../../../../../../../../../Src/salvolicense.c  .generated_files/flags/default/6e342cb54fee742e82753915b46919db0fb74d27 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvolicense.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvolicense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvolicense.c  -o ${OBJECTDIR}/_ext/1353486475/salvolicense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvolicense.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomem.o: ../../../../../../../../../Src/salvomem.c  .generated_files/flags/default/ccd40e80e7dbdc03f2789c85c8007a7fa0c8cbed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomem.c  -o ${OBJECTDIR}/_ext/1353486475/salvomem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsg.o: ../../../../../../../../../Src/salvomsg.c  .generated_files/flags/default/31ec0e0a89208b6a7ab40f529c3ef0d6d5a209e7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsg.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsg.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsg2.o: ../../../../../../../../../Src/salvomsg2.c  .generated_files/flags/default/baf7b97d9fa9a457ba070e03853b996990a989f2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsg2.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsg2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq.o: ../../../../../../../../../Src/salvomsgq.c  .generated_files/flags/default/8059f981f15f3d937a8f1d37372f0fced2c66a4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq2.o: ../../../../../../../../../Src/salvomsgq2.c  .generated_files/flags/default/b57b141e71f112ba7bd6ce447a245cb7d8f12539 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq2.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq3.o: ../../../../../../../../../Src/salvomsgq3.c  .generated_files/flags/default/b866326f6677372d88fd33312affa0cd3b085100 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq3.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq4.o: ../../../../../../../../../Src/salvomsgq4.c  .generated_files/flags/default/4338f7652faf4477ccc572b1c51183bd52540738 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq4.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoprio.o: ../../../../../../../../../Src/salvoprio.c  .generated_files/flags/default/eabeeb7dc95d967b6e788b342e6535f380d60ca3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoprio.c  -o ${OBJECTDIR}/_ext/1353486475/salvoprio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoprio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoprio2.o: ../../../../../../../../../Src/salvoprio2.c  .generated_files/flags/default/b6fb64dcbbd150cd79629b4f3d81e92f20a1554b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoprio2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoprio2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoqdel.o: ../../../../../../../../../Src/salvoqdel.c  .generated_files/flags/default/73ce37c448f09213bc9f7e2c884aa4a968614ffa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqdel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoqdel.c  -o ${OBJECTDIR}/_ext/1353486475/salvoqdel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoqins.o: ../../../../../../../../../Src/salvoqins.c  .generated_files/flags/default/78f18c749ea3fe5ef000a05a9e178814cb5e0808 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoqins.c  -o ${OBJECTDIR}/_ext/1353486475/salvoqins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoqins.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvorpt.o: ../../../../../../../../../Src/salvorpt.c  .generated_files/flags/default/7980caa34d101f4c1427f9fdb8be1f709ccdc2e5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvorpt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvorpt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvorpt.c  -o ${OBJECTDIR}/_ext/1353486475/salvorpt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvorpt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosched.o: ../../../../../../../../../Src/salvosched.c  .generated_files/flags/default/4f92cd85d279a99cc07f12d73c817f805449007d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosched.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosched.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosched.c  -o ${OBJECTDIR}/_ext/1353486475/salvosched.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosched.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosem.o: ../../../../../../../../../Src/salvosem.c  .generated_files/flags/default/d4cefbf02b475e384a1b297bea116624de60177c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosem.c  -o ${OBJECTDIR}/_ext/1353486475/salvosem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosem2.o: ../../../../../../../../../Src/salvosem2.c  .generated_files/flags/default/3c44b55326eec85aecac7017e36e6795983370c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosem2.c  -o ${OBJECTDIR}/_ext/1353486475/salvosem2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosem2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvostop.o: ../../../../../../../../../Src/salvostop.c  .generated_files/flags/default/57b5dcf7986b287031f09b3ef1deef5292fd5574 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvostop.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvostop.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvostop.c  -o ${OBJECTDIR}/_ext/1353486475/salvostop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvostop.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask.o: ../../../../../../../../../Src/salvotask.c  .generated_files/flags/default/29baa38b75537465e658cee06b45f94ef3243cae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask2.o: ../../../../../../../../../Src/salvotask2.c  .generated_files/flags/default/d9394eeb68524002657315208868da7d31882b8a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask2.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask3.o: ../../../../../../../../../Src/salvotask3.c  .generated_files/flags/default/706ea8122a503ba60409f9524da779d8eb894dc5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask3.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask4.o: ../../../../../../../../../Src/salvotask4.c  .generated_files/flags/default/e541648c144539163a0753a460efc887600068f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask4.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask5.o: ../../../../../../../../../Src/salvotask5.c  .generated_files/flags/default/fc2219f0dd703292dcfb9a5edf742cdd8a81ca05 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask5.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask5.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask6.o: ../../../../../../../../../Src/salvotask6.c  .generated_files/flags/default/f318f47e5f442b0dcd81871929ce3bdd2676cb24 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask6.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask6.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask7.o: ../../../../../../../../../Src/salvotask7.c  .generated_files/flags/default/1323ecf602700684c7bd5ab3f56ef0e5a7313e4d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask7.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask7.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask7.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask8.o: ../../../../../../../../../Src/salvotask8.c  .generated_files/flags/default/147bd06274557006e751d19c6687765acda3f098 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask8.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask8.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotick.o: ../../../../../../../../../Src/salvotick.c  .generated_files/flags/default/f2c6cdaf9dce5aeb33118e6b771587c1cb6f0362 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotick.c  -o ${OBJECTDIR}/_ext/1353486475/salvotick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotid.o: ../../../../../../../../../Src/salvotid.c  .generated_files/flags/default/cf5cd72cdee1cb67350073f392e364efb175e5a0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotid.c  -o ${OBJECTDIR}/_ext/1353486475/salvotid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotime.o: ../../../../../../../../../Src/salvotime.c  .generated_files/flags/default/e712d627338394e26950e26ae0d87e4b3ea699d3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotime.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotime.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotime.c  -o ${OBJECTDIR}/_ext/1353486475/salvotime.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotime.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotimer.o: ../../../../../../../../../Src/salvotimer.c  .generated_files/flags/default/f4dfc14db074bbff4dd999937cc868c4e67b8734 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotimer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotimer.c  -o ${OBJECTDIR}/_ext/1353486475/salvotimer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotimer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoutil.o: ../../../../../../../../../Src/salvoutil.c  .generated_files/flags/default/319adacc506f70fcae5efa7b5feb3a943a56f34f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoutil.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoutil.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoutil.c  -o ${OBJECTDIR}/_ext/1353486475/salvoutil.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoutil.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoversion.o: ../../../../../../../../../Src/salvoversion.c  .generated_files/flags/default/a53c0ca99760fea8ca885468ea340097d035e757 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoversion.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoversion.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoversion.c  -o ${OBJECTDIR}/_ext/1353486475/salvoversion.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoversion.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/satellite_utils.o: ../../../../../../../../../Src/satellite_utils.c  .generated_files/flags/default/2ff88a60152a96fc04365ac26d3017a0b100e955 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/satellite_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/satellite_utils.c  -o ${OBJECTDIR}/_ext/1353486475/satellite_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/43898991/main.o: ../../main.c  .generated_files/flags/default/3bab8475b9aea27ff15403ce39e64ebe105c6b6a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../main.c  -o ${OBJECTDIR}/_ext/43898991/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoarray.o: ../../../../../../../../../Src/salvoarray.c  .generated_files/flags/default/938f8d044c92805c456951302f389b00d592298 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoarray.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoarray.c  -o ${OBJECTDIR}/_ext/1353486475/salvoarray.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoarray.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvobinsem.o: ../../../../../../../../../Src/salvobinsem.c  .generated_files/flags/default/cb52955ec7c4a383c500bcd370dd773985461f88 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvobinsem.c  -o ${OBJECTDIR}/_ext/1353486475/salvobinsem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvobinsem2.o: ../../../../../../../../../Src/salvobinsem2.c  .generated_files/flags/default/104ff6cde4b0955cd2bf5b382a6382bba376f9d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvobinsem2.c  -o ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvochk.o: ../../../../../../../../../Src/salvochk.c  .generated_files/flags/default/be6fb102859d803c93a58ddc80d37e5e557bad46 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvochk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvochk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvochk.c  -o ${OBJECTDIR}/_ext/1353486475/salvochk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvochk.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic.o: ../../../../../../../../../Src/salvocyclic.c  .generated_files/flags/default/9784f537abea8e8f9d9334bb845e35edddda3aed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic2.o: ../../../../../../../../../Src/salvocyclic2.c  .generated_files/flags/default/43e61ec8fcfaf53aa782ba122711a00c041696c8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic2.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic3.o: ../../../../../../../../../Src/salvocyclic3.c  .generated_files/flags/default/b7d178b3df4e6175f44464f923f9eba4def7d9aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic3.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic4.o: ../../../../../../../../../Src/salvocyclic4.c  .generated_files/flags/default/2f613aaffdf2d341e755e7099c95ea9d2184f9f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic4.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic5.o: ../../../../../../../../../Src/salvocyclic5.c  .generated_files/flags/default/b4cb0cfb5c50e969eec0dac47601d537bb9e2bf6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic5.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic6.o: ../../../../../../../../../Src/salvocyclic6.c  .generated_files/flags/default/74d7b53eb4326f9b1bbddaf2e1869861bf60fb71 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic6.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic7.o: ../../../../../../../../../Src/salvocyclic7.c  .generated_files/flags/default/7b9060b314028f570ecedc231e32b6788ba057cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic7.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodebug.o: ../../../../../../../../../Src/salvodebug.c  .generated_files/flags/default/adaef316d0e469932e54e6a7a16bf72760f5761f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodebug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodebug.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodebug.c  -o ${OBJECTDIR}/_ext/1353486475/salvodebug.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodebug.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay.o: ../../../../../../../../../Src/salvodelay.c  .generated_files/flags/default/123015d37a91039e83e9b7aedeea17748b0614d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay2.o: ../../../../../../../../../Src/salvodelay2.c  .generated_files/flags/default/5bb15e34702dcbe3999048cc379103cdb00d76b7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay2.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay3.o: ../../../../../../../../../Src/salvodelay3.c  .generated_files/flags/default/3c83f4b42a041196c9d125bc99d0d91909b617f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay3.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodestroy.o: ../../../../../../../../../Src/salvodestroy.c  .generated_files/flags/default/338eecfadc7ad5611323a4d93fe9de99e6dcaa5f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodestroy.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodestroy.c  -o ${OBJECTDIR}/_ext/1353486475/salvodestroy.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeflag.o: ../../../../../../../../../Src/salvoeflag.c  .generated_files/flags/default/4274bf03c0b33aa2d04af20127a36ff0827a9fed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeflag.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeflag.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeflag2.o: ../../../../../../../../../Src/salvoeflag2.c  .generated_files/flags/default/6f20482d22d9500f6d5a70e21796e2abcec19dff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeflag2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeid.o: ../../../../../../../../../Src/salvoeid.c  .generated_files/flags/default/c8eb676bfa142725f7ae3331ddfb9ddacb78b58b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeid.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeid.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoevent.o: ../../../../../../../../../Src/salvoevent.c  .generated_files/flags/default/11b1fccb4f1be10939b8bc62fc836153175794b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoevent.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoevent.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoevent.c  -o ${OBJECTDIR}/_ext/1353486475/salvoevent.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoevent.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_idle.o: ../../../../../../../../../Src/salvohook_idle.c  .generated_files/flags/default/21a0f063d738f31c0db87c2fbc40bdc7a03cbe42 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_idle.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o: ../../../../../../../../../Src/salvohook_interrupt.c  .generated_files/flags/default/b9390769ff8aa66cc66c16e9032120e14403f1f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_interrupt.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o: ../../../../../../../../../Src/salvohook_wdt.c  .generated_files/flags/default/8db203c12713a756a637ef8ec8a3d93e2e92d5fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_wdt.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit.o: ../../../../../../../../../Src/salvoinit.c  .generated_files/flags/default/e87c11fb6547436dea4336e0a48c6ae2fb590217 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit2.o: ../../../../../../../../../Src/salvoinit2.c  .generated_files/flags/default/53db75c7af3a5de4aa41c6f19a26f823f259f92c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit3.o: ../../../../../../../../../Src/salvoinit3.c  .generated_files/flags/default/e24a175c87e52acd57c71d2a8f449c813fb8cd58 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit3.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit4.o: ../../../../../../../../../Src/salvoinit4.c  .generated_files/flags/default/cbdcaa302f01f782e78c0312856bc8037d3ab0ed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit4.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvolicense.o: ../../../../../../../../../Src/salvolicense.c  .generated_files/flags/default/f8a4d4cd1db12d0c29712f204c5dae91f92f638a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvolicense.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvolicense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvolicense.c  -o ${OBJECTDIR}/_ext/1353486475/salvolicense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvolicense.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomem.o: ../../../../../../../../../Src/salvomem.c  .generated_files/flags/default/1b797bae8cfd65dbf5afec8484f737ed22a3d7b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomem.c  -o ${OBJECTDIR}/_ext/1353486475/salvomem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomem.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsg.o: ../../../../../../../../../Src/salvomsg.c  .generated_files/flags/default/68134029f7c1e8fb772c6c50ec14c9c169eb3d30 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsg.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsg.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsg2.o: ../../../../../../../../../Src/salvomsg2.c  .generated_files/flags/default/3f340eba12892cce2f57c698ed5ce2203315571b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsg2.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsg2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq.o: ../../../../../../../../../Src/salvomsgq.c  .generated_files/flags/default/c364391b7e9ef38aa4671b971d22adbc8ddd7c94 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq2.o: ../../../../../../../../../Src/salvomsgq2.c  .generated_files/flags/default/3a7e48d1679f06e360b8f1edf8e1584f9f17d4c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq2.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq3.o: ../../../../../../../../../Src/salvomsgq3.c  .generated_files/flags/default/239dfe07ea420dac7b47dc061a84e71955dfcaf1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq3.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq4.o: ../../../../../../../../../Src/salvomsgq4.c  .generated_files/flags/default/ed96ecff377cbae84e8203b55d02e52f77b64901 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq4.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoprio.o: ../../../../../../../../../Src/salvoprio.c  .generated_files/flags/default/56fdba359da85b8543abc8b1fa89451bd827b84e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoprio.c  -o ${OBJECTDIR}/_ext/1353486475/salvoprio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoprio.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoprio2.o: ../../../../../../../../../Src/salvoprio2.c  .generated_files/flags/default/39f76cef9e44b71ca74a3ceb32a4f786d0ec4331 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoprio2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoprio2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoqdel.o: ../../../../../../../../../Src/salvoqdel.c  .generated_files/flags/default/ec734785ec9d094ac09b47ea652b5ebf56852ac3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqdel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoqdel.c  -o ${OBJECTDIR}/_ext/1353486475/salvoqdel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoqins.o: ../../../../../../../../../Src/salvoqins.c  .generated_files/flags/default/3fc76b015ce0694c14c17f0cd713e0df8637793 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoqins.c  -o ${OBJECTDIR}/_ext/1353486475/salvoqins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoqins.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvorpt.o: ../../../../../../../../../Src/salvorpt.c  .generated_files/flags/default/d9c52da82aa0bd19788d5773a5672bf0ca76361c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvorpt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvorpt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvorpt.c  -o ${OBJECTDIR}/_ext/1353486475/salvorpt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvorpt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosched.o: ../../../../../../../../../Src/salvosched.c  .generated_files/flags/default/cefdef16c8e626507588ab6537a495d9e273e41 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosched.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosched.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosched.c  -o ${OBJECTDIR}/_ext/1353486475/salvosched.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosched.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosem.o: ../../../../../../../../../Src/salvosem.c  .generated_files/flags/default/fd8735f940ebd7602fd6863cf21bf78efadcfccf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosem.c  -o ${OBJECTDIR}/_ext/1353486475/salvosem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosem.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosem2.o: ../../../../../../../../../Src/salvosem2.c  .generated_files/flags/default/5f91edaf185537395833912f2770a5c5972ddca0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosem2.c  -o ${OBJECTDIR}/_ext/1353486475/salvosem2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosem2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvostop.o: ../../../../../../../../../Src/salvostop.c  .generated_files/flags/default/a693ad89efd3387e341dd4f7e9bca9fd5987bb7d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvostop.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvostop.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvostop.c  -o ${OBJECTDIR}/_ext/1353486475/salvostop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvostop.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask.o: ../../../../../../../../../Src/salvotask.c  .generated_files/flags/default/4aae37f1b48ea62c83279bc2b6eea90eb77b12c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask2.o: ../../../../../../../../../Src/salvotask2.c  .generated_files/flags/default/ce68a7e68833f1d6f55ab9e520b1f8bf9ea57995 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask2.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask2.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask3.o: ../../../../../../../../../Src/salvotask3.c  .generated_files/flags/default/6d49a2c1788d2a2576b6b31728ed88ede92d7edf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask3.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask3.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask4.o: ../../../../../../../../../Src/salvotask4.c  .generated_files/flags/default/2d0d119645f03621764a4d87189c448a8a89d86 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask4.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask4.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask5.o: ../../../../../../../../../Src/salvotask5.c  .generated_files/flags/default/b7bec5d41b5a89698d6b9b6594c235ecbedb34ab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask5.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask5.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask6.o: ../../../../../../../../../Src/salvotask6.c  .generated_files/flags/default/741a2c3af016b388f9d344424a8d6313a10d2b0a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask6.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask6.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask7.o: ../../../../../../../../../Src/salvotask7.c  .generated_files/flags/default/a59319127e0143c91affbf444b3913f1ae718961 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask7.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask7.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask7.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask8.o: ../../../../../../../../../Src/salvotask8.c  .generated_files/flags/default/dec43c6291fb6e31809646c486d2b9e7423740d1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask8.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask8.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotick.o: ../../../../../../../../../Src/salvotick.c  .generated_files/flags/default/d400f4808a993e5b08e7817500c737284a65999 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotick.c  -o ${OBJECTDIR}/_ext/1353486475/salvotick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotick.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotid.o: ../../../../../../../../../Src/salvotid.c  .generated_files/flags/default/aaeb7bcc47aabc671c4fc39a488c5a6e00c03801 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotid.c  -o ${OBJECTDIR}/_ext/1353486475/salvotid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotid.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotime.o: ../../../../../../../../../Src/salvotime.c  .generated_files/flags/default/983d3eb01b074e5672baa593203e747e8ed36f98 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotime.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotime.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotime.c  -o ${OBJECTDIR}/_ext/1353486475/salvotime.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotime.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotimer.o: ../../../../../../../../../Src/salvotimer.c  .generated_files/flags/default/ab9a60673edb9c133395df593c64d552137eb12c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotimer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotimer.c  -o ${OBJECTDIR}/_ext/1353486475/salvotimer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotimer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoutil.o: ../../../../../../../../../Src/salvoutil.c  .generated_files/flags/default/3617264fdf3973e6f549eb41ea69b7b40adc6e2c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoutil.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoutil.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoutil.c  -o ${OBJECTDIR}/_ext/1353486475/salvoutil.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoutil.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoversion.o: ../../../../../../../../../Src/salvoversion.c  .generated_files/flags/default/ddaba7d7743e1718cc59f8f0e5707261b18c920c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoversion.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoversion.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoversion.c  -o ${OBJECTDIR}/_ext/1353486475/salvoversion.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoversion.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/satellite_utils.o: ../../../../../../../../../Src/satellite_utils.c  .generated_files/flags/default/ee3dbb7ca9e32c8cc57f3d0e62f45aaffbba0bc1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/satellite_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/satellite_utils.c  -o ${OBJECTDIR}/_ext/1353486475/satellite_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o: ../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s  .generated_files/flags/default/bb1099d5a19dd4936b32f1a579d828163a641a9d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/91385488" 
	@${RM} ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o.d 
	@${RM} ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s  -o ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"../../../../../../../../../Src" -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o: ../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s  .generated_files/flags/default/260bdb0a9e1ecfbe239a8b2a11f70826b80f04e9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/Tut5pro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src"     -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
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
