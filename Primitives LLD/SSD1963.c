/*****************************************************************************
 *  Solomon Systech. SSD1963 LCD controller driver
 *****************************************************************************
 * FileName:        SSD1963.c
 * Dependencies:    SSD1963.h
 * Processor:       Microchip PIC32MX
 * Compiler:        MPLAB C32 version 1.10 or higher
 * Linker:          MPLAB LINK32
 * Company:         TechToys Company
 *
 * Author           Date            Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * John Leung       17/06/2011
 *****************************************************************************/

/*******************************************************************************
* Remarks:
* 1. Removed hardware definition for LED_LAT_BIT and LED_TRIS_BIT
*	  because PWM pin of SSD1963 applied, therefore backlight intensity
*	  set by software
* 2. Add new function void SetBacklight(BYTE intensity)
* 3. Funny finding, PLL to 120MHz work only when 10MHz crystal applied with
* 	  multiplier N = 35. A crystal with 4MHz attempted but the PLL frequency
*	  failed to boost to 120MHz somehow!
*
* John Leung @ TechToys Co.			09/09/2009
* www.TechToys.com.hk
*******************************************************************************/

/*******************************************************************************
* Revision:
* Port ot Microchip Graphics Library v2.00
* (1) Only BLOCKING CONFIGURATION is supported
* (2) GetPixel() not working yet.
* John Leung @ TechToys Co.			15th Jan 2010
* www.TechToys.com.hk
*******************************************************************************/

/*******************************************************************************
* Revision:
* (1) Optimize for WriteData() by removing CS_LAT_BIT for each write cycle
*	  and append CS strobe between multiple WriteData()
*
* John Leung @ TechToys Co.			3rd Feb 2010
* www.TechToys.com.hk
*******************************************************************************/

/*******************************************************************************
* Revision
* An attempt to make use of 74HC573 latch on Rev3A board and it is working.
* Date: 8th April 2011
*******************************************************************************/

/*******************************************************************************
* Revision:
*
* Three new functions for power management. They are
* void DisplayOff(void), void DisplayOn(void), void EnterDeepSleep(void).
* The hardware consists of a SSD1963 Rev2A EVK + PIC24/32 EVK R2C with
* PIC32 GP Starter kit stacked on it. Display was a 4.3" TFT LCD (TY430TFT480272 Rev03).
*
* With Display state set to Display ON, the current drawn was 192mA,
* being the full power state. This is a baseline.
*
* With EnterDeepSleep() function executed, current reduced to 128mA
* with instant blackout of the display.
*
* Dummy read was not implemented to bring SSD1963 out of the deep sleep state.
* Instead, DisplayOn() function executed which was also able to bring the TFT
* to display ON state without any loss on the screen content.
* However, it would be advised to follow the datasheet for a proper
* deep sleep state exit.
*
* User may refer to the state chart on page 19 of SSD1963 datasheet
* regarding individual power states
*
* Date: 20th April 2011
*******************************************************************************/

/*******************************************************************************
* Revision:
* (1) Port to Microchip Graphics Library version 3.01
* (2) SetActivePage(0), SetVisualPage(0) under ResetDevice()
* (3) Removed WORD PutImage(SHORT left, SHORT top, void* bitmap, BYTE stretch)
*		It is now declared under primitive.c and primitive.h
*
* Programmer: John Leung @ www.TechToys.com.hk
* Date: 10th Aug 2011
*******************************************************************************/

/*******************************************************************************
* Revision:
* Add support for double buffering
* Programmer: John Leung @ www.TechToys.com.hk
* Date: 15th Aug 2011
*******************************************************************************/

/*******************************************************************************
* Revision:
* Removed all PutImage() functions as they are now declared under Primitive.c
* with Graphcis Library Version 3.0.1
* Programmer: John Leung @ www.TechToys.com.hk
* Date: 5th Sept 2011
*******************************************************************************/

/*******************************************************************************
* Revision:
* Removed #if defined (USE_DISPLAY_CONTROLLER_SSD1963_R3B) ..#endif
* Programmer: John Leung @ www.TechToys.com.hk
* Date: 9th Feb 2012
*******************************************************************************/

/*******************************************************************************
* Revision:
* Add support for USE_8BIT_PMP with PIC32MX795F512L on Explorer 16
* Add support for TY700TFT800480_R3
* Programmer: John Leung @ www.TechToys.com.hk
* Date: 28th Aug 2012
*******************************************************************************/

/*******************************************************************************
* Revision:
* changes on WriteCommand() and WriteData() for compatibility with Explorer 16
* for 8-bit and 16-bit PMP
* Programmer: John Leung @ www.TechToys.com.hk
* Date: 6th Sept 2012
*******************************************************************************/

