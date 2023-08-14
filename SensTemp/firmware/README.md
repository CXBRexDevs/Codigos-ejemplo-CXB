# Hardware

Para medir la temperatura deberá escoger una termocupla, el chip integrado "MAX31855" es compatible con termopares de tipo K-, J-, N-, T-, S-, R-, o E- y cuenta con una resolución de hasta 0.25°C y una precición de &plusmn;2°C, el rango de temperatura depende del termopar elegido, para mas información puede revisar las [caracteristicas térmicas](https://www.analog.com/media/en/technical-documentation/data-sheets/max31855.pdf#MAX31855%20DS.indd%3AAnchor%3A9803) en el datasheet del integrado.

La información que transmite el conversor cuenta con tres datos, temperatura interna de la unión fría del termopar, temperatura externa del termopar y detección de errores. El ejemplo descrito en este repositorio hace uso únicamente de la detección de errores y lectura de la temperatura externa, estas corresponden a las funciones ``TermoparReady`` y ``TermoparC`` respectivamente. La forma en la que la información es entregada se puede observar en la siguiente [tabla](https://www.analog.com/media/en/technical-documentation/data-sheets/max31855.pdf#MAX31855%20DS.indd%3AAnchor%2021%3A9811):

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/TablaMAXDatos.png?raw=true)

> **Nota:** Es importante que el usuario esté al tanto que independientemente del sensor que escoja, este contará con una no-linealidad intrinseca, aunque el chip ofrezca acoplamiento para su lectura, es posible que las medidas tengan una desviación y esta debe ser tenida en cuenta y corregida de acuerdo a las necesidades del experimento.

Conecte el termopar el terminal SENS TEMP, teniendo en cuenta la polaridad de su sensor.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SenTempClose.png?raw=true)
> Nota: si la medida de temperatura resulta muy sensible al ruido, puede conectar (o soldar) un capacitor de entre 10nF a 100nF a la borna del termopar para mitigar el ruido

Conecte el conversor de información serial TTL a USB a su respectivo terminal y luego conectelo a su PC, abra su terminal serial predilecto (Ejemplo: realTerm), configure el terminal a 9600 baudios.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/SenTempUARTclose.png?raw=true)

Programe el microcontrolador con el ejemplo provisto en este repositorio (SensTemp), podrá ver en el terminal el siguiente menú:



Compare las medidas con las de un termómetro externo para asegurarse que su termopar esta conctado correctamente y que la conversión se está ejecutando adecuadamente. Adicionalmente podrá intercambiar el algoritmo principal en el programa "[main.c](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/SensTemp/firmware/src/main.c)" con el algoritmo "[ShiftedBits.c](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/SensTemp/firmware/ShiftedBits.c)", para comprobar que los datos entregados por el chip MAX31855, concuerdan con la [tabla](https://www.analog.com/media/en/technical-documentation/data-sheets/max31855.pdf#MAX31855%20DS.indd%3AAnchor%2021%3A9811) de registro de datos vista previamente. 
