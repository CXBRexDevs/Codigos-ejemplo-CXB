# Hardware
Este código utiliza el módulo PWM número 1, el periodo se configuró por medio de los registros del pwm de la familia del microcontrolador PIC32.


```C
#define PERIODO_PWM      1000  // periodo del PWM
#define PORCENT          1     // ciclo útil del PWM

int main(void)
{
    MCPWM_Initialize();     // Inicializa el módulo PWM
    MCPWM_Start();          // Inicializa el funcionamiento del PWM  
    
    MCPWM_ChannelPrimaryDutySet(MCPWM_CH_1, PERIODO_PWM * 1); // Establece un ciclo útil en el canal 1
```


En el espacio superior se puede apreciar una fracción del código "[main.c](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/EjemploPWM/firmware/src/main.c)" del ejemplo del PWM donde en las primeras líneas se pueden modificar el periodo del PWM y el ciclo útil respectivamente, más abajo se puede ver la inicialización del pwm al igual que la función que establece el periodo de PWM en el canal primario.


![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PWM_grafica.png?raw=true)
>**NOTA: imagen referenciada de: https://microchipdeveloper.com/pwr3101:pwm-operations**


En esta gráfica se puede apreciar el ciclo completo del PWM, que se compone en PWMH y PWML, además se visualiza el "tiempo muerto" que ocurre inmediatamente antes del cambio de estado de los transistores con el fin de proteger los componentes.


A continuación se representa la conexión del motor con encoder realizada en la tarjeta  a traves de la siguiente imagen.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/CXBMOTOR.png)

Las conexiones para este experimento son ejemplificadas en la imagen superior con distintos cables, los cuales representan lo siguiente.

+ ***Cable Negro***: Conexión a tierra
+ ***Cable Rojo***: Alimentación (3.3V)
+ ***Cable Azul***: Entrada B de encoder de cuadratura
+ ***Cable Verde***: Entrada A de encoder de cuadratura
+ ***Cable Café***: Entrada B de motor 
+ ***Cable Morado***: Entrada A de motor


Para invertir el sentido de giro con relación a la lectura del encoder se pueden intercambiar los cables representados en el color **Café** y **Morado**, ya que son las conexiones de salida de los medio puente H de la tarjeta electrónica, o tambien se pueden invertir los cables **Azul** y **Verde**

M1SRC ubicado en la bornera de la zona superior izquierda de la [tarjeta electrónica](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/015453cbffbb8909efc1b8809f53027d9adc56b4/images/BASEDibujoCXBareas.png) es el voltaje de alimentación para los medio puente H, donde se recomienda un voltaje entre 8 y 18 voltios, también se debe conectar la conexión a tierra para el componente en la bornera.

GND JMPR ubicado en la zona inferior izquierda de la [tarjeta electrónica](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/015453cbffbb8909efc1b8809f53027d9adc56b4/images/BASEDibujoCXBareas.png) es una terminal para un jumper que se puede conectar para compartir la tierra del medio puente H con la tierra del microcontrolador en la tarjeta


Para más información sobre el PWM se puede buscar en [https://ww1.microchip.com/downloads/en/DeviceDoc/61111E.pdf](http://ww1.microchip.com/downloads/en/DeviceDoc/60001393A.pdf).

