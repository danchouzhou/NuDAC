/***************************************************************************//**
 * @file     main.c
 * @brief    ISP tool main function
 * @version  0x32
 * @date     14, June, 2017
 *
 * @note
 * Copyright (C) 2017-2018 Nuvoton Technology Corp. All rights reserved.
 ******************************************************************************/
#include <stdio.h>
#include "targetdev.h"
#include "hid_transfer.h"
#include "isp_user.h"

#define PLLCON_SETTING          CLK_PLLCTL_192MHz_HIRC
#define PLL_CLOCK               192000000
#define HCLK_DIV                        1
#define USBD_DIV                        4
#define CRYSTAL_LESS                    1

uint32_t CLK_GetPLLClockFreq(void)
{
    return PLL_CLOCK;
}

/*--------------------------------------------------------------------------*/
void SYS_Init(void)
{
    /*---------------------------------------------------------------------------------------------------------*/
    /* Init System Clock                                                                                       */
    /*---------------------------------------------------------------------------------------------------------*/
    /* Set XT1_OUT(PF.2) and XT1_IN(PF.3) to input mode */
    PF->MODE &= ~(GPIO_MODE_MODE2_Msk | GPIO_MODE_MODE3_Msk);
    /* Enable Internal RC clock and external XTAL clock */
    CLK->PWRCTL |= (CLK_PWRCTL_HXTEN_Msk | CLK_PWRCTL_HIRCEN_Msk);

    /* Waiting for internal RC clock ready */
    while (!(CLK->STATUS & CLK_STATUS_HXTSTB_Msk));

    /* Set core clock as PLL_CLOCK from PLL */
    CLK->PLLCTL = PLLCON_SETTING;

    while (!(CLK->STATUS & CLK_STATUS_PLLSTB_Msk));

    CLK->CLKDIV0 &= ~CLK_CLKDIV0_HCLKDIV_Msk;
    CLK->CLKDIV0 |= CLK_CLKDIV0_HCLK(HCLK_DIV);
    //CLK->CLKDIV0 &= ~CLK_CLKDIV0_USBDIV_Msk;
    //CLK->CLKDIV0 |= CLK_CLKDIV0_USB(USBD_DIV);
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
    CLK->CLKSEL0 = (CLK->CLKSEL0 & (~CLK_CLKSEL0_HCLKSEL_Msk)) | CLK_CLKSEL0_HCLKSEL_PLL;

    /* SysTick clock source HIRC 12MHz / 2 = 6MHz */
    CLK->CLKSEL0 = (CLK->CLKSEL0 & ~CLK_CLKSEL0_STCLKSEL_Msk) | CLK_CLKSEL0_STCLKSEL_HIRC_DIV2;

    /* Update System Core Clock */
    /* User can use SystemCoreClockUpdate() to calculate PllClock, SystemCoreClock and CycylesPerUs automatically. */
    //SystemCoreClockUpdate();
    PllClock        = PLL_CLOCK;                        // PLL
    SystemCoreClock = PLL_CLOCK / HCLK_DIV;             // HCLK
    //CyclesPerUs     = SystemCoreClock / 1000000;  // For SYS_SysTickDelay()
    CyclesPerUs     = 6000000 / 1000000;  // For SYS_SysTickDelay()
    /* Set both PCLK0 and PCLK1 as HCLK/2 */
    CLK->PCLKDIV = CLK_PCLKDIV_APB0DIV_DIV2 | CLK_PCLKDIV_APB1DIV_DIV2;
    /* Select USBD */
    SYS->USBPHY = (SYS->USBPHY & ~SYS_USBPHY_USBROLE_Msk) | SYS_USBPHY_USBEN_Msk | SYS_USBPHY_SBO_Msk;
    /* Enable module clock */
    CLK->APBCLK0 |= CLK_APBCLK0_USBDCKEN_Msk;
    CLK->AHBCLK |= CLK_AHBCLK_ISPCKEN_Msk;
    /*---------------------------------------------------------------------------------------------------------*/
    /* Init I/O Multi-function                                                                                 */
    /*---------------------------------------------------------------------------------------------------------*/
    /* Set PA.12 ~ PA.14 to input mode */
    PA->MODE &= ~(GPIO_MODE_MODE12_Msk | GPIO_MODE_MODE13_Msk | GPIO_MODE_MODE14_Msk);
    SYS->GPA_MFPH &= ~(SYS_GPA_MFPH_PA12MFP_Msk | SYS_GPA_MFPH_PA13MFP_Msk | SYS_GPA_MFPH_PA14MFP_Msk | SYS_GPA_MFPH_PA15MFP_Msk);
    SYS->GPA_MFPH |= (SYS_GPA_MFPH_PA12MFP_USB_VBUS | SYS_GPA_MFPH_PA13MFP_USB_D_N | SYS_GPA_MFPH_PA14MFP_USB_D_P | SYS_GPA_MFPH_PA15MFP_USB_OTG_ID);
}

void USBD_IRQHandler(void);
/*---------------------------------------------------------------------------------------------------------*/
/*  Main Function                                                                                          */
/*---------------------------------------------------------------------------------------------------------*/
int32_t main(void)
{
    volatile uint32_t u32TimeOutCnt = 0;
    /* Unlock write-protected registers */
    SYS_UnlockReg();
    /* Init system and multi-function I/O */
    SYS_Init();
    FMC->ISPCTL |= FMC_ISPCTL_ISPEN_Msk;    // (1ul << 0)
    g_apromSize = GetApromSize();
    GetDataFlashInfo(&g_dataFlashAddr, &g_dataFlashSize);

    /* Open USB controller */
    USBD_Open(&gsInfo, HID_ClassRequest, NULL);
    /*Init Endpoint configuration for HID */
    HID_Init();
    /* Start USB device */
    USBD_Start();

    /* Using polling mode and Removed Interrupt Table to reduce code size for M480 */

    /* DO NOT Enable USB device interrupt */
    // NVIC_EnableIRQ(USBD_IRQn);

_ISP:
    if(u32TimeOutCnt < 3) // perform three times
    {
        u32TimeOutCnt++;

        SysTick->LOAD = 1000000 * CyclesPerUs; // 1 seconds
        SysTick->VAL  = (0x00);
        SysTick->CTRL = SysTick_CTRL_ENABLE_Msk;

        while ( (g_u8Connected == 0) || ((SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk) == 0))
        {
            // polling USBD interrupt flag
            USBD_IRQHandler();

            if (bUsbDataReady == TRUE)
            {
                ParseCmd((uint8_t *)usb_rcvbuf, 64);
                EP2_Handler();
                bUsbDataReady = FALSE;
            }
        }
        
        /* Disable SysTick counter */
        SysTick->CTRL = 0;
    }
    else
    {
        goto _APROM;
    }

    goto _ISP;

_APROM:
    outpw(&SYS->RSTSTS, 3);//clear bit
    outpw(&FMC->ISPCTL, inpw(&FMC->ISPCTL) & 0xFFFFFFFC);
    outpw(&SCB->AIRCR, (V6M_AIRCR_VECTKEY_DATA | V6M_AIRCR_SYSRESETREQ));

    /* Trap the CPU */
    while (1);

    return 0;
}
/*** (C) COPYRIGHT 2017 Nuvoton Technology Corp. ***/
