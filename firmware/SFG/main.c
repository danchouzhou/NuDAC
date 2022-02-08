#include <stdio.h>
#include "NuMicro.h"
#include <math.h>
#include "arm_math.h"
#include "audio_codec.h"

#define CRYSTAL_LESS        1

void SYS_Init(void)
{
    /* Enable Internal RC Oscillator (12MHz) */
    CLK_EnableXtalRC(CLK_PWRCTL_HIRCEN_Msk);

    /* Waiting for 12MHz clock ready */
    CLK_WaitClockReady(CLK_STATUS_HIRCSTB_Msk);

    /* Set core clock as PLL_CLOCK from PLL */
    CLK_SetCoreClock(FREQ_192MHZ);

    /* M480LD support crystal-less */
    if (((SYS->CSERVER & SYS_CSERVER_VERSION_Msk) == 0x1) && (CRYSTAL_LESS))
    {
        /* Enable Internal RC Oscillator (48MHz) */
        CLK->PWRCTL |= CLK_PWRCTL_HIRC48MEN_Msk;
        /* Select IP clock source */
        CLK->CLKSEL0 &= ~CLK_CLKSEL0_USBSEL_Msk;
    }
    else
    {
        /* Select IP clock source */
        CLK->CLKSEL0 |= CLK_CLKSEL0_USBSEL_Msk;
        CLK->CLKDIV0 = (CLK->CLKDIV0 & ~CLK_CLKDIV0_USBDIV_Msk) | CLK_CLKDIV0_USB(4);
    }

    /* Update System Core Clock */
    /* User can use SystemCoreClockUpdate() to calculate SystemCoreClock. */
    SystemCoreClockUpdate();

    /* Set both PCLK0 and PCLK1 as HCLK/2 */
    CLK->PCLKDIV = CLK_PCLKDIV_APB0DIV_DIV2 | CLK_PCLKDIV_APB1DIV_DIV2;

    /* Select USBD */
    SYS->USBPHY = (SYS->USBPHY & ~SYS_USBPHY_USBROLE_Msk) | SYS_USBPHY_USBEN_Msk | SYS_USBPHY_SBO_Msk;

    /* Enable IP clock */
    CLK_EnableModuleClock(USBD_MODULE);

    /* Select IP clock source */
    CLK_SetModuleClock(UART0_MODULE, CLK_CLKSEL1_UART0SEL_HIRC, CLK_CLKDIV0_UART0(1));
    CLK_SetModuleClock(I2S0_MODULE, CLK_CLKSEL3_I2S0SEL_HIRC, CLK_CLKDIV2_I2S0(1));

    /* Enable IP clock */
    CLK_EnableModuleClock(UART0_MODULE);
    CLK_EnableModuleClock(I2C0_MODULE);
    CLK_EnableModuleClock(I2S0_MODULE);

    /* Set PA.12 ~ PA.14 to input mode */
    PA->MODE &= ~(GPIO_MODE_MODE12_Msk | GPIO_MODE_MODE13_Msk | GPIO_MODE_MODE14_Msk);
    /* Set GPA multi-function pins for USB */
    SYS->GPA_MFPH &= ~(SYS_GPA_MFPH_PA12MFP_Msk | SYS_GPA_MFPH_PA13MFP_Msk | SYS_GPA_MFPH_PA14MFP_Msk);
    SYS->GPA_MFPH |=  (SYS_GPA_MFPH_PA12MFP_USB_VBUS | SYS_GPA_MFPH_PA13MFP_USB_D_N | SYS_GPA_MFPH_PA14MFP_USB_D_P);

    /* Set GPB multi-function pins for UART0 RXD and TXD */
    SYS->GPB_MFPH &= ~(SYS_GPB_MFPH_PB12MFP_Msk | SYS_GPB_MFPH_PB13MFP_Msk);
    SYS->GPB_MFPH |=  (SYS_GPB_MFPH_PB12MFP_UART0_RXD | SYS_GPB_MFPH_PB13MFP_UART0_TXD);

    /* Set GPB and GPC multi-function pins for codec */
    SYS->GPB_MFPL &= ~(SYS_GPB_MFPL_PB1MFP_Msk | SYS_GPB_MFPL_PB2MFP_Msk |
    				   SYS_GPB_MFPL_PB3MFP_Msk | SYS_GPB_MFPL_PB4MFP_Msk | SYS_GPB_MFPL_PB5MFP_Msk);
    SYS->GPB_MFPL |=  (SYS_GPB_MFPL_PB1MFP_I2S0_LRCK | SYS_GPB_MFPL_PB2MFP_I2S0_DO |
    				   SYS_GPB_MFPL_PB3MFP_I2S0_DI   | SYS_GPB_MFPL_PB4MFP_I2S0_MCLK | SYS_GPB_MFPL_PB5MFP_I2S0_BCLK);
    SYS->GPC_MFPL &= ~(SYS_GPC_MFPL_PC0MFP_Msk | SYS_GPC_MFPL_PC1MFP_Msk);
    SYS->GPC_MFPL |=  (SYS_GPC_MFPL_PC0MFP_I2C0_SDA | SYS_GPC_MFPL_PC1MFP_I2C0_SCL);
    /* Enable schmitt trigger avoid from disturb */
    PB->SMTEN |= GPIO_SMTEN_SMTEN5_Msk;
    PC->SMTEN |= GPIO_SMTEN_SMTEN1_Msk;
}

