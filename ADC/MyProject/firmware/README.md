# Hardware
La configuración con MCC harmony ha presentado inconvenientes para los autores, así que se recomienda hacerla en el código MAIN para este ejemplo, la configuración se encuentra a continuación.
```C
    ADC0CFG = DEVADC0; //Inicia las opciones de coniguración para el ADC
    ADCCON1 = 0; // Desactiva caracteristicas del addcon como la caracteristica turbo y detener en modo inactividad
    ADCCON2 = 0; 
    /* Inicializar el tiempo de calentamiento del registro */
    ADCANCON = 0;
    ADCANCONbits.WKUPCLKCNT = 5; // Establece el tiempo de calentamiento del registro para 2^5 ciclos de reloj
    /* Opciones de reloj */
    ADCCON3 = 0;
    ADCCON3bits.ADCSEL = 0; // Selección de fuente de referencia de reloj
    ADCCON3bits.CONCLKDIV = 1; // El control de frecuencia de reloj es la mitad de la entrada
    ADCCON3bits.VREFSEL = 0; // Selecciona AVDD y AVSS como fuente de referencia
    /*Selección del tiempo de muestreo de ADC y conversión del reloj*/
    ADC0TIMEbits.ADCDIV = 1; // ADC0 control de frecuencia de reloj es la mitad del reloj de control = TAD0
    ADC0TIMEbits.SAMC = 5; // ADC0 tiempo de muestreo = 5 * TAD0
    ADC0TIMEbits.SELRES = 3; // ADC0 resolución de 12 bits
    /* Selección de entrada análoga para módulos ADC */
    ADCTRGMODEbits.SH0ALT = 0; // Selección de entrada análogica para ADC0 = AN0
    /* Selección de modo de entrada ADC */
    ADCIMCON1bits.SIGN0 = 0; // Formato de datos
    ADCIMCON1bits.DIFF0 = 0; // Modo de entrada único
    /* Configuración ADCGIRQENx */
    ADCGIRQEN1 = 0; // Sin uso de interrupciones
    ADCGIRQEN2 = 0;
    /* Configure ADCCSSx */
    ADCCSS1 = 0; // Deshabilitado de canales de escaneo
    ADCCSS2 = 0;
    /* Configuración ADCCMPCONx */
    ADCCMPCON1 = 0;
    ADCCMPCON2 = 0; 
    ADCCMPCON3 = 0; // Desahilitado de comparadores
    ADCCMPCON4 = 0;

    /* Configure ADCFLTRx */
    ADCFLTR1 = 0; // Desactivación de filtros de sobremuestreo
    ADCFLTR2 = 0;
    ADCFLTR3 = 0;
    ADCFLTR4 = 0;

    /* Activar fuentes de disparador o activador*/
    ADCTRGSNSbits.LVL0 = 0; // Configurar el disparador de nivel
    ADCTRG1bits.TRGSRC0 = 1; // Fuente de disparo por el canal 0
    /* Interrupción */
    ADCEIEN1 = 0; // Desactivación de interrupción temprana
    ADCEIEN2 = 0;
    /* Encender el módulo ADC*/
    ADCCON1bits.ON = 1;
    /* Esperar que el voltaje de referencia este estable */
    while(!ADCCON2bits.BGVRRDY); // Esperar que el voltaje de referencia este lista
    while(ADCCON2bits.REFFLT); // Esperar que no haya fallos en el voltaje de referencia
    /* Habilitar circuito de reloj análogo */
    ADCANCONbits.ANEN0 = 1; // 
    /* Esperar que el ADC este listo */
    while(!ADCANCONbits.WKRDY0); // Esperar que ADC0 este listo
    /* Habilitar el módulo ADC */
    ADCCON3bits.DIGEN0 = 1; // Habilitar ADC0
```
>**NOTA: código ejemplo de [https://microchipdeveloper.com/pwr3101:pwm-operations](https://ww1.microchip.com/downloads/en/DeviceDoc/Section22._12-bit_HS_SAR_ADC_FRM_DS60001344E.pdf) (página 66)**


CXB_REX cuenta con un módulo UART, este módulo cuenta con conexiones de transmisión, recepción y GND (tierra). La configuración de UART esta ubicada en el microcontrolador en los pines 42 (RX) Y 44 (TX).

Más adelante se ilustra una imagen que muestra el módulo UART al lado derecho central de la tarjeta y también se ilustra la conexión realizada del módulo UART de la tarjeta con un módulo UART externo.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/CXBUART.png)

A continuación se presenta un listado indicando las conexiones que se observan en la imagen superior.

+**Cable Azul:** Transmisión (UART CXB_REX) → Recepción (UART MÓDULO EXTERNO)
+**Cable Rojo:** Recepción (UART CXB_REX) → Transmisión (UART MÓDULO EXTERNO)
+**Cable Negro:** GND (UART CXB_REX) → GND (UART MÓDULO EXTERNO)

Para encontrar una mayor información sobre el módulo ADC puede buscar en [Microchip Analog-to-Digital Converter (ADC) with Threshold Detect](https://ww1.microchip.com/downloads/en/DeviceDoc/60001359b.pdf).
