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

/* Define a dentro del buffer el mensaje que se enviará por
medio del UART5*/
unsigned char buffer[]="Hola mundo";

int main ( void )
{
    
    SYS_Initialize ( NULL );

    while ( true )
    {
        if(PULSE1_Get()){ // Si el valor de PULSE1 es verdadero
        	LED1_Set(); // Encienda LED1
        	LED0_Clear(); // Apague LED0
        	CORETIMER_DelayMs (500); // Espere 0.5 segundos
    	}
    	else{
        	LED0_Set(); // Encienda LED0
        	LED1_Clear(); // Apague LED1
        	CORETIMER_DelayMs (500); // Espere 0.5 segundos
    	}
	
        /*Envié el mensaje almacenado en la variable ?buffer? a
        UART5 y espere un segundo*/
        UART5_Write(&buffer[0],sizeof(buffer));
        CORETIMER_DelayMs (1000);

        SYS_Tasks ( );
    }

    
    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

