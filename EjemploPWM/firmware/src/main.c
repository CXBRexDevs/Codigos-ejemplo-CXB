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

#include <stddef.h>
#include <stdbool.h>
#include <stdlib.h>
#include "definitions.h"

#define PERIODO_PWM      1000    // periodo del PWM
#define PORCENT          1       // ciclo útil del PWM

int main(void)
{
    // Inicializa el módulo PWM
    MCPWM_Initialize();
    MCPWM_Start();
    
    // Establece un ciclo útil
    MCPWM_ChannelPrimaryDutySet(MCPWM_CH_1, PERIODO_PWM * 1);
    
    while (1)
    {
        // Código principal va aquí
    }
    
    return (EXIT_FAILURE);
}


/*******************************************************************************
 End of File
*/

