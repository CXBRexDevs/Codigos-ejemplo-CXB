# Hardware
El código del conversor análogo digital "[main.c](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/ADC/MyProject/firmware/src/main.c)" inicia con la variable "ctrl" y "conversión", esta última variable debe ser modificada en función de lo que necesite el usuario, por ejemplo si se necesita la mitad de la señal recibida el valor de "conversion" será de 0,5 o si por el contrario se necesita duplicar la señal análoga el valor será de 2. La función transmiter se encarga de enviar el resultado del ADC a través del puerto serial


![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/Codigo_ADC_1.png)


Más abajo de este código se encuentra la inicialización de los módulos del sistema, la configuración del ADC como los triggers, el reloj, referencias de voltaje, tiempo de muestreo entre otros... 

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/Codigo_ADC_2.png)


Y al final se encuentra el bucle para realizar la conversión, obtener el valor convertido, esperar a que la operación de conversión se realice y transmitir el valor obtenido con la función transmiter que se define en la primera parte del código.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/Codigo_ADC_3.png)
