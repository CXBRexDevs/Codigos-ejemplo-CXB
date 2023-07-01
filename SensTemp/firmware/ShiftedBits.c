/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains a test to demonstrate the correction of the shifted bits 
    due to the MAX31855 working at 14 bit, while PIC32MC family working at 16 
    bit.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include <string.h>                     // Defines String
#include <stdio.h>

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

char dataRead[16] = "";
unsigned char dataRaw[] =   "Raw Data:     ";
unsigned char dataShift[] = "Shifted Data: ";
uint16_t recivedData;
uint16_t bitMask = 0x3FFF;

void writeBinaryData(uint16_t value)
{
    char binaryString[17];  
    binaryString[16] = '\0';  
    
    for (int i = 15; i >= 0; i--)
    {
        binaryString[i] = (value & 1) ? '1' : '0';
        value >>= 1;
    }
    
    UART5_Write(binaryString, strlen(binaryString));
}

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    
    SPI1_Initialize();
    UART5_Initialize();
    
    while ( true )
    {
        SPI1_Read(&recivedData,16); //Lee los datos del bus SPI
        
        UART5_Write(&dataRaw[0],sizeof(dataRaw));
        writeBinaryData(recivedData);
        UART5_Write("\n", 1);
        
        uint16_t shiftedData = (recivedData >> 2) & bitMask; //Corre los datos para compensar los 14 bits del max31855
        UART5_Write(&dataShift[0],sizeof(dataShift));
        writeBinaryData(shiftedData);
        UART5_Write("\n", 1);
        
        CORETIMER_DelayMs(1000);
        
        SYS_Tasks ( );
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/
