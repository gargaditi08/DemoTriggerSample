#ifndef _SOUND_CODE_H
#define _SOUND_CODE_H
#include "ac_typedef.h"
#ifdef __cplusplus
extern "C" {
#endif
    
#define     SC_N_BITS_MESSAGE   33 
#define     SC_NOT_FOUND       -1
#define     SC_DETECTED_OLD     0
#define     SC_DETECTED_NEW     1
    
int  soundCode_open(void **handler, int counter_length, int counter_inc, Word64 counter_start, float delay_adjustment);
int  soundCode_close(void **handler);
int  soundCode_reset(void **handler, int counter_length, int counter_inc,  Word64 counter_start, float delay_adjustment);
int  soundCode_receiver(void **handler,  void *inSignal, int nPts, Word64 *id, Word64 *counter, float *timeStamp);

#ifdef __cplusplus
}
#endif 

#endif
