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

int main(void)
{
    /* Initialize all modules */
    SYS_Initialize(NULL);

    while (true)
    {
        /* Envia el mensaje CAN */
        uint8_t dato[] = {0xAA, 0x11, 0x1A, 0x06};    //Define el mensaje en "data"
        uint8_t Longdato = sizeof(dato) / sizeof(dato[0]);    // Establece la longitúd del mensaje
        uint32_t Idmensaje = 0x123; // Establece la identificación del mensaje
        uint8_t NumeroFifo = 0;     // Establece el numero del FIFO

        CAN2_MessageTransmit(Idmensaje, Longdato, dato, NumeroFifo, CAN_MSG_TX_DATA_FRAME);

        /* Maintain state machines of all polled MPLAB Harmony modules. */
        SYS_Tasks();
    }

    /* Execution should not come here during normal operation */
    return (EXIT_FAILURE);
}

/*******************************************************************************
 End of File
*/

