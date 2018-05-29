#import <Foundation/Foundation.h>
#import <pthread.h>
#import "SCSSettings.h"
#include "ac_vec16.h"

typedef struct samplesFIFOStruct {
    vec16               buffer;
    int                 pWR;
    int                 pRD;
    int                 nSamples;
    bool                overFlow;
    pthread_mutex_t     mBuffer;
} samplesFIFOStruct;

typedef struct scsSettingsAudioManagerStruct {
	void                *info;
    samplesFIFOStruct   *recAudioSamples;
} scsSettingsAudioManagerStruct;

typedef struct scsSettingsSearchManagerStruct {
	void                *info;
    NSTimeInterval      userSearchInterval;
    samplesFIFOStruct   *recAudioSamples;
} scsSettingsSearchManagerStruct;


@interface SCSManager : NSObject
//@property(nonatomic) scsSettingsStruct scsSettings;

+(SCSManager*) sharedManager;

-(void) startSearching;
-(void) singleSearching;
-(void) pauseSearching;
-(void) stopSearching;
-(void) resetSearching;
-(void) settingsSearching:(scsSettingsStruct*) scsSettings;


@end

