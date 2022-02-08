#ifndef __AUDIO_CODEC_H__
#define __AUDIO_CODEC_H__

#include "NuMicro.h"

void NAU88L25_Reset(void);
void NAU88L25_Setup(void);
void NAU88L25_ConfigSampleRate(uint32_t u32SampleRate);

#endif
