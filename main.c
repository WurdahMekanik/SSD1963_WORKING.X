/******************************************************************************/
/*  Files to Include                                                          */
/******************************************************************************/
#ifdef __XC32
    #include <xc.h>          /* Defines special funciton registers, CP0 regs  */
#endif

#include <plib.h>           /* Include to use PIC32 peripheral libraries      */
#include <stdint.h>         /* For uint32_t definition                        */
#include <stdbool.h>        /* For true/false definition                      */

#include "system.h"         /* System funct/params, like osc/periph config    */
#include "user.h"           /* User funct/params, such as InitApp             */
#include "config_bits.h"
#include "Primitives LLD/SSD1963.h"

/******************************************************************************/
/* Global Variable Declaration                                                */
/******************************************************************************/

/* i.e. uint32_t <variable_name>; */

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

int32_t main(void)
{
    BYTE x, y;
    /*Refer to the C32 peripheral library documentation for more
    information on the SYSTEMConfig function.
    
    This function sets the PB divider, the Flash Wait States, and the DRM
    /wait states to the optimum value.  It also enables the cacheability for
    the K0 segment.  It could has side effects of possibly alter the pre-fetch
    buffer and cache.  It sets the RAM wait states to 0.  Other than
    the SYS_FREQ, this takes these parameters.  The top 3 may be '|'ed
    together:
    
    SYS_CFG_WAIT_STATES (configures flash wait states from system clock)
    SYS_CFG_PB_BUS (configures the PB bus from the system clock)
    SYS_CFG_PCACHE (configures the pCache if used)
    SYS_CFG_ALL (configures the flash wait states, PB bus, and pCache)*/

    /* TODO Add user clock/system configuration code if appropriate.  */
    SYSTEMConfig(SYS_FREQ, SYS_CFG_ALL); 

    /* Initialize I/O and Peripherals for application */
    InitApp();

    /*Configure Multivector Interrupt Mode.  Using Single Vector Mode
    is expensive from a timing perspective, so most applications
    should probably not use a Single Vector Mode*/
    INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);

    /* TODO <INSERT USER APPLICATION CODE HERE> */

    /*
    Configure the device for maximum performance.
    This macro sets flash wait states, PBCLK divider and DRM wait states
    based on the specified clock frequency. It also turns on the cache
    mode if avaialble.
    Based on the current frequency, the PBCLK divider will be set at 1:1.
    This knowledge is required to correctly set UART baud rate, timer
    reload value and other time sensitive setting.
    */
    SYSTEMConfigPerformance(GetSystemClock());
    // Use PBCLK divider of 1:1 to calculate UART baud, timer tick etc.

    ResetDevice();
    SetBacklight(255);	//full brightness

    while(1)
    {
        // Show a few colors as an opening screen
        _color = WHITE;
        ClearDevice();
        DelayMs(1000);

        _color = BLUE;
        ClearDevice();
        DelayMs(1000);

        _color = BRIGHTYELLOW;
        for(x=100; x<200; x++)
        {
            for(y=50; y<120; y++) {PutPixel(x,y);}
        }
        DelayMs(1000);

        _color = LIGHTRED;
        ClearDevice();
        DelayMs(1000);

        _color = BRIGHTBLUE;
        for(x=50; x<90; x++)
        {
            for(y=30; y<200; y++) {PutPixel(x,y);}
        }
        DelayMs(1000);

        _color = BRIGHTGREEN;
        ClearDevice();
        DelayMs(1000);

        _color = BLACK;
        ClearDevice();
        DelayMs(1000);
    }
}