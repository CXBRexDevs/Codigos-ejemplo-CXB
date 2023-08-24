# Hardware
Este código utiliza el módulo PWM número 1, El periodo se configuró por medio de los registros del pwm de la familia del microcontrolador PIC32.


```C
#define PERIODO_PWM      1000 
#define PORCENT          1     

int main(void)
{
    // Inicializa el módulo PWM
    MCPWM_Initialize();
    MCPWM_Start();
    
    // Establece un ciclo útil
    MCPWM_ChannelPrimaryDutySet(MCPWM_CH_1, PERIODO_PWM * 1);
```


En el espacio superior se puede apreciar una fracción del código "[main.c](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/EjemploPWM/firmware/src/main.c)" del ejemplo del PWM donde en las primeras líneas se pueden modificar el periodo del PWM y el ciclo útil respectivamente, más abajo se puede ver la inicialización del pwm al igual que la función que establece el periodo de PWM en el canal primario.


![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PWM_grafica.png?raw=true)
>**NOTA: imagen referenciada de: https://microchipdeveloper.com/pwr3101:pwm-operations**


En esta gráfica se puede apreciar el ciclo completo del PWM, que se dividide en PWMH y PWML, además se visualiza el "tiempo muerto" que ocurre inmediatamente antes del cambio de estado de los transistores con el fin de proteger los componentes.


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

