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

/* Enumeración de los estados */
typedef enum
{
    APP_STATE_CAN_RECEIVE,
    APP_STATE_CAN_TRANSMIT,
    APP_STATE_CAN_IDLE,
    APP_STATE_CAN_USER_INPUT,
    APP_STATE_CAN_XFER_SUCCESSFUL,
    APP_STATE_CAN_XFER_ERROR
} APP_STATES;

/* Establecer el formato del atributo vararg */
void PrintFormattedData (const char * format, ...) __attribute__ ((format (printf, 1, 2)));

/* Variable para guardar el estado de la aplicación */
static APP_STATES state = APP_STATE_CAN_USER_INPUT;
/* Variable para guardar el estado de transmisión Tx/Rx y su contexto */
static uint32_t status = 0;
static uint32_t xferContext = 0;
/* Variable para guardar los mensajes Tx/Rx */
static uint32_t messageID = 0;
static uint8_t message[8];
static uint8_t messageLength = 0;
static uint8_t rx_message[8];
static uint32_t rx_messageID = 0;
static uint8_t rx_messageLength = 0;
static uint16_t timestamp = 0;
static CAN_MSG_RX_ATTRIBUTE msgAttr = CAN_MSG_RX_DATA_FRAME;
uint32_t recivedData;


void APP_CAN_Callback(uintptr_t context)
{
    xferContext = context;

    /* Revice el estado del CAN */
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
    printf(" Presione '1' para transmitir \r\n");
    printf(" Presione '2' para recibir \r\n");
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
    
    /* Prepara el mensaje a enviar*/
    messageID = 0x09;
    messageLength = 8;
    SPI1_Read(&recivedData,32);
    message[0]=0x01;
    message[1]=0x02;
    message[2]=0x03;
    message[3]=0x0A;
    message[4]=0x0B;
    message[5]=0x0C;
    message[6]=0x0D;
    message[7]=0x0E;
    
    while ( true )
    {
        if (state == APP_STATE_CAN_USER_INPUT)
        {
            /* Read user input */
            UART5_Read((void *)&user_input, 1);
            
            switch (user_input)
            {
                case '1': 
                    printf(" Transmitiendo: ");                    
                    CAN1_CallbackRegister( APP_CAN_Callback, (uintptr_t)APP_STATE_CAN_TRANSMIT, 0 );
                    state = APP_STATE_CAN_IDLE;
                    if (CAN1_MessageTransmit(messageID, messageLength, message, 0, CAN_MSG_TX_DATA_FRAME) == false)
                    {
                        printf("CAN1_MessageTransmit petición fallida\r\n");
                    }             
                    break;
                case '2':
                    printf(" Esperando mensaje: \r\n");
                    CAN1_CallbackRegister( APP_CAN_Callback, (uintptr_t)APP_STATE_CAN_RECEIVE, 1 );
                    state = APP_STATE_CAN_IDLE;
                    memset(rx_message, 0x00, sizeof(rx_message));
                    /* Receive New Message */
                    if (CAN1_MessageReceive(&rx_messageID, &rx_messageLength, rx_message, &timestamp, 1, &msgAttr) == false)  
                    {
                        printf("CAN1_MessageReceive petición fallida\r\n");
                    }
                    break;
                default:
                    printf(" Comando invalido \r\n");
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
                    printf(" Mensaje Receivido    \r\n");
                    uint8_t length = rx_messageLength;
                    PrintFormattedData(" Mensaje - Timestamp : 0x%x ID : 0x%x Long : 0x%x ", (unsigned int)timestamp, (unsigned int) rx_messageID,(unsigned int) rx_messageLength);
                    printf("Mensaje : ");
                    while(length)
                    {
                        PrintFormattedData("0x%x ", rx_message[rx_messageLength - length--]);
                    }
                    printf("\r\n");
                } 
                else if ((APP_STATES)xferContext == APP_STATE_CAN_TRANSMIT)
                {
                    printf("Exito \r\n");
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
                    printf("Error en el mensaje recivido");
                }
                else
                {
                    printf("Fallo \r\n");
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


