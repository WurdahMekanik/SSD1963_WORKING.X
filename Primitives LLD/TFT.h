/*********************************************************************
* Define TFT panel here
*********************************************************************/
#define TY430TFT480272  0
#define TY500TFT800480  1
#define TY700TFT800480  2
#define YOUR_PANEL      4


#define DISPLAY_PANEL TY430TFT480272
//#define DISPLAY_PANEL TY500TFT800480
//#define DISPLAY_PANEL TY700TFT800480
//#define DISPLAY_PANEL YOUR_PANEL

/*
***********************************************************************
 comment or uncomment #define TY700TFT_USE_QA_PATTERN to show/not show
 a built-in QA pattern for TY700TFT800480. Project rebuild req.
 only valid for #define DISPLAY_PANEL TY700TFT800480
***********************************************************************
*/
//#define TY700TFT_USE_QA_PATTERN	


/********************** INDIVIDUAL PANEL DEFS **************************/
	#if (DISPLAY_PANEL == TY430TFT480272)
	/*
	*********************************************************************
	* TIMING PARAMETERS FOR 4.3" TFT PANEL (480x272):
	* PART# TY430TFT480272
	*********************************************************************
	*/
	/*********************************************************************
	* Overview: Horizontal and vertical display resolution
	*                  (from the glass datasheet).
	*********************************************************************/
	#define DISP_HOR_RESOLUTION     480
	#define DISP_VER_RESOLUTION     272
	/*********************************************************************
	* Overview: Image orientation (can be 0, 90, 180, 270 degrees).
	*********************************************************************/
	#define DISP_ORIENTATION    0
	/*********************************************************************
	* Overview: Panel Data Width
	*********************************************************************/
	#define DISP_DATA_WIDTH     24
	/*********************************************************************
	* Overview: LSHIFT Polarity Swap
	* If defined LSHIFT is a falling trigger
	*********************************************************************/
	//#define DISP_INV_LSHIFT
	/*********************************************************************
	* Overview: Horizontal synchronization timing in pixels
	*                  (from the glass datasheet).
	*********************************************************************/
	#define DISP_HOR_PULSE_WIDTH    41
	#define DISP_HOR_BACK_PORCH     2
	#define DISP_HOR_FRONT_PORCH    2
	/*********************************************************************
	* Overview: Vertical synchronization timing in lines
	*                  (from the glass datasheet).
	*********************************************************************/
	#define DISP_VER_PULSE_WIDTH    10
	#define DISP_VER_BACK_PORCH     2
	#define DISP_VER_FRONT_PORCH    2
	
	/*********************************************************************
	* Definition for SPI interface for SSD1963 
	* Hardware dependent!
	*********************************************************************/
	#define GPIO3 3
	#define GPIO2 2
	#define GPIO1 1
	#define GPIO0 0
	#define LCD_RESET       (1<<GPIO0)      //LCD Reset signal (Reset for display panel, NOT ssd1963)
	#define LCD_SPENA	0
	#define LCD_SPCLK	0
	#define LCD_SPDAT	0
	/* End of definition for TY430TFT480272 */


