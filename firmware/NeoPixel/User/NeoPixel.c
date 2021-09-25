/*!
 * 
 * Source from Adafruit. Modified by Danny Chou, City Science - MIT Media Lab.
 * 
 * @section intro_sec Introduction
 *
 * This is the documentation for Adafruit's NeoPixel library for the
 * Arduino platform, allowing a broad range of microcontroller boards
 * (most AVR boards, many ARM devices, ESP8266 and ESP32, among others)
 * to control Adafruit NeoPixels, FLORA RGB Smart Pixels and compatible
 * devices -- WS2811, WS2812, WS2812B, SK6812, etc.
 *
 * Adafruit invests time and resources providing this open source code,
 * please support Adafruit and open-source hardware by purchasing products
 * from Adafruit!
 *
 * @section author Author
 *
 * Written by Phil "Paint Your Dragon" Burgess for Adafruit Industries,
 * with contributions by PJRC, Michael Miller and other members of the
 * open source community.
 *
 * @section license License
 *
 * This file is part of the Adafruit_NeoPixel library.
 *
 * Adafruit_NeoPixel is free software: you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * Adafruit_NeoPixel is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with NeoPixel. If not, see
 * <http://www.gnu.org/licenses/>.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "NuMicro.h"
#include "NeoPixel.h"

volatile uint32_t gu32msTicks = 0;

void SysTick_Handler(void)
{
    gu32msTicks++;
}

void NeoPixel_updateLength(STR_NEOPIXEL_T *pNeoPixel, uint16_t n)
{
    free(pNeoPixel->pu8pixels); // Free existing data (if any)

    // Allocate new data -- note: ALL PIXELS ARE CLEARED
    pNeoPixel->u16numBytes = n * ((pNeoPixel->u8wOffset == pNeoPixel->u8rOffset) ? 3 : 4);
    if((pNeoPixel->pu8pixels = (uint8_t *)malloc(pNeoPixel->u16numBytes))) {
        memset(pNeoPixel->pu8pixels, 0, pNeoPixel->u16numBytes);
        pNeoPixel->u16numLEDs = n;
    } else {
        pNeoPixel->u16numLEDs = pNeoPixel->u16numBytes = 0;
    }
}

void NeoPixel_updateType(STR_NEOPIXEL_T *pNeoPixel, uint8_t t)
{
    uint8_t oldThreeBytesPerPixel = (pNeoPixel->u8wOffset == pNeoPixel->u8rOffset); // false if RGBW

    pNeoPixel->u8wOffset = (t >> 6) & 0b11; // See notes in header file
    pNeoPixel->u8rOffset = (t >> 4) & 0b11; // regarding R/G/B/W offsets
    pNeoPixel->u8gOffset = (t >> 2) & 0b11;
    pNeoPixel->u8bOffset =  t       & 0b11;

    // If bytes-per-pixel has changed (and pixel data was previously
    // allocated), re-allocate to new size. Will clear any data.
    if(pNeoPixel->pu8pixels) {
        uint8_t newThreeBytesPerPixel = (pNeoPixel->u8wOffset == pNeoPixel->u8rOffset);
        if(newThreeBytesPerPixel != oldThreeBytesPerPixel) NeoPixel_updateLength(pNeoPixel, pNeoPixel->u16numLEDs);
  }
}

void NeoPixel_setPin(STR_NEOPIXEL_T *pNeoPixel, volatile uint32_t *pu32pdio)
{
    /* gpio.h:49:0: GPIO_PIN_DATA(port, pin)    (*((volatile uint32_t *)((GPIO_PIN_DATA_BASE+(0x40*(port))) + ((pin)<<2)))) */
    GPIO_T *port;
    int8_t pin;

    /* Get port and pin from PDIO */
    port = (GPIO_T *)( ( ( (uint32_t)pu32pdio - GPIO_PIN_DATA_BASE) & 0x1C0) + PA_BASE);
    pin = ( ( (uint32_t)pu32pdio - GPIO_PIN_DATA_BASE) & 0x3F) >> 2;

    _GPIO_SET_PIN_MODE(port, pin, GPIO_MODE_OUTPUT);

    *pu32pdio = 0; // PDIO output low

    pNeoPixel->pu32pdio = pu32pdio;
}