/* Init I2C interface */
void I2C0_Init(void)
{
    /* Open I2C2 and set clock to 100k */
    I2C_Open(I2C0, 100000);

    /* Get I2C2 Bus Clock */
    printf("I2C clock  %d Hz\n", I2C_GetBusClockFreq(I2C0));
}

/* Init I2S interface */
void I2S0_Init(void)
{
    /* Open I2S0 as slave mode */
    I2S_Open(I2S0, I2S_MODE_SLAVE, 48000, I2S_DATABIT_16, I2S_DISABLE_MONO, I2S_FORMAT_I2S);

    /* Set MCLK and enable MCLK */
    printf("I2S MCLK %d Hz\r\n", I2S_EnableMCLK(I2S0, 12000000));
}

void main(void)
{
    q15_t q15sineTable[48];
    uint32_t index, data = 0;

    /* Unlock protected registers */
    SYS_UnlockReg();

    /* Init System, peripheral clock and multi-function I/O */
    SYS_Init();

    /* Lock protected registers */
    SYS_LockReg();

    /* Init UART to 115200-8n1 for print message */
    UART_Open(UART0, 115200);

    /* Connect UART to PC, and open a terminal tool to receive following message */
    printf("\r\nFunction generator.\r\n");

    /* Init I2C0 */
    I2C0_Init();

    /* Init I2S0 */
    I2S0_Init();

    /* Reset the audio codec by software */
    NAU88L25_Reset();

    /* Initialize NAU88L25 codec */
    NAU88L25_Setup();

    /*
    printf("Select a waveform.\r\n");
    printf("[0] Square wave\r\n");
    printf("[1] Triangle wave\r\n");
    printf("[2] Sine wave\r\n");

    printf("\r\nEnter a frequency between 20 Hz and 20000 Hz: ");
    */

    /* Create sine table */
    for (int p=0; p<48; p++)
    {
        q15_t t = 32768UL*p/48;
        q15sineTable[p] = arm_sin_q15(t);
        printf("%02d: arm_sin_q15(%d) = 0x%04x\r\n", p, t, (uint16_t)q15sineTable[p]);
    }

    I2S_CLR_TX_FIFO(I2S0);
    I2S_ENABLE_TX(I2S0);

    /* Fill I2S_TXFIFO */
    while (1)
    {
        /* Check if I2S_TXFIFO is not full */
        if (I2S_GET_INT_FLAG(I2S0, I2S_STATUS0_TXFULL_Msk) == 0)
        {
            /* Write left and right channel with same data */
            data = (uint32_t)q15sineTable[index] << 16;
            data |= (uint32_t)q15sineTable[index] & 0xFFFFUL;
            I2S_WRITE_TX_FIFO(I2S0, data);

            //printf("%02d: 0x%08x\n", index, data);

            /* Increase or loop back the index */
            index++;
            if (index >= 48)
                index = 0;
        }        
    }
}
