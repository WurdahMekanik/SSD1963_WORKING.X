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
ifeq "$(wildcard nbproject/Makefile-local-XC32_PIC32MX795F512L.mk)" "nbproject/Makefile-local-XC32_PIC32MX795F512L.mk"
include nbproject/Makefile-local-XC32_PIC32MX795F512L.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=XC32_PIC32MX795F512L
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SSD1963_WORKING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SSD1963_WORKING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=configuration_bits.c exceptions.c interrupts.c main.c system.c user.c "Primitives LLD/TimeDelay.c" "Primitives LLD/SSD1963.c" "../Board Support Package/TouchScreen.c" "../Board Support Package/TouchScreenAR1020.c" "../Board Support Package/TouchScreenResistive.c" "../Board Support Package/Beep.c" "../Board Support Package/SST25VF016.c" "../Board Support Package/cpld.c" "../Board Support Package/drv_spi.c" "../Board Support Package/SST39LF400.c" "../Board Support Package/SST39VF040.c" "../Board Support Package/MCHP25LC256.c" ../Microchip/Graphics/Drivers/gfxepmp.c ../Microchip/Graphics/Drivers/mchpGfxDrv.c ../Microchip/Graphics/Drivers/mchpGfxLCC.c ../Microchip/Graphics/Drivers/TCON_Custom.c ../Microchip/Graphics/Drivers/TCON_HX8238.c ../Microchip/Graphics/Drivers/TCON_HX8257.c ../Microchip/Graphics/Drivers/TCON_SSD1289.c ../Microchip/Graphics/Drivers/drvTFT001.c ../Microchip/Graphics/Drivers/drvTFT002.c ../Microchip/Graphics/Drivers/HIT1270.c ../Microchip/Graphics/Drivers/HX8347.c ../Microchip/Graphics/Drivers/S1D13517.c ../Microchip/Graphics/Drivers/SH1101A_SSD1303.c ../Microchip/Graphics/Drivers/SSD1339.c ../Microchip/Graphics/Drivers/SSD1926.c ../Microchip/Graphics/Drivers/ST7529.c ../Microchip/Graphics/Drivers/UC1610.c ../Microchip/Graphics/GOL.c ../Microchip/Graphics/GOLFontDefault.c ../Microchip/Graphics/GOLSchemeDefault.c ../Microchip/Graphics/Palette.c ../Microchip/Graphics/Primitive.c ../Microchip/Graphics/Button.c ../Microchip/Graphics/CheckBox.c ../Microchip/Graphics/Meter.c ../Microchip/Graphics/DigitalMeter.c ../Microchip/Graphics/Chart.c ../Microchip/Graphics/RadioButton.c ../Microchip/Graphics/ListBox.c ../Microchip/Graphics/GroupBox.c ../Microchip/Graphics/EditBox.c ../Microchip/Graphics/Window.c ../Microchip/Graphics/Slider.c ../Microchip/Graphics/StaticText.c ../Microchip/Graphics/RoundDial.c ../Microchip/Graphics/Picture.c ../Microchip/Graphics/ProgressBar.c ../Microchip/Graphics/TextEntry.c image_dropp/GDD_Screens.c image_dropp/GDD_Resource.c image_dropp/GDD_X_Event_Handler.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/configuration_bits.o ${OBJECTDIR}/exceptions.o ${OBJECTDIR}/interrupts.o ${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/user.o "${OBJECTDIR}/Primitives LLD/TimeDelay.o" "${OBJECTDIR}/Primitives LLD/SSD1963.o" ${OBJECTDIR}/_ext/215660468/TouchScreen.o ${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o ${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o ${OBJECTDIR}/_ext/215660468/Beep.o ${OBJECTDIR}/_ext/215660468/SST25VF016.o ${OBJECTDIR}/_ext/215660468/cpld.o ${OBJECTDIR}/_ext/215660468/drv_spi.o ${OBJECTDIR}/_ext/215660468/SST39LF400.o ${OBJECTDIR}/_ext/215660468/SST39VF040.o ${OBJECTDIR}/_ext/215660468/MCHP25LC256.o ${OBJECTDIR}/_ext/1575306571/gfxepmp.o ${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o ${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o ${OBJECTDIR}/_ext/1575306571/TCON_Custom.o ${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o ${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o ${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o ${OBJECTDIR}/_ext/1575306571/drvTFT001.o ${OBJECTDIR}/_ext/1575306571/drvTFT002.o ${OBJECTDIR}/_ext/1575306571/HIT1270.o ${OBJECTDIR}/_ext/1575306571/HX8347.o ${OBJECTDIR}/_ext/1575306571/S1D13517.o ${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o ${OBJECTDIR}/_ext/1575306571/SSD1339.o ${OBJECTDIR}/_ext/1575306571/SSD1926.o ${OBJECTDIR}/_ext/1575306571/ST7529.o ${OBJECTDIR}/_ext/1575306571/UC1610.o ${OBJECTDIR}/_ext/1713430119/GOL.o ${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o ${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o ${OBJECTDIR}/_ext/1713430119/Palette.o ${OBJECTDIR}/_ext/1713430119/Primitive.o ${OBJECTDIR}/_ext/1713430119/Button.o ${OBJECTDIR}/_ext/1713430119/CheckBox.o ${OBJECTDIR}/_ext/1713430119/Meter.o ${OBJECTDIR}/_ext/1713430119/DigitalMeter.o ${OBJECTDIR}/_ext/1713430119/Chart.o ${OBJECTDIR}/_ext/1713430119/RadioButton.o ${OBJECTDIR}/_ext/1713430119/ListBox.o ${OBJECTDIR}/_ext/1713430119/GroupBox.o ${OBJECTDIR}/_ext/1713430119/EditBox.o ${OBJECTDIR}/_ext/1713430119/Window.o ${OBJECTDIR}/_ext/1713430119/Slider.o ${OBJECTDIR}/_ext/1713430119/StaticText.o ${OBJECTDIR}/_ext/1713430119/RoundDial.o ${OBJECTDIR}/_ext/1713430119/Picture.o ${OBJECTDIR}/_ext/1713430119/ProgressBar.o ${OBJECTDIR}/_ext/1713430119/TextEntry.o ${OBJECTDIR}/image_dropp/GDD_Screens.o ${OBJECTDIR}/image_dropp/GDD_Resource.o ${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o
POSSIBLE_DEPFILES=${OBJECTDIR}/configuration_bits.o.d ${OBJECTDIR}/exceptions.o.d ${OBJECTDIR}/interrupts.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/system.o.d ${OBJECTDIR}/user.o.d "${OBJECTDIR}/Primitives LLD/TimeDelay.o.d" "${OBJECTDIR}/Primitives LLD/SSD1963.o.d" ${OBJECTDIR}/_ext/215660468/TouchScreen.o.d ${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o.d ${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o.d ${OBJECTDIR}/_ext/215660468/Beep.o.d ${OBJECTDIR}/_ext/215660468/SST25VF016.o.d ${OBJECTDIR}/_ext/215660468/cpld.o.d ${OBJECTDIR}/_ext/215660468/drv_spi.o.d ${OBJECTDIR}/_ext/215660468/SST39LF400.o.d ${OBJECTDIR}/_ext/215660468/SST39VF040.o.d ${OBJECTDIR}/_ext/215660468/MCHP25LC256.o.d ${OBJECTDIR}/_ext/1575306571/gfxepmp.o.d ${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o.d ${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o.d ${OBJECTDIR}/_ext/1575306571/TCON_Custom.o.d ${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o.d ${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o.d ${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o.d ${OBJECTDIR}/_ext/1575306571/drvTFT001.o.d ${OBJECTDIR}/_ext/1575306571/drvTFT002.o.d ${OBJECTDIR}/_ext/1575306571/HIT1270.o.d ${OBJECTDIR}/_ext/1575306571/HX8347.o.d ${OBJECTDIR}/_ext/1575306571/S1D13517.o.d ${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o.d ${OBJECTDIR}/_ext/1575306571/SSD1339.o.d ${OBJECTDIR}/_ext/1575306571/SSD1926.o.d ${OBJECTDIR}/_ext/1575306571/ST7529.o.d ${OBJECTDIR}/_ext/1575306571/UC1610.o.d ${OBJECTDIR}/_ext/1713430119/GOL.o.d ${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o.d ${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o.d ${OBJECTDIR}/_ext/1713430119/Palette.o.d ${OBJECTDIR}/_ext/1713430119/Primitive.o.d ${OBJECTDIR}/_ext/1713430119/Button.o.d ${OBJECTDIR}/_ext/1713430119/CheckBox.o.d ${OBJECTDIR}/_ext/1713430119/Meter.o.d ${OBJECTDIR}/_ext/1713430119/DigitalMeter.o.d ${OBJECTDIR}/_ext/1713430119/Chart.o.d ${OBJECTDIR}/_ext/1713430119/RadioButton.o.d ${OBJECTDIR}/_ext/1713430119/ListBox.o.d ${OBJECTDIR}/_ext/1713430119/GroupBox.o.d ${OBJECTDIR}/_ext/1713430119/EditBox.o.d ${OBJECTDIR}/_ext/1713430119/Window.o.d ${OBJECTDIR}/_ext/1713430119/Slider.o.d ${OBJECTDIR}/_ext/1713430119/StaticText.o.d ${OBJECTDIR}/_ext/1713430119/RoundDial.o.d ${OBJECTDIR}/_ext/1713430119/Picture.o.d ${OBJECTDIR}/_ext/1713430119/ProgressBar.o.d ${OBJECTDIR}/_ext/1713430119/TextEntry.o.d ${OBJECTDIR}/image_dropp/GDD_Screens.o.d ${OBJECTDIR}/image_dropp/GDD_Resource.o.d ${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/configuration_bits.o ${OBJECTDIR}/exceptions.o ${OBJECTDIR}/interrupts.o ${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/user.o ${OBJECTDIR}/Primitives\ LLD/TimeDelay.o ${OBJECTDIR}/Primitives\ LLD/SSD1963.o ${OBJECTDIR}/_ext/215660468/TouchScreen.o ${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o ${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o ${OBJECTDIR}/_ext/215660468/Beep.o ${OBJECTDIR}/_ext/215660468/SST25VF016.o ${OBJECTDIR}/_ext/215660468/cpld.o ${OBJECTDIR}/_ext/215660468/drv_spi.o ${OBJECTDIR}/_ext/215660468/SST39LF400.o ${OBJECTDIR}/_ext/215660468/SST39VF040.o ${OBJECTDIR}/_ext/215660468/MCHP25LC256.o ${OBJECTDIR}/_ext/1575306571/gfxepmp.o ${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o ${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o ${OBJECTDIR}/_ext/1575306571/TCON_Custom.o ${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o ${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o ${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o ${OBJECTDIR}/_ext/1575306571/drvTFT001.o ${OBJECTDIR}/_ext/1575306571/drvTFT002.o ${OBJECTDIR}/_ext/1575306571/HIT1270.o ${OBJECTDIR}/_ext/1575306571/HX8347.o ${OBJECTDIR}/_ext/1575306571/S1D13517.o ${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o ${OBJECTDIR}/_ext/1575306571/SSD1339.o ${OBJECTDIR}/_ext/1575306571/SSD1926.o ${OBJECTDIR}/_ext/1575306571/ST7529.o ${OBJECTDIR}/_ext/1575306571/UC1610.o ${OBJECTDIR}/_ext/1713430119/GOL.o ${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o ${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o ${OBJECTDIR}/_ext/1713430119/Palette.o ${OBJECTDIR}/_ext/1713430119/Primitive.o ${OBJECTDIR}/_ext/1713430119/Button.o ${OBJECTDIR}/_ext/1713430119/CheckBox.o ${OBJECTDIR}/_ext/1713430119/Meter.o ${OBJECTDIR}/_ext/1713430119/DigitalMeter.o ${OBJECTDIR}/_ext/1713430119/Chart.o ${OBJECTDIR}/_ext/1713430119/RadioButton.o ${OBJECTDIR}/_ext/1713430119/ListBox.o ${OBJECTDIR}/_ext/1713430119/GroupBox.o ${OBJECTDIR}/_ext/1713430119/EditBox.o ${OBJECTDIR}/_ext/1713430119/Window.o ${OBJECTDIR}/_ext/1713430119/Slider.o ${OBJECTDIR}/_ext/1713430119/StaticText.o ${OBJECTDIR}/_ext/1713430119/RoundDial.o ${OBJECTDIR}/_ext/1713430119/Picture.o ${OBJECTDIR}/_ext/1713430119/ProgressBar.o ${OBJECTDIR}/_ext/1713430119/TextEntry.o ${OBJECTDIR}/image_dropp/GDD_Screens.o ${OBJECTDIR}/image_dropp/GDD_Resource.o ${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o

# Source Files
SOURCEFILES=configuration_bits.c exceptions.c interrupts.c main.c system.c user.c Primitives LLD/TimeDelay.c Primitives LLD/SSD1963.c ../Board Support Package/TouchScreen.c ../Board Support Package/TouchScreenAR1020.c ../Board Support Package/TouchScreenResistive.c ../Board Support Package/Beep.c ../Board Support Package/SST25VF016.c ../Board Support Package/cpld.c ../Board Support Package/drv_spi.c ../Board Support Package/SST39LF400.c ../Board Support Package/SST39VF040.c ../Board Support Package/MCHP25LC256.c ../Microchip/Graphics/Drivers/gfxepmp.c ../Microchip/Graphics/Drivers/mchpGfxDrv.c ../Microchip/Graphics/Drivers/mchpGfxLCC.c ../Microchip/Graphics/Drivers/TCON_Custom.c ../Microchip/Graphics/Drivers/TCON_HX8238.c ../Microchip/Graphics/Drivers/TCON_HX8257.c ../Microchip/Graphics/Drivers/TCON_SSD1289.c ../Microchip/Graphics/Drivers/drvTFT001.c ../Microchip/Graphics/Drivers/drvTFT002.c ../Microchip/Graphics/Drivers/HIT1270.c ../Microchip/Graphics/Drivers/HX8347.c ../Microchip/Graphics/Drivers/S1D13517.c ../Microchip/Graphics/Drivers/SH1101A_SSD1303.c ../Microchip/Graphics/Drivers/SSD1339.c ../Microchip/Graphics/Drivers/SSD1926.c ../Microchip/Graphics/Drivers/ST7529.c ../Microchip/Graphics/Drivers/UC1610.c ../Microchip/Graphics/GOL.c ../Microchip/Graphics/GOLFontDefault.c ../Microchip/Graphics/GOLSchemeDefault.c ../Microchip/Graphics/Palette.c ../Microchip/Graphics/Primitive.c ../Microchip/Graphics/Button.c ../Microchip/Graphics/CheckBox.c ../Microchip/Graphics/Meter.c ../Microchip/Graphics/DigitalMeter.c ../Microchip/Graphics/Chart.c ../Microchip/Graphics/RadioButton.c ../Microchip/Graphics/ListBox.c ../Microchip/Graphics/GroupBox.c ../Microchip/Graphics/EditBox.c ../Microchip/Graphics/Window.c ../Microchip/Graphics/Slider.c ../Microchip/Graphics/StaticText.c ../Microchip/Graphics/RoundDial.c ../Microchip/Graphics/Picture.c ../Microchip/Graphics/ProgressBar.c ../Microchip/Graphics/TextEntry.c image_dropp/GDD_Screens.c image_dropp/GDD_Resource.c image_dropp/GDD_X_Event_Handler.c


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-XC32_PIC32MX795F512L.mk dist/${CND_CONF}/${IMAGE_TYPE}/SSD1963_WORKING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
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
${OBJECTDIR}/configuration_bits.o: configuration_bits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/configuration_bits.o.d 
	@${RM} ${OBJECTDIR}/configuration_bits.o 
	@${FIXDEPS} "${OBJECTDIR}/configuration_bits.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/configuration_bits.o.d" -o ${OBJECTDIR}/configuration_bits.o configuration_bits.c   
	
${OBJECTDIR}/exceptions.o: exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/exceptions.o.d 
	@${RM} ${OBJECTDIR}/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/exceptions.o.d" -o ${OBJECTDIR}/exceptions.o exceptions.c   
	
${OBJECTDIR}/interrupts.o: interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/interrupts.o.d" -o ${OBJECTDIR}/interrupts.o interrupts.c   
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c   
	
${OBJECTDIR}/system.o: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	@${FIXDEPS} "${OBJECTDIR}/system.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/system.o.d" -o ${OBJECTDIR}/system.o system.c   
	
${OBJECTDIR}/user.o: user.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	@${FIXDEPS} "${OBJECTDIR}/user.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/user.o.d" -o ${OBJECTDIR}/user.o user.c   
	
${OBJECTDIR}/Primitives\ LLD/TimeDelay.o: Primitives\ LLD/TimeDelay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Primitives\ LLD 
	@${RM} ${OBJECTDIR}/Primitives\ LLD/TimeDelay.o.d 
	@${RM} "${OBJECTDIR}/Primitives LLD/TimeDelay.o" 
	@${FIXDEPS} "${OBJECTDIR}/Primitives LLD/TimeDelay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/Primitives LLD/TimeDelay.o.d" -o "${OBJECTDIR}/Primitives LLD/TimeDelay.o" "Primitives LLD/TimeDelay.c"   
	
${OBJECTDIR}/Primitives\ LLD/SSD1963.o: Primitives\ LLD/SSD1963.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Primitives\ LLD 
	@${RM} ${OBJECTDIR}/Primitives\ LLD/SSD1963.o.d 
	@${RM} "${OBJECTDIR}/Primitives LLD/SSD1963.o" 
	@${FIXDEPS} "${OBJECTDIR}/Primitives LLD/SSD1963.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/Primitives LLD/SSD1963.o.d" -o "${OBJECTDIR}/Primitives LLD/SSD1963.o" "Primitives LLD/SSD1963.c"   
	
${OBJECTDIR}/_ext/215660468/TouchScreen.o: ../Board\ Support\ Package/TouchScreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreen.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreen.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/TouchScreen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/TouchScreen.o.d" -o ${OBJECTDIR}/_ext/215660468/TouchScreen.o "../Board Support Package/TouchScreen.c"   
	
${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o: ../Board\ Support\ Package/TouchScreenAR1020.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o.d" -o ${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o "../Board Support Package/TouchScreenAR1020.c"   
	
${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o: ../Board\ Support\ Package/TouchScreenResistive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o.d" -o ${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o "../Board Support Package/TouchScreenResistive.c"   
	
${OBJECTDIR}/_ext/215660468/Beep.o: ../Board\ Support\ Package/Beep.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/Beep.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/Beep.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/Beep.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/Beep.o.d" -o ${OBJECTDIR}/_ext/215660468/Beep.o "../Board Support Package/Beep.c"   
	
${OBJECTDIR}/_ext/215660468/SST25VF016.o: ../Board\ Support\ Package/SST25VF016.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST25VF016.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST25VF016.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/SST25VF016.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/SST25VF016.o.d" -o ${OBJECTDIR}/_ext/215660468/SST25VF016.o "../Board Support Package/SST25VF016.c"   
	
${OBJECTDIR}/_ext/215660468/cpld.o: ../Board\ Support\ Package/cpld.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/cpld.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/cpld.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/cpld.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/cpld.o.d" -o ${OBJECTDIR}/_ext/215660468/cpld.o "../Board Support Package/cpld.c"   
	
${OBJECTDIR}/_ext/215660468/drv_spi.o: ../Board\ Support\ Package/drv_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/drv_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/drv_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/drv_spi.o.d" -o ${OBJECTDIR}/_ext/215660468/drv_spi.o "../Board Support Package/drv_spi.c"   
	
${OBJECTDIR}/_ext/215660468/SST39LF400.o: ../Board\ Support\ Package/SST39LF400.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST39LF400.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST39LF400.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/SST39LF400.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/SST39LF400.o.d" -o ${OBJECTDIR}/_ext/215660468/SST39LF400.o "../Board Support Package/SST39LF400.c"   
	
${OBJECTDIR}/_ext/215660468/SST39VF040.o: ../Board\ Support\ Package/SST39VF040.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST39VF040.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST39VF040.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/SST39VF040.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/SST39VF040.o.d" -o ${OBJECTDIR}/_ext/215660468/SST39VF040.o "../Board Support Package/SST39VF040.c"   
	
${OBJECTDIR}/_ext/215660468/MCHP25LC256.o: ../Board\ Support\ Package/MCHP25LC256.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/MCHP25LC256.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/MCHP25LC256.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/MCHP25LC256.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/MCHP25LC256.o.d" -o ${OBJECTDIR}/_ext/215660468/MCHP25LC256.o "../Board Support Package/MCHP25LC256.c"   
	
${OBJECTDIR}/_ext/1575306571/gfxepmp.o: ../Microchip/Graphics/Drivers/gfxepmp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxepmp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxepmp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/gfxepmp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/gfxepmp.o.d" -o ${OBJECTDIR}/_ext/1575306571/gfxepmp.o ../Microchip/Graphics/Drivers/gfxepmp.c   
	
${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o: ../Microchip/Graphics/Drivers/mchpGfxDrv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o.d" -o ${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o ../Microchip/Graphics/Drivers/mchpGfxDrv.c   
	
${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o: ../Microchip/Graphics/Drivers/mchpGfxLCC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o.d" -o ${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o ../Microchip/Graphics/Drivers/mchpGfxLCC.c   
	
${OBJECTDIR}/_ext/1575306571/TCON_Custom.o: ../Microchip/Graphics/Drivers/TCON_Custom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_Custom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_Custom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/TCON_Custom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/TCON_Custom.o.d" -o ${OBJECTDIR}/_ext/1575306571/TCON_Custom.o ../Microchip/Graphics/Drivers/TCON_Custom.c   
	
${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o: ../Microchip/Graphics/Drivers/TCON_HX8238.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o.d" -o ${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o ../Microchip/Graphics/Drivers/TCON_HX8238.c   
	
${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o: ../Microchip/Graphics/Drivers/TCON_HX8257.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o.d" -o ${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o ../Microchip/Graphics/Drivers/TCON_HX8257.c   
	
${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o: ../Microchip/Graphics/Drivers/TCON_SSD1289.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o.d" -o ${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o ../Microchip/Graphics/Drivers/TCON_SSD1289.c   
	
${OBJECTDIR}/_ext/1575306571/drvTFT001.o: ../Microchip/Graphics/Drivers/drvTFT001.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/drvTFT001.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/drvTFT001.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/drvTFT001.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/drvTFT001.o.d" -o ${OBJECTDIR}/_ext/1575306571/drvTFT001.o ../Microchip/Graphics/Drivers/drvTFT001.c   
	
${OBJECTDIR}/_ext/1575306571/drvTFT002.o: ../Microchip/Graphics/Drivers/drvTFT002.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/drvTFT002.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/drvTFT002.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/drvTFT002.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/drvTFT002.o.d" -o ${OBJECTDIR}/_ext/1575306571/drvTFT002.o ../Microchip/Graphics/Drivers/drvTFT002.c   
	
${OBJECTDIR}/_ext/1575306571/HIT1270.o: ../Microchip/Graphics/Drivers/HIT1270.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/HIT1270.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/HIT1270.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/HIT1270.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/HIT1270.o.d" -o ${OBJECTDIR}/_ext/1575306571/HIT1270.o ../Microchip/Graphics/Drivers/HIT1270.c   
	
${OBJECTDIR}/_ext/1575306571/HX8347.o: ../Microchip/Graphics/Drivers/HX8347.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/HX8347.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/HX8347.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/HX8347.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/HX8347.o.d" -o ${OBJECTDIR}/_ext/1575306571/HX8347.o ../Microchip/Graphics/Drivers/HX8347.c   
	
${OBJECTDIR}/_ext/1575306571/S1D13517.o: ../Microchip/Graphics/Drivers/S1D13517.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/S1D13517.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/S1D13517.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/S1D13517.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/S1D13517.o.d" -o ${OBJECTDIR}/_ext/1575306571/S1D13517.o ../Microchip/Graphics/Drivers/S1D13517.c   
	
${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o: ../Microchip/Graphics/Drivers/SH1101A_SSD1303.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o.d" -o ${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o ../Microchip/Graphics/Drivers/SH1101A_SSD1303.c   
	
${OBJECTDIR}/_ext/1575306571/SSD1339.o: ../Microchip/Graphics/Drivers/SSD1339.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SSD1339.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SSD1339.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/SSD1339.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/SSD1339.o.d" -o ${OBJECTDIR}/_ext/1575306571/SSD1339.o ../Microchip/Graphics/Drivers/SSD1339.c   
	
${OBJECTDIR}/_ext/1575306571/SSD1926.o: ../Microchip/Graphics/Drivers/SSD1926.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SSD1926.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SSD1926.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/SSD1926.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/SSD1926.o.d" -o ${OBJECTDIR}/_ext/1575306571/SSD1926.o ../Microchip/Graphics/Drivers/SSD1926.c   
	
${OBJECTDIR}/_ext/1575306571/ST7529.o: ../Microchip/Graphics/Drivers/ST7529.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/ST7529.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/ST7529.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/ST7529.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/ST7529.o.d" -o ${OBJECTDIR}/_ext/1575306571/ST7529.o ../Microchip/Graphics/Drivers/ST7529.c   
	
${OBJECTDIR}/_ext/1575306571/UC1610.o: ../Microchip/Graphics/Drivers/UC1610.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/UC1610.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/UC1610.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/UC1610.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/UC1610.o.d" -o ${OBJECTDIR}/_ext/1575306571/UC1610.o ../Microchip/Graphics/Drivers/UC1610.c   
	
${OBJECTDIR}/_ext/1713430119/GOL.o: ../Microchip/Graphics/GOL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOL.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/GOL.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/GOL.o.d" -o ${OBJECTDIR}/_ext/1713430119/GOL.o ../Microchip/Graphics/GOL.c   
	
${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o: ../Microchip/Graphics/GOLFontDefault.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o.d" -o ${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o ../Microchip/Graphics/GOLFontDefault.c   
	
${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o: ../Microchip/Graphics/GOLSchemeDefault.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o.d" -o ${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o ../Microchip/Graphics/GOLSchemeDefault.c   
	
${OBJECTDIR}/_ext/1713430119/Palette.o: ../Microchip/Graphics/Palette.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Palette.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Palette.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Palette.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Palette.o.d" -o ${OBJECTDIR}/_ext/1713430119/Palette.o ../Microchip/Graphics/Palette.c   
	
${OBJECTDIR}/_ext/1713430119/Primitive.o: ../Microchip/Graphics/Primitive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Primitive.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Primitive.o.d" -o ${OBJECTDIR}/_ext/1713430119/Primitive.o ../Microchip/Graphics/Primitive.c   
	
${OBJECTDIR}/_ext/1713430119/Button.o: ../Microchip/Graphics/Button.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Button.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Button.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Button.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Button.o.d" -o ${OBJECTDIR}/_ext/1713430119/Button.o ../Microchip/Graphics/Button.c   
	
${OBJECTDIR}/_ext/1713430119/CheckBox.o: ../Microchip/Graphics/CheckBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/CheckBox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/CheckBox.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/CheckBox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/CheckBox.o.d" -o ${OBJECTDIR}/_ext/1713430119/CheckBox.o ../Microchip/Graphics/CheckBox.c   
	
${OBJECTDIR}/_ext/1713430119/Meter.o: ../Microchip/Graphics/Meter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Meter.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Meter.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Meter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Meter.o.d" -o ${OBJECTDIR}/_ext/1713430119/Meter.o ../Microchip/Graphics/Meter.c   
	
${OBJECTDIR}/_ext/1713430119/DigitalMeter.o: ../Microchip/Graphics/DigitalMeter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/DigitalMeter.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/DigitalMeter.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/DigitalMeter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/DigitalMeter.o.d" -o ${OBJECTDIR}/_ext/1713430119/DigitalMeter.o ../Microchip/Graphics/DigitalMeter.c   
	
${OBJECTDIR}/_ext/1713430119/Chart.o: ../Microchip/Graphics/Chart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Chart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Chart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Chart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Chart.o.d" -o ${OBJECTDIR}/_ext/1713430119/Chart.o ../Microchip/Graphics/Chart.c   
	
${OBJECTDIR}/_ext/1713430119/RadioButton.o: ../Microchip/Graphics/RadioButton.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/RadioButton.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/RadioButton.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/RadioButton.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/RadioButton.o.d" -o ${OBJECTDIR}/_ext/1713430119/RadioButton.o ../Microchip/Graphics/RadioButton.c   
	
${OBJECTDIR}/_ext/1713430119/ListBox.o: ../Microchip/Graphics/ListBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/ListBox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/ListBox.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/ListBox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/ListBox.o.d" -o ${OBJECTDIR}/_ext/1713430119/ListBox.o ../Microchip/Graphics/ListBox.c   
	
${OBJECTDIR}/_ext/1713430119/GroupBox.o: ../Microchip/Graphics/GroupBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GroupBox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GroupBox.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/GroupBox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/GroupBox.o.d" -o ${OBJECTDIR}/_ext/1713430119/GroupBox.o ../Microchip/Graphics/GroupBox.c   
	
${OBJECTDIR}/_ext/1713430119/EditBox.o: ../Microchip/Graphics/EditBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/EditBox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/EditBox.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/EditBox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/EditBox.o.d" -o ${OBJECTDIR}/_ext/1713430119/EditBox.o ../Microchip/Graphics/EditBox.c   
	
${OBJECTDIR}/_ext/1713430119/Window.o: ../Microchip/Graphics/Window.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Window.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Window.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Window.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Window.o.d" -o ${OBJECTDIR}/_ext/1713430119/Window.o ../Microchip/Graphics/Window.c   
	
${OBJECTDIR}/_ext/1713430119/Slider.o: ../Microchip/Graphics/Slider.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Slider.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Slider.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Slider.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Slider.o.d" -o ${OBJECTDIR}/_ext/1713430119/Slider.o ../Microchip/Graphics/Slider.c   
	
${OBJECTDIR}/_ext/1713430119/StaticText.o: ../Microchip/Graphics/StaticText.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/StaticText.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/StaticText.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/StaticText.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/StaticText.o.d" -o ${OBJECTDIR}/_ext/1713430119/StaticText.o ../Microchip/Graphics/StaticText.c   
	
${OBJECTDIR}/_ext/1713430119/RoundDial.o: ../Microchip/Graphics/RoundDial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/RoundDial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/RoundDial.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/RoundDial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/RoundDial.o.d" -o ${OBJECTDIR}/_ext/1713430119/RoundDial.o ../Microchip/Graphics/RoundDial.c   
	
${OBJECTDIR}/_ext/1713430119/Picture.o: ../Microchip/Graphics/Picture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Picture.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Picture.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Picture.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Picture.o.d" -o ${OBJECTDIR}/_ext/1713430119/Picture.o ../Microchip/Graphics/Picture.c   
	
${OBJECTDIR}/_ext/1713430119/ProgressBar.o: ../Microchip/Graphics/ProgressBar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/ProgressBar.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/ProgressBar.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/ProgressBar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/ProgressBar.o.d" -o ${OBJECTDIR}/_ext/1713430119/ProgressBar.o ../Microchip/Graphics/ProgressBar.c   
	
${OBJECTDIR}/_ext/1713430119/TextEntry.o: ../Microchip/Graphics/TextEntry.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/TextEntry.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/TextEntry.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/TextEntry.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/TextEntry.o.d" -o ${OBJECTDIR}/_ext/1713430119/TextEntry.o ../Microchip/Graphics/TextEntry.c   
	
${OBJECTDIR}/image_dropp/GDD_Screens.o: image_dropp/GDD_Screens.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/image_dropp 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_Screens.o.d 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_Screens.o 
	@${FIXDEPS} "${OBJECTDIR}/image_dropp/GDD_Screens.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/image_dropp/GDD_Screens.o.d" -o ${OBJECTDIR}/image_dropp/GDD_Screens.o image_dropp/GDD_Screens.c   
	
${OBJECTDIR}/image_dropp/GDD_Resource.o: image_dropp/GDD_Resource.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/image_dropp 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_Resource.o.d 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_Resource.o 
	@${FIXDEPS} "${OBJECTDIR}/image_dropp/GDD_Resource.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/image_dropp/GDD_Resource.o.d" -o ${OBJECTDIR}/image_dropp/GDD_Resource.o image_dropp/GDD_Resource.c   
	
${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o: image_dropp/GDD_X_Event_Handler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/image_dropp 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o.d 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o 
	@${FIXDEPS} "${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o.d" -o ${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o image_dropp/GDD_X_Event_Handler.c   
	
else
${OBJECTDIR}/configuration_bits.o: configuration_bits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/configuration_bits.o.d 
	@${RM} ${OBJECTDIR}/configuration_bits.o 
	@${FIXDEPS} "${OBJECTDIR}/configuration_bits.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/configuration_bits.o.d" -o ${OBJECTDIR}/configuration_bits.o configuration_bits.c   
	
${OBJECTDIR}/exceptions.o: exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/exceptions.o.d 
	@${RM} ${OBJECTDIR}/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/exceptions.o.d" -o ${OBJECTDIR}/exceptions.o exceptions.c   
	
${OBJECTDIR}/interrupts.o: interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/interrupts.o.d" -o ${OBJECTDIR}/interrupts.o interrupts.c   
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c   
	
${OBJECTDIR}/system.o: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	@${FIXDEPS} "${OBJECTDIR}/system.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/system.o.d" -o ${OBJECTDIR}/system.o system.c   
	
${OBJECTDIR}/user.o: user.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	@${FIXDEPS} "${OBJECTDIR}/user.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/user.o.d" -o ${OBJECTDIR}/user.o user.c   
	
${OBJECTDIR}/Primitives\ LLD/TimeDelay.o: Primitives\ LLD/TimeDelay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Primitives\ LLD 
	@${RM} ${OBJECTDIR}/Primitives\ LLD/TimeDelay.o.d 
	@${RM} "${OBJECTDIR}/Primitives LLD/TimeDelay.o" 
	@${FIXDEPS} "${OBJECTDIR}/Primitives LLD/TimeDelay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/Primitives LLD/TimeDelay.o.d" -o "${OBJECTDIR}/Primitives LLD/TimeDelay.o" "Primitives LLD/TimeDelay.c"   
	
${OBJECTDIR}/Primitives\ LLD/SSD1963.o: Primitives\ LLD/SSD1963.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/Primitives\ LLD 
	@${RM} ${OBJECTDIR}/Primitives\ LLD/SSD1963.o.d 
	@${RM} "${OBJECTDIR}/Primitives LLD/SSD1963.o" 
	@${FIXDEPS} "${OBJECTDIR}/Primitives LLD/SSD1963.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/Primitives LLD/SSD1963.o.d" -o "${OBJECTDIR}/Primitives LLD/SSD1963.o" "Primitives LLD/SSD1963.c"   
	
${OBJECTDIR}/_ext/215660468/TouchScreen.o: ../Board\ Support\ Package/TouchScreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreen.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreen.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/TouchScreen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/TouchScreen.o.d" -o ${OBJECTDIR}/_ext/215660468/TouchScreen.o "../Board Support Package/TouchScreen.c"   
	
${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o: ../Board\ Support\ Package/TouchScreenAR1020.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o.d" -o ${OBJECTDIR}/_ext/215660468/TouchScreenAR1020.o "../Board Support Package/TouchScreenAR1020.c"   
	
${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o: ../Board\ Support\ Package/TouchScreenResistive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o.d" -o ${OBJECTDIR}/_ext/215660468/TouchScreenResistive.o "../Board Support Package/TouchScreenResistive.c"   
	
${OBJECTDIR}/_ext/215660468/Beep.o: ../Board\ Support\ Package/Beep.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/Beep.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/Beep.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/Beep.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/Beep.o.d" -o ${OBJECTDIR}/_ext/215660468/Beep.o "../Board Support Package/Beep.c"   
	
${OBJECTDIR}/_ext/215660468/SST25VF016.o: ../Board\ Support\ Package/SST25VF016.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST25VF016.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST25VF016.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/SST25VF016.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/SST25VF016.o.d" -o ${OBJECTDIR}/_ext/215660468/SST25VF016.o "../Board Support Package/SST25VF016.c"   
	
${OBJECTDIR}/_ext/215660468/cpld.o: ../Board\ Support\ Package/cpld.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/cpld.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/cpld.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/cpld.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/cpld.o.d" -o ${OBJECTDIR}/_ext/215660468/cpld.o "../Board Support Package/cpld.c"   
	
${OBJECTDIR}/_ext/215660468/drv_spi.o: ../Board\ Support\ Package/drv_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/drv_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/drv_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/drv_spi.o.d" -o ${OBJECTDIR}/_ext/215660468/drv_spi.o "../Board Support Package/drv_spi.c"   
	
${OBJECTDIR}/_ext/215660468/SST39LF400.o: ../Board\ Support\ Package/SST39LF400.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST39LF400.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST39LF400.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/SST39LF400.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/SST39LF400.o.d" -o ${OBJECTDIR}/_ext/215660468/SST39LF400.o "../Board Support Package/SST39LF400.c"   
	
${OBJECTDIR}/_ext/215660468/SST39VF040.o: ../Board\ Support\ Package/SST39VF040.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST39VF040.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/SST39VF040.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/SST39VF040.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/SST39VF040.o.d" -o ${OBJECTDIR}/_ext/215660468/SST39VF040.o "../Board Support Package/SST39VF040.c"   
	
${OBJECTDIR}/_ext/215660468/MCHP25LC256.o: ../Board\ Support\ Package/MCHP25LC256.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/215660468 
	@${RM} ${OBJECTDIR}/_ext/215660468/MCHP25LC256.o.d 
	@${RM} ${OBJECTDIR}/_ext/215660468/MCHP25LC256.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/215660468/MCHP25LC256.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/215660468/MCHP25LC256.o.d" -o ${OBJECTDIR}/_ext/215660468/MCHP25LC256.o "../Board Support Package/MCHP25LC256.c"   
	
${OBJECTDIR}/_ext/1575306571/gfxepmp.o: ../Microchip/Graphics/Drivers/gfxepmp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxepmp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/gfxepmp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/gfxepmp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/gfxepmp.o.d" -o ${OBJECTDIR}/_ext/1575306571/gfxepmp.o ../Microchip/Graphics/Drivers/gfxepmp.c   
	
${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o: ../Microchip/Graphics/Drivers/mchpGfxDrv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o.d" -o ${OBJECTDIR}/_ext/1575306571/mchpGfxDrv.o ../Microchip/Graphics/Drivers/mchpGfxDrv.c   
	
${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o: ../Microchip/Graphics/Drivers/mchpGfxLCC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o.d" -o ${OBJECTDIR}/_ext/1575306571/mchpGfxLCC.o ../Microchip/Graphics/Drivers/mchpGfxLCC.c   
	
${OBJECTDIR}/_ext/1575306571/TCON_Custom.o: ../Microchip/Graphics/Drivers/TCON_Custom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_Custom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_Custom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/TCON_Custom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/TCON_Custom.o.d" -o ${OBJECTDIR}/_ext/1575306571/TCON_Custom.o ../Microchip/Graphics/Drivers/TCON_Custom.c   
	
${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o: ../Microchip/Graphics/Drivers/TCON_HX8238.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o.d" -o ${OBJECTDIR}/_ext/1575306571/TCON_HX8238.o ../Microchip/Graphics/Drivers/TCON_HX8238.c   
	
${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o: ../Microchip/Graphics/Drivers/TCON_HX8257.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o.d" -o ${OBJECTDIR}/_ext/1575306571/TCON_HX8257.o ../Microchip/Graphics/Drivers/TCON_HX8257.c   
	
${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o: ../Microchip/Graphics/Drivers/TCON_SSD1289.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o.d" -o ${OBJECTDIR}/_ext/1575306571/TCON_SSD1289.o ../Microchip/Graphics/Drivers/TCON_SSD1289.c   
	
${OBJECTDIR}/_ext/1575306571/drvTFT001.o: ../Microchip/Graphics/Drivers/drvTFT001.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/drvTFT001.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/drvTFT001.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/drvTFT001.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/drvTFT001.o.d" -o ${OBJECTDIR}/_ext/1575306571/drvTFT001.o ../Microchip/Graphics/Drivers/drvTFT001.c   
	
${OBJECTDIR}/_ext/1575306571/drvTFT002.o: ../Microchip/Graphics/Drivers/drvTFT002.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/drvTFT002.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/drvTFT002.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/drvTFT002.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/drvTFT002.o.d" -o ${OBJECTDIR}/_ext/1575306571/drvTFT002.o ../Microchip/Graphics/Drivers/drvTFT002.c   
	
${OBJECTDIR}/_ext/1575306571/HIT1270.o: ../Microchip/Graphics/Drivers/HIT1270.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/HIT1270.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/HIT1270.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/HIT1270.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/HIT1270.o.d" -o ${OBJECTDIR}/_ext/1575306571/HIT1270.o ../Microchip/Graphics/Drivers/HIT1270.c   
	
${OBJECTDIR}/_ext/1575306571/HX8347.o: ../Microchip/Graphics/Drivers/HX8347.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/HX8347.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/HX8347.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/HX8347.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/HX8347.o.d" -o ${OBJECTDIR}/_ext/1575306571/HX8347.o ../Microchip/Graphics/Drivers/HX8347.c   
	
${OBJECTDIR}/_ext/1575306571/S1D13517.o: ../Microchip/Graphics/Drivers/S1D13517.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/S1D13517.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/S1D13517.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/S1D13517.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/S1D13517.o.d" -o ${OBJECTDIR}/_ext/1575306571/S1D13517.o ../Microchip/Graphics/Drivers/S1D13517.c   
	
${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o: ../Microchip/Graphics/Drivers/SH1101A_SSD1303.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o.d" -o ${OBJECTDIR}/_ext/1575306571/SH1101A_SSD1303.o ../Microchip/Graphics/Drivers/SH1101A_SSD1303.c   
	
${OBJECTDIR}/_ext/1575306571/SSD1339.o: ../Microchip/Graphics/Drivers/SSD1339.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SSD1339.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SSD1339.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/SSD1339.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/SSD1339.o.d" -o ${OBJECTDIR}/_ext/1575306571/SSD1339.o ../Microchip/Graphics/Drivers/SSD1339.c   
	
${OBJECTDIR}/_ext/1575306571/SSD1926.o: ../Microchip/Graphics/Drivers/SSD1926.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SSD1926.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/SSD1926.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/SSD1926.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/SSD1926.o.d" -o ${OBJECTDIR}/_ext/1575306571/SSD1926.o ../Microchip/Graphics/Drivers/SSD1926.c   
	
${OBJECTDIR}/_ext/1575306571/ST7529.o: ../Microchip/Graphics/Drivers/ST7529.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/ST7529.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/ST7529.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/ST7529.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/ST7529.o.d" -o ${OBJECTDIR}/_ext/1575306571/ST7529.o ../Microchip/Graphics/Drivers/ST7529.c   
	
${OBJECTDIR}/_ext/1575306571/UC1610.o: ../Microchip/Graphics/Drivers/UC1610.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1575306571 
	@${RM} ${OBJECTDIR}/_ext/1575306571/UC1610.o.d 
	@${RM} ${OBJECTDIR}/_ext/1575306571/UC1610.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1575306571/UC1610.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1575306571/UC1610.o.d" -o ${OBJECTDIR}/_ext/1575306571/UC1610.o ../Microchip/Graphics/Drivers/UC1610.c   
	
${OBJECTDIR}/_ext/1713430119/GOL.o: ../Microchip/Graphics/GOL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOL.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/GOL.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/GOL.o.d" -o ${OBJECTDIR}/_ext/1713430119/GOL.o ../Microchip/Graphics/GOL.c   
	
${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o: ../Microchip/Graphics/GOLFontDefault.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o.d" -o ${OBJECTDIR}/_ext/1713430119/GOLFontDefault.o ../Microchip/Graphics/GOLFontDefault.c   
	
${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o: ../Microchip/Graphics/GOLSchemeDefault.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o.d" -o ${OBJECTDIR}/_ext/1713430119/GOLSchemeDefault.o ../Microchip/Graphics/GOLSchemeDefault.c   
	
${OBJECTDIR}/_ext/1713430119/Palette.o: ../Microchip/Graphics/Palette.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Palette.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Palette.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Palette.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Palette.o.d" -o ${OBJECTDIR}/_ext/1713430119/Palette.o ../Microchip/Graphics/Palette.c   
	
${OBJECTDIR}/_ext/1713430119/Primitive.o: ../Microchip/Graphics/Primitive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Primitive.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Primitive.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Primitive.o.d" -o ${OBJECTDIR}/_ext/1713430119/Primitive.o ../Microchip/Graphics/Primitive.c   
	
${OBJECTDIR}/_ext/1713430119/Button.o: ../Microchip/Graphics/Button.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Button.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Button.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Button.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Button.o.d" -o ${OBJECTDIR}/_ext/1713430119/Button.o ../Microchip/Graphics/Button.c   
	
${OBJECTDIR}/_ext/1713430119/CheckBox.o: ../Microchip/Graphics/CheckBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/CheckBox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/CheckBox.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/CheckBox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/CheckBox.o.d" -o ${OBJECTDIR}/_ext/1713430119/CheckBox.o ../Microchip/Graphics/CheckBox.c   
	
${OBJECTDIR}/_ext/1713430119/Meter.o: ../Microchip/Graphics/Meter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Meter.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Meter.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Meter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Meter.o.d" -o ${OBJECTDIR}/_ext/1713430119/Meter.o ../Microchip/Graphics/Meter.c   
	
${OBJECTDIR}/_ext/1713430119/DigitalMeter.o: ../Microchip/Graphics/DigitalMeter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/DigitalMeter.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/DigitalMeter.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/DigitalMeter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/DigitalMeter.o.d" -o ${OBJECTDIR}/_ext/1713430119/DigitalMeter.o ../Microchip/Graphics/DigitalMeter.c   
	
${OBJECTDIR}/_ext/1713430119/Chart.o: ../Microchip/Graphics/Chart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Chart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Chart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Chart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Chart.o.d" -o ${OBJECTDIR}/_ext/1713430119/Chart.o ../Microchip/Graphics/Chart.c   
	
${OBJECTDIR}/_ext/1713430119/RadioButton.o: ../Microchip/Graphics/RadioButton.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/RadioButton.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/RadioButton.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/RadioButton.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/RadioButton.o.d" -o ${OBJECTDIR}/_ext/1713430119/RadioButton.o ../Microchip/Graphics/RadioButton.c   
	
${OBJECTDIR}/_ext/1713430119/ListBox.o: ../Microchip/Graphics/ListBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/ListBox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/ListBox.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/ListBox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/ListBox.o.d" -o ${OBJECTDIR}/_ext/1713430119/ListBox.o ../Microchip/Graphics/ListBox.c   
	
${OBJECTDIR}/_ext/1713430119/GroupBox.o: ../Microchip/Graphics/GroupBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GroupBox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/GroupBox.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/GroupBox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/GroupBox.o.d" -o ${OBJECTDIR}/_ext/1713430119/GroupBox.o ../Microchip/Graphics/GroupBox.c   
	
${OBJECTDIR}/_ext/1713430119/EditBox.o: ../Microchip/Graphics/EditBox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/EditBox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/EditBox.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/EditBox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/EditBox.o.d" -o ${OBJECTDIR}/_ext/1713430119/EditBox.o ../Microchip/Graphics/EditBox.c   
	
${OBJECTDIR}/_ext/1713430119/Window.o: ../Microchip/Graphics/Window.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Window.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Window.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Window.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Window.o.d" -o ${OBJECTDIR}/_ext/1713430119/Window.o ../Microchip/Graphics/Window.c   
	
${OBJECTDIR}/_ext/1713430119/Slider.o: ../Microchip/Graphics/Slider.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Slider.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Slider.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Slider.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Slider.o.d" -o ${OBJECTDIR}/_ext/1713430119/Slider.o ../Microchip/Graphics/Slider.c   
	
${OBJECTDIR}/_ext/1713430119/StaticText.o: ../Microchip/Graphics/StaticText.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/StaticText.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/StaticText.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/StaticText.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/StaticText.o.d" -o ${OBJECTDIR}/_ext/1713430119/StaticText.o ../Microchip/Graphics/StaticText.c   
	
${OBJECTDIR}/_ext/1713430119/RoundDial.o: ../Microchip/Graphics/RoundDial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/RoundDial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/RoundDial.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/RoundDial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/RoundDial.o.d" -o ${OBJECTDIR}/_ext/1713430119/RoundDial.o ../Microchip/Graphics/RoundDial.c   
	
${OBJECTDIR}/_ext/1713430119/Picture.o: ../Microchip/Graphics/Picture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Picture.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/Picture.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/Picture.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/Picture.o.d" -o ${OBJECTDIR}/_ext/1713430119/Picture.o ../Microchip/Graphics/Picture.c   
	
${OBJECTDIR}/_ext/1713430119/ProgressBar.o: ../Microchip/Graphics/ProgressBar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/ProgressBar.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/ProgressBar.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/ProgressBar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/ProgressBar.o.d" -o ${OBJECTDIR}/_ext/1713430119/ProgressBar.o ../Microchip/Graphics/ProgressBar.c   
	
${OBJECTDIR}/_ext/1713430119/TextEntry.o: ../Microchip/Graphics/TextEntry.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1713430119 
	@${RM} ${OBJECTDIR}/_ext/1713430119/TextEntry.o.d 
	@${RM} ${OBJECTDIR}/_ext/1713430119/TextEntry.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1713430119/TextEntry.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/_ext/1713430119/TextEntry.o.d" -o ${OBJECTDIR}/_ext/1713430119/TextEntry.o ../Microchip/Graphics/TextEntry.c   
	
${OBJECTDIR}/image_dropp/GDD_Screens.o: image_dropp/GDD_Screens.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/image_dropp 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_Screens.o.d 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_Screens.o 
	@${FIXDEPS} "${OBJECTDIR}/image_dropp/GDD_Screens.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/image_dropp/GDD_Screens.o.d" -o ${OBJECTDIR}/image_dropp/GDD_Screens.o image_dropp/GDD_Screens.c   
	
${OBJECTDIR}/image_dropp/GDD_Resource.o: image_dropp/GDD_Resource.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/image_dropp 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_Resource.o.d 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_Resource.o 
	@${FIXDEPS} "${OBJECTDIR}/image_dropp/GDD_Resource.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/image_dropp/GDD_Resource.o.d" -o ${OBJECTDIR}/image_dropp/GDD_Resource.o image_dropp/GDD_Resource.c   
	
${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o: image_dropp/GDD_X_Event_Handler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/image_dropp 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o.d 
	@${RM} ${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o 
	@${FIXDEPS} "${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../Board Support Package" -I"../Microchip/Include" -I"../Microchip/Include/Graphics" -I"." -I"image_dropp" -MMD -MF "${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o.d" -o ${OBJECTDIR}/image_dropp/GDD_X_Event_Handler.o image_dropp/GDD_X_Event_Handler.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/SSD1963_WORKING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SSD1963_WORKING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}           -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/SSD1963_WORKING.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SSD1963_WORKING.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/SSD1963_WORKING.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/XC32_PIC32MX795F512L
	${RM} -r dist/XC32_PIC32MX795F512L

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
