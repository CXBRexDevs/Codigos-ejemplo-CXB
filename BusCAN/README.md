# Hardware

Para utilizar la comunicación del protocolo CAN es necesaria la implementación de un transceptor "TJA1050", en las siguientes imágenes se ilustra el circuito y las funciones del integrado.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/TJA1050_CAN.png?raw=true)

El esquema de conexión se ilustra en la siguiente figura, donde el pin #5 (Vref) no se utiliza para este ejemplo.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/Plano-1.png?raw=true)

Conecte uno de los transceptores a los terminales "CAN_TX" y "CAN_RX", así como se muestra en la siguiente figura.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/CXBCAN.png?raw=true)

Energice y programe el microcontrolador, conecte los terminales CANHI y CANLO a otro dispositivo CAN para empezar a transmitir o recibir mensajes como se muestra en la siguiente figura.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/comunicacion_can.png?raw=true)

Para comunicar el microcontrolador con otro dispositivo se deben utilizar dos transceptores, uno para las terminales CANH y CANL de la tarjeta, se recomienda utilizar el mencionado anteriormente 'TJA1050' para la conexion de la tarjeta, y otro transceptor para el otro dispositivo de comunicación externo, cabe aclarar que un dispositivo CAN puede disponer de un transceptor al igual que un módulo para comunicación integrados, por lo que se pueden usar para que cumpla el papel de los dos componentes (transceptor y módulo de comunicación). La conexión se debe realizar como se observa en la imagen superior.

Para encontrar una mayor información sobre el módulo CAN puede buscar en la [Documentación de módulo CAN](https://ww1.microchip.com/downloads/en/DeviceDoc/61154C.pdf)

# Software

Descargue y abra este proyecto en MPLAB, al concluir la progrmación y adecuada conexión del puerto serial, el terminal serial presentará un menú al usuario, brindándole la opción de presionar el número 1 para transmitir información, o en su lugar presionar el número 2 para recibir información, si se produce un error o inconveniente durante la comunicación al igual que si el usuario provee una entrada incorrecta en el menú el programa notificará lo ocurrido y retornará al menú para solicitar nuevamente una respuesta del usuario para transmitir o recibir información. Este ejemplo fue adaptado de "[can normal operation interrupt timestamp](https://github.com/Microchip-MPLAB-Harmony/csp_apps_pic32mx/tree/master/apps/can/can_normal_operation_interrupt_timestamp)" y fué adaptado para ser compatible con CXB Rex usando un PIC32MK1024MCF064.
