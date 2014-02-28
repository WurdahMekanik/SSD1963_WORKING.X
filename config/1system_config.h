/*******************************************************************************
  MPLAB Harmony Demo Configuration Header

  Company:
    Microchip Technology Incorporated

  File Name:
    system_config.h

  Summary:
    Top-level configuration header file.

  Description:
    This file is the top-level configuration header for the Harmony Demo
    application for the Explorer-16 board with PIC32MX795F512L.
*******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
*******************************************************************************/
// DOM-IGNORE-END

#ifndef _SYS_CONFIG_H
#define _SYS_CONFIG_H

//PMP Data Size
#define USE_16BIT_PMP

//GFX
#define GFX_CONFIG_FONT_ANTIALIASED_DISABLE
#define GFX_CONFIG_FONT_EXTERNAL_DISABLE
#define GFX_CONFIG_IMAGE_EXTERNAL_DISABLE

#define GFX_CONFIG_COLOR_DEPTH              (16)
#define GFX_CONFIG_FONT_CHAR_SIZE           (8)
#define GFX_CONFIG_PALETTE_DISABLE
#define GFX_CONFIG_GOL_DISABLE
#define GFX_CONFIG_FONT_EXTERNAL_DISABLE

//Display
//#define GFX_USE_DISPLAY_PANEL_TFT_G240320LTSW_118W_E

// CLOCK
#define SYS_CLK_CONFIG_USBPLL_ENABLE        true
#define SYS_CLK_PRIMARY_CLOCK               80000000L
#define SYS_CLK_SECONDARY_CLOCK             80000000
#define SYS_CLK_CLOCK_CONFIG_ERROR          10
#define SYS_CLK_CONFIG_USBPLL_DIVISOR       2
#define SYS_CLK_CONFIG_SYSCLK_INP_DIVISOR   2
#define SYS_CLK_CONFIG_SYSCLK_OP_DIVISOR    1
#define SYS_CLK_ON_WAIT_IDLE                1
#define SYS_CLK_ON_WAIT_SLEEP               0
#define SYS_CLK_EXTERNAL_CLOCK	            4000000

// Timer
#define DRV_TMR_COUNT_WIDTH                 32
#define SYS_TMR_MAX_PERIODIC_EVENTS         4
#define DRV_TMR_INDEX                       0
#define DRV_TMR_INTERRUPT_MODE              0
#define DRV_TMR_INSTANCES_NUMBER            4
#define DRV_TMR_CLIENTS_NUMBER              4

// *****************************************************************************
// *****************************************************************************
// Section: Other Include Files
// *****************************************************************************
// *****************************************************************************
#include "config_bits.h"

// *****************************************************************************
// *****************************************************************************
// Section: Analog Configuration
// *****************************************************************************
// *****************************************************************************
#define AD1PCFG_MASK    0x3F03  // AN[13:8] and AN[1:0]as analog ports... 0x3FC3 to add AN[7:6]

// *****************************************************************************
// *****************************************************************************
// Section: SPI Driver Configuration
// *****************************************************************************
// *****************************************************************************

/* Number of driver instances */
#define DRV_SPI_INSTANCES_NUMBER            1
/* Number of client to be supported */
#define DRV_SPI_CLIENTS_NUMBER              1
/* Driver will work in polling mode */
#define DRV_SPI_INTERRUPT_MODE              true
#define DRV_SPI_PORTS_REMAP_USAGE           false
#define DRV_SPI_BUFFER_SIZE                 64

#define DRV_SPI_FRAME_SYNC_PULSE_DIRECTION  SPI_FRAME_PULSE_DIRECTION_INPUT
#define DRV_SPI_FRAME_SYNC_PULSE_POLARITY   SPI_FRAME_PULSE_POLARITY_ACTIVE_HIGH
#define DRV_SPI_FRAME_SYNC_PULSE_EDGE       SPI_FRAME_PULSE_EDGE_COINCIDES_FIRST_BIT_CLOCK

#define DRV_SPI_PERIPHERAL_ID               SPI_ID_1


// *****************************************************************************
// *****************************************************************************
// Section: PMP Configuration
// *****************************************************************************
// *****************************************************************************
#define PMP_CONTROL     (PMP_ON | PMP_READ_WRITE_EN | PMP_MUX_OFF | PMP_WRITE_POL_LO | PMP_READ_POL_LO | PMP_LATCH_POL_LO)
#define PMP_MODE        (PMP_DATA_BUS_16 | PMP_MODE_MASTER2 | PMP_WAIT_BEG_4 | PMP_WAIT_MID_15 | PMP_WAIT_END_4)
#define PMP_PORT        (PMP_PEN_0)
#define PMP_INT         (PMP_INT_OFF)


// *****************************************************************************
// *****************************************************************************
// Section: SDCARD Driver Configuration
// *****************************************************************************
// *****************************************************************************
#define DRV_SDCARD_INSTANCES_NUMBER         1
#define DRV_SDCARD_CLIENTS_NUMBER           1
#define DRV_SDCARD_INDEX_MAX                1
#define DRV_SDCARD_INDEX                    DRV_SDCARD_INDEX_0
#define DRV_SDCARD_QUEUE_POOL_SIZE          10
/* Defines if the card detect logic as designed in hardware */
#define DRV_SDCARD_CD_LOGIC_ACTIVE_LOW


// *****************************************************************************
// *****************************************************************************
// Section: Media Manager Configuration
// *****************************************************************************
// *****************************************************************************
/* Max Number of media used in the demo */
#define SYS_FS_MEDIA_NUMBER     1
/* Max Number of volumes to be allocated  */
#define SYS_FS_VOLUME_NUMBER    1

// *****************************************************************************
// *****************************************************************************
// Section: Driver Configuration
// *****************************************************************************
// *****************************************************************************


// *****************************************************************************
// *****************************************************************************
// Section: System Clock Service Configuration
// *****************************************************************************
// *****************************************************************************
#define SYS_CLK_ClockFrequencyGet(CLK_PERIPHERAL)   80000000

/* Microcontroller MIPs (FCY) */
#define SYS_FREQ     80000000L
#define FCY          SYS_FREQ


// *****************************************************************************
// *****************************************************************************
// Section: SYS FS Configuration
// *****************************************************************************
// *****************************************************************************

/* Max Number of file system to be supported */
#define SYS_FS_MAX_FILE_SYSTEM_TYPE     1
/* Max Number of files that will be opened at a time */
#define SYS_FS_MAX_FILES                2


// *****************************************************************************
// *****************************************************************************
// Section: System Timer Service Configuration
// *****************************************************************************
// *****************************************************************************


// *****************************************************************************
// *****************************************************************************
// Section: OSAL Configuration
// *****************************************************************************
// *****************************************************************************


#endif // _SYS_CONFIG_H
/*******************************************************************************
 End of File
*/


