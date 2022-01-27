#include <stdio.h>
#include "NuMicro.h"
#include <math.h>
#include "arm_math.h"

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

void main(void)
{
    float32_t sinOutput;
    q15_t q15sinOutput;
    q31_t q31sinOutput;

    /* Unlock protected registers */
    SYS_UnlockReg();

    /* Init System, peripheral clock and multi-function I/O */
    SYS_Init();

    /* Lock protected registers */
    SYS_LockReg();

    /* Init UART to 115200-8n1 for print message */
    UART_Open(UART0, 115200);

    /* Connect UART to PC, and open a terminal tool to receive following message */
    printf("\r\nARM Fast Math sine\r\n");

    sinOutput = arm_sin_f32(PI/4.0);  // 45 degree
    printf("arm_sin_f32(PI/4.0) = %f\r\n", sinOutput); // sqrt(2)

    q15sinOutput = arm_sin_q15(4096); // 360 degree * 4,096 / 2^15 = 45 degree
    printf("arm_sin_q15(4096) = %d\r\n", q15sinOutput); // 2^15 * sqrt(2) = 23,170

    q31sinOutput = arm_sin_q31(268435456); // 360 degree * 268,435,456 / 4,294,967,296 = 45 degree
    printf("arm_sin_q31(536870912) = %d\r\n", q31sinOutput); // 2^31 * sqrt(2) = 1,518,500,249.98 ~1,518,500,250

    /* Trap the CPU */
    while (1);
}
