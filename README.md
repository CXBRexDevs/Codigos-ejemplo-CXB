# CXB Rex

Es una plataforma de desarrollo orientada hacia control avanzado de variables físicas, que integra drivers de motores, interfaces de comunicación y acoplo de sensores, como se aprecia en la [imagen]([https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/BASEDibujoCXBareas.png?raw=true](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/015453cbffbb8909efc1b8809f53027d9adc56b4/images/BASEDibujoCXBareas.png)),  con el fin de facilitar experimentos para el desarrollo academico superior.

![]([https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/BASEDibujoCXBareas.png?raw=true](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/015453cbffbb8909efc1b8809f53027d9adc56b4/images/BASEDibujoCXBareas.png))



En este repositorio se encuentran los planos y archivos de fabricación, códigos ejemplo, circuitos de prueba externos a la tarjeta electronica y entre otros archivos de interés.

# Guía de instalación programador

## Advertencia: Pickit 3 solo es compatible con versiones de MPLAB anteriores a la versión 6.05

## Programas necesarios

- MPLAB IDE

- Compilador XC32

- MPLAB Code Configurator
  
  ## MPLAB IDE
  
  Para la instalación de estos dos programas se debe ingresar a [MPLAB® X IDE | Microchip Technology](https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide) . Una vez en la página, seleccione la opción “Download MPLAB X IDE” y posteriormente descargue la versión de Windows.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/2023-07-07-10-11-16-image.png?raw=true)

Puede descargar versiones anteriores navegando en la misma página al botón "Go To Downloads Archives" y buscando en el navegador su versión predilecta.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/2023-07-07-10-13-20-image.png?raw=true)

Una vez descargado el archivo abra el ejecutable.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/2023-07-07-10-55-47-image.png?raw=true)

![](C:\Users\PEDRO\AppData\Roaming\marktext\images\2023-07-07-10-22-03-image.png)

Ahora debe dar clic en aceptar el acuerdo de usuario y así poder seguir el proceso de instalación haciendo clic en ‘next’.

![]([C:\Users\PEDRO\AppData\Roaming\marktext\images\2023-07-07-10-25-39-image.png](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/2023-07-07-10-25-39-image.png?raw=true)https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/2023-07-07-10-25-39-image.png?raw=true)

Escoja el directorio donde desea instalar MPLAB X IDE y pulse siguiente.

![Modificar la ruta por defeco de instalación es opcional.](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image4.png?raw=true)

Ahora el instalador preguntará cuáles programas desea instalar, se recomienda la instalación de todos los aplicativos de la imagen abajo, pero para el uso de CXB-REX, solo es necesario “MPLAB X IDE” y “32 bit MCUs”.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image16.png?raw=true)

Al hacer clic en siguiente se iniciará la instalación.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image11.png?raw=true)
![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image12.png?raw=true)

Espere a que termine la instalación y haga clic en finalizar una vez la opción se habilite.

## MPLAB XC32 COMPILER:

Ingrese a [MPLAB XC Compiler Downloads and Documentation | Microchip Technology](https://www.microchip.com/en-us/tools-resources/develop/mplab-xc-compilers/downloads-documentation) y seleccione la opción “XC32 Compilers” y posteriormente descargue la versión de Windows.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image13.png?raw=true) ![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image14.png?raw=true)

Una vez se ha descargado el instalador, ejecute la aplicación, los pasos a seguir son los mismos que para la instalación de MPLAB IDE, excepto por el tipo de licencia, en la cual debe seleccionar ‘free’.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image15.png?raw=true)

Después de escoger la licencia, se escoge el directorio de instalación y el programa procederá a instalarse, de la misma manera que MPLAB IDE, solo que al final dirá la información de la licencia, pero debido a que se seleccionó gratuita solo se debe dar clic en next para finalizar.

## MPLAB Harmony V3

El primer paso es abrir MPLAB IDE, luego seleccionar el apartado de "tools" en la parte superior de la pantalla, y en la ventana desplegada seleccionar "Plugins".

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image17.png?raw=true)

En la ventana de plugins seleccionar la pestaña de "Updates" y en el listado buscar si se encuentra “MPLAB@ Code Configurator”, si es el caso seleccionelo y haga clic en "Update".

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image18.png?raw=true)

Aparecerá una nueva ventana dandole la bienvenida al instalador, haga clic en “Next” empezará la instalación.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image19.png?raw=true)

Luego de terminar aparecerá una ventana solicitando reiniciar MPLAB IDE para que los cambios tengan efecto, acepte y finalice.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image20.png?raw=true)

## Extensiones de Harmony 3:

Una vez se ha reiniciado MPLAB IDE con la instalación de harmony 3, seleccionamos en la pestaña Tools -> Embedded -> MPLAB Code Configurator v5 Open/Close

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image21.png?raw=true)

La primera vez que se inicia el programa mostrará un cuadro con el framework a elegir, en este caso se selecciona Harmony.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image22.png?raw=true)

Una vez seleccionado aparecerá una tabla que indicara las extensiones requeridas.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image23.png?raw=true)

En caso de ser necesario también puede seleccionar las casillas del contenido opcional para que sean también se instale ese contenido, haga clic en "Finish" y espere, esto puede tomar unos minutos.  Se abrirá el siguiente entorno cuando haya terminado

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/image24.png?raw=true)

Ahora puede seguir la guía en "Mi primer proyecto", la cuál le guirá en este mismo proceso y le indicará como programar comunicación UART a USB o UART a RS232. También puede descargar este repositorio y abrir algún otro de los proyectos aquí descritos.
