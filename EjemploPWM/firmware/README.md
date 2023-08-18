# Hardware
Este código utiliza el módulo PWM número 1, El periodo se configuró por medio de los registros de la familia del microcontrolador "PTPER/STPER" mientras que el ciclo de trabajo se modificó con el registro "PDC1".


```C
#define PERIODO_PWM      1000    // periodo del PWM
#define PORCENT          1       // ciclo útil del PWM

int main(void)
{
    // Inicializa el módulo PWM
    MCPWM_Initialize();
    MCPWM_Start();
    
    // Establece un ciclo útil
    MCPWM_ChannelPrimaryDutySet(MCPWM_CH_1, PERIODO_PWM * 1);
```


En el espacio superior se puede apreciar el código "[main.c](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/EjemploPWM/firmware/src/main.c)" del ejemplo del PWM donde en las primeras líneas se pueden modificar el periodo del PWM y el ciclo útil respectivamente, más abajo se puede ver la inicialización del pwm al igual que la función que establece el periodo de PWM en el canal primario.


![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PWM_grafica.png?raw=true)


En esta gráfica se puede apreciar el ciclo completo del PWM, que se dividide en "PTPER" y "STPER" que son los periodos previos al ciclo útil para PWMH y PWML, además se visualiza el tiempo muerto "DTR" que ocurre inmediatamente antes del cambio de estado de los transistores, y finalmente se destaca el ciclo útil "PDC" que representa el periodo de actividad del motor.


![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/CXBMOTOR.png)


+ ***Cable Negro***: Conexión a tierra
+ ***Cable Rojo***: Alimentación (3.3V)
+ ***Cable Azul***: Entrada B de encoder de cuadratura
+ ***Cable Verde***: Entrada A de encoder de cuadratura
+ ***Cable Café***: Entrada B de motor 
+ ***Cable Morado***: Entrada A de motor


Para invertir el sentido de giro se pueden intercambiar los cables representados en el color **Café** y **Morado**, ya que son las conexiones de salida de los medio puente H de la tarjeta electrónica

M1SRC es el voltaje de alimentación para los medio puente H, donde se recomienda un voltaje entre 8 y 18 voltios, también se debe conectar la conexión a tierra para el componente en la bornera.


Para más información sobre el PWM se puede buscar en [https://ww1.microchip.com/downloads/en/DeviceDoc/61111E.pdf](https://ww1.microchip.com/downloads/en/DeviceDoc/61111E.pdf).

