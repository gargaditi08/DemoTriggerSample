//
//  Defines.h
//  ACAudioSearch
//
//  Created by Andrey Brusnikin on 14.05.15.
//  Copyright (c) 2015 Cifrasoft. All rights reserved.
//

#ifndef ACAudioSearch_Defines_h
#define ACAudioSearch_Defines_h

#import     <UIKit/UIKit.h>

typedef long int    TFTShift;
typedef int         TFTId;
typedef float       TFTDelay;

typedef struct tfCrossingPoint {
    TFTId fragmentlId;
    TFTShift overlapShift;
} TFCrossingPoint;

//#define GLOBAL_LOGGING_ON

#define TF_REQUEST_ERROR @"com.cifrasoft.tfsearchrequest"
//#define TF_FPDB_ERROR @"com.cifrasoft.tffpdb"
#define TF_ERR_CODE_JSONERR  101
#define TF_ERR_CODE_DATAERR  102
#define TF_ERR_CODE_RESPERR  103
//#define TF_ERR_CODE_NOTFOUND  101

#define VIDEOTAG_API_FUNC_SEARCH        @"getSampleIDandShift.php"
#define VIDEOTAG_API_FUNC_HASH          @"getfdb.php"
#define VIDEOTAG_API_PATH_SEARCH        @"http://sonar.actv8technologies.com/fdb/"

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#endif
