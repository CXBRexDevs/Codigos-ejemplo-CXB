# Hardware
La configuración con MCC harmony ha presentado inconvenientes para los autores, así que se recomienda hacerla en el código MAIN para este ejemplo, la configuración se encuentra a continuación.
```C
    ADC0CFG = DEVADC0;
    /* Configure ADCCON1 */
    ADCCON1 = 0; // No ADCCON1 features are enabled including: Stop-in-Idle, turbo,
    // CVD mode, Fractional mode and scan trigger source.
    /* Configure ADCCON2 */
    ADCCON2 = 0; // Since, we are using only
    /* Initialize warm up time register */
    ADCANCON = 0;
    ADCANCONbits.WKUPCLKCNT = 5; // Wakeup exponent = 32 * TADx
    /* Clock setting */
    ADCCON3 = 0;
    ADCCON3bits.ADCSEL = 0; // Select input clock source
    ADCCON3bits.CONCLKDIV = 1; // Control clock frequency is half of input clock
    ADCCON3bits.VREFSEL = 0; // Select AVDD and AVSS as reference source
    /* Select ADC sample time and conversion clock */
    ADC0TIMEbits.ADCDIV = 1; // ADC0 clock frequency is half of control clock = TAD0
    ADC0TIMEbits.SAMC = 5; // ADC0 sampling time = 5 * TAD0
    ADC0TIMEbits.SELRES = 3; // ADC0 resolution is 12 bits
    /* Select analog input for ADC modules, no presync trigger, not sync sampling */
    ADCTRGMODEbits.SH0ALT = 0; // ADC0 = AN0
    /* Select ADC input mode */
    ADCIMCON1bits.SIGN0 = 0; // unsigned data format
    ADCIMCON1bits.DIFF0 = 0; // Single ended mode
    /* Configure ADCGIRQENx */
    ADCGIRQEN1 = 0; // No interrupts are used
    ADCGIRQEN2 = 0;
    /* Configure ADCCSSx */
    ADCCSS1 = 0; // No scanning is used
    ADCCSS2 = 0;
    /* Configure ADCCMPCONx */
    ADCCMPCON1 = 0; // No digital comparators are used. Setting the ADCCMPCONx
    ADCCMPCON2 = 0; // register to '0' ensures that the comparator is disabled.
    ADCCMPCON3 = 0; // Other registers are ?don't care?.
    ADCCMPCON4 = 0;

    /* Configure ADCFLTRx */
    ADCFLTR1 = 0; // No oversampling filters are used.
    ADCFLTR2 = 0;
    ADCFLTR3 = 0;
    ADCFLTR4 = 0;

    /* Set up the trigger sources */
    ADCTRGSNSbits.LVL0 = 0; // Edge trigger
    ADCTRG1bits.TRGSRC0 = 1; // Set AN0 to trigger from software
    /* Early interrupt */
    ADCEIEN1 = 0; // No early interrupt
    ADCEIEN2 = 0;
    /* Turn the ADC on */
    ADCCON1bits.ON = 1;
    /* Wait for voltage reference to be stable */
    while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    while(ADCCON2bits.REFFLT); // Wait if there is a fault with the reference voltage
    /* Enable clock to analog circuit */
    ADCANCONbits.ANEN0 = 1; // Enable the clock to analog bias
    /* Wait for ADC to be ready */
    while(!ADCANCONbits.WKRDY0); // Wait until ADC0 is ready
    /* Enable the ADC module */
    ADCCON3bits.DIGEN0 = 1; // Enable ADC0
```

CXB_REX cuenta con un módulo al lado derecho de la tarjeta, este módulo cuenta con conexiones de transmisión, recepción y GND (tierra). La configuración de UART esta ubicada en el microcontrolador en los pines 42 (RX) Y 44 (TX).

Más adelante se ilustra una imagen con la conexión realizada del módulo UART de la tarjeta con un módulo UART externo.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/CXBUART.png).

A continuación se presenta un listado indicando las conexiones que se observan en la imagen superior.

**Cable Azul:** Transmisión (UART CXB_REX) → Recepción (UART MÓDULO EXTERNO)
**Cable Rojo:** Recepción (UART CXB_REX) → Transmisión (UART MÓDULO EXTERNO)
**Cable Negro:** GND (UART CXB_REX) → GND (UART MÓDULO EXTERNO)

Para encontrar una mayor información sobre el módulo ADC puede buscar en [Microchip Analog-to-Digital Converter (ADC) with Threshold Detect](https://ww1.microchip.com/downloads/en/DeviceDoc/60001359b.pdf).
