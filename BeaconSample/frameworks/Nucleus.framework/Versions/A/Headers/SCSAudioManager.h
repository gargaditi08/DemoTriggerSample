#import 	<Foundation/Foundation.h>
#import     <AudioToolbox/AudioQueue.h>
#import     <AudioToolbox/AudioFile.h>
#import     <AVFoundation/AVAudioSession.h>
#import     "SCSManager.h"
#import     "SCSSettings.h"

#define     SCS_AUDIO_BUFFERS               3
#define     SCS_AUDIO_FRAMESIZE          	44100
#define     SCS_AUDIO_MAX_LENGTH_BUFFER     (4 * SCS_AUDIO_FRAMESIZE)
#define     SCS_AUDIO_SAMPLE_RATE           44100
#define     SCS_AUDIO_BUFFER_SIZE           4096



typedef struct AudioCallbackStruct {
    AudioStreamBasicDescription 		mDataFormat;
    AudioQueueRef               		queue;
    AudioQueueBufferRef         		mBuffers[SCS_AUDIO_BUFFERS];
    void                        		*info;
    samplesFIFOStruct                   *fifoBuffer;
} AudioCallbackStruct;


@interface SCSAudioManager : NSObject

+(SCSAudioManager*) sharedManager;
@property (nonatomic, readonly) SCSAudioManagerState 	state;

- (void) startAudioRecording;
- (void) pauseAudioRecording;
- (void) stopAudioRecording;
- (void) settingsAudioManager:(scsSettingsAudioManagerStruct*) settings;

@end
