#import     "SCSManager.h"
#import     "SCSSettings.h"

@interface SCSSearchManager : NSObject

+ (SCSSearchManager*) sharedManager;

@property (nonatomic, readonly) SCSSearchManagerState 	state;
- (void) startSearchingManager;
- (void) stopSearchingManager;
- (void) singleSearchingManager;
- (void) settingsSearchManager:(scsSettingsSearchManagerStruct*) settings;


@end
