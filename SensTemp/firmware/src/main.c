/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

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
unsigned char dataOk[] =  "Temperatura:";
uint16_t recivedData;
uint16_t bitMask = 0x3FFF;

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    
    SPI1_Initialize();
    UART5_Initialize();
    
    while ( true )
    {
        SPI1_Read(&recivedData,16); //Lee los datos del bus SPI
        
        uint16_t shiftedData = (recivedData >> 2) & bitMask; //Corre los datos para compensar los 14 bits del max31855
        uint16_t regData = 1.427*shiftedData-24.57;
        sprintf(dataRead,"%u\n", regData);  //Pone en Buffer los datos movidos
        UART5_Write(&dataOk[0],sizeof(dataOk));
        UART5_Write(dataRead, strlen(dataRead));
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
