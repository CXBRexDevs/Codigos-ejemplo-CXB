# Mi primer proyecto MCC HARMONY

Para empezar cualquier proyecto bajo la infraestructura de harmony v3 es necesario empezar por crear un proyecto, haga clic sobre la pestaña “File”, en la parte superior izquierda de la pantalla, luego haga clic en “New Project”. Una ventana nueva se desplegará. Seleccione la opción “32-bit MCC Harmony project”, luego pulse el botón “Next”. 

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto1.png?raw=true)

Por defecto viene seleccionado el repositorio del cual se integra harmony 3 ([Microchip MPLAB Harmony GitHub](https://github.com/Microchip-MPLAB-Harmony/)) y la ruta donde se instalará para este proyecto (C:\Users\USUARIO\.mcc\HarmonyContent). No es necesario cambiar estas rutas, pulse el botón “Next”.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto2.png?raw=true)

El siguiente paso es escoger la ruta en la que se guardará su proyecto y definir su nombre, para este ejemplo, cambiaremos el nombre por defecto de la ruta a “MiPrimerProyecto” (1) y el nombre del proyecto a “HolaMundo” (2).

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto3.png?raw=true)

Asegúrese de seleccionar el pic instalado en su tarjeta, CXB Rex es compatible con la familia de microcontroladores PIC32MKxxxxMCF064. En este ejemplo se selecciona PIC32MK1024MCF04.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto4.png?raw=true)

Haga clic en “Finish” para terminar el proceso de creación del proyecto.

## Entorno

Una vez creado su proyecto, inicie MCC haciendo clic en el icono “Mplab Code Configurator” ![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/MCCBOTON.png?raw=true)para iniciar la configuración. Una vez haya abierto el entorno de configuración usted verá 3 áreas diferentes.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto5.png?raw=true)

1. **Área de composición:** En esta área usted podrá visualizar las diversas configuraciones disponibles a una macro escala, esto incluye periféricos, interconexiones que existen entre ellos, configuración de pines, de reloj, entre otros.

2. **Área de recursos:** En esta área se presentan los periféricos, en “Device Reourses” se encuentran los que podrá agregar a su proyecto y en “Project Resourses” se ubican los recursos y periféricos ya agregados.

3. **Área de configuración:** Aquí se mostrarán, al seleccionar un periférico en el área de composición y las configuraciones específicas de ese periférico.

## Comunicación serial (Hola Mundo)

Para este proyecto usted necesitará:

- Conversor de UART a USB y/o conversor RS232 a USB. 

- Protoboard.

- 2 diodos emisores de luz.

- 2 resistencias de 330 Ω.

- 1 resistencia de 1k Ω.

- Instalar un terminal de puerto serial, por ejemplo RealTerm (en Windows) o CuteCom (en Mac Os o Linux).

Empezaremos por crear un proyecto básico en el que se demuestra el uso de las áreas de MCC, este proyecto enviará un mensaje a través del puerto UART de la tarjeta y le permitirá encender un LED. Empiece por desplegar el menú “Harmony” en “Device Resources” visto en el área de recursos, luego despliegue “Peripherals”, busque la opción UART y escoja el periférico “UART5” haciendo clic en la cruz verde.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto6.png?raw=true)

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto7.png?raw=true)

Aparecerá una caja gris en el área de composición, al hacer clic sobre cualquiera de los cajones en este espacio, este se verá seleccionado, se indica con el recuadro verde a su alrededor. Los ítems seleccionados tienen sus propiedades expuestas en el área de configuración.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto8.png?raw=true)

Despliegue el menú “Tools” en el área de recursos y agregue también el periférico STDIO, que significa "*S*tandard *I*nput-*O*utput *H*eader", este permitirá hacer operaciones estándar a través de los pines, conecte los diamantes de UART5 y STDIO. Agregue también el periférico “Core Timer”.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto9.png?raw=true)

