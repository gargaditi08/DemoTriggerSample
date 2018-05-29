#import     <UIKit/UIKit.h>

//#define GLOBAL_LOGGING_ON
#define SCS_AUDIO_SAMPLES_FIFO_BUFFER_MAX_LENGTH            (44100*4)        
#define SCS_SEARCH_INTERVAL_DEFAULT                         1.0f
#define SCS_COUNTER_LENGTH                                  6
#define SCS_COUNTER_INCREMENT                               1
#define SCS_COUNTER_OFFSET_VALUE                            0
#define SCS_DELAY_OFFSET_ADJUSTMENT                         +0.0f

#define SCS_MANAGER_NOTIFICATION                            @"scsManagerNotification"
#define SCS_MANAGER_NOTIFICATION_STATE_KEY                  @"scsManagerNotificationStateKey"

#define SCS_AUDIO_MANAGER_NOTIFICATION						@"scsAudioManagerNotification"
#define SCS_AUDIO_MANAGER_NOTIFICATION_ERROR_KEY			@"scsAudioManagerNotificationErrorKey"
#define SCS_AUDIO_MANAGER_NOTIFICATION_STATE_CHANGE_KEY		@"scsAudioManagerNotificationStateChangeKey"

#define SCS_SEARCH_MANAGER_NOTIFICATION						@"scsSearchManagerNotification"
#define SCS_SEARCH_MANAGER_NOTIFICATION_ERROR_KEY			@"scsSearchManagerNotificationErrorKey"
#define SCS_SEARCH_MANAGER_NOTIFICATION_RESULT_KEY			@"scsSearchManagerNotificationResultKey"
#define SCS_SEARCH_MANAGER_NOTIFICATION_OFFSET_KEY			@"scsSearchManagerNotificationOffsetKey"
#define SCS_SEARCH_MANAGER_NOTIFICATION_STATE_CHANGE_KEY	@"scsSearchManagerNotificationStateChangeKey"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

typedef struct scsSettingsStruct {
	NSTimeInterval                  userSearchInterval;
    int                             userLengthCounter;
    int                             userPeriodIncrementCounter;
    int                             userOffsetCounterAdjustment;
    float                           userOffsetDelayAdjustment;
} scsSettingsStruct;

typedef enum SCSManagerState: NSUInteger {
    SCSManagerEventErrorLocalSearchFileServiceUnavailable,
    SCSManagerEventUpdateLocalSearchFile,
    SCSManagerEventNoUpdateLocalSearchFile,
    SCSManagerEventCheckLocalSearchFileHash
} SCSManagerState;

typedef enum SCSAudioManagerState: NSUInteger {
	SCSAudioManagerStateUninitialized,
    SCSAudioManagerStateRecording,
    SCSAudioManagerStatePaused,
    SCSAudioManagerStateStopped,
    SCSAudioManagerStateError,
    SCSAudioManagerStatePermDenied
} SCSAudioManagerState;


typedef enum SCSSearchManagerState: NSUInteger {
	SCSSearchManagerStateUninitialized,
    SCSSearchManagerStateSearching,
    SCSSearchManagerStateSingleSearching,
    SCSSearchManagerStatePaused,
    SCSSearchManagerStateStopped
} SCSSearchManagerState;

typedef enum SCSSearchManagerResult: int64_t {
    SCSSearchManagerResultNotFound,
    SCSSearchManagerResultFound,
} SCSSearchManagerResult;

typedef enum SCSSearchManagerError: NSUInteger {
    SCSSearchManagerErrorInitialization,
} SCSSearchManagerError;