/*******************************************************************************
* Revision:
* Add WriteCommandSlow() and WriteDataSlow() for Fosc before PLL locked
*	Before PLL is locked, Fosc = 10MHz only.
* Add support for USE_MCHP_PMPWR
*
* Programmer: John Leung @ www.TechToys.com.hk
* Date: 21st Sept 2012
*******************************************************************************/
#include "SSD1963.h"

#include "HardwareProfile.h"

#include "TimeDelay.h"
#include "DisplayDriver.h"
#include "Graphics/Primitive.h"


#ifdef USE_DOUBLE_BUFFERING
    BYTE blInvalidateAll;
    BYTE blEnableDoubleBuffering;
    BYTE NoOfInvalidatedRectangleAreas;
    RectangleArea InvalidatedArea[GFX_MAX_INVALIDATE_AREAS];

    volatile DWORD  _drawbuffer;
    volatile BYTE   blDisplayUpdatePending;

    static void ExchangeDrawAndFrameBuffers(void);
#endif //USE_DOUBLE_BUFFERING

// Color
GFX_COLOR   _color;
#ifdef USE_TRANSPARENT_COLOR
    GFX_COLOR   _colorTransparent;
    SHORT       _colorTransparentEnable;
#endif

#ifdef GFX_DRV_PAGE_COUNT
    volatile DWORD	_PageTable[GFX_DRV_PAGE_COUNT];
#endif

// Clipping region control
SHORT _clipRgn;
// Clipping region borders
SHORT _clipLeft;
SHORT _clipTop;
SHORT _clipRight;
SHORT _clipBottom;

// Active Page
BYTE  _activePage;
// Visual Page
BYTE  _visualPage;

// ssd1963 specific
BYTE _gpioStatus = 0;

void PutImage1BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch);
void PutImage4BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch);
void PutImage8BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch);
void PutImage16BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch);

void PutImage1BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch);
void PutImage4BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch);
void PutImage8BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch);
void PutImage16BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch);


/**************** LOCAL FUNCTION PROTOTYPE (SSD1963 SPECIFIC) ****************/
static void SetArea(SHORT start_x, SHORT start_y, SHORT end_x, SHORT end_y);
static void GPIO_WR(BYTE pin, BOOL state);

/*********************************************************************
* Function: IsDeviceBusy()
*
* Overview: Returns non-zero if LCD controller is busy 
*           (previous drawing operation is not completed).
*
* PreCondition: none
*
* Input: none
*
* Output: Busy status.
*
* Remarks: Not implemented yet
*
********************************************************************/
WORD IsDeviceBusy()
{
	return 0;
}

#if defined (USE_DOUBLE_BUFFERING)
/*********************************************************************
* Function:  static void ExchangeDrawAndFrameBuffers(void);
*
* Overview: Interchanges Draw and Frame buffers and copies the contents
*           of current frame buffer to the draw buffer
*
* PreCondition: The graphical frame must be completely drawn.
*
* Input: None
*
* Output: None
*
* Side Effects: Always draw on draw buffer & not on frame buffer
*
********************************************************************/
static void ExchangeDrawAndFrameBuffers(void)
{
	DWORD SourceBuffer, DestBuffer;

    if(blEnableDoubleBuffering == 0)
    {
        return;
    }	

    if(_drawbuffer == GFX_BUFFER1)
    {
        SourceBuffer = GFX_BUFFER1;
        DestBuffer   = GFX_BUFFER2;
    }
    else
    {
        SourceBuffer = GFX_BUFFER2;
        DestBuffer   = GFX_BUFFER1;
    }

    _drawbuffer = DestBuffer;
	//...
}
#endif

#if defined (USE_DOUBLE_BUFFERING)
/*********************************************************************
* Function:  SwitchOnDoubleBuffering()
*
* Overview: Switches on the double buffering.
*			Double buffering utilizes two buffers. The frame buffer and the
*           draw buffer. The frame buffer is the buffer that is being displayed
*			while the draw buffer is used for all rendering. 
*           When this function is called, it copies the contents of the frame buffer 
*           to the draw buffer once and all succeeding rendering will be performed on 
*           the draw buffer. To update the frame buffer with newly drawn 
*           items on the draw buffer call UpdateDisplayNow() or RequestDisplayUpdate().
*
* PreCondition: none
*
* Input: none
*
* Output: none
*
* Side Effects: none
*
********************************************************************/
void SwitchOnDoubleBuffering(void)
{
    if(blEnableDoubleBuffering == 0) 
    { 
        blEnableDoubleBuffering = 1; 
        InvalidateAll(); 
    }  
}