Seleccione UART5 y configure de la siguiente forma.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto10.png?raw=true)

No es necesario hacer configuraciones extra en los demás periféricos.

Despliegue el menú “plugins” visto en la parte superior del área de composición y seleccione la opción “pin configuration”.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto11.png?raw=true)

Se abrirán 3 pestañas en el área de configuración, las tres son una representación gráfica diferente de la configuración de pines, su función y sus nombres.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto12.png?raw=true)

Usted puede escoger la configuración de los pines desde la pestaña de su preferencia, pero para nuestros fines usaremos la pestaña “pin settings”. Busque el pin 23, haga clic en el desplegable visto en la columna “Function” y seleccione la opción GPIO, para hallarla más fácilmente puede pulsar la letra “G” en su teclado, acto seguido nombre el pin haciendo doble clic en la casilla correspondiente sobre la columna “Custom Name” e ingrese el nombre “LED1”, luego, en la columna “Direction (TRIS)”, escoja “Out” y en la columna “Latch (LAT)” escoja “Low”. Repita este proceso en los pines 33 y 54, cambiando el nombre de los pines a “PULSE1” y “LED0” respectivamente, cambié la dirección de “PULSE1” a “In”.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto13.png?raw=true)

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto14.png?raw=true)

Luego busque los pines 44 y 49, haga clic sobre los desplegables en la columna “Function” y seleccione “U5RX” y “U5TX” respectivamente, nómbrelos “UARTRX” y “UARTTX”. La configuración debe quedar de la siguiente forma.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto15.png?raw=true)

Esto se corresponderá con las otras pestañas, puede visualizar la implementación de estos pines en la pestaña “Pin Diagram”.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto16.png?raw=true)

Genere la configuración de su proyecto haciendo clic en el botón “Generate” en el área de recursos y espere a que MCC termine el proceso.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto17.png?raw=true)

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto18.png?raw=true)

Una vez haya terminado podrá regresar a la pestaña “Projects”, en el área de recursos, y navegar en los archivos del proyecto, MCC habrá generado los archivos de cabecera (header), de extensión .h, archivos de configuración (config-default) y principal (main) de extensión .c estos archivos contienen las funciones de los periféricos configurados y facilitarán la programación de su microcontrolador.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PrimerProyecto19.png?raw=true)

Abra el archivo “main.c” haciendo doble clic en él, luego pegue el siguiente código:

```c
#include <stddef.h>            	// Defines NULL
#include <stdbool.h>           	// Defines true
#include <stdlib.h>            	// Defines EXIT_FAILURE
#include "definitions.h"    	// SYS function prototypes

/* Define a dentro del buffer el mensaje que se enviará por
medio del UART5*/
	unsigned char buffer[]=;
int main ( void )
{
	SYS_Initialize ( NULL );
	while ( true )
	{
	if(PULSE1_Get()){ //Si el valor de PULSE1 es verdadero
        	LED1_Set(); // Encienda LED1
        	LED0_Clear(); // Apague LED0
        	CORETIMER_DelayMs (500); // Espere 0.5 segundos
    	}
    	else{
        	LED0_Set(); // Encienda LED0
        	LED1_Clear(); // Apague LED1
    	}
	
/*Escriba el mensaje en el puerto UART*/
printf("Hola mundo \n");
    	SYS_Tasks ( );
	}
	return ( EXIT_FAILURE );
}

```
Conecte su conversor TTL a USB como se muestra en la siguiente [figura](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/CXBUART.png?raw=true), luego conecte este a su PC, conecte la alimentación de la tarjeta y energicela encendiendo el switch, los LEDs testigos de 3.3V y 5V se encenderán. Programe su microcontrolador.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/CXBUART.png?raw=true)

Una vez haya programado abra el terminal serial predilecto (Ejemplo: realTerm) y configure el puerto serial igual que como se programó previemente el canal UART y abra el terminal, debería ver el mensaje ```Hola mundo``` reescribiendoce constantemente.
