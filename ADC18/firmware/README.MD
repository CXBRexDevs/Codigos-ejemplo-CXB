# Configuración de registors

A pesar de ser muy útil en la mayoria de proyectos, la configuración con MCC harmony para los puertos ADCHS han presentado lo que presumiblemente sean bugs, así que se recomienda hacer una configuración manual del archivo "[plib_adchs.c](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/ADC18/firmware/src/config/default/peripheral/adchs/plib_adchs.c)" para este ejemplo, la configuración de registros se encuentra a continuación y fué adaptada de el ejemplo provisto en el [manual para puertos ADC para pic32](https://ww1.microchip.com/downloads/en/DeviceDoc/Section22._12-bit_HS_SAR_ADC_FRM_DS60001344E.pdf), el cual cueta con algunos errores de tipografia, los cuales fueron corregidos en este repositorio.

```C
void ADCHS_Initialize(void)
{
    /* Configure ADCCON1 */
    ADCCON1bits.FRACT = 1; // use Fractional output format
    ADCCON1bits.SELRES = 3; // ADC7 resolution is 12 bits
    ADCCON1bits.STRGSRC = 0; // No scan trigger.
    /* Configure ADCCON2 */
    ADCCON2bits.SAMC = 6; // ADC7 sampling time = 5 * TAD7
    ADCCON2bits.ADCDIV = 1; // ADC7 clock freq is half of control clock = TAD7
    /* Initialize warm up time register */
    ADCANCON = 0;
    ADCANCONbits.WKUPCLKCNT = 5; // Wakeup exponent = 32 * TADx
    /* Clock setting */
    ADCCON3 = 0;
    ADCCON3bits.ADCSEL = 0; // Select input clock source
    ADCCON3bits.CONCLKDIV = 1; // Control clock frequency is half of input clock
    ADCCON3bits.VREFSEL = 0; // Select AVDD and AVSS as reference source
    /* No selection for dedicated ADC modules, no presync trigger, not sync sampling */
    ADCTRGMODE = 0;
    /* Select ADC input mode */
    ADCIMCON2bits.SIGN17 = 0; // unsigned data format
    ADCIMCON2bits.DIFF17 = 0; // Single ended mode
    ADCIMCON2bits.SIGN18 = 0; // unsigned data format
    ADCIMCON2bits.DIFF18 = 0; // Single ended mode
    ADCIMCON2bits.SIGN19 = 0; // unsigned data format
    ADCIMCON2bits.DIFF19 = 0; // Single ended mode
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
    ADCTRGSNSbits.LVL17 = 0; // Edge trigger
    ADCTRGSNSbits.LVL18 = 0; // Edge trigger
    ADCTRGSNSbits.LVL19 = 0; // Edge trigger
    ADCTRG5bits.TRGSRC17 = 1; // Set AN17 to trigger from software
    ADCTRG5bits.TRGSRC18 = 1; // Set AN18 to trigger from software
    ADCTRG5bits.TRGSRC19 = 1; // Set AN19 to trigger from software

    /* Early interrupt */
    ADCEIEN1 = 0; // No early interrupt
    ADCEIEN2 = 0;
    /* Turn the ADC on */
    ADCCON1bits.ON = 1;




    /* Turn ON ADC */
    ADCCON1bits.ON = 1;
    while(ADCCON2bits.BGVRRDY == 0U) // Wait until the reference voltage is ready
    {

    }
    while(ADCCON2bits.REFFLT != 0U) // Wait if there is a fault with the reference voltage
    {

    }

    /* ADC 7 */
    ADCANCONbits.ANEN7 = 1;      // Enable the clock to analog bias
    while(ADCANCONbits.WKRDY7 == 0U) // Wait until ADC is ready
    {

    }
    ADCCON3bits.DIGEN7 = 1;      // Enable ADC


}
```

> **NOTA: Configuración ejemplo adaptada de [Section 22. 12-bit High-Speed Successive Approximation
> Register (SAR) Analog-to-Digital Converter (ADC)](https://ww1.microchip.com/downloads/en/DeviceDoc/Section22._12-bit_HS_SAR_ADC_FRM_DS60001344E.pdf) (página 70)**

Configure los pines que se usan para los terminales banana como ANx (x: El número del canál ADC correspondiente al pin), es decir: "[FESTO 177469](https://ip.festo-didactic.com/InfoPortal/DataSheets/INT/177469_en_v2.0_Analog_ultrasonic_distance_sensor.pdf)" &rarr; AN19 (Pin 4) "[FESTO 539757](https://ip.festo-didactic.com/InfoPortal/DataSheets/INT/539757_es_v2.0_Sensor_de_presi%C3%B3n_SDE1.pdf)" &rarr; AN18 (Pin 5) y "[FESTO 178577](https://ip.festo-didactic.com/InfoPortal/DataSheets/INT/178577_en_v2.0_Proximity_sensor_optical.pdf)" &rarr; AN17 (Pin 6). Invoque en el área de composición los bloques ADCHS, UART5 y STDIO configure estos ultimos dos como se hizo en [MiPrimerProyecto](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/tree/main/MiPrimerProyecto), sin hacer modificaciones a los registros del bloque ADCHS genere la configuración y reemplace la función ```ADCHS_Initialize()``` con la configuración provista en el bloque de código visto más arriba, el proyecto ejemplo provisto en este repositorio ya cuenta con los cambios que acaba de leer.

# Hardware

Conecte el módulo UART a USB, como se ilustra en la siguiente imágen.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/CXBUART.png?raw=true)

> A continuación se presenta un listado indicando las conexiones que se observan en la imagen superior.

> + ***Cable Azul:*** Transmisión (UART CXB_REX) → Recepción (UART MÓDULO EXTERNO)
> + ***Cable Rojo:*** Recepción (UART CXB_REX) → Transmisión (UART MÓDULO EXTERNO)
> + ***Cable Negro:*** GND (UART CXB_REX) → GND (UART MÓDULO EXTERNO)

Conecte los cables de los sensores mencionados a sus respectivos puertos, incluyendo la tierra de los sensores, conecte la alimentación de los sensores a la fuente de PLC y asegurece de puentear la tierra de la fuente con la tierra del circuito, **tenga cuidado de conectar los sensores a su respectivo puerto y no los intercambie**. Los circuitos internos de CXB correspondientes al acople de las señales de los sensores se ilustran a continuación.

![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/DivTens1.png?raw=true)
![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/DivTens2.png?raw=true)
![](https://github.com/CXBRexDevs/Codigos-ejemplo-CXB/blob/main/images/OpAmps.png?raw=true)

Para mayor información sobre el módulo ADC en dispositivos PIC32 puede leer [Microchip Analog-to-Digital Converter (ADC) with Threshold Detect](https://ww1.microchip.com/downloads/en/DeviceDoc/60001359b.pdf), [Section 22. 12-bit High-Speed Successive Approximation
Register (SAR) Analog-to-Digital Converter (ADC)](https://ww1.microchip.com/downloads/en/DeviceDoc/Section22._12-bit_HS_SAR_ADC_FRM_DS60001344E.pdf) y el cápitulo designado a ADC en el datasheet de su microcontrolador, por ejemplo [PIC32MK1024MCF064](https://ww1.microchip.com/downloads/en/DeviceDoc/PIC32MK_GP_MC_Familly_Datasheet_60001402G.pdf#G26.1079552).