#elif (DISPLAY_PANEL == TY500TFT800480)
	/*
	*********************************************************************
	* TIMING PARAMETERS FOR 5" TFT PANEL (800x480):
	* PART# TY500TFT800480
	*********************************************************************
	*/
	/*********************************************************************
	* Overview: Horizontal and vertical display resolution
	*                  (from the glass datasheet).
	*********************************************************************/
	#define DISP_HOR_RESOLUTION				800
	#define DISP_VER_RESOLUTION				480
	/*********************************************************************
	* Overview: Image orientation (can be 0, 90, 180, 270 degrees).
	*********************************************************************/
	#define DISP_ORIENTATION				0
	/*********************************************************************
	* Overview: Panel Data Width
	*********************************************************************/
	#define DISP_DATA_WIDTH                 24
	/*********************************************************************
	* Overview: LSHIFT Polarity Swap
	* If defined LSHIFT is a falling trigger
	*********************************************************************/
	//#define DISP_INV_LSHIFT
	/*********************************************************************
	* Overview: Horizontal synchronization timing in pixels
	*                  (from the glass datasheet).
	*********************************************************************/
	#define DISP_HOR_PULSE_WIDTH		128  
	#define DISP_HOR_BACK_PORCH			88
	#define DISP_HOR_FRONT_PORCH		40	

	/*********************************************************************
	* Overview: Vertical synchronization timing in lines
	*                  (from the glass datasheet).
	*********************************************************************/
	#define DISP_VER_PULSE_WIDTH		2
	#define DISP_VER_BACK_PORCH			25	
	#define DISP_VER_FRONT_PORCH		18


	/*********************************************************************
	* Definition for SPI interface for SSD1963 
	* Hardware dependent!
	*********************************************************************/
	#define GPIO3 3
	#define GPIO2 2
	#define GPIO1 1
	#define GPIO0 0
	#define LCD_RESET (1<<GPIO0)		//LCD Reset signal (Reset for display panel, NOT ssd1963)
	#define LCD_SPENA	0
	#define LCD_SPCLK	0
	#define LCD_SPDAT	0
	/* End of definition for DISPLAY_PANEL == TY500TFT800480 */
#elif (DISPLAY_PANEL == TY700TFT800480)
	/*
	*********************************************************************
	* TIMING PARAMETERS FOR 7" TFT PANEL (800x480):
	* PART# TY700TFT800480
	* Reamrks: 	By accident, a QA procedure for TY700TFT800480 discovered!
	*			Set all parameters as follows for a built-in display 
	*			R,G,B, and B&W spare pattern
	*		#define DISP_VER_PULSE_WIDTH		0
	*		#define DISP_VER_BACK_PORCH			0	
	*		#define DISP_VER_FRONT_PORCH		0
	*
	*		Normal operating values 
	*		#define DISP_VER_PULSE_WIDTH		1
	*		#define DISP_VER_BACK_PORCH			34	
	*		#define DISP_VER_FRONT_PORCH		10
	*********************************************************************
	*/
	/*********************************************************************
	* Overview: Image orientation (can be 0, 90, 180, 270 degrees).
	*********************************************************************/	
  	#define DISP_ORIENTATION    0
	/*********************************************************************
	* Overview: Panel Data Width (R,G,B) in (6,6,6)
	*********************************************************************/
	#define DISP_DATA_WIDTH                 18
	/*********************************************************************
	* Overview: Horizontal and vertical display resolution
	*                  (from the glass datasheet).
	*********************************************************************/
	#define DISP_HOR_RESOLUTION 800
	#define DISP_VER_RESOLUTION 480
	/*********************************************************************
	* Overview: Horizontal synchronization timing in pixels
	*                  (from the glass datasheet).
	*********************************************************************/
	#define DISP_HOR_PULSE_WIDTH		1
	#define DISP_HOR_BACK_PORCH			210
	#define DISP_HOR_FRONT_PORCH		45	
	/*********************************************************************
	* Overview: Vertical synchronization timing in lines
	*                  (from the glass datasheet).
	*********************************************************************/
	#if defined (TY700TFT_USE_QA_PATTERN)
		#define DISP_VER_PULSE_WIDTH		0
		#define DISP_VER_BACK_PORCH			0	
		#define DISP_VER_FRONT_PORCH		0
	#else
		#define DISP_VER_PULSE_WIDTH		1
		#define DISP_VER_BACK_PORCH			34	
		#define DISP_VER_FRONT_PORCH		10
	#endif

	/*********************************************************************
	* Definition for SPI interface for SSD1963 
	* Hardware dependent!
	*********************************************************************/
	#define GPIO3 3
	#define GPIO2 2
	#define GPIO1 1
	#define GPIO0 0
	#define LCD_RESET 	0
	#define LCD_SPENA	0
	#define LCD_SPCLK	0
	#define LCD_SPDAT	0
	/* End of definition for TY700TFT800480 */

#elif (DISPLAY_PANEL == YOUR_PANEL)
	//...your TFT parameters to be defined here
#endif

