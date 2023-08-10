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
#include <time.h>
#include <math.h>

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

char dataRead[16] = "";
char dataBin[35];
int buf;
char dataOk;
float DataInt;
float DataExt;
float timee=0;
uint32_t recivedData;

void TIMER1_InterruptSvcRoutine(uint32_t status, uintptr_t context)
{
    timee=timee+pow(10,-2);
}
bool TermoparReady(uint32_t value) //
{    
    //Leectura de errores
    switch(value & 0x7){
        case 0b001:
            printf("No se detecta un termopar \n");
            return false;
            break;
        case 0b010:
            printf("Termopar en corto circuito con tierra \n");
            return false;
            break;
        case 0b100:
            printf("Termopar en corto circuito con VCC \n");
            return false;
            break;
        default:
            return true;
    }
    //Lectura error de SCV, SCG o OC
    if((value & 0x10000) == 0x10000){printf("error de SCV, SCG o OC \n");
        return false;
    }else{return true;}      
}

void TermoparC(int32_t v, float *centigrade)
{

    if (v & 0x80000000) {
      // Negative value, drop the lower 18 bits and explicitly extend sign bits.
      v = 0xFFFFC000 | ((v >> 18) & 0x00003FFF);
    } else {
      // Positive value, just drop the lower 18 bits.
      v >>= 18;
    }

    // Convert to double before applying multiplication
    double temp = (double)v;

    // LSB = 0.25 degrees C
    temp *= 0.25;

    // Assign the result to the float pointed by centigrade
    *centigrade = (float)temp;

    // Return the calculated value (optional, depending on your use case)

}
    
    
void printBinary(uint32_t value, char binaryString[]) {
    int size = sizeof(value) * 8;

    uint32_t mask = 1u << (size - 1);

    int index = 0;
    for (int i = 1; i <= size; i++) {
        binaryString[index++] = (value & mask) ? '1' : '0';
        if (i == 1 || i == 14 || i == 15 || i == 16 || i == 17  || i == 28 || i == 29) {
            binaryString[index++] = ' ';
        }
        if (i == 12 || i == 24 ) {
            binaryString[index++] = '.';
        }
        mask >>= 1;
    }

    binaryString[index] = '\0';
}



int main ( void )
{
    TMR1_CallbackRegister(TIMER1_InterruptSvcRoutine, (uintptr_t) NULL);Initialize all modules */
    SYS_Initialize ( NULL );
     
    
    SPI1_Initialize();
    SPI3_Initialize();
    UART5_Initialize();
    
    printf("\n \n \n \n \n \n \n \n \n \n \n \n \n \n");
    printf("\n \n \n \n \n \n \n \n \n \n \n \n \n \n");
    printf("#############################\n");
    printf("#                           #\n");
    printf("#   Lectura de termocupla   #\n");
    printf("#                           #\n");
    printf("#############################\n");
    
    
    
    while ( true )
    {
        SPI1_Read(&recivedData,32); //Lee los datos del bus SPI
        uint32_t asd = recivedData;
        printBinary(asd, dataBin);
        if(!TermoparReady(recivedData)){
            printf("Revise sus coneciones \n");
        }else{
            TermoparInt(asd, &DataInt);
            TermoparC(asd, &DataExt);
            printf("$%f; \r", DataExt);
        }
        SYS_Tasks ( );
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File  
*/
