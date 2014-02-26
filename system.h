/******************************************************************************/
/* System Level #define Macros                                                */
/******************************************************************************/
#include <plib.h>
#include <GenericTypeDefs.h>

/* TODO Define system operating frequency */
#define MIKROSHIT

/* Microcontroller MIPs (FCY) */
#define SYS_FREQ     80000000L
#define FCY          SYS_FREQ

// Specific to PIC32MX processor
#define	GetSystemClock()        (80000000ul)        // 8 MHz/2 x 20 PLL -or- 12MHz/3 x 20 PLL
#define	GetPeripheralClock()    GetSystemClock()    //FPBDIV = DIV_1
#define	GetInstructionClock()   (GetSystemClock())


/******************************************************************************/
/* System Function Prototypes                                                 */
/******************************************************************************/

/* Custom oscillator configuration funtions, reset source evaluation
functions, and other non-peripheral microcontroller initialization functions
go here. */


