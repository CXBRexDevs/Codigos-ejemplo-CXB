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
ifeq "$(wildcard nbproject/Makefile-local-default_PIC32MK1024MCF064.mk)" "nbproject/Makefile-local-default_PIC32MK1024MCF064.mk"
include nbproject/Makefile-local-default_PIC32MK1024MCF064.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default_PIC32MK1024MCF064
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CXB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CXB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../src/config/default_PIC32MK1024MCF064/peripheral/adchs/plib_adchs.c ../src/config/default_PIC32MK1024MCF064/peripheral/can/plib_can1.c ../src/config/default_PIC32MK1024MCF064/peripheral/clk/plib_clk.c ../src/config/default_PIC32MK1024MCF064/peripheral/coretimer/plib_coretimer.c ../src/config/default_PIC32MK1024MCF064/peripheral/evic/plib_evic.c ../src/config/default_PIC32MK1024MCF064/peripheral/gpio/plib_gpio.c ../src/config/default_PIC32MK1024MCF064/peripheral/mcpwm/plib_mcpwm.c ../src/config/default_PIC32MK1024MCF064/peripheral/qei/plib_qei1.c ../src/config/default_PIC32MK1024MCF064/peripheral/spi/spi_master/plib_spi1_master.c ../src/config/default_PIC32MK1024MCF064/peripheral/tmr1/plib_tmr1.c ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart5.c ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart6.c ../src/config/default_PIC32MK1024MCF064/stdio/xc32_monitor.c ../src/config/default_PIC32MK1024MCF064/interrupts.c ../src/config/default_PIC32MK1024MCF064/exceptions.c ../src/config/default_PIC32MK1024MCF064/initialization.c ../src/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1696097330/plib_adchs.o ${OBJECTDIR}/_ext/842925033/plib_can1.o ${OBJECTDIR}/_ext/842924695/plib_clk.o ${OBJECTDIR}/_ext/1356541453/plib_coretimer.o ${OBJECTDIR}/_ext/360792540/plib_evic.o ${OBJECTDIR}/_ext/360738712/plib_gpio.o ${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o ${OBJECTDIR}/_ext/842911460/plib_qei1.o ${OBJECTDIR}/_ext/766763505/plib_spi1_master.o ${OBJECTDIR}/_ext/360354095/plib_tmr1.o ${OBJECTDIR}/_ext/360335769/plib_uart5.o ${OBJECTDIR}/_ext/360335769/plib_uart6.o ${OBJECTDIR}/_ext/590055919/xc32_monitor.o ${OBJECTDIR}/_ext/2045050379/interrupts.o ${OBJECTDIR}/_ext/2045050379/exceptions.o ${OBJECTDIR}/_ext/2045050379/initialization.o ${OBJECTDIR}/_ext/1360937237/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1696097330/plib_adchs.o.d ${OBJECTDIR}/_ext/842925033/plib_can1.o.d ${OBJECTDIR}/_ext/842924695/plib_clk.o.d ${OBJECTDIR}/_ext/1356541453/plib_coretimer.o.d ${OBJECTDIR}/_ext/360792540/plib_evic.o.d ${OBJECTDIR}/_ext/360738712/plib_gpio.o.d ${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o.d ${OBJECTDIR}/_ext/842911460/plib_qei1.o.d ${OBJECTDIR}/_ext/766763505/plib_spi1_master.o.d ${OBJECTDIR}/_ext/360354095/plib_tmr1.o.d ${OBJECTDIR}/_ext/360335769/plib_uart5.o.d ${OBJECTDIR}/_ext/360335769/plib_uart6.o.d ${OBJECTDIR}/_ext/590055919/xc32_monitor.o.d ${OBJECTDIR}/_ext/2045050379/interrupts.o.d ${OBJECTDIR}/_ext/2045050379/exceptions.o.d ${OBJECTDIR}/_ext/2045050379/initialization.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1696097330/plib_adchs.o ${OBJECTDIR}/_ext/842925033/plib_can1.o ${OBJECTDIR}/_ext/842924695/plib_clk.o ${OBJECTDIR}/_ext/1356541453/plib_coretimer.o ${OBJECTDIR}/_ext/360792540/plib_evic.o ${OBJECTDIR}/_ext/360738712/plib_gpio.o ${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o ${OBJECTDIR}/_ext/842911460/plib_qei1.o ${OBJECTDIR}/_ext/766763505/plib_spi1_master.o ${OBJECTDIR}/_ext/360354095/plib_tmr1.o ${OBJECTDIR}/_ext/360335769/plib_uart5.o ${OBJECTDIR}/_ext/360335769/plib_uart6.o ${OBJECTDIR}/_ext/590055919/xc32_monitor.o ${OBJECTDIR}/_ext/2045050379/interrupts.o ${OBJECTDIR}/_ext/2045050379/exceptions.o ${OBJECTDIR}/_ext/2045050379/initialization.o ${OBJECTDIR}/_ext/1360937237/main.o

# Source Files
SOURCEFILES=../src/config/default_PIC32MK1024MCF064/peripheral/adchs/plib_adchs.c ../src/config/default_PIC32MK1024MCF064/peripheral/can/plib_can1.c ../src/config/default_PIC32MK1024MCF064/peripheral/clk/plib_clk.c ../src/config/default_PIC32MK1024MCF064/peripheral/coretimer/plib_coretimer.c ../src/config/default_PIC32MK1024MCF064/peripheral/evic/plib_evic.c ../src/config/default_PIC32MK1024MCF064/peripheral/gpio/plib_gpio.c ../src/config/default_PIC32MK1024MCF064/peripheral/mcpwm/plib_mcpwm.c ../src/config/default_PIC32MK1024MCF064/peripheral/qei/plib_qei1.c ../src/config/default_PIC32MK1024MCF064/peripheral/spi/spi_master/plib_spi1_master.c ../src/config/default_PIC32MK1024MCF064/peripheral/tmr1/plib_tmr1.c ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart5.c ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart6.c ../src/config/default_PIC32MK1024MCF064/stdio/xc32_monitor.c ../src/config/default_PIC32MK1024MCF064/interrupts.c ../src/config/default_PIC32MK1024MCF064/exceptions.c ../src/config/default_PIC32MK1024MCF064/initialization.c ../src/main.c



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
	${MAKE}  -f nbproject/Makefile-default_PIC32MK1024MCF064.mk ${DISTDIR}/CXB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MK1024MCF064
MP_LINKER_FILE_OPTION=,--script="..\src\config\default_PIC32MK1024MCF064\p32MK1024MCF064.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1696097330/plib_adchs.o: ../src/config/default_PIC32MK1024MCF064/peripheral/adchs/plib_adchs.c  .generated_files/flags/default_PIC32MK1024MCF064/f043a8c72c30945caacfd92a654cdbdb63caa02 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1696097330" 
	@${RM} ${OBJECTDIR}/_ext/1696097330/plib_adchs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1696097330/plib_adchs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1696097330/plib_adchs.o.d" -o ${OBJECTDIR}/_ext/1696097330/plib_adchs.o ../src/config/default_PIC32MK1024MCF064/peripheral/adchs/plib_adchs.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/842925033/plib_can1.o: ../src/config/default_PIC32MK1024MCF064/peripheral/can/plib_can1.c  .generated_files/flags/default_PIC32MK1024MCF064/493b057813a2d87bc71663efee4722019f1d9618 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/842925033" 
	@${RM} ${OBJECTDIR}/_ext/842925033/plib_can1.o.d 
	@${RM} ${OBJECTDIR}/_ext/842925033/plib_can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/842925033/plib_can1.o.d" -o ${OBJECTDIR}/_ext/842925033/plib_can1.o ../src/config/default_PIC32MK1024MCF064/peripheral/can/plib_can1.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/842924695/plib_clk.o: ../src/config/default_PIC32MK1024MCF064/peripheral/clk/plib_clk.c  .generated_files/flags/default_PIC32MK1024MCF064/56e83e5536b56ffb3a3a71176f420072f1541e0e .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/842924695" 
	@${RM} ${OBJECTDIR}/_ext/842924695/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/842924695/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/842924695/plib_clk.o.d" -o ${OBJECTDIR}/_ext/842924695/plib_clk.o ../src/config/default_PIC32MK1024MCF064/peripheral/clk/plib_clk.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1356541453/plib_coretimer.o: ../src/config/default_PIC32MK1024MCF064/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/default_PIC32MK1024MCF064/b9de70441801820d6534a63b464c9e1fcd0f67a0 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1356541453" 
	@${RM} ${OBJECTDIR}/_ext/1356541453/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1356541453/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1356541453/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/1356541453/plib_coretimer.o ../src/config/default_PIC32MK1024MCF064/peripheral/coretimer/plib_coretimer.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/360792540/plib_evic.o: ../src/config/default_PIC32MK1024MCF064/peripheral/evic/plib_evic.c  .generated_files/flags/default_PIC32MK1024MCF064/81a7a33afa435f8602ce8c9fe58fd5a2cd8c2fd7 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/360792540" 
	@${RM} ${OBJECTDIR}/_ext/360792540/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/360792540/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/360792540/plib_evic.o.d" -o ${OBJECTDIR}/_ext/360792540/plib_evic.o ../src/config/default_PIC32MK1024MCF064/peripheral/evic/plib_evic.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/360738712/plib_gpio.o: ../src/config/default_PIC32MK1024MCF064/peripheral/gpio/plib_gpio.c  .generated_files/flags/default_PIC32MK1024MCF064/69a77793764f3b148a7fa6bf820a3d2a431673ad .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/360738712" 
	@${RM} ${OBJECTDIR}/_ext/360738712/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/360738712/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/360738712/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/360738712/plib_gpio.o ../src/config/default_PIC32MK1024MCF064/peripheral/gpio/plib_gpio.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o: ../src/config/default_PIC32MK1024MCF064/peripheral/mcpwm/plib_mcpwm.c  .generated_files/flags/default_PIC32MK1024MCF064/f3a07a34bc2339128cac47ec4af54a007d843a87 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1707162743" 
	@${RM} ${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o.d" -o ${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o ../src/config/default_PIC32MK1024MCF064/peripheral/mcpwm/plib_mcpwm.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/842911460/plib_qei1.o: ../src/config/default_PIC32MK1024MCF064/peripheral/qei/plib_qei1.c  .generated_files/flags/default_PIC32MK1024MCF064/6b681989e3543707f5872ae0316dbe3ea96f6706 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/842911460" 
	@${RM} ${OBJECTDIR}/_ext/842911460/plib_qei1.o.d 
	@${RM} ${OBJECTDIR}/_ext/842911460/plib_qei1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/842911460/plib_qei1.o.d" -o ${OBJECTDIR}/_ext/842911460/plib_qei1.o ../src/config/default_PIC32MK1024MCF064/peripheral/qei/plib_qei1.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/766763505/plib_spi1_master.o: ../src/config/default_PIC32MK1024MCF064/peripheral/spi/spi_master/plib_spi1_master.c  .generated_files/flags/default_PIC32MK1024MCF064/10d938d547bc081ff2538592d5255e7f74f88082 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/766763505" 
	@${RM} ${OBJECTDIR}/_ext/766763505/plib_spi1_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/766763505/plib_spi1_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/766763505/plib_spi1_master.o.d" -o ${OBJECTDIR}/_ext/766763505/plib_spi1_master.o ../src/config/default_PIC32MK1024MCF064/peripheral/spi/spi_master/plib_spi1_master.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/360354095/plib_tmr1.o: ../src/config/default_PIC32MK1024MCF064/peripheral/tmr1/plib_tmr1.c  .generated_files/flags/default_PIC32MK1024MCF064/e86bc3bed5b5d4ee9f64c2613284e86eeabd3e60 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/360354095" 
	@${RM} ${OBJECTDIR}/_ext/360354095/plib_tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/360354095/plib_tmr1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/360354095/plib_tmr1.o.d" -o ${OBJECTDIR}/_ext/360354095/plib_tmr1.o ../src/config/default_PIC32MK1024MCF064/peripheral/tmr1/plib_tmr1.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/360335769/plib_uart5.o: ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart5.c  .generated_files/flags/default_PIC32MK1024MCF064/10396033526b2df0c9bc9f41ece31bfa4848ab2d .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/360335769" 
	@${RM} ${OBJECTDIR}/_ext/360335769/plib_uart5.o.d 
	@${RM} ${OBJECTDIR}/_ext/360335769/plib_uart5.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/360335769/plib_uart5.o.d" -o ${OBJECTDIR}/_ext/360335769/plib_uart5.o ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart5.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/360335769/plib_uart6.o: ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart6.c  .generated_files/flags/default_PIC32MK1024MCF064/75857625173b8aae1780a6d8ecdcaaa245106e99 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/360335769" 
	@${RM} ${OBJECTDIR}/_ext/360335769/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/360335769/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/360335769/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/360335769/plib_uart6.o ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart6.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/590055919/xc32_monitor.o: ../src/config/default_PIC32MK1024MCF064/stdio/xc32_monitor.c  .generated_files/flags/default_PIC32MK1024MCF064/a2e519c27198dc3bccdb4a8efc5b2230fae00cf8 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/590055919" 
	@${RM} ${OBJECTDIR}/_ext/590055919/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/590055919/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/590055919/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/590055919/xc32_monitor.o ../src/config/default_PIC32MK1024MCF064/stdio/xc32_monitor.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2045050379/interrupts.o: ../src/config/default_PIC32MK1024MCF064/interrupts.c  .generated_files/flags/default_PIC32MK1024MCF064/b52c1016ef261f6c02d2e2c3f29f3df6822a7d41 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2045050379" 
	@${RM} ${OBJECTDIR}/_ext/2045050379/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/2045050379/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2045050379/interrupts.o.d" -o ${OBJECTDIR}/_ext/2045050379/interrupts.o ../src/config/default_PIC32MK1024MCF064/interrupts.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2045050379/exceptions.o: ../src/config/default_PIC32MK1024MCF064/exceptions.c  .generated_files/flags/default_PIC32MK1024MCF064/15fc18994b0fcde6a277fdc23d314ed8b454e898 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2045050379" 
	@${RM} ${OBJECTDIR}/_ext/2045050379/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/2045050379/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2045050379/exceptions.o.d" -o ${OBJECTDIR}/_ext/2045050379/exceptions.o ../src/config/default_PIC32MK1024MCF064/exceptions.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2045050379/initialization.o: ../src/config/default_PIC32MK1024MCF064/initialization.c  .generated_files/flags/default_PIC32MK1024MCF064/d8c7f99f61d9103c75a3274d471b1d2234dd5b2f .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2045050379" 
	@${RM} ${OBJECTDIR}/_ext/2045050379/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/2045050379/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2045050379/initialization.o.d" -o ${OBJECTDIR}/_ext/2045050379/initialization.o ../src/config/default_PIC32MK1024MCF064/initialization.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default_PIC32MK1024MCF064/b90db414d72276f1eb78b78e678d86a97a0db209 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1696097330/plib_adchs.o: ../src/config/default_PIC32MK1024MCF064/peripheral/adchs/plib_adchs.c  .generated_files/flags/default_PIC32MK1024MCF064/761acf5cd1a37777e33eb5e390f79808c3348b53 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1696097330" 
	@${RM} ${OBJECTDIR}/_ext/1696097330/plib_adchs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1696097330/plib_adchs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1696097330/plib_adchs.o.d" -o ${OBJECTDIR}/_ext/1696097330/plib_adchs.o ../src/config/default_PIC32MK1024MCF064/peripheral/adchs/plib_adchs.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/842925033/plib_can1.o: ../src/config/default_PIC32MK1024MCF064/peripheral/can/plib_can1.c  .generated_files/flags/default_PIC32MK1024MCF064/f03ba15475280ab75604f92cd737ccb49b0372f0 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/842925033" 
	@${RM} ${OBJECTDIR}/_ext/842925033/plib_can1.o.d 
	@${RM} ${OBJECTDIR}/_ext/842925033/plib_can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/842925033/plib_can1.o.d" -o ${OBJECTDIR}/_ext/842925033/plib_can1.o ../src/config/default_PIC32MK1024MCF064/peripheral/can/plib_can1.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/842924695/plib_clk.o: ../src/config/default_PIC32MK1024MCF064/peripheral/clk/plib_clk.c  .generated_files/flags/default_PIC32MK1024MCF064/f0b613f0955cb892e17e0f282d99f2e108c42420 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/842924695" 
	@${RM} ${OBJECTDIR}/_ext/842924695/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/842924695/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/842924695/plib_clk.o.d" -o ${OBJECTDIR}/_ext/842924695/plib_clk.o ../src/config/default_PIC32MK1024MCF064/peripheral/clk/plib_clk.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1356541453/plib_coretimer.o: ../src/config/default_PIC32MK1024MCF064/peripheral/coretimer/plib_coretimer.c  .generated_files/flags/default_PIC32MK1024MCF064/ae226c14b3e023273c8813fa18bd582939b51211 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1356541453" 
	@${RM} ${OBJECTDIR}/_ext/1356541453/plib_coretimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1356541453/plib_coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1356541453/plib_coretimer.o.d" -o ${OBJECTDIR}/_ext/1356541453/plib_coretimer.o ../src/config/default_PIC32MK1024MCF064/peripheral/coretimer/plib_coretimer.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/360792540/plib_evic.o: ../src/config/default_PIC32MK1024MCF064/peripheral/evic/plib_evic.c  .generated_files/flags/default_PIC32MK1024MCF064/a5844ded86070982b8b417ce66f850ca7bc65c83 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/360792540" 
	@${RM} ${OBJECTDIR}/_ext/360792540/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/360792540/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/360792540/plib_evic.o.d" -o ${OBJECTDIR}/_ext/360792540/plib_evic.o ../src/config/default_PIC32MK1024MCF064/peripheral/evic/plib_evic.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/360738712/plib_gpio.o: ../src/config/default_PIC32MK1024MCF064/peripheral/gpio/plib_gpio.c  .generated_files/flags/default_PIC32MK1024MCF064/758a588999e300f21302b23583ece0e68739cc87 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/360738712" 
	@${RM} ${OBJECTDIR}/_ext/360738712/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/360738712/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/360738712/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/360738712/plib_gpio.o ../src/config/default_PIC32MK1024MCF064/peripheral/gpio/plib_gpio.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o: ../src/config/default_PIC32MK1024MCF064/peripheral/mcpwm/plib_mcpwm.c  .generated_files/flags/default_PIC32MK1024MCF064/69d62e64c03cdb598e8f9381a67cb775c9f677ce .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1707162743" 
	@${RM} ${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o.d" -o ${OBJECTDIR}/_ext/1707162743/plib_mcpwm.o ../src/config/default_PIC32MK1024MCF064/peripheral/mcpwm/plib_mcpwm.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/842911460/plib_qei1.o: ../src/config/default_PIC32MK1024MCF064/peripheral/qei/plib_qei1.c  .generated_files/flags/default_PIC32MK1024MCF064/3cadec54caf5253b35d2607bd43d5fbb72e969a3 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/842911460" 
	@${RM} ${OBJECTDIR}/_ext/842911460/plib_qei1.o.d 
	@${RM} ${OBJECTDIR}/_ext/842911460/plib_qei1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/842911460/plib_qei1.o.d" -o ${OBJECTDIR}/_ext/842911460/plib_qei1.o ../src/config/default_PIC32MK1024MCF064/peripheral/qei/plib_qei1.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/766763505/plib_spi1_master.o: ../src/config/default_PIC32MK1024MCF064/peripheral/spi/spi_master/plib_spi1_master.c  .generated_files/flags/default_PIC32MK1024MCF064/6da1d4d95db44d6fd9bb652a1086f07ade0c9f2b .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/766763505" 
	@${RM} ${OBJECTDIR}/_ext/766763505/plib_spi1_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/766763505/plib_spi1_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/766763505/plib_spi1_master.o.d" -o ${OBJECTDIR}/_ext/766763505/plib_spi1_master.o ../src/config/default_PIC32MK1024MCF064/peripheral/spi/spi_master/plib_spi1_master.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/360354095/plib_tmr1.o: ../src/config/default_PIC32MK1024MCF064/peripheral/tmr1/plib_tmr1.c  .generated_files/flags/default_PIC32MK1024MCF064/eba15b61515998a340a8e77478a936feaa43a389 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/360354095" 
	@${RM} ${OBJECTDIR}/_ext/360354095/plib_tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/360354095/plib_tmr1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/360354095/plib_tmr1.o.d" -o ${OBJECTDIR}/_ext/360354095/plib_tmr1.o ../src/config/default_PIC32MK1024MCF064/peripheral/tmr1/plib_tmr1.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/360335769/plib_uart5.o: ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart5.c  .generated_files/flags/default_PIC32MK1024MCF064/ad6e5791424d200db80e900994f5ce01d0dcd697 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/360335769" 
	@${RM} ${OBJECTDIR}/_ext/360335769/plib_uart5.o.d 
	@${RM} ${OBJECTDIR}/_ext/360335769/plib_uart5.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/360335769/plib_uart5.o.d" -o ${OBJECTDIR}/_ext/360335769/plib_uart5.o ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart5.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/360335769/plib_uart6.o: ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart6.c  .generated_files/flags/default_PIC32MK1024MCF064/9a1684873390b4291f9932d873783d2e7b4fdc13 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/360335769" 
	@${RM} ${OBJECTDIR}/_ext/360335769/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/360335769/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/360335769/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/360335769/plib_uart6.o ../src/config/default_PIC32MK1024MCF064/peripheral/uart/plib_uart6.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/590055919/xc32_monitor.o: ../src/config/default_PIC32MK1024MCF064/stdio/xc32_monitor.c  .generated_files/flags/default_PIC32MK1024MCF064/181937262f093f67200945fea309de84702452a6 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/590055919" 
	@${RM} ${OBJECTDIR}/_ext/590055919/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/590055919/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/590055919/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/590055919/xc32_monitor.o ../src/config/default_PIC32MK1024MCF064/stdio/xc32_monitor.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2045050379/interrupts.o: ../src/config/default_PIC32MK1024MCF064/interrupts.c  .generated_files/flags/default_PIC32MK1024MCF064/725d4f23f7b6049a0ca191793dfb48401aa18648 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2045050379" 
	@${RM} ${OBJECTDIR}/_ext/2045050379/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/2045050379/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2045050379/interrupts.o.d" -o ${OBJECTDIR}/_ext/2045050379/interrupts.o ../src/config/default_PIC32MK1024MCF064/interrupts.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2045050379/exceptions.o: ../src/config/default_PIC32MK1024MCF064/exceptions.c  .generated_files/flags/default_PIC32MK1024MCF064/f9374f1073e36642d8e6cbd240577f33ec6fd4e4 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2045050379" 
	@${RM} ${OBJECTDIR}/_ext/2045050379/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/2045050379/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2045050379/exceptions.o.d" -o ${OBJECTDIR}/_ext/2045050379/exceptions.o ../src/config/default_PIC32MK1024MCF064/exceptions.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2045050379/initialization.o: ../src/config/default_PIC32MK1024MCF064/initialization.c  .generated_files/flags/default_PIC32MK1024MCF064/8b8985ea52aeaa6267812fb1d6d564e77345b4 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2045050379" 
	@${RM} ${OBJECTDIR}/_ext/2045050379/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/2045050379/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2045050379/initialization.o.d" -o ${OBJECTDIR}/_ext/2045050379/initialization.o ../src/config/default_PIC32MK1024MCF064/initialization.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default_PIC32MK1024MCF064/93b904e18122bc2cfbbc6e5b1596701d18d17358 .generated_files/flags/default_PIC32MK1024MCF064/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/default_PIC32MK1024MCF064" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/CXB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/default_PIC32MK1024MCF064/p32MK1024MCF064.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/CXB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x36F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/CXB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/default_PIC32MK1024MCF064/p32MK1024MCF064.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/CXB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default_PIC32MK1024MCF064=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/CXB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
