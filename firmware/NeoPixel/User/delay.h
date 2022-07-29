#ifndef _DELAY_H_
#define _DELAY_H_

#ifdef __cplusplus
extern "C"
{
#endif

void delay(uint32_t u32msDelay);
void delayMicroseconds(uint32_t u32usDelay);
uint32_t timeout(uint32_t u32msTimeout);

#ifdef __cplusplus
}
#endif

#endif
