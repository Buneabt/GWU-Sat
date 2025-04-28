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
${OBJECTDIR}/_ext/43898991/main.o: ../../main.c  .generated_files/flags/default/411b307ee76cef138431090628ff56027f2b4e04 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../main.c  -o ${OBJECTDIR}/_ext/43898991/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/43898991/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoarray.o: ../../../../../../../../../Src/salvoarray.c  .generated_files/flags/default/bbb2ae54b8dcd375e3489f977f961a22c8bae4f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoarray.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoarray.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoarray.c  -o ${OBJECTDIR}/_ext/1353486475/salvoarray.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoarray.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvobinsem.o: ../../../../../../../../../Src/salvobinsem.c  .generated_files/flags/default/d9069b3bb67614d1219e8f26ccb0611ad675711b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvobinsem.c  -o ${OBJECTDIR}/_ext/1353486475/salvobinsem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvobinsem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvobinsem2.o: ../../../../../../../../../Src/salvobinsem2.c  .generated_files/flags/default/48c4779ecac39cc926ad3b866aefbfb0a6c2938 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvobinsem2.c  -o ${OBJECTDIR}/_ext/1353486475/salvobinsem2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvobinsem2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvochk.o: ../../../../../../../../../Src/salvochk.c  .generated_files/flags/default/1d6578b93dc31c3408b05c06d536840d1ff598fa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvochk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvochk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvochk.c  -o ${OBJECTDIR}/_ext/1353486475/salvochk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvochk.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic.o: ../../../../../../../../../Src/salvocyclic.c  .generated_files/flags/default/f3da33757a6423dc83564b89e7855c7e80c03548 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic2.o: ../../../../../../../../../Src/salvocyclic2.c  .generated_files/flags/default/150d587aec00f8713eb9d6259f6bf57406f131b4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic2.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic3.o: ../../../../../../../../../Src/salvocyclic3.c  .generated_files/flags/default/928f4028003a375a69197dde7ed4a5c3a3b0a5b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic3.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic4.o: ../../../../../../../../../Src/salvocyclic4.c  .generated_files/flags/default/dd8e79c34c5e773e06ad962d939bdcf2ab0d2ba4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic4.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic5.o: ../../../../../../../../../Src/salvocyclic5.c  .generated_files/flags/default/66d41cd346cad4c74bc4abe80f5eb4deda89cb4a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic5.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic5.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic6.o: ../../../../../../../../../Src/salvocyclic6.c  .generated_files/flags/default/59253b8bb38e8d03e9da2d4e28ccec582bb6d9d2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic6.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic6.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvocyclic7.o: ../../../../../../../../../Src/salvocyclic7.c  .generated_files/flags/default/cbbb165606a3b1db62e8e464f6f4cd1fdf46bebe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvocyclic7.c  -o ${OBJECTDIR}/_ext/1353486475/salvocyclic7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvocyclic7.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodebug.o: ../../../../../../../../../Src/salvodebug.c  .generated_files/flags/default/8d8535f77ae8dfc08d5a542e3f520b448be6743e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodebug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodebug.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodebug.c  -o ${OBJECTDIR}/_ext/1353486475/salvodebug.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodebug.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay.o: ../../../../../../../../../Src/salvodelay.c  .generated_files/flags/default/d38a7f139a014fb4732d40c4ed63042d64a17f89 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay2.o: ../../../../../../../../../Src/salvodelay2.c  .generated_files/flags/default/ed604b33966f5d33ebe2bfccfbb1618bd1faf871 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay2.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodelay3.o: ../../../../../../../../../Src/salvodelay3.c  .generated_files/flags/default/e75cdf1ed429168f01379b5284813ed0495d97da .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodelay3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodelay3.c  -o ${OBJECTDIR}/_ext/1353486475/salvodelay3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodelay3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvodestroy.o: ../../../../../../../../../Src/salvodestroy.c  .generated_files/flags/default/e487f5e2d7f542ad79ad5f329c17090a427d8a4b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvodestroy.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvodestroy.c  -o ${OBJECTDIR}/_ext/1353486475/salvodestroy.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvodestroy.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeflag.o: ../../../../../../../../../Src/salvoeflag.c  .generated_files/flags/default/c4c46778bd86b5f01a250f179cc64d3b496e35ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeflag.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeflag.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeflag.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeflag2.o: ../../../../../../../../../Src/salvoeflag2.c  .generated_files/flags/default/52b063245a8e4a2e1398bd24b1b03ec828f9c097 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeflag2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeflag2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeflag2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoeid.o: ../../../../../../../../../Src/salvoeid.c  .generated_files/flags/default/f481a26fc4884a930f77e57b84def104904e1cd9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoeid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoeid.c  -o ${OBJECTDIR}/_ext/1353486475/salvoeid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoeid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoevent.o: ../../../../../../../../../Src/salvoevent.c  .generated_files/flags/default/d81c7e3cc1503e7c13c4d029e264e1468b080e4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoevent.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoevent.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoevent.c  -o ${OBJECTDIR}/_ext/1353486475/salvoevent.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoevent.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_idle.o: ../../../../../../../../../Src/salvohook_idle.c  .generated_files/flags/default/7949b81159283f8a0072c07da656de329c3c580e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_idle.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_idle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_idle.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o: ../../../../../../../../../Src/salvohook_interrupt.c  .generated_files/flags/default/fb0148f196ef15201d5b38c7689e73cd584dd408 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_interrupt.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_interrupt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o: ../../../../../../../../../Src/salvohook_wdt.c  .generated_files/flags/default/12aae639544009b14afbec3e33dec110d75ea84a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvohook_wdt.c  -o ${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvohook_wdt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit.o: ../../../../../../../../../Src/salvoinit.c  .generated_files/flags/default/32cade1bc8df78f2e10b1a0db7626e307e5552f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit2.o: ../../../../../../../../../Src/salvoinit2.c  .generated_files/flags/default/220f4dc5b97d13c027a80010dd05213732acaac0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit3.o: ../../../../../../../../../Src/salvoinit3.c  .generated_files/flags/default/fd44c91837abfb04758e6b09fbde53352301ea59 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit3.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoinit4.o: ../../../../../../../../../Src/salvoinit4.c  .generated_files/flags/default/b6d7e450eb9429652225705fada478e7a4d686ab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoinit4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoinit4.c  -o ${OBJECTDIR}/_ext/1353486475/salvoinit4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoinit4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvolicense.o: ../../../../../../../../../Src/salvolicense.c  .generated_files/flags/default/a52013f158b15bbd259a8173552135ec7e673484 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvolicense.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvolicense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvolicense.c  -o ${OBJECTDIR}/_ext/1353486475/salvolicense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvolicense.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomem.o: ../../../../../../../../../Src/salvomem.c  .generated_files/flags/default/310c028150a12061c348210652fd76573ada72ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomem.c  -o ${OBJECTDIR}/_ext/1353486475/salvomem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsg.o: ../../../../../../../../../Src/salvomsg.c  .generated_files/flags/default/c548d3d289f94223936c7927cdaaf0855102c0f8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsg.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsg.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsg2.o: ../../../../../../../../../Src/salvomsg2.c  .generated_files/flags/default/72788126bdde51a588fcfe53cae4263087b9de12 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsg2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsg2.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsg2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsg2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq.o: ../../../../../../../../../Src/salvomsgq.c  .generated_files/flags/default/657d689e3286e7902cd16bad080efd604ba9b867 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq2.o: ../../../../../../../../../Src/salvomsgq2.c  .generated_files/flags/default/63f336a08feb48dcd09bafcc8ad3a521a234bc3c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq2.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq3.o: ../../../../../../../../../Src/salvomsgq3.c  .generated_files/flags/default/c411b808cac5a9d5152b79c5a2615748b49120a0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq3.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvomsgq4.o: ../../../../../../../../../Src/salvomsgq4.c  .generated_files/flags/default/a173da7e2392c390eb91b36bb93978a4e4309ee4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvomsgq4.c  -o ${OBJECTDIR}/_ext/1353486475/salvomsgq4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvomsgq4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoprio.o: ../../../../../../../../../Src/salvoprio.c  .generated_files/flags/default/b62e60821a252e39f248108663460bb0c90517c2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoprio.c  -o ${OBJECTDIR}/_ext/1353486475/salvoprio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoprio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoprio2.o: ../../../../../../../../../Src/salvoprio2.c  .generated_files/flags/default/fe900c7636f6fac64a7c1a5a2c1524bba6d6a686 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoprio2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoprio2.c  -o ${OBJECTDIR}/_ext/1353486475/salvoprio2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoprio2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoqdel.o: ../../../../../../../../../Src/salvoqdel.c  .generated_files/flags/default/92c279378fb2fd44d4136f762b3642d7618639ef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqdel.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoqdel.c  -o ${OBJECTDIR}/_ext/1353486475/salvoqdel.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoqdel.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoqins.o: ../../../../../../../../../Src/salvoqins.c  .generated_files/flags/default/30f28f6e7952b77754b04e0b681a78f4b047bd06 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoqins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoqins.c  -o ${OBJECTDIR}/_ext/1353486475/salvoqins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoqins.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvorpt.o: ../../../../../../../../../Src/salvorpt.c  .generated_files/flags/default/3609f2d452c82dec806187939180debe6999191d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvorpt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvorpt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvorpt.c  -o ${OBJECTDIR}/_ext/1353486475/salvorpt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvorpt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosched.o: ../../../../../../../../../Src/salvosched.c  .generated_files/flags/default/a9fdf917bf7020c917b6d5affcb23292bfa9389a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosched.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosched.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosched.c  -o ${OBJECTDIR}/_ext/1353486475/salvosched.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosched.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosem.o: ../../../../../../../../../Src/salvosem.c  .generated_files/flags/default/378ed52a27277e3c7ef9397b50baae4112bf9065 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosem.c  -o ${OBJECTDIR}/_ext/1353486475/salvosem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvosem2.o: ../../../../../../../../../Src/salvosem2.c  .generated_files/flags/default/90d5bc5a5d3170d175a2d94a5365dbbe03bcb4c3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvosem2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvosem2.c  -o ${OBJECTDIR}/_ext/1353486475/salvosem2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvosem2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvostop.o: ../../../../../../../../../Src/salvostop.c  .generated_files/flags/default/1a191c38a3092248e34e11d1e63bcfcbd267c584 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvostop.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvostop.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvostop.c  -o ${OBJECTDIR}/_ext/1353486475/salvostop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvostop.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask.o: ../../../../../../../../../Src/salvotask.c  .generated_files/flags/default/1e71c894a98f5eecff36da0d346340253f321cc2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask2.o: ../../../../../../../../../Src/salvotask2.c  .generated_files/flags/default/be863319b01c2ba14138f706712f5351539b1050 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask2.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask3.o: ../../../../../../../../../Src/salvotask3.c  .generated_files/flags/default/3185088fe24ef4e5bf945d9a3c4ab5f5b6bdac7c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask3.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask4.o: ../../../../../../../../../Src/salvotask4.c  .generated_files/flags/default/a3a282543dc5ec04a6022a998e66b8d89d5993b1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask4.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask5.o: ../../../../../../../../../Src/salvotask5.c  .generated_files/flags/default/b60a2b7dda93f9c1ad4842b013bacd1b8f9d8464 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask5.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask5.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask6.o: ../../../../../../../../../Src/salvotask6.c  .generated_files/flags/default/f62edcb4afc5bbb8dde562d746ee45b65d3b90e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask6.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask6.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask6.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask7.o: ../../../../../../../../../Src/salvotask7.c  .generated_files/flags/default/38be1e4a4d1f99905cf2b265a059bd0c683110fd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask7.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask7.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask7.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask7.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask7.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotask8.o: ../../../../../../../../../Src/salvotask8.c  .generated_files/flags/default/627c88166baee1abbea160e3a66f336a49352c71 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotask8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotask8.c  -o ${OBJECTDIR}/_ext/1353486475/salvotask8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotask8.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotick.o: ../../../../../../../../../Src/salvotick.c  .generated_files/flags/default/3f8932939aca7d582889b14e1488926d32e6c936 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotick.c  -o ${OBJECTDIR}/_ext/1353486475/salvotick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotid.o: ../../../../../../../../../Src/salvotid.c  .generated_files/flags/default/7e789c82dd4e2024ca151fd3d8e489cdffd09aa4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotid.c  -o ${OBJECTDIR}/_ext/1353486475/salvotid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotime.o: ../../../../../../../../../Src/salvotime.c  .generated_files/flags/default/947497d182668eb3b4e4b944e483cfc2d22e780d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotime.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotime.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotime.c  -o ${OBJECTDIR}/_ext/1353486475/salvotime.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotime.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvotimer.o: ../../../../../../../../../Src/salvotimer.c  .generated_files/flags/default/477d5b4713ba19ef5a2bef775b3b28b8680861a6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvotimer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvotimer.c  -o ${OBJECTDIR}/_ext/1353486475/salvotimer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvotimer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoutil.o: ../../../../../../../../../Src/salvoutil.c  .generated_files/flags/default/512780a86e8910b5f0fca92e68e338ae87777d80 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoutil.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoutil.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoutil.c  -o ${OBJECTDIR}/_ext/1353486475/salvoutil.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoutil.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/salvoversion.o: ../../../../../../../../../Src/salvoversion.c  .generated_files/flags/default/eb78c564e3fcba0b8c25c9d3b897dad9f32b186b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoversion.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/salvoversion.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/salvoversion.c  -o ${OBJECTDIR}/_ext/1353486475/salvoversion.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/salvoversion.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1353486475/satellite_utils.o: ../../../../../../../../../Src/satellite_utils.c  .generated_files/flags/default/871784df8ab69d46da7daa5b689a48f940f7cee3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1353486475" 
	@${RM} ${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1353486475/satellite_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../../../../Src/satellite_utils.c  -o ${OBJECTDIR}/_ext/1353486475/satellite_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1353486475/satellite_utils.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"../../../../../../../../../Src" -O0 -I".." -I"../$(BINDIR)" -I"../../../../../../../../../Inc" -I"." -I"../../../../../../../../../Src/MCC30" -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
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
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o: ../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s  .generated_files/flags/default/dea817af4467d92f3cc54fcc2a7dd05dcdcbeebd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/91385488" 
	@${RM} ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o.d 
	@${RM} ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../../../../../../../Src/MCC30/salvoportmcc30-lm.s  -o ${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"../../../../../../../../../Src" -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/91385488/salvoportmcc30-lm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
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
