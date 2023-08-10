// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include <stdarg.h>
#include "definitions.h"                // SYS function prototypes

/* Application's state machine enum */
typedef enum
{
    APP_STATE_CAN_RECEIVE,
    APP_STATE_CAN_TRANSMIT,
    APP_STATE_CAN_IDLE,
    APP_STATE_CAN_USER_INPUT,
    APP_STATE_CAN_XFER_SUCCESSFUL,
    APP_STATE_CAN_XFER_ERROR
} APP_STATES;

/* set format attribute for the vararg function */
void PrintFormattedData (const char * format, ...) __attribute__ ((format (printf, 1, 2)));

/* Variable to save application state */
static APP_STATES state = APP_STATE_CAN_USER_INPUT;
/* Variable to save Tx/Rx transfer status and context */
static uint32_t status = 0;
static uint32_t xferContext = 0;
/* Variable to save Tx/Rx message */
static uint32_t messageID = 0;
static uint8_t message[8];
static uint8_t messageLength = 0;
static uint8_t rx_message[8];
static uint32_t rx_messageID = 0;
static uint8_t rx_messageLength = 0;
static uint16_t timestamp = 0;
static CAN_MSG_RX_ATTRIBUTE msgAttr = CAN_MSG_RX_DATA_FRAME;
uint32_t recivedData;

// *****************************************************************************
// *****************************************************************************
// Section: Local functions
// *****************************************************************************
// *****************************************************************************

/* This function will be called by CAN PLIB when transfer is completed */
// *****************************************************************************
/* void APP_CAN_Callback(uintptr_t context)

  Summary:
    Function called by CAN PLIB upon transfer completion

  Description:
    This function will be called by CAN PLIB when transfer is completed.
    In this function, current state of the application is obtained by context
    parameter. Based on current state of the application and CAN error
    state, next state of the application is decided.

  Remarks:
    None.
*/
void APP_CAN_Callback(uintptr_t context)
{
    xferContext = context;

    /* Check CAN Status */
    status = CAN1_ErrorGet();

    if ((status & (CAN_ERROR_TX_RX_WARNING_STATE | CAN_ERROR_RX_WARNING_STATE |
                   CAN_ERROR_TX_WARNING_STATE | CAN_ERROR_RX_BUS_PASSIVE_STATE |
                   CAN_ERROR_TX_BUS_PASSIVE_STATE | CAN_ERROR_TX_BUS_OFF_STATE)) == CAN_ERROR_NONE)
    {
        switch ((APP_STATES)context)
        {
            case APP_STATE_CAN_RECEIVE:
            case APP_STATE_CAN_TRANSMIT:
            {
                state = APP_STATE_CAN_XFER_SUCCESSFUL;
                break;
            }
            default:
                break;
        }
    }
    else
    {
        state = APP_STATE_CAN_XFER_ERROR;
    }
}

void print_menu(void)
{
    printf(" ------------------------------ \r\n");   
    printf(" Press '1' to Transmit message \r\n");
    printf(" Press '2' to Receive message \r\n");
}

void PrintFormattedData (const char * format, ...)
{
    va_list args = {0};
    va_start (args, format);
    vprintf (format, args);
    va_end (args);
}

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

int main ( void )
{
    uint8_t user_input = 0;
//    uint8_t count = 0;

    /* Initialize all modules */
    SYS_Initialize ( NULL );

    printf(" ------------------------------ \r\n");
    printf("            CAN Demo            \r\n");
    printf(" ------------------------------ \r\n");
    
    print_menu();
    
    /* Prepare the message to send*/
    messageID = 0x09;
    messageLength = 8;
    SPI1_Read(&recivedData,32);
    message[0]=1;
    message[1]=2;
    message[2]=3;
    message[3]=4;
    message[4]=5;
    message[5]=6;
    message[6]=7;
    message[7]=8;
    
    while ( true )
    {
        if (state == APP_STATE_CAN_USER_INPUT)
        {
            /* Read user input */
            UART5_Read((void *)&user_input, 1);
            
            switch (user_input)
            {
                case '1': 
                    printf(" Transmitting Message: ");                    
                    CAN1_CallbackRegister( APP_CAN_Callback, (uintptr_t)APP_STATE_CAN_TRANSMIT, 0 );
                    state = APP_STATE_CAN_IDLE;
                    if (CAN1_MessageTransmit(messageID, messageLength, message, 0, CAN_MSG_TX_DATA_FRAME) == false)
                    {
                        printf("CAN1_MessageTransmit request has failed\r\n");
                    }             
                    break;
                case '2':
                    printf(" Waiting for message: \r\n");
                    CAN1_CallbackRegister( APP_CAN_Callback, (uintptr_t)APP_STATE_CAN_RECEIVE, 1 );
                    state = APP_STATE_CAN_IDLE;
                    memset(rx_message, 0x00, sizeof(rx_message));
                    /* Receive New Message */
                    if (CAN1_MessageReceive(&rx_messageID, &rx_messageLength, rx_message, &timestamp, 1, &msgAttr) == false)  
                    {
                        printf("CAN1_MessageReceive request has failed\r\n");
                    }
                    break;
                default:
                    printf(" Invalid Input \r\n");
                    break;
            }
        }
        /* Check the application's current state. */
        switch (state)
        {
            case APP_STATE_CAN_IDLE:
            {
                /* Application can do other task here
                state = APP_STATE_CAN_USER_INPUT; */
                break;
            }
            case APP_STATE_CAN_XFER_SUCCESSFUL:
            {
                if ((APP_STATES)xferContext == APP_STATE_CAN_RECEIVE)
                {
                    /* Print message to Console */
                    printf(" New Message Received    \r\n");
                    uint8_t length = rx_messageLength;
                    PrintFormattedData(" Message - Timestamp : 0x%x ID : 0x%x Length : 0x%x ", (unsigned int)timestamp, (unsigned int) rx_messageID,(unsigned int) rx_messageLength);
                    printf("Message : ");
                    while(length)
                    {
                        PrintFormattedData("0x%x ", rx_message[rx_messageLength - length--]);
                    }
                    printf("\r\n");
                } 
                else if ((APP_STATES)xferContext == APP_STATE_CAN_TRANSMIT)
                {
                    printf("Success \r\n");
                }
                LED_Toggle();
                print_menu();
                state = APP_STATE_CAN_USER_INPUT;
                break;
            }
            case APP_STATE_CAN_XFER_ERROR:
            {
                if ((APP_STATES)xferContext == APP_STATE_CAN_RECEIVE)
                {
                    printf("Error in received message");
                }
                else
                {
                    printf("Failed \r\n");
                }
                print_menu();
                state = APP_STATE_CAN_USER_INPUT;
                break;
            }
            default:
                break;
        }
        
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