/*********************************************************************
* Function:  SwitchOffDoubleBuffering()
*
* Overview: Switches off the double buffering.
*           All rendering will be performed on the frame buffer. Calls
*           to UpdateDisplayNow() or RequestDisplayUpdate() will 
*           have no effect.
*
* PreCondition: none
*
* Input: none
*
* Output: none
*
* Side Effects: none
*
********************************************************************/
void SwitchOffDoubleBuffering(void)
{
    if(blEnableDoubleBuffering == 1) 
    { 
        UpdateDisplayNow(); 
        _drawbuffer = (_drawbuffer == GFX_BUFFER1)? GFX_BUFFER2: GFX_BUFFER1; 
        blEnableDoubleBuffering = 0; 
    }
}

/*********************************************************************
* Function:  void UpdateDisplayNow(void)
*
* Overview: Synchronizes the draw and frame buffers immediately
*
* PreCondition: none
*
* Input: none
*
* Output: none
*
* Side Effects: none
*
* Remarks:	For SSD1963, this is equivalent to updating the pointer
*			to the DrawBuffer and swap the role of DrawBuffer with 
*			FrameBuffer with ExchangeDrawAndFrameBuffers()
********************************************************************/
void UpdateDisplayNow(void)
{
	SetScrollArea(0, GetMaxY()+1,0);
	if(_drawbuffer == GFX_BUFFER1)
	{
		SetScrollStart(0);
	} else
	{
		SetScrollStart(GetMaxY()+1);
	}
    ExchangeDrawAndFrameBuffers();
}


/*********************************************************************
* Function:  void RequestDisplayUpdate(void)
*
* Overview: Synchronizes the draw and frame buffers at next VBlank
*
* PreCondition: none
*
* Input: none
*
* Output: none
*
* Side Effects: none
* Remarks: Not implemented yet, may use tearing effect to achieve this
********************************************************************/
void RequestDisplayUpdate(void)
{
	//use tearing effect!
}

#endif	//USE_DOUBLE_BUFFERING

/*********************************************************************
* Macros:  PMPWaitBusy()
*
* Overview: waits for PMP cycle end.
*
* PreCondition: none
*
* Input: none
*
* Output: none
*
* Side Effects: none
*
* Note: 
********************************************************************/
#ifdef __PIC32MX
    #define PMPWaitBusy()  while(PMMODEbits.BUSY);

#else
    #ifdef __PIC24F__
        #define PMPWaitBusy()  Nop();
    #else
        #error CONTROLLER IS NOT SUPPORTED
    #endif
#endif

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
* Functions:  SetActivePage(page)
*
* Overview: Sets active graphic page.
*
* PreCondition: none
*
* Input: page - Graphic page number.
*
* Output: none
*
* Side Effects: none
*
********************************************************************/
void SetActivePage(WORD page)
{
    _activePage = (BYTE)page;
}
/*********************************************************************
* Functions: SetVisualPage(page)
*
* Overview: Sets graphic page to display.
*
* PreCondition: none
*
* Input: page - Graphic page number
*
* Output: none
*
* Side Effects: none
*
********************************************************************/
void SetVisualPage(WORD page)
{
    _visualPage = (BYTE)page;
    SetScrollArea(0,GetMaxY()+1,0);
    SetScrollStart((SHORT)_visualPage*(GetMaxY()+1));
}
/*********************************************************************
* Function: SetClipRgn(left, top, right, bottom)
*
* Overview: Sets clipping region.
*
* PreCondition: none
*
* Input: left - Defines the left clipping region border.
*		 top - Defines the top clipping region border.
*		 right - Defines the right clipping region border.
*	     bottom - Defines the bottom clipping region border.
*
* Output: none
*
* Side Effects: none
*
********************************************************************/
void SetClipRgn(SHORT left, SHORT top, SHORT right, SHORT bottom)
{
    _clipLeft=left;
    _clipTop=top;
    _clipRight=right;
    _clipBottom=bottom;
}
/*********************************************************************
* Macros: SetClip(control)
*
* Overview: Enables/disables clipping.
*
* PreCondition: none
*
* Input: control - Enables or disables the clipping.
*			- 0: Disable clipping
*			- 1: Enable clipping
*
* Output: none
*
* Side Effects: none
*
********************************************************************/
void SetClip(BYTE control)
{
    _clipRgn=control;
}
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
    DWORD offset;

#if defined (USE_DOUBLE_BUFFERING)
    if(_drawbuffer==GFX_BUFFER1)
        offset = 0;
    else
        offset = (DWORD)(GetMaxY()+1);
#else
    offset = (DWORD)_activePage*(GetMaxY()+1);
