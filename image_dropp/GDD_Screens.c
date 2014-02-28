
/*****************************************************************************
* Microchip Graphics Library
* Graphics Display Designer (GDD) Template
*****************************************************************************
 
* Dependencies:    See INCLUDES section below
* Processor:       PIC24F, PIC24H, dsPIC, PIC32
* Compiler:        MPLAB C30 V3.22, MPLAB C32 V1.05b
* Linker:          MPLAB LINK30, MPLAB LINK32
* Company:         Microchip Technology Incorporated
*
* Software License Agreement
*
* Copyright (c) 2010 Microchip Technology Inc.  All rights reserved.
* Microchip licenses to you the right to use, modify, copy and distribute
* Software only when embedded on a Microchip microcontroller or digital
* signal controller, which is integrated into your product or third party
* product (pursuant to the sublicense terms in the accompanying license
* agreement).  
*
* You should refer to the license agreement accompanying this Software
* for additional information regarding your rights and obligations.
*
* SOFTWARE AND DOCUMENTATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
* KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY
* OF MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR
* PURPOSE. IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR
* OBLIGATED UNDER CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION,
 
* BREACH OF WARRANTY, OR OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT
* DAMAGES OR EXPENSES INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL,
* INDIRECT, PUNITIVE OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA,
* COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY
* CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
* OR OTHER SIMILAR COSTS.
*
* Author               Date        Comment
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*
*****************************************************************************/


/***************************************************
*INCLUDE FILES
***************************************************/
#include "Graphics/Graphics.h"
#include "GDD_Screens.h"

/***************************************************
* String literals used in the project
***************************************************/


/***************************************************
* Scheme Declarations
***************************************************/
GOL_SCHEME* defscheme;


/***************************************************
* Function and global Declarations
***************************************************/
void (*CreateFunctionArray[NUM_GDD_SCREENS])();
void (*CreatePrimitivesFunctionArray[NUM_GDD_SCREENS])();
WORD currentGDDDemoScreenIndex;
BYTE update = 0;
static BYTE updateGPL = 0;

/***************************************************
* Function       : GDDDemoCreateFirstScreen
* Parameters     : none
* Return         : none
* Description    : Creates the first screen
***************************************************/
void GDDDemoCreateFirstScreen(void)
{
    currentGDDDemoScreenIndex = 0;
    update = 1;
    (*CreateFunctionArray[currentGDDDemoScreenIndex])();
}

/***************************************************
* Function      : GDDDemoNextScreen
* Parameters    : none
* Return        : none
* Description   : Updates counter to show next screen
***************************************************/
void GDDDemoNextScreen(void)
{
    currentGDDDemoScreenIndex++;
    if(currentGDDDemoScreenIndex >= NUM_GDD_SCREENS)
    {
        currentGDDDemoScreenIndex = 0;
    }
    update = 1;
}

/***************************************************
* Function      : GDDDemoGoToScreen
* Parameters    : int screenIndex
* Return        : none
* Description   : Show the screen referred by the index
***************************************************/
void GDDDemoGoToScreen(int screenIndex)
{
    currentGDDDemoScreenIndex = screenIndex;
    if(currentGDDDemoScreenIndex >= NUM_GDD_SCREENS)
    {
        currentGDDDemoScreenIndex = 0;
    }
    update = 1;
}

/***************************************************
* Function       : GDDDemoGOLDrawCallback
* Parameters     : none
* Return         : none
* Description    : Callback to do the actual drawing of widgets
***************************************************/
void GDDDemoGOLDrawCallback(void)
{
    if(updateGPL)
    {
        (*CreatePrimitivesFunctionArray[currentGDDDemoScreenIndex])();
        updateGPL = 0;
    }

    if(update)
    {
        (*CreateFunctionArray[currentGDDDemoScreenIndex])();
        if(CreatePrimitivesFunctionArray[currentGDDDemoScreenIndex] != NULL)
        {
            updateGPL = 1;
        }
        update = 0;
    }
}

/***************************************************
* Function       : CreateError
* Parameters     : none
* Return         : none
* Description    : Creates a Error screen 
***************************************************/
void CreateError(char* string)
{
    // Blue Screen Error
    SetColor(119);
    ClearDevice();
    SetColor(-1);

    // Flash Error Message
    if(string == NULL)
        {OutTextXY(0, 0, "Runtime Error.");}
    else
        {OutTextXY(0,0, string);}
}

/***************************************************
* Function 	      :    CreateFIRST
* Parameters      :    none
* Return          :    none
* Description     :    Creates GOL widgets used in screen - FIRST
***************************************************/
void CreateFIRST(void)
{
    GOLFree();
    SetColor(RGBConvert(248, 252, 248));
    ClearDevice();


     if(defscheme != NULL) free(defscheme);
        defscheme = GOLCreateScheme();

    defscheme->Color0 = RGBConvert(32, 168, 224);
    defscheme->Color1 = RGBConvert(16, 132, 168);
    defscheme->TextColor0 = RGBConvert(24, 24, 24);
    defscheme->TextColor1 = RGBConvert(248, 252, 248);
    defscheme->EmbossDkColor = RGBConvert(248, 204, 0);
    defscheme->EmbossLtColor = RGBConvert(24, 116, 184);
    defscheme->TextColorDisabled = RGBConvert(128, 128, 128);
    defscheme->ColorDisabled = RGBConvert(208, 224, 240);
    defscheme->CommonBkColor = RGBConvert(208, 236, 240);
    defscheme->pFont = (void*)&Gentium_16;


    PICTURE *pPCB_1;
    pPCB_1 = PictCreate(  PCB_1, //name
                       0, //left
                       0, //top
                       479, //right
                       271, //bottom
                       PICT_DRAW, //state
                       1, //scale
                       (void*)&1newABID - lock, //bitmap
                      defscheme //scheme
                    );

    if(pPCB_1==NULL)
    {
      CreateError(0);
      while(1); //Fatal Error, Check for memory leak or heap size
    }


}

/***************************************************
* Function       : CreateFunctionArray
* Parameters     : none
* Return         : none
* Description    : Creates a array of GOL function pointers
***************************************************/
void (*CreateFunctionArray[NUM_GDD_SCREENS])(void)=
    
{
    &CreateFIRST,
};



/***************************************************
* Function       : CreatePrimitivesFunctionArray
* Parameters     : none
* Return         : none
* Description    : Creates a array of GPL function pointers
***************************************************/
void (*CreatePrimitivesFunctionArray[NUM_GDD_SCREENS])(void)=
    
{
    NULL,
};


