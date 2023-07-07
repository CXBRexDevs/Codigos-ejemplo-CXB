# Sensor de temperatura

## Requisitos:

- MPLAB IDE

- Compilador XC32

- MCC

- Conversor TTL a USB

- Termopar tipo K

- Haber concluido tutorial "MiPrimerProyecto"

En este ejemplo se programará el puerto SPI se usa para interpretar la señal de la interfaz MAX31855 para la lectura de termopares de tipo K. Empiece por crear un proyecto igual que como indica en la siguiente foto. 

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SPI2.png?raw=true)

Una ves abra el entrono Agregue los perifericos CORETIMER, SPI1, UART5 y STDIO.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SPI3.png?raw=true)

Configure el periférico UART5 de la siguiente forma.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SPI4.png?raw=true)

Luego configure SPI1 de la siguiente forma.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SPI5.png?raw=true)

Abra el desplegable plugins en la área de compsición y seleccione el menú "Clock Configuration"

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SPI10.png?raw=true)

El driver MAX31855 no puede funcionar a más de 5MHz, cualquier frecuencia más alta que esta comprometerá la señal y podrá recalentar el chip hasta dañarlo, es por esto que se configura el reloj asignado a este periférico (PBCLK2) a 4MHz, esto puede lograrse cambiando su fuente a "FRCDIV".

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SPI11.png?raw=true)  

Nótece que esto también cambiará la frecuencia de sistema (SYSCLK) que es usada por el procesador y el periférico UART, puede evitar esto modificando cualquiera de los registros que defienen las fuentes de reloj de los periféricos usados para que usen fuentes mas adecuadas si así lo ve necesario.

Abra el menú de plugins y configure los pines de la siguiente forma.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SPI6.png?raw=true)

Genere el código haciendo clic en el  botón "Generate"

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SPI7.png?raw=true)

Una ves haya terminado, busque y abra el archivo "main.c" en el directorio "/Source Files"
![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SPI8.png?raw=true)

Defina las siguientes librerías para habilitar la manipulación de variables de tipo string

```c
#include <string.h>                     // Defines String
#include <stdio.h>
```

Defina las varibles como se muestra a continuación

```c
char dataRead[16] = "";
unsigned char dataOk[] =  "Temperatura:";
uint16_t recivedData;
uint16_t bitMask = 0x3FFF;
```

La lectura del puerto SPI se hace con el comando "SPI1_Read(&A, B)", dónde &A es el puntero de la variable en la que se almacenará la información recibida, mientras que B es el tamaño de la varaible A, en este caso A es recivedData, como se definió arriba de 16 bits, B debe ser igual a 16.

```c
SPI1_Read(&recivedData,16); //Lee los datos del bus SPI
```

El módulo MAX31855 entrega información a 14 bits, pero como pudo notar la configuración de periférico SPI en su PIC32 solo le permite usar 8, 16 y 32 bits, por lo cuál es necesario corregir la información recibida. Para esto, se hara corrimiento de los bits hacia la izquierda y luego se aplica una máscara para mantener fidelidad en la medición.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SPI9.png?raw=true)

```C
uint16_t shiftedData = (recivedData >> 2) & bitMask; //Corre los datos para compensar los 14 bits del max31855
```

> Nota: Puede experimentar explorar esto más a fondo revisando el código "ShiftedBits.c" en el directorio [firmware](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/tree/main/SensTemp/firmware) de este proyecto.

Imprima la información recibida haciendo uso de un buffer, la instrucción "sprintf()" junto con la información imprima un testigo que le indique que está leyendo y finalmente agregue un final de línea.

```c
sprintf(dataRead,"%u\n", regData);
UART5_Write(&dataOk[0],sizeof(dataOk)); 
UART5_Write(dataRead, strlen(dataRead));
UART5_Write("\n", 1);
```

Finalmente agregue un temporizador para repetir el proceso cada segundo.

```c
CORETIMER_DelayMs(1000);
```

Su código debería verse de la siguiente forma:

```c
#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include <string.h>                     // Defines String
#include <stdio.h>

char dataRead[16] = "";
unsigned char dataOk[] =  "Temperatura:";
uint16_t recivedData;
uint16_t bitMask = 0x3FFF;

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );

    while ( true )
    {
        SPI1_Read(&recivedData,16); //Lee los datos del bus SPI

        uint16_t shiftedData = (recivedData >> 2) & bitMask; //Corre los datos para compensar los 14 bits del max31855

        sprintf(dataRead,"%u\n", regData);  //Pone en Buffer los datos movidos
        UART5_Write(&dataOk[0],sizeof(dataOk)); //Imprime la variable dataOk
        UART5_Write(dataRead, strlen(dataRead)); //Imprime al valor leido del desde el periférico SPI1
        UART5_Write("\n", 1); //Imprime un final de línea

        CORETIMER_DelayMs(1000); //Eséra un segundo antes deempezar de nuevo

        SYS_Tasks ( );
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
```

. . .