#endif

    start_y = offset + start_y;
    end_y   = offset + end_y;

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
* Function:  SetScrollArea(SHORT top, SHORT scroll, SHORT bottom)
*
* PreCondition: none
*
* Input: top - Top fixed area in number of lines from top of the frame buffer
*        scroll - Vertical scrolling area in number of lines
*        bottom - Bottom Fixed Area in number of lines
*
* Output: none
*
* Side Effects: none
*
* Overview:
*
* Note: Reference: section 9.22 Set Scroll Area, SSD1963 datasheet Rev0.20
********************************************************************/
void SetScrollArea(SHORT top, SHORT scroll, SHORT bottom)
{
    WriteCommand(CMD_SET_SCROLL_AREA);
    CS_LAT_BIT = 0;
    WriteData(top>>8);
    WriteData(top);
    WriteData(scroll>>8);
    WriteData(scroll);
    WriteData(bottom>>8);
    WriteData(bottom);
    CS_LAT_BIT = 1;
}
/*********************************************************************
* Function:  void  SetScrollStart(SHORT line)
*
* Overview: First, we need to define the scrolling area by SetScrollArea()
*           before using this function.
*
* PreCondition: SetScrollArea(SHORT top, SHORT scroll, SHORT bottom)
*
* Input: line - Vertical scrolling pointer (in number of lines) as
*        the first display line from the Top Fixed Area defined in SetScrollArea()
*
* Output: none
*
* Note: (Example:)
*    <CODE>
*       SHORT line=0;
*       SetScrollArea(0,272,0);
*       for(line=0;line<272;line++) {SetScrollStart(line);DelayMs(100);}
*   </CODE>
*
*      Code above scrolls the whole page upwards in 100ms interval
*      with page 2 replacing the first page in scrolling
********************************************************************/
void SetScrollStart(SHORT line)
{
    WriteCommand(CMD_SET_SCROLL_START);
    CS_LAT_BIT = 0;
    WriteData(line>>8);
    WriteData(line);
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
* Function: WORD GetPixel(SHORT x, SHORT y)
*
* PreCondition: none
*
* Input: x,y - pixel coordinates
*
* Output: pixel color
*
* Side Effects: none
*
* Overview: returns pixel color at x,y position
*
* Note: none
*
********************************************************************/
WORD GetPixel(SHORT x, SHORT y)
{
    ;
}
/*********************************************************************
* Function: WORD Bar(SHORT left, SHORT top, SHORT right, SHORT bottom)
*
* PreCondition: none
*
* Input: left,top - top left corner coordinates,
*        right,bottom - bottom right corner coordinates
*
* Output: For Blocking configuration:
*         - Always return 1.
*
* Side Effects: none
*
* Overview: draws rectangle filled with current color
*
* Note: none
*
********************************************************************/
//#ifdef USE_DRV_BAR
WORD Bar(SHORT left, SHORT top, SHORT right, SHORT bottom)
{
    register SHORT  x,y;

    if(_clipRgn)
    {
        if(left<_clipLeft)
            left = _clipLeft;
        if(right>_clipRight)
            right= _clipRight;
        if(top<_clipTop)
            top = _clipTop;
        if(bottom>_clipBottom)
            bottom = _clipBottom;
    }

    SetArea(left,top,right,bottom);
    WriteCommand(CMD_WR_MEMSTART);
    CS_LAT_BIT = 0;
    for(y=top; y<bottom+1; y++)
    {
        for(x=left; x<right+1; x++)
        {
            #if defined (USE_16BIT_PMP)
                WriteData(_color);
            #elif defined (USE_8BIT_PMP)
                WriteColor(_color);
            #endif
        }
    }
    CS_LAT_BIT = 1;
    return (1);
}
//#endif

/*********************************************************************
* Function: WORD PutImage(SHORT left, SHORT top, void* bitmap, BYTE stretch)
*
* PreCondition: none
*
* Input: left,top - left top image corner,
*        bitmap - image pointer,
*        stretch - image stretch factor
*
* Output: For Blocking configuration:
*         - Always return 1.
*
* Side Effects: none
*
* Overview: outputs image starting from left,top coordinates
*
* Note: image must be located in flash
*
********************************************************************/

#ifdef USE_BITMAP_FLASH
/*********************************************************************
* Function: void PutImage1BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch)
*
* PreCondition: none
*
* Input: left,top - left top image corner,
*        bitmap - image pointer,
*        stretch - image stretch factor
*
* Output: none
*
* Side Effects: none
*
* Overview: outputs monochrome image starting from left,top coordinates
*
* Note: image must be located in flash
*
********************************************************************/
void PutImage1BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch)
{
    register FLASH_BYTE* flashAddress;
    register FLASH_BYTE* tempFlashAddress;
    BYTE temp;
    WORD sizeX, sizeY;
    WORD x,y,y_inc;
    BYTE stretchX,stretchY;
    WORD pallete[2];
    BYTE mask;

    // Move pointer to size information
    flashAddress = bitmap + 2;

    // Read image size
    sizeY = *((FLASH_WORD*)flashAddress);
    flashAddress += 2;
    sizeX = *((FLASH_WORD*)flashAddress);
    flashAddress += 2;
    pallete[0] = *((FLASH_WORD*)flashAddress);
    flashAddress += 2;
    pallete[1] = *((FLASH_WORD*)flashAddress);
    flashAddress += 2;

    y_inc = 0;      // Y-counter, in case stretch > 1
    for(y=0; y<sizeY; y++)
    {
        tempFlashAddress = flashAddress;
        for(stretchY = 0; stretchY<stretch; stretchY++)
        {
            flashAddress = tempFlashAddress;
            SetArea(left, top+y_inc, GetMaxX(), GetMaxY());
            y_inc++;
            WriteCommand(CMD_WR_MEMSTART);
            mask = 0;
            CS_LAT_BIT= 0 ;
            for(x=0; x<sizeX; x++)
            {
                // Read 8 pixels from flash
                if(mask == 0)
                {
                    temp = *flashAddress;
                    flashAddress++;
                    mask = 0x80;
                }
                // Set color
                if(mask&temp)
                    SetColor(pallete[1]);
                else
                    SetColor(pallete[0]);
                // Write pixel to screen
                for(stretchX=0; stretchX<stretch; stretchX++)
                {
                    WriteData(_color);
                }
                // Shift to the next pixel
                mask >>= 1;
            }
            CS_LAT_BIT = 1;
        }
    }
}
/*********************************************************************
* Function: void PutImage4BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch)
*
* PreCondition: none
*
* Input: left,top - left top image corner, bitmap - image pointer,
*        stretch - image stretch factor
*
* Output: none
*
* Side Effects: none
*
* Overview: outputs 16 color image starting from left,top coordinates
*
* Note: image must be located in flash
*
********************************************************************/
void PutImage4BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch)
{
    register FLASH_BYTE* flashAddress;
    register FLASH_BYTE* tempFlashAddress;
    WORD sizeX, sizeY;
    register WORD x,y;
    WORD y_inc;
    BYTE temp;
    register BYTE stretchX,stretchY;
    WORD pallete[16];
    WORD counter;

    // Move pointer to size information
    flashAddress = bitmap + 2;

    // Read image size
    sizeY = *((FLASH_WORD*)flashAddress);
    flashAddress += 2;
    sizeX = *((FLASH_WORD*)flashAddress);
    flashAddress += 2;

    // Read pallete
    for(counter=0;counter<16;counter++)
    {
        pallete[counter] = *((FLASH_WORD*)flashAddress);
        flashAddress += 2;
    }
    
    y_inc = 0;      // Y-counter, in case stretch > 1
    for(y=0; y<sizeY; y++)
    {
        tempFlashAddress = flashAddress;
        for(stretchY = 0; stretchY<stretch; stretchY++)
        {
            flashAddress = tempFlashAddress;
            SetArea(left, top+y_inc, GetMaxX(), GetMaxY());
            y_inc++;
            WriteCommand(CMD_WR_MEMSTART);
            CS_LAT_BIT = 0;
            for(x=0; x<sizeX; x++)
            {
                // Read 2 pixels from flash
                if(x&0x0001)
                {
                    // second pixel in byte
                    SetColor(pallete[temp>>4]);
                }
                else
                {
                    temp = *flashAddress;
                    flashAddress++;
                    // first pixel in byte
                    SetColor(pallete[temp&0x0f]);
                }

                // Write pixel to screen
                for(stretchX=0; stretchX<stretch; stretchX++)
                {
                    WriteData(_color);
                }
            }
            CS_LAT_BIT = 1;
        }
    }
}
/*********************************************************************
* Function: void PutImage8BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch)
*
* PreCondition: none
*
* Input: left,top - left top image corner, bitmap - image pointer,
*        stretch - image stretch factor
*
* Output: none
*
* Side Effects: none
*
* Overview: outputs 256 color image starting from left,top coordinates
*
* Note: image must be located in flash
*
********************************************************************/
void PutImage8BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch)
{
    register FLASH_BYTE* flashAddress;
    register FLASH_BYTE* tempFlashAddress;
    WORD sizeX, sizeY;
    WORD x,y, y_inc;
    BYTE temp;
    BYTE stretchX, stretchY;
    WORD pallete[256];
    WORD counter;

    // Move pointer to size information
    flashAddress = bitmap + 2;

    // Read image size
    sizeY = *((FLASH_WORD*)flashAddress);
    flashAddress += 2;
    sizeX = *((FLASH_WORD*)flashAddress);
    flashAddress += 2;

    // Read pallete
    for(counter=0;counter<256;counter++)
    {
        pallete[counter] = *((FLASH_WORD*)flashAddress);
        flashAddress += 2;
    }
    y_inc = 0;      // Y-counter, in case stretch > 1
    
    for(y=0; y<sizeY; y++)
    {
        tempFlashAddress = flashAddress;
        for(stretchY = 0; stretchY<stretch; stretchY++)
        {
            flashAddress = tempFlashAddress;
            SetArea(left, top+y_inc, GetMaxX(), GetMaxY());
            y_inc++;
            WriteCommand(CMD_WR_MEMSTART);
            CS_LAT_BIT = 0;
            for(x=0; x<sizeX; x++)
            {
                // Read pixels from flash
                temp = *flashAddress;
                flashAddress++;

                // Set color
                SetColor(pallete[temp]);
                
                // Write pixel to screen
                for(stretchX=0; stretchX<stretch; stretchX++)
                {
                    WriteData(_color);
                }
            }
            CS_LAT_BIT = 1;
        }
    }
}
/*********************************************************************
* Function: void PutImage16BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch)
*
* PreCondition: none
*
* Input: left,top - left top image corner, bitmap - image pointer,
*        stretch - image stretch factor
*
* Output: none
*
* Side Effects: none
*
* Overview: outputs hicolor image starting from left,top coordinates
*
* Note: image must be located in flash
*
********************************************************************/
void PutImage16BPP(SHORT left, SHORT top, FLASH_BYTE* bitmap, BYTE stretch)
{
    register FLASH_WORD* flashAddress;
    register FLASH_WORD* tempFlashAddress;
    WORD sizeX, sizeY;
    register WORD x,y;
    WORD y_inc;
    WORD temp;
    register BYTE stretchX,stretchY;

    // Move pointer to size information
    flashAddress = (FLASH_WORD*)bitmap + 1;

    // Read image size
    sizeY = *flashAddress;
    flashAddress++;
    sizeX = *flashAddress;
    flashAddress++;

    y_inc = 0;      // Y-counter, in case stretch > 1
    for(y=0; y<sizeY; y++)
    {
        tempFlashAddress = flashAddress;
        for(stretchY = 0; stretchY<stretch; stretchY++)
        {
            flashAddress = tempFlashAddress;
            SetArea(left, top+y_inc, GetMaxX(), GetMaxY());
            y_inc++;
            WriteCommand(CMD_WR_MEMSTART);
            CS_LAT_BIT = 0;
            for(x=0; x<sizeX; x++)
            {
                // Read pixels from flash
                temp = *flashAddress;
                flashAddress++;

                // Set color
                SetColor(temp);

                // Write pixel to screen
                for(stretchX=0; stretchX<stretch; stretchX++)
                {
                    WriteData(_color);
                }
            }
            CS_LAT_BIT = 1;
        }
    }
}
#endif

