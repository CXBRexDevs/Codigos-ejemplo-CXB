/*******************************************************************************
  ADCHS Peripheral Library Interface Source File

  Company
    Microchip Technology Inc.

  File Name
    plib_adchs.c

  Summary
    ADCHS peripheral library source.

  Description
    This file implements the ADCHS peripheral library.

*******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/
// DOM-IGNORE-END
#include "device.h"
#include "plib_adchs.h"
#include "interrupts.h"

#define ADCHS_CHANNEL_32  (32U)

// *****************************************************************************
// *****************************************************************************
// Section: ADCHS Implementation
// *****************************************************************************
// *****************************************************************************




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


/* Enable ADCHS channels */
void ADCHS_ModulesEnable (ADCHS_MODULE_MASK moduleMask)
{
    ADCCON3 |= ((uint32_t)moduleMask << 16);
}

/* Disable ADCHS channels */
void ADCHS_ModulesDisable (ADCHS_MODULE_MASK moduleMask)
{
    ADCCON3 &= ~(((uint32_t)moduleMask << 16));
}


void ADCHS_ChannelResultInterruptEnable (ADCHS_CHANNEL_NUM channel)
{
    if (channel < ADCHS_CHANNEL_32)
    {
        ADCGIRQEN1 |= 0x01UL << channel;
    }
    else
    {
        ADCGIRQEN2 |= 0x01UL << (channel - 32U);
    }
}

void ADCHS_ChannelResultInterruptDisable (ADCHS_CHANNEL_NUM channel)
{
    if (channel < ADCHS_CHANNEL_32)
    {
        ADCGIRQEN1 &= ~(0x01UL << channel);
    }
    else
    {
        ADCGIRQEN2 &= ~(0x01UL << (channel - 32U));
    }
}

void ADCHS_ChannelEarlyInterruptEnable (ADCHS_CHANNEL_NUM channel)
{
    if (channel < ADCHS_CHANNEL_32)
    {
        ADCEIEN1 |= (0x01UL << channel);
    }
    else
    {
        ADCEIEN2 |= (0x01UL << (channel - 32U));
    }
}

void ADCHS_ChannelEarlyInterruptDisable (ADCHS_CHANNEL_NUM channel)
{
    if (channel < ADCHS_CHANNEL_32)
    {
        ADCEIEN1 &= ~(0x01UL << channel);
    }
    else
    {
        ADCEIEN2 &= ~(0x01UL << (channel - 32U));
    }
}

void ADCHS_GlobalEdgeConversionStart(void)
{
    ADCCON3bits.GSWTRG = 1;
}

void ADCHS_GlobalLevelConversionStart(void)
{
    ADCCON3bits.GLSWTRG = 1;
}

void ADCHS_GlobalLevelConversionStop(void)
{
    ADCCON3bits.GLSWTRG = 0;
}

void ADCHS_ChannelConversionStart(ADCHS_CHANNEL_NUM channel)
{
    ADCCON3bits.ADINSEL = (uint8_t)channel;
    ADCCON3bits.RQCNVRT = 1;
}


/*Check if conversion result is available */
bool ADCHS_ChannelResultIsReady(ADCHS_CHANNEL_NUM channel)
{
    bool status = false;
    if (channel < ADCHS_CHANNEL_32)
    {
        status = (((ADCDSTAT1 >> channel) & 0x01U) != 0U);
    }
    else
    {
        status = (((ADCDSTAT2 >> (channel - 32U)) & 0x01U) != 0U);
    }
    return status;
}

/* Read the conversion result */
uint16_t ADCHS_ChannelResultGet(ADCHS_CHANNEL_NUM channel)
{
    return (uint16_t)(*((&ADCDATA0) + (channel << 2)));

}





bool ADCHS_EOSStatusGet(void)
{
    return (bool)(ADCCON2bits.EOSRDY);
}


