/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include <time.h>
#include <math.h>

uint8_t user_input;

int ctrl=1500;
float conversion=0;
char text[317]="";
float timee=0;
uint32_t cont = 0;
int objetivo = 0;
uint16_t AdcRead = 0;
uint16_t PWM = 0;

char dataRead[16] = "";
char dataBin[35];
int buf;
char dataOk;
float DataInt;
float DataExt;
uint32_t recivedData;
uint16_t result;

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

static uint32_t messageID = 0;
static uint8_t message[8];
static uint8_t messageLength = 0;
static APP_STATES state = APP_STATE_CAN_USER_INPUT;
/* Variable to save Tx/Rx transfer status and context */
static uint32_t status = 0;
static uint32_t xferContext = 0;

void TIMER1_InterruptSvcRoutine(uint32_t status, uintptr_t context)
{
    timee=timee+pow(10,-2);
}
bool TermoparReady(uint32_t value) //
{    
    //Leectura de errores
    switch(value & 0x7){
        case 0b001:
            printf("No se detecta un termopar \n");
            return false;
            break;
        case 0b010:
            printf("Termopar en corto circuito con tierra \n");
            return false;
            break;
        case 0b100:
            printf("Termopar en corto circuito con VCC \n");
            return false;
            break;
        default:
            return true;
    }
    //Lectura error de SCV, SCG o OC
    if((value & 0x10000) == 0x10000){printf("error de SCV, SCG o OC \n");
        return false;
    }else{return true;}      
}

void TermoparInt(int32_t v, float *internal)
{
    // ignore bottom 4 bits - they're just thermocouple data
    v >>= 4; 
    
    // pull the bottom 11 bits off
    *internal =(float)(v & 0x7FF);
    // check sign bit!
    if (v & 0x800) {
      // Convert to negative value by extending sign and casting to signed type.
      int16_t tmp = 0xF800 | (v & 0x7FF);
      *internal = tmp;
    }
    *internal *= 0.0625; // LSB = 0.0625 degrees
    // Serial.print("\tInternal Temp: "); Serial.println(internal);
    
}

void TermoparC(int32_t v, float *centigrade)
{

    if (v & 0x80000000) {
      // Negative value, drop the lower 18 bits and explicitly extend sign bits.
      v = 0xFFFFC000 | ((v >> 18) & 0x00003FFF);
    } else {
      // Positive value, just drop the lower 18 bits.
      v >>= 18;
    }

    // Convert to double before applying multiplication
    double temp = (double)v;

    // LSB = 0.25 degrees C
    temp *= 0.25;

    // Assign the result to the float pointed by centigrade
    *centigrade = (float)temp;

    // Return the calculated value (optional, depending on your use case)

}
    
    
void printBinary(uint32_t value, char binaryString[]) {
    int size = sizeof(value) * 8;

    uint32_t mask = 1u << (size - 1);

    int index = 0;
    for (int i = 1; i <= size; i++) {
        binaryString[index++] = (value & mask) ? '1' : '0';
        if (i == 1 || i == 14 || i == 15 || i == 16 || i == 17  || i == 28 || i == 29) {
            binaryString[index++] = ' ';
        }
        if (i == 12 || i == 24 ) {
            binaryString[index++] = '.';
        }
        mask >>= 1;
    }

    binaryString[index] = '\0';
}

void print_menu(void)
{
    printf(" ----------------------------------------------------------- \r\n");   
    printf(" Presione '1' para probar motores y lectura ADC\r\n");
    printf(" Presione '2' para probar lectura de sensor de temperatura \r\n");
    printf(" Presione '3' para probar transmitir un mensaje CAN \r\n");
}

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

char UART6buff[100];

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    SPI1_Initialize();
    
    printf("\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r");
    printf("  ______  ______  ____           ____ \n\r");
    printf(" / ___\\ \\/ | __ )|  _ \\ _____  _|  _ \\  ___ _ __ ___   ___ \n\r");
    printf("| |    \\  /|  _ \\| |_) / _ \\ \\/ | | | |/ _ | '_ ` _ \\ / _ \\ \n\r");
    printf("| |___ /  \\| |_) |  _ |  __/>  <| |_| |  __| | | | | | (_) | \n\r");
    printf(" \\____/_/\\_|____/|_| \\_\\___/_/\\_|____/ \\___|_| |_| |_|\\___/ \n\r");
    print_menu();

    messageID = 0x469;
    messageLength = 8;
    uint8_t count = 0;
    for (count = 8; count >=1; count--)
    {
        message[count - 1] = count;
    }    
    
    while ( true )
    {
        
        while(user_input == 0){
            UART5_Read(&user_input,1);
        }
        switch(user_input){
            case '1': //Probar motores, lectura ADC y RS232
                ENABLEH1_Set();
                ENABLEL1_Set();
                printf("Ejecutando prueba de motores y lectura adc \n\r");
                MCPWM_Start( );
                QEI1_Start( );
                
                while(1){
                    cont = (int)VEL1CNT;
                    ADCHS_GlobalEdgeConversionStart();
                    while(ADCDSTAT1bits.ARDY17 == 0);
                    /* fetch the result */
                    PWM = (2500.00/ 24117248)*ADCDATA17;
                    conversion=(3.3/ 24117248)*ADCDATA17;
                    MCPWM_ChannelPrimaryDutySet(MCPWM_CH_1,PWM);
                    
                    printf("Vel: %d       ADC: %d      PWM: %d      \r", cont, ADCDATA17, (uint16_t)PWM);
                }
            break;
            case '2': //Probar lectura de sensor de temperatura
                printf("Lectura del termopar  \n\r");
               
                while(1){
                    SPI1_Read(&recivedData,32); //Lee los datos del bus SPI
                    uint32_t asd = recivedData;
                    //printBinary(asd, dataBin);
                    if(!TermoparReady(recivedData)){
                        printf("Revise sus coneciones \n");
                    }else{
                        TermoparInt(asd, &DataInt);
                        TermoparC(asd, &DataExt);
                        //sprintf(UART6buff,"%f °C \r", DataExt);
                        UART6_Write(&DataExt,sizeof(DataExt));
                        printf("%f °C \r", DataExt);
                    }
                }
                user_input = 0;
            break;
            case '3': //para probar transmitir un mensaje CAN
                CAN1_Initialize();
                printf(" Transmitiendo mensaje CAN: 1, 2, 3, 4, 5, 6, 7, 8 \n\r");
                while(true){
                    if(CAN1_MessageTransmit(0x12,messageLength,message,0,CAN_MSG_TX_REMOTE_FRAME)==true){
                        printf("succes \r");
                    }
                }
            break;
            default:
                printf("Entrada no valida \n\r");
                user_input = 0;
                print_menu();
        }
        SYS_Tasks ( );
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