#ifdef USE_BITMAP_EXTERNAL
/*********************************************************************
* Function: void PutImage1BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch)
*
* PreCondition: none
*
* Input: left,top - left top image corner, bitmap - image pointer,
*        stretch - image stretch factor
*
* Output: none
*
* Side Effects: none
*
* Overview: outputs monochrome image starting from left,top coordinates
*
* Note: image must be located in external memory
*
********************************************************************/
void PutImage1BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch)
{
    register DWORD      memOffset;
    BITMAP_HEADER       bmp;
    WORD                pallete[2];
    BYTE                lineBuffer[((GetMaxX()+1)/8)+1];
    BYTE*               pData;
    SHORT               byteWidth;
    BYTE                temp;
    BYTE                mask;
    WORD                sizeX, sizeY;
    WORD                x,y,y_inc;
    BYTE                stretchX, stretchY;

    // Get bitmap header
    ExternalMemoryCallback(bitmap, 0, sizeof(BITMAP_HEADER), &bmp);

    // Get pallete (2 entries)
    ExternalMemoryCallback(bitmap, sizeof(BITMAP_HEADER), 2*sizeof(WORD), pallete);

    // Set offset to the image data
    memOffset = sizeof(BITMAP_HEADER) + 2*sizeof(WORD);

    // Line width in bytes
    byteWidth = bmp.width>>3;
    if(bmp.width&0x0007)
        byteWidth++;

    // Get size
    sizeX = bmp.width;
    sizeY = bmp.height;

    y_inc = 0;      // Y-counter, in case stretch > 1
    for(y=0; y<sizeY; y++)
    {
        // Get line
        ExternalMemoryCallback(bitmap, memOffset, byteWidth, lineBuffer);
        memOffset += byteWidth;
        
        for(stretchY = 0; stretchY<stretch; stretchY++)
        {
            pData = lineBuffer;
            SetArea(left, top+y_inc, GetMaxX(), GetMaxY());
            y_inc++;
            WriteCommand(CMD_WR_MEMSTART);
            mask = 0;
            CS_LAT_BIT = 0;
            for(x=0; x<sizeX; x++)
            {
                // Read 8 pixels from flash
                if(mask == 0)
                {
                    temp = *pData++;
                    mask = 0x80;
                }
                
                // Set color
                if(mask&temp)
                    SetColor(pallete[1]);
                else
                    SetColor(pallete[0]);

                // Write pixel to screen
                for(stretchX=0; stretchX<stretch; stretchX++)
                {
                    WriteData(_color);
                }
                
                // Shift to the next pixel
                mask >>= 1;
            }
            CS_LAT_BIT = 1;
        }
    }
}
/*********************************************************************
* Function: void PutImage4BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch)
*
* PreCondition: none
*
* Input: left,top - left top image corner, bitmap - image pointer,
*        stretch - image stretch factor
*
* Output: none
*
* Side Effects: none
*
* Overview: outputs monochrome image starting from left,top coordinates
*
* Note: image must be located in external memory
*
********************************************************************/
void PutImage4BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch)
{
    register DWORD      memOffset;
    BITMAP_HEADER       bmp;
    WORD                pallete[16];
    BYTE                lineBuffer[((GetMaxX()+1)/2)+1];
    BYTE*               pData;
    SHORT               byteWidth;
    BYTE                temp;
    WORD                sizeX, sizeY;
    WORD                x,y,y_inc;
    BYTE                stretchX, stretchY;

    // Get bitmap header
    ExternalMemoryCallback(bitmap, 0, sizeof(BITMAP_HEADER), &bmp);

    // Get pallete (16 entries)
    ExternalMemoryCallback(bitmap, sizeof(BITMAP_HEADER), 16*sizeof(WORD), pallete);

    // Set offset to the image data
    memOffset = sizeof(BITMAP_HEADER) + 16*sizeof(WORD);

    // Line width in bytes
    byteWidth = bmp.width>>1;
    if(bmp.width&0x0001)
        byteWidth++;

    // Get size
    sizeX = bmp.width;
    sizeY = bmp.height;
    
    y_inc = 0;      // Y-counter, in case stretch > 1
    for(y=0; y<sizeY; y++)
    {
        // Get line
        ExternalMemoryCallback(bitmap, memOffset, byteWidth, lineBuffer);
        memOffset += byteWidth;
        
        for(stretchY = 0; stretchY<stretch; stretchY++)
        {
            pData = lineBuffer;
            SetArea(left, top+y_inc, GetMaxX(), GetMaxY());
            y_inc++;
            WriteCommand(CMD_WR_MEMSTART);
            CS_LAT_BIT = 0;
            for(x=0; x<sizeX; x++)
            {
                // Read 2 pixels from flash
                if(x&0x0001)
                {
                    // second pixel in byte
                    SetColor(pallete[temp>>4]);
                }
                else
                {
                    temp = *pData++;
                    // first pixel in byte
                    SetColor(pallete[temp&0x0f]);
                }

                // Write pixel to screen
                for(stretchX=0; stretchX<stretch; stretchX++)
                {
                    WriteData(_color);
                }
            }
            CS_LAT_BIT = 1;
        }
    }
}
/*********************************************************************
* Function: void PutImage8BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch)
*
* PreCondition: none
*
* Input: left,top - left top image corner, bitmap - image pointer,
*        stretch - image stretch factor
*
* Output: none
*
* Side Effects: none
*
* Overview: outputs monochrome image starting from left,top coordinates
*
* Note: image must be located in external memory
*
********************************************************************/
void PutImage8BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch)
{
    register DWORD      memOffset;
    BITMAP_HEADER       bmp;
    WORD                pallete[256];
    BYTE                lineBuffer[(GetMaxX()+1)];
    BYTE*               pData;
    BYTE                temp;
    WORD                sizeX, sizeY;
    WORD                x,y,y_inc;
    BYTE                stretchX, stretchY;

    // Get bitmap header
    ExternalMemoryCallback(bitmap, 0, sizeof(BITMAP_HEADER), &bmp);

    // Get pallete (256 entries)
    ExternalMemoryCallback(bitmap, sizeof(BITMAP_HEADER), 256*sizeof(WORD), pallete);

    // Set offset to the image data
    memOffset = sizeof(BITMAP_HEADER) + 256*sizeof(WORD);

    // Get size
    sizeX = bmp.width;
    sizeY = bmp.height;

    y_inc = 0;      // Y-counter, in case stretch > 1
    for(y=0; y<sizeY; y++)
    {
        // Get line
        ExternalMemoryCallback(bitmap, memOffset, sizeX, lineBuffer);
        memOffset += sizeX;
        
        for(stretchY = 0; stretchY<stretch; stretchY++)
        {
            pData = lineBuffer;
            SetArea(left, top+y_inc, GetMaxX(), GetMaxY());
            y_inc++;
            WriteCommand(CMD_WR_MEMSTART);
            CS_LAT_BIT  = 0;
            for(x=0; x<sizeX; x++)
            {
                temp = *pData++;
                SetColor(pallete[temp]);

                // Write pixel to screen
                for(stretchX=0; stretchX<stretch; stretchX++)
                {
                    WriteData(_color);
                }
            }
            CS_LAT_BIT = 1;
        }
    }
}
/*********************************************************************
* Function: void PutImage16BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch)
*
* PreCondition: none
*
* Input: left,top - left top image corner, bitmap - image pointer,
*        stretch - image stretch factor
*
* Output: none
*
* Side Effects: none
*
* Overview: outputs monochrome image starting from left,top coordinates
*
* Note: image must be located in external memory
*
********************************************************************/
void PutImage16BPPExt(SHORT left, SHORT top, void* bitmap, BYTE stretch)
{
    register DWORD      memOffset;
    BITMAP_HEADER       bmp;
    WORD                lineBuffer[(GetMaxX()+1)];
    WORD*               pData;
    WORD                byteWidth;
    WORD                temp;
    WORD                sizeX, sizeY;
    WORD                x,y,y_inc;
    BYTE                stretchX, stretchY;

    // Get bitmap header
    ExternalMemoryCallback(bitmap, 0, sizeof(BITMAP_HEADER), &bmp);

    // Set offset to the image data
    memOffset = sizeof(BITMAP_HEADER);

    // Get size
    sizeX = bmp.width;
    sizeY = bmp.height;

    byteWidth = sizeX<<1;

    y_inc = 0;      // Y-counter, in case stretch > 1
    for(y=0; y<sizeY; y++)
    {
        // Get line
        ExternalMemoryCallback(bitmap, memOffset, byteWidth, lineBuffer);
        memOffset += byteWidth;

        for(stretchY = 0; stretchY<stretch; stretchY++)
        {
            pData = lineBuffer;
            SetArea(left, top+y_inc, GetMaxX(), GetMaxY());
            y_inc++;
            WriteCommand(CMD_WR_MEMSTART);
            CS_LAT_BIT = 0;
            for(x=0; x<sizeX; x++)
            {
                temp = *pData++;
                SetColor(temp);
                
                // Write pixel to screen
                for(stretchX=0; stretchX<stretch; stretchX++)
                {
                    WriteData(_color);
                }
            }
            CS_LAT_BIT  = 1;
        }
    }
}
#endif

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