int32_t NeoPixel_begin(STR_NEOPIXEL_T *pNeoPixel, uint16_t n, volatile uint32_t *p, uint8_t t)
{
    uint32_t returnCode;

    pNeoPixel->u8begun = 0;
    pNeoPixel->u8brightness = 0;
    pNeoPixel->pu8pixels = NULL;
    pNeoPixel->u32endTime = 0;

    NeoPixel_updateType(pNeoPixel, t);      // NeoPixel type
    NeoPixel_updateLength(pNeoPixel, n);    // Number of pixels
    NeoPixel_setPin(pNeoPixel, p);          // Pointer of the GPIO Px.n Pin Data Input/Outut Register (Pxn_PDIO)

    /* Configure SysTick to generate an interrupt every millisecond */
    returnCode = SysTick_Config(SystemCoreClock / 1000);

    if (returnCode == 0)
        pNeoPixel->u8begun = 1;

    return pNeoPixel->u8begun;
}

uint8_t canShow(STR_NEOPIXEL_T *pNeoPixel)
{
    if (pNeoPixel->u32endTime > gu32msTicks) {
        pNeoPixel->u32endTime = gu32msTicks;
    }
    return (gu32msTicks - pNeoPixel->u32endTime) >= 1;
}

void NeoPixel_show(STR_NEOPIXEL_T *pNeoPixel)
{
    uint8_t  *ptr, *end, p, bitMask;
    uint32_t t0, t1, top, ticks, F_CPU, saveLoad, saveVal;

    ptr     =  pNeoPixel->pu8pixels;
    end     =  ptr + pNeoPixel->u16numBytes;
    p       = *ptr++;
    bitMask =  0x80;

    /* Make sure that SysTick has been config */
    while(!canShow(pNeoPixel));

    /* Disable all interrupts force the timming */
    __disable_irq();

    saveLoad = SysTick->LOAD; 
    saveVal = SysTick->VAL;

    F_CPU = CLK_GetCPUFreq();

    top =       (uint32_t)(F_CPU * 0.00000125); // Bit hi + lo = 1.25 uS
    t0  = top - (uint32_t)(F_CPU * 0.00000040); // 0 = 0.4 uS hi
    t1  = top - (uint32_t)(F_CPU * 0.00000080); // 1 = 0.8 uS hi
    
    SysTick->LOAD = top;               // Config SysTick for NeoPixel bit freq
    SysTick->VAL  = top;               // Set to start value (counts down)
    (void)SysTick->VAL;                // Dummy read helps sync up 1st bit

    for(;;) {
        *pNeoPixel->pu32pdio  = 1;          // Set output high
        ticks = (p & bitMask) ? t1 : t0;    // SysTick threshold,
        while(SysTick->VAL > ticks);        // wait for it
        *pNeoPixel->pu32pdio  = 0;          // Set output low
        if(!(bitMask >>= 1)) {              // Next bit for this byte...done?
            if(ptr >= end) break;           // If last byte sent, exit loop
            p       = *ptr++;               // Fetch next byte
            bitMask = 0x80;                 // Reset bitmask
        }
        while(SysTick->VAL <= ticks);       // Wait for rollover to 'top'
    }

    SysTick->LOAD = saveLoad;          // Restore SysTick rollover to 1 ms
    SysTick->VAL  = saveVal;           // Restore SysTick value

    /* Turn the interrupt back */
    __enable_irq();
}

