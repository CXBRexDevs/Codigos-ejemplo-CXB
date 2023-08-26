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


// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************


int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    ADCHS_Initialize();
    
    printf("################################\n");
    printf("#                              #\n");
    printf("#    Prueba de Lectura ADC     #\n");
    printf("#                              #\n");
    printf("################################\n");
    
    int result[3];
    
    while ( true )
    {
        /* Trigger a conversion */
        ADCHS_GlobalEdgeConversionStart();
        
        /* Wait the conversions to complete */
        /* Wait the conversions to complete */
        while(ADCDSTAT1bits.ARDY17 == 0);
        /* fetch the result */
        result[0] = ADCDATA17;
        
        while (ADCDSTAT1bits.ARDY18 == 0);
        /* fetch the result */
        result[1] = ADCDATA18;
        
        while (ADCDSTAT1bits.ARDY19 == 0);
        /* fetch the result */
        result[2] = ADCDATA19;
        
        printf("%u, %u, %u\r",result[0],result[1],result[2]);
        
        SYS_Tasks ( );
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