#ifdef USE_DOUBLE_BUFFERING
    // initialize double buffering feature
    blInvalidateAll = 1;
    blDisplayUpdatePending = 0;
    NoOfInvalidatedRectangleAreas = 0;
    _drawbuffer = GFX_BUFFER1;
    SwitchOnDoubleBuffering();
#endif //USE_DOUBLE_BUFFERING

#ifdef GFX_DRV_PAGE_COUNT
    for (i = 0; i < GFX_DRV_PAGE_COUNT; i++)
    {
        _PageTable[i] = GFX_DISPLAY_BUFFER_START_ADDRESS + (GFX_DISPLAY_BUFFER_LENGTH * i);
    }

    for(i = 0; i < GFX_DRV_PAGE_COUNT; i++)
    {
        SetActivePage(i);
        SetColor(0);
        ClearDevice();
    }
#endif  //GFX_DRV_PAGE_COUNT

    SetActivePage(0);   //Set page1 as  _drawbuffer
    SetVisualPage(0);
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
    //DWORD xcounter, ycounter, counter; //depreciated
    DWORD counter;
    SetArea(0,0,GetMaxX(),GetMaxY());
    WriteCommand(CMD_WR_MEMSTART);
    CS_LAT_BIT = 0;
    for(counter=0;counter<(GetMaxY()+1)*(GetMaxX()+1);counter++)
    {
        #if defined (USE_16BIT_PMP)
            WriteData(_color);
        #elif defined (USE_8BIT_PMP)
            WriteColor(_color);
        #endif
    }
    CS_LAT_BIT = 1;
/*
    //depreciated
    for(ycounter=0;ycounter<GetMaxY()+1;ycounter++)
    {
        for(xcounter=0;xcounter<GetMaxX()+1;xcounter++)
        {
            #if defined (USE_16BIT_PMP)
                WriteData(_color+xcounter+ycounter);
            #elif defined (USE_8BIT_PMP)
                WriteColor(_color);
            #endif
        }
    }
*/
}
