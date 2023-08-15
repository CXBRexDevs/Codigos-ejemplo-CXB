# Hardware
Este código utiliza el módulo PWM número 1 que a su vez utiliza los pines 2 y 3 del microcontrolador asignados a "PWM1L" y "PWM1H" cuya salida en la tarjeta se encuentra en "SALIDAA1" y "SALIDAB1", El periodo se configuró por medio de los registros de la familia del microcontrolador "PTPER/STPER" mientras que el ciclo de trabajo se modificó con el registro "PDC1".


![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/Main_PWM.png?raw=true)


En la imagen superior se puede apreciar el código "[main.c](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/EjemploPWM/firmware/src/main.c)" del ejemplo del PWM donde en la línea 30 y 31 se pueden modificar el periodo del PWM y el ciclo útil respectivamente, más abajo se puede ver la inicialización del pwm y en la línea 40 la función que establece el periodo de PWM en el canal primario.


![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/PWM_grafica.png?raw=true)


En esta gráfica se puede apreciar el ciclo completo del PWM, que se dividide en "PTPER" y "STPER" que son los periodos previos al ciclo útil para PWMH y PWML, además se visualiza el tiempo muerto "DTR" que ocurre inmediatamente antes del cambio de estado de los transistores, y finalmente se destaca el ciclo útil "PDC" que representa el periodo de actividad del motor.


Para más información sobre el PWM se puede buscar en [https://ww1.microchip.com/downloads/en/DeviceDoc/61111E.pdf](https://ww1.microchip.com/downloads/en/DeviceDoc/61111E.pdf).

