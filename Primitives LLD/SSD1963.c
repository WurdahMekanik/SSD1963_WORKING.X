/*****************************************************************************
 *  Solomon Systech. SSD1963 LCD controller driver
 *****************************************************************************
 * FileName:        SSD1963.c
 * Dependencies:    SSD1963.h
 * Processor:       Microchip PIC32MX360F512L
 * Compiler:        MPLAB C32 version 1.10 or higher
 * Linker:          MPLAB LINK32
 * Company:         TechToys Company
 *
 * Author           Date            Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * John Leung       17/06/2011
 *****************************************************************************/
#include "SSD1963.h"

/******************************** GLOBAL VARIABLE ********************************/
WORD  _color;

/**************** LOCAL FUNCTION PROTOTYPE (SSD1963 SPECIFIC) ****************/
static void SetArea(SHORT start_x, SHORT start_y, SHORT end_x, SHORT end_y);
static void GPIO_WR(BYTE pin, BOOL state);
//BYTE _gpioStatus = 0;

/*********************************************************************
* Macros:  WriteCommand(cmd)
*
* PreCondition: 
*
* Input: cmd - controller command
*
* Output: none
*
* Side Effects: none
*
* Overview: writes command
*
* Note: Since Microchip's PMP module is used, the syntax PMDIN = cmd
*		is used. For other MCUs, this could be PORTx=cmd that PORTx
*		is the data bus from your MCU.
********************************************************************/
#define WriteCommand(cmd) { RS_LAT_BIT = 0; PMDIN = cmd; CS_LAT_BIT = 0;    \
                            WR_LAT_BIT = 0; WR_LAT_BIT = 1; CS_LAT_BIT = 1;};

/*********************************************************************
* Function:  void  WriteData(WORD data)
*
* PreCondition: 
*
* Input:  value - value to be written in WORD format
*
* Output: none
*
* Side Effects: none
*
* Overview: 
*
* Note: Since Microchip's PMP module is used, the syntax PMDIN = data
*		is used. For other MCUs, this could be PORTx=data that PORTx
*		is the data bus from your MCU.
********************************************************************/
#define WriteData(data) {RS_LAT_BIT = 1; PMDIN = data; WR_LAT_BIT = 0;  WR_LAT_BIT = 1;}

