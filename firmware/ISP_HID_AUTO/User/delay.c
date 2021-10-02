#include <stdio.h>
#include "NuMicro.h"

void delay(uint32_t u32msDelay)
{
    uint32_t saveLoad, saveVal, saveCtrl;

    /* Store SysTick settings */
    saveLoad = SysTick->LOAD; 
    saveVal = SysTick->VAL;
    saveCtrl = SysTick->CTRL;

    if( (u32msDelay * CyclesPerUs * 1000) < 16777216) // Check if load value with in 2^24
    {
        SysTick->LOAD = u32msDelay * CyclesPerUs * 1000;
        SysTick->VAL  = (0x00);
        SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;

        /* Waiting for down-count to zero */
        while ((SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk) == 0);
    }
    else
    {
        SysTick->LOAD = u32msDelay * CyclesPerUs;
        SysTick->VAL  = (0x00);
        SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;

        for(uint32_t i=0; i<1000; i++)
        {
            /* Waiting for down-count to zero */
            while ((SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk) == 0);
        }
    }

    /* Disable SysTick counter */
    SysTick->CTRL = 0;

    /* Restore SysTick settings */
    SysTick->LOAD = saveLoad;
    SysTick->VAL  = saveVal;
    SysTick->CTRL = saveCtrl;
}

void delayMicroseconds(uint32_t u32usDelay)
{
    uint32_t saveLoad, saveVal, saveCtrl;

    /* Store SysTick settings */
    saveLoad = SysTick->LOAD; 
    saveVal = SysTick->VAL;
    saveCtrl = SysTick->CTRL;

    if( (u32usDelay * CyclesPerUs) < 16777216) // Check if load value with in 2^24
    {
        SysTick->LOAD = u32usDelay * CyclesPerUs;
        SysTick->VAL  = (0x00);
        SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;

        /* Waiting for down-count to zero */
        while ((SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk) == 0);
    }
    else
    {
        SysTick->LOAD = 0xFFFFFF; // Set to maximum of 2^24
        SysTick->VAL  = (0x00);
        SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;
    }

    /* Disable SysTick counter */
    SysTick->CTRL = 0;

    /* Restore SysTick settings */
    SysTick->LOAD = saveLoad;
    SysTick->VAL  = saveVal;
    SysTick->CTRL = saveCtrl;
}