void NeoPixel_setPixelColor(STR_NEOPIXEL_T *pNeoPixel, uint16_t n, uint8_t r, uint8_t g, uint8_t b)
{
    if(n < pNeoPixel->u16numLEDs) {
        if(pNeoPixel->u8brightness) { // See notes in setBrightness()
            r = (r * pNeoPixel->u8brightness) >> 8;
            g = (g * pNeoPixel->u8brightness) >> 8;
            b = (b * pNeoPixel->u8brightness) >> 8;
        }
        uint8_t *p;
        if(pNeoPixel->u8wOffset == pNeoPixel->u8rOffset) { // Is an RGB-type strip
            p = &pNeoPixel->pu8pixels[n * 3];   // 3 bytes per pixel
        } else {                                // Is a WRGB-type strip
            p = &pNeoPixel->pu8pixels[n * 4];   // 4 bytes per pixel
            p[pNeoPixel->u8wOffset] = 0;        // But only R,G,B passed -- set W to 0
        }
        p[pNeoPixel->u8rOffset] = r;        // R,G,B always stored
        p[pNeoPixel->u8gOffset] = g;
        p[pNeoPixel->u8bOffset] = b;
    }
}

void NeoPixel_fill(STR_NEOPIXEL_T *pNeoPixel, uint8_t r, uint8_t g, uint8_t b, uint16_t first, uint16_t count)
{
    uint16_t i, end;

    if(first >= pNeoPixel->u16numLEDs) {
        return; // If first LED is past end of strip, nothing to do
    }

    // Calculate the index ONE AFTER the last pixel to fill
    if(count == 0) {
        // Fill to end of strip
        end = pNeoPixel->u16numLEDs;
    } else {
        // Ensure that the loop won't go past the last pixel
        end = first + count;
        if(end > pNeoPixel->u16numLEDs) end = pNeoPixel->u16numLEDs;
    }

    for(i = first; i < end; i++) {
        NeoPixel_setPixelColor(pNeoPixel, i, r, g, b);
    }
}

uint32_t NeoPixel_ColorHSV(uint16_t hue, uint8_t sat, uint8_t val)
{
    uint8_t r, g, b;

    hue = (hue * 1530L + 32768) / 65536;

    // Convert hue to R,G,B (nested ifs faster than divide+mod+switch):
    if(hue < 510) {         // Red to Green-1
        b = 0;
        if(hue < 255) {     //   Red to Yellow-1
            r = 255;
            g = hue;        //     g = 0 to 254
        } else {            //   Yellow to Green-1
            r = 510 - hue;  //     r = 255 to 1
            g = 255;
        }
    } else if(hue < 1020) { // Green to Blue-1
        r = 0;
        if(hue <  765) {    //   Green to Cyan-1
            g = 255;
            b = hue - 510;  //     b = 0 to 254
        } else {            //   Cyan to Blue-1
        g = 1020 - hue;     //     g = 255 to 1
        b = 255;
        }
    } else if(hue < 1530) { // Blue to Red-1
        g = 0;
        if(hue < 1275) {    //   Blue to Magenta-1
            r = hue - 1020; //     r = 0 to 254
            b = 255;
        } else {            //   Magenta to Red-1
            r = 255;
            b = 1530 - hue; //     b = 255 to 1
        }
    } else {                // Last 0.5 Red (quicker than % operator)
        r = 255;
        g = b = 0;
    }

    // Apply saturation and value to R,G,B, pack into 32-bit result:
    uint32_t v1 =   1 + val; // 1 to 256; allows >>8 instead of /255
    uint16_t s1 =   1 + sat; // 1 to 256; same reason
    uint8_t  s2 = 255 - sat; // 255 to 0
    return ((((((r * s1) >> 8) + s2) * v1) & 0xff00) << 8) |
            (((((g * s1) >> 8) + s2) * v1) & 0xff00)       |
            (((((b * s1) >> 8) + s2) * v1)           >> 8);
}