/*********************************************************************
* Function:  SetArea(start_x,start_y,end_x,end_y)
*
* PreCondition: SetActivePage(page)
*
* Input: start_x, end_x	- start column and end column
*		 start_y,end_y 	- start row and end row position (i.e. page address)
*
* Output: none
*
* Side Effects: none
*
* Overview: defines start/end columns and start/end rows for memory access
*			from host to SSD1963
* Note: none
********************************************************************/
void SetArea(SHORT start_x, SHORT start_y, SHORT end_x, SHORT end_y)
{
    WriteCommand(CMD_SET_COLUMN);
    CS_LAT_BIT = 0;
    WriteData(start_x>>8);
    WriteData(start_x);
    WriteData(end_x>>8);
    WriteData(end_x);
    CS_LAT_BIT = 1;
    WriteCommand(CMD_SET_PAGE);
    CS_LAT_BIT = 0;
    WriteData(start_y>>8);
    WriteData(start_y);
    WriteData(end_y>>8);
    WriteData(end_y);
    CS_LAT_BIT = 1;
}
/*********************************************************************
* Function: Set a GPIO pin to state high(1) or low(0)
*
* PreCondition: Set the GPIO pin an output prior using this function
*
* Arguments: BYTE pin   -   LCD_RESET
*                           LCD_SPENA
*                           LCD_SPCLK
*                           LCD_SPDAT   defined under GraphicsConfig.h
*							
*            BOOL state -   0 for low
*                           1 for high
* Return: none
*
* Note:
*********************************************************************/
static void GPIO_WR(BYTE pin, BOOL state)
{
    BYTE _gpioStatus = 0;

    if(state==1)
        _gpioStatus = _gpioStatus|pin;
    else
        _gpioStatus = _gpioStatus&(~pin);

    WriteCommand(CMD_SET_GPIO_VAL);	// Set GPIO value
    CS_LAT_BIT = 0;
    WriteData(_gpioStatus);
    CS_LAT_BIT = 1;
}
/*********************************************************************
* Function:  void EnterSleepMode (void)
* PreCondition: none
* Input:  none
* Output: none
* Side Effects: none
* Overview: SSD1963 enters sleep mode
* Note: Host must wait 5mS after sending before sending next command
********************************************************************/
void EnterSleepMode (void)
{
    WriteCommand(CMD_ENT_SLEEP);
}
/*********************************************************************
* Function:  void ExitSleepMode (void)
* PreCondition: none
* Input:  none
* Output: none
* Side Effects: none
* Overview: SSD1963 enters sleep mode
* Note:   none
********************************************************************/
void ExitSleepMode (void)
{
    WriteCommand(CMD_EXIT_SLEEP);
}
/*********************************************************************
* Function		: void DisplayOff(void)
* PreCondition	: none
* Input			: none
* Output		: none
* Side Effects	: none
* Overview		: SSD1963 changes the display state to OFF state
* Note			: none
********************************************************************/
void DisplayOff(void)
{
    WriteCommand(CMD_BLANK_DISPLAY);
}
/*********************************************************************
* Function		: void DisplayOn(void)
* PreCondition	: none
* Input			: none
* Output		: none
* Side Effects	: none
* Overview		: SSD1963 changes the display state to ON state
* Note			: none
********************************************************************/
void DisplayOn(void)
{
    WriteCommand(CMD_ON_DISPLAY);
}
/*********************************************************************
* Function		: void EnterDeepSleep(void)
* PreCondition	: none
* Input			: none
* Output		: none
* Side Effects	: none
* Overview		: SSD1963 enters deep sleep state with PLL stopped
* Note			: none
********************************************************************/
void EnterDeepSleep(void)
{
    WriteCommand(CMD_ENT_DEEP_SLEEP);
}
/*********************************************************************
* Function:  void  SetBacklight(BYTE intensity)
*
* Overview: This function makes use of PWM feature of ssd1963 to adjust
*			the backlight intensity. 
*
* PreCondition: Backlight circuit with shutdown pin connected to PWM output of ssd1963.
*
* Input: 	(BYTE) intensity from 
*			0x00 (total backlight shutdown, PWM pin pull-down to VSS)
*			0xff (99% pull-up, 255/256 pull-up to VDD)
*
* Output: none
*
* Note: The base frequency of PWM set to around 300Hz with PLL set to 120MHz.
*		This parameter is hardware dependent
********************************************************************/
void SetBacklight(BYTE intensity)
{
    WriteCommand(CMD_SET_PWM_CONF); // Set PWM configuration for backlight control
    CS_LAT_BIT = 0;
    WriteData(0x0E);                // PWMF[7:0] = 2, PWM base freq = PLL/(256*(1+5))/256 =
                                    // 300Hz for a PLL freq = 120MHz
    WriteData(intensity);           // Set duty cycle, from 0x00 (total pull-down) to 0xFF
    WriteData(0x01);                // PWM enabled and controlled by host (mcu)
    WriteData(0x00);
    WriteData(0x00);
    WriteData(0x00);
    CS_LAT_BIT = 1;
}
/*********************************************************************
* Function:  void  SetTearingCfg(BOOL state, BOOL mode)
*
* Overview: This function enable/disable tearing effect
*
* PreCondition: none
*
* Input: 	BOOL state -	1 to enable
*							0 to disable
*			BOOL mode -		0:  the tearing effect output line consists
*								of V-blanking information only
*							1:	the tearing effect output line consists
*								of both V-blanking and H-blanking info.
* Output: none
*
* Note:
********************************************************************/
void SetTearingCfg(BOOL state, BOOL mode)
{
    if(state == 1)
    {
        WriteCommand(CMD_SET_TEAR_ON);
        CS_LAT_BIT = 0;
        WriteData(mode&0x01);
        CS_LAT_BIT = 1;
    }
    else
    {
        WriteCommand(0x34);
    }
}
/*********************************************************************
* Function: void PutPixel(SHORT x, SHORT y)
*
* PreCondition: none
*
* Input: x,y - pixel coordinates
*
* Output: none
*
* Side Effects: none
*
* Overview: puts pixel
*
* Note:
********************************************************************/
void PutPixel(SHORT x, SHORT y)
{
    SetArea(x,y,DISP_HOR_RESOLUTION-1,DISP_VER_RESOLUTION-1);
    WriteCommand(CMD_WR_MEMSTART);
    CS_LAT_BIT = 0;
    WriteData(_color);
    CS_LAT_BIT = 1;
}
/*********************************************************************
* Function:  void ResetDevice()
*
* PreCondition: none
*
* Input: none
*
* Output: none
*
* Side Effects: none
*
* Overview: Resets LCD, initializes PMP
*			Initialize low level IO port for mcu,
*			initialize SSD1963 for PCLK,
*			HSYNC, VSYNC etc
*
* Note: Need to set the backlight intensity by SetBacklight(BYTE intensity)
*		in main()
*		MCU specific. 
********************************************************************/
void ResetDevice(void)
{
    RST_LAT_BIT  = 1;
    RST_TRIS_BIT = 0;       // enable RESET line

    RS_TRIS_BIT = 0;        // enable RS line

    CS_LAT_BIT  = 1;        // SSD1963 is not selected by default
    CS_TRIS_BIT = 0;        // enable SSD1963 CS line

    RD_LAT_BIT  = 1;
    RD_TRIS_BIT = 0;

    WR_LAT_BIT  = 1;
    WR_TRIS_BIT = 0;

    // PMP setup
    PMMODE = 0; PMAEN = 0; PMCON = 0;
    PMMODEbits.MODE   = 2;  // Intel 80 master interface
    // Before PLL is set and locked, the reference clock = crystal freq.
    // Set the largest data setup time for 10MHz clock
    PMMODEbits.WAITB  = 3;
    PMMODEbits.WAITM  = 15;
    PMMODEbits.WAITE  = 3;

    PMMODEbits.MODE16 = 1;  // 16 bit mode

    PMCONbits.PTRDEN = 0;   // disable RD line
    PMCONbits.PTWREN = 0;   // disable WR line
    PMCONbits.PMPEN  = 1;   // enable PMP

    RST_LAT_BIT = 0;
    DelayMs(1);
    RST_LAT_BIT = 1;        // release from reset state to sleep state

    //Set MN(multipliers) of PLL, VCO = crystal freq * (N+1)
    //PLL freq = VCO/M with 250MHz < VCO < 800MHz
    //The max PLL freq is around 120MHz. To obtain 120MHz as the PLL freq
    WriteCommand(CMD_SET_PLL_MN);   // Set PLL with OSC = 10MHz (hardware)
                                    // Multiplier N = 35, VCO (>250MHz)= OSC*(N+1), VCO = 360MHz
    CS_LAT_BIT = 0;
    WriteData(0x23);
    WriteData(0x02);                // Divider M = 2, PLL = 360/(M+1) = 120MHz
    WriteData(0x54);                // Validate M and N values
    CS_LAT_BIT = 1;

    WriteCommand(CMD_PLL_START);    // Start PLL command
    CS_LAT_BIT = 0;
    WriteData(0x01);                // enable PLL
    CS_LAT_BIT = 1;

    DelayMs(1);                     // wait stablize
    WriteCommand(CMD_PLL_START);    // Start PLL command again
    CS_LAT_BIT = 0;
    WriteData(0x03);                // now, use PLL output as system clock
    CS_LAT_BIT = 1;
    //once PLL locked (at 120MHz), set data hold time set shortest
    PMMODEbits.WAITB  = 0;
    PMMODEbits.WAITM  = 0;
    PMMODEbits.WAITE  = 0;
    
    WriteCommand(CMD_SOFT_RESET);   // Soft reset
    DelayMs(10);
    /*
    *************************************************
    * 4.3" TFT panel model # TY430TFT480272
    *************************************************
    */
#if (DISPLAY_PANEL==TY430TFT480272)	
    //Set LSHIFT freq, i.e. the DCLK with PLL freq 120MHz set previously
    //Typical DCLK for TY430TFT480272 is 9MHz
    //9MHz = 120MHz*(LCDC_FPR+1)/2^20
    //LCDC_FPR = 78642 (0x13332)
    WriteCommand(CMD_SET_PCLK);     //set pixel clock (LSHIFT signal) frequency
    CS_LAT_BIT = 0;
    WriteData(0x01);
    WriteData(0x33);
    WriteData(0x32);
    CS_LAT_BIT = 1;
    /*
    *************************************************
    * 5.0" TFT panel model # TY500TFT800480
    *************************************************
    */
#elif (DISPLAY_PANEL==TY500TFT800480)	
    //Set LSHIFT freq, i.e. the DCLK with PLL freq 120MHz set previously
    //Typical DCLK for TY500TFT800480 is 33MHz
    //30MHz = 120MHz*(LCDC_FPR+1)/2^20
    //LCDC_FPR = 262143 (0x3FFFF)
    WriteCommand(CMD_SET_PCLK);     //set pixel clock (LSHIFT signal) frequency
    CS_LAT_BIT = 0;
    WriteData(0x03);
    WriteData(0xff);
    WriteData(0xff);
    CS_LAT_BIT = 1;
    /*
    ****************************************************************
    * 7" TFT model # TY700TFT800480
    ****************************************************************
    */
#elif (DISPLAY_PANEL==TY700TFT800480)
    //Set LSHIFT freq, i.e. the DCLK with PLL freq 120MHz set previously
    //Typical DCLK for TY700TFT800480 is 33.3MHz(datasheet), experiment shows 30MHz gives a stable result
    //30MHz = 120MHz*(LCDC_FPR+1)/2^20
    //LCDC_FPR = 262143 (0x3FFFF)
    //Time per line = (DISP_HOR_RESOLUTION+DISP_HOR_PULSE_WIDTH+DISP_HOR_BACK_PORCH+DISP_HOR_FRONT_PORCH)/30 us = 1056/30 = 35.2us
    WriteCommand(CMD_SET_PCLK);     //set pixel clock (LSHIFT signal) frequency
    CS_LAT_BIT = 0;
    WriteData(0x03);
    WriteData(0xff);
    WriteData(0xff);
    CS_LAT_BIT = 1;
    /*
    *************************************************
    * 3.5" TFT model # LVC75Z779V1S
    *************************************************
    */
#elif (DISPLAY_PANEL==LVC75Z779V1S)
    //Set LSHIFT freq, i.e. the DCLK with PLL freq 120MHz set previously
    //Typical DCLK for LVC75Z779V1S is 6.5MHz in 24 bit format
    //6.5MHz = 120MHz*(LCDC_FPR+1)/2^20
    //LCDC_FPR = 56796 (0x00DDDC)
    WriteCommand(CMD_SET_PCLK);     //set pixel clock (LSHIFT signal) frequency
    CS_LAT_BIT = 0;
    WriteData(0x00);
    WriteData(0xDD);
    WriteData(0xDC);
    CS_LAT_BIT = 1;
#endif
	
    //Set panel mode, varies from individual manufacturer
    WriteCommand(CMD_SET_PANEL_MODE);
#if ((DISPLAY_PANEL==TY430TFT480272)||(DISPLAY_PANEL==LVC75Z779V1S))
    CS_LAT_BIT = 0;
    WriteData(0x20);                        // set 24-bit for TY430TF480272 4.3" panel, or LVC75Z779V1S 3.5" TFT Panel, data latch in rising edge for LSHIFT
    WriteData(0x00);                        // set Hsync+Vsync mode
    WriteData((DISP_HOR_RESOLUTION-1)>>8);  //Set panel size
    WriteData(DISP_HOR_RESOLUTION-1);
    WriteData((DISP_VER_RESOLUTION-1)>>8);
    WriteData(DISP_VER_RESOLUTION-1);
    WriteData(0x00);                        //RGB sequence
    CS_LAT_BIT = 1;
#elif (DISPLAY_PANEL==TY500TFT800480)
    CS_LAT_BIT = 0;
    WriteData(0x24);                        // set 24-bit for TY500TFT800480 5" panel, data latch in falling edge for LSHIFT
    WriteData(0x00);                        // set Hsync+Vsync mode
    WriteData((DISP_HOR_RESOLUTION-1)>>8);  //Set panel size
    WriteData(DISP_HOR_RESOLUTION-1);
    WriteData((DISP_VER_RESOLUTION-1)>>8);
    WriteData(DISP_VER_RESOLUTION-1);
    WriteData(0x00);                        //RGB sequence
    CS_LAT_BIT = 1;
#elif (DISPLAY_PANEL==TY700TFT800480)
    CS_LAT_BIT = 0;
    WriteData(0x10);                        // set 18-bit for 7" panel TY700TFT800480
    WriteData(0x80);                        // set TTL mode
    WriteData((DISP_HOR_RESOLUTION-1)>>8);  //Set panel size
    WriteData(DISP_HOR_RESOLUTION-1);
    WriteData((DISP_VER_RESOLUTION-1)>>8);
    WriteData(DISP_VER_RESOLUTION-1);
    WriteData(0x00);                        //RGB sequence
    CS_LAT_BIT = 1;
#endif

    //Set horizontal period
    WriteCommand(CMD_SET_HOR_PERIOD);
    #define HT (DISP_HOR_RESOLUTION+DISP_HOR_PULSE_WIDTH+DISP_HOR_BACK_PORCH+DISP_HOR_FRONT_PORCH)
    CS_LAT_BIT = 0;
    WriteData((HT-1)>>8);
    WriteData(HT-1);
    #define HPS (DISP_HOR_PULSE_WIDTH+DISP_HOR_BACK_PORCH)
    WriteData((HPS-1)>>8);
    WriteData(HPS-1);
    WriteData(DISP_HOR_PULSE_WIDTH-1);
    WriteData(0x00);
    WriteData(0x00);
    WriteData(0x00);
    CS_LAT_BIT = 1;
    //Set vertical period
    WriteCommand(CMD_SET_VER_PERIOD);
    #define VT (DISP_VER_PULSE_WIDTH+DISP_VER_BACK_PORCH+DISP_VER_FRONT_PORCH+DISP_VER_RESOLUTION)
    CS_LAT_BIT = 0;
    WriteData((VT-1)>>8);
    WriteData(VT-1);
    #define VSP (DISP_VER_PULSE_WIDTH+DISP_VER_BACK_PORCH)
    WriteData((VSP-1)>>8);
    WriteData(VSP-1);
    WriteData(DISP_VER_PULSE_WIDTH-1);
    WriteData(0x00);
    WriteData(0x00);
    CS_LAT_BIT = 1;
	
    //Set pixel format, i.e. the bpp
    WriteCommand(CMD_SET_PIXEL_FORMAT);
    CS_LAT_BIT = 0;
    WriteData(0x70);
    CS_LAT_BIT = 1;

    //Set pixel data interface
    WriteCommand(CMD_SET_DATA_INTERFACE);
    CS_LAT_BIT = 0;
    WriteData(0x03);                    //16-bit(565 format) data for 16bpp PIC32MX only
    CS_LAT_BIT = 1;


#if ((DISPLAY_PANEL==TY500TFT800480)||(DISPLAY_PANEL==TY430TFT480272)||(DISPLAY_PANEL==LVC75Z779V1S))
    WriteCommand(CMD_SET_GPIO_CONF);    // Set all GPIOs to output, controlled by host
    CS_LAT_BIT = 0;
    WriteData(0x0f);                    // Set GPIO0 as output
    WriteData(0x01);                    // GPIO[3:0] used as normal GPIOs
    CS_LAT_BIT = 1;
#endif
    // Turn on display; show the image on display
    DisplayOn();
}
/*********************************************************************
* Function: void ClearDevice(void)
*
* PreCondition: none
*
* Input: none
*
* Output: none
*
* Side Effects: none
*
* Overview: clears screen with current color 
*
* Note: none
*
********************************************************************/
void ClearDevice(void)
{
    DWORD xcounter, ycounter;

    SetArea(0,0,DISP_HOR_RESOLUTION-1,DISP_VER_RESOLUTION-1);

    WriteCommand(CMD_WR_MEMSTART);
    CS_LAT_BIT = 0;
    for(ycounter=0;ycounter<DISP_VER_RESOLUTION;ycounter++)
    {
        for(xcounter=0;xcounter<DISP_HOR_RESOLUTION;xcounter++)
        {
            WriteData(_color);
        }
    }
    CS_LAT_BIT = 1;
}
