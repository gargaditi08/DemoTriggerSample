//
//  fp_core.h
//  Copyright (c) 2013 Cifrasoft. All rights reserved.
//

#ifndef _FP_CORE_H
#define _FP_CORE_H
#ifdef __cplusplus
extern "C" {
#endif
    
#include "ac_typedef.h"
    
#define AS_LOCAL_SEARCH_NOT_FOUND           (-1)
#define AS_ERROR_INITIALIZATION				(-100)
#define AS_ERROR_LENGTH_FINGERPRINT_BUFFER	(-101)
#define AS_ERROR_OPEN_LOCAL_SEARCH_FILE     (-102)
#define AS_ERROR_FORMAT_LOCAL_SEARCH_FILE   (-103)

    
    int fingerprint_prepare(void **handler, Word16 *input, int nPts);
    int fingerprint_make(void **handler, Word32 *fingerprint, int nPts);
    int fingerprint_open(void **handler);
    int fingerprint_close(void **handler);
    int fingerprint_reset(void **handler);
    int fingerprint_local_search(Word32 *fp, int nPts, const char *path, const char *filename, int *offset);
    int fingerprint_local_file_check_hash(Word32 *hash, const char *path, const char *filename);
    
#ifdef __cplusplus
}
#endif

#endif