uint32_t NeoPixel_getPixelColor(STR_NEOPIXEL_T *pNeoPixel, uint16_t n)
{
    if(n >= pNeoPixel->u16numLEDs) return 0; // Out of bounds, return no color.

    uint8_t *p;

    if(pNeoPixel->u8wOffset == pNeoPixel->u8rOffset) { // Is RGB-type device
        p = &pNeoPixel->pu8pixels[n * 3];
        if(pNeoPixel->u8brightness) {
            // Stored color was decimated by setBrightness(). Returned value
            // attempts to scale back to an approximation of the original 24-bit
            // value used when setting the pixel color, but there will always be
            // some error -- those bits are simply gone. Issue is most
            // pronounced at low brightness levels.
            return  (((uint32_t)(p[pNeoPixel->u8rOffset] << 8) / pNeoPixel->u8brightness) << 16) |
                    (((uint32_t)(p[pNeoPixel->u8gOffset] << 8) / pNeoPixel->u8brightness) <<  8) |
                    ( (uint32_t)(p[pNeoPixel->u8bOffset] << 8) / pNeoPixel->u8brightness       );
            } else {
            // No brightness adjustment has been made -- return 'raw' color
            return  ((uint32_t)p[pNeoPixel->u8rOffset] << 16) |
                    ((uint32_t)p[pNeoPixel->u8gOffset] <<  8) |
                     (uint32_t)p[pNeoPixel->u8bOffset];
        }
    } else {                 // Is RGBW-type device
        p = &pNeoPixel->pu8pixels[n * 4];
        if(pNeoPixel->u8brightness) { // Return scaled color
            return  (((uint32_t)(p[pNeoPixel->u8wOffset] << 8) / pNeoPixel->u8brightness) << 24) |
                    (((uint32_t)(p[pNeoPixel->u8rOffset] << 8) / pNeoPixel->u8brightness) << 16) |
                    (((uint32_t)(p[pNeoPixel->u8gOffset] << 8) / pNeoPixel->u8brightness) <<  8) |
                    ( (uint32_t)(p[pNeoPixel->u8bOffset] << 8) / pNeoPixel->u8brightness       );
            } else { // Return raw color
            return  ((uint32_t)p[pNeoPixel->u8wOffset] << 24) |
                    ((uint32_t)p[pNeoPixel->u8rOffset] << 16) |
                    ((uint32_t)p[pNeoPixel->u8gOffset] <<  8) |
                     (uint32_t)p[pNeoPixel->u8bOffset];
        }
    }
}

void NeoPixel_setBrightness(STR_NEOPIXEL_T *pNeoPixel, uint8_t b)
{
    uint8_t newBrightness = b + 1;
    if(newBrightness != pNeoPixel->u8brightness) {
        uint8_t  c,
                *ptr           = pNeoPixel->pu8pixels,
                 oldBrightness = pNeoPixel->u8brightness - 1; // De-wrap old brightness value
        uint16_t scale;
        if(oldBrightness == 0) scale = 0; // Avoid /0
        else if(b == 255) scale = 65535 / oldBrightness;
        else scale = (((uint16_t)newBrightness << 8) - 1) / oldBrightness;
        for(uint16_t i=0; i<pNeoPixel->u16numBytes; i++) {
             c     = *ptr;
            *ptr++ = (c * scale) >> 8;
        }
        pNeoPixel->u8brightness = newBrightness;
    }
}

uint8_t NeoPixel_getBrightness(STR_NEOPIXEL_T *pNeoPixel)
{
    return pNeoPixel->u8brightness - 1;
}

void NeoPixel_clear(STR_NEOPIXEL_T *pNeoPixel)
{
    memset(pNeoPixel->pu8pixels, 0, pNeoPixel->u16numBytes);
}

// A 32-bit variant of gamma8() that applies the same function
// to all components of a packed RGB or WRGB value.
uint32_t NeoPixel_gamma32(uint32_t x)
{
    uint8_t *y = (uint8_t *)&x;
    // All four bytes of a 32-bit value are filtered even if RGB (not WRGB),
    // to avoid a bunch of shifting and masking that would be necessary for
    // properly handling different endianisms (and each byte is a fairly
    // trivial operation, so it might not even be wasting cycles vs a check
    // and branch for the RGB case). In theory this might cause trouble *if*
    // someone's storing information in the unused most significant byte
    // of an RGB value, but this seems exceedingly rare and if it's
    // encountered in reality they can mask values going in or coming out.
    for(uint8_t i=0; i<4; i++) y[i] = NeoPixel_gamma8(y[i]);
    return x; // Packed 32-bit return
}
