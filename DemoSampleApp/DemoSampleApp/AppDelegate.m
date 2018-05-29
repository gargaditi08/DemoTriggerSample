//
//  AppDelegate.m
//  DemoAudioTouch
//
//  Created by k2annex on 18/05/18.
//  Copyright © 2018 k2annex. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<NCTriggerDelegate>
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    NSString *remoteHostName = @"www.google.com";
    self.hostReachability = [Availablility reachabilityWithHostName:remoteHostName];
    [self.hostReachability startNotifier];
    
    NCUser *user = [[NCUser alloc]init];
    user.email = @"dm.winsnit@gmail.com";
    user.password = @"sara2849";
    user.login_method = @"email";
    
    
    [NCAPIManager setBaseUrl:[MBState url]];
    [NCAPIManager setAPIKey:[MBState key]];
    [[NCAPIManager sharedManager] setLogRequests:NO];
    
    
    NSString *audio = @"undetermined";
    switch ([AVAudioSession sharedInstance].recordPermission) {
            case AVAudioSessionRecordPermissionDenied:
            audio = @"denied";
            break;
            case AVAudioSessionRecordPermissionGranted:
            audio = @"granted";
            break;
            case AVAudioSessionRecordPermissionUndetermined:
        default:
            break;
    }
    
    NSString *location = @"undetermined";
    switch ([CLLocationManager authorizationStatus]) {
            case kCLAuthorizationStatusDenied:
            location = @"denied";
            case kCLAuthorizationStatusRestricted:
            location = @"restricted";
            break;
            
            case kCLAuthorizationStatusAuthorizedWhenInUse:
            location = @"authorized when in use";
            break;
            
            case kCLAuthorizationStatusAuthorizedAlways:
            location = @"always authorized";
            break;
            
            case kCLAuthorizationStatusNotDetermined:
        default:
            break;
    }
    
    [MBTracking registerData:@"Permissions" value:@{@"audio" : audio,
                                                    @"location" : location
                                                    }];
    
    
    [NCAPIManager login:user callback:^(NSDictionary *response, NSError *error){
        if (error) {
            if (error.code == 404) {
                [NCAPIManager registerUser:user callback:^(NSError *error) {
                    if (!error) {
                        [NCAPIManager login:user callback:^(NSDictionary *response, NSError *error){
                            //   [self setupBeacons];
                        }];
                    }
                }];
            }
        } else {
            //[self setupBeacons];
        }
    }];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:DefaultsOnboardingCompleteKey]) {
        if (self.audio.autoMode) {
            [self.audio start];
            [NSObject cancelPreviousPerformRequestsWithTarget:self];
            //            [self performSelector:@selector(shutOffMicrophone) withObject:nil afterDelay:60 * 60];
        } else {
            [self.audio stop];
        }
    }
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    if ([[NSUserDefaults standardUserDefaults] objectForKey:DefaultsOnboardingCompleteKey]) {
        [MBTracking registerData:@"Permissions" value:@{@"audio" : @([[AVAudioSession sharedInstance] recordPermission]),
                                                        @"location" : @([CLLocationManager authorizationStatus])
                                                        }];
        if (self.audio) {
            [self.audio start];
            
        }
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    if ([MBState isRelease] || [MBState audioDetection]) {
        if (!self.audio) {
            NCGenericTriggerOptions *options = [NCGenericTriggerOptions new];
            options.requestPermissionsOnRegister = NO;
            self.audio = [[VATriggerAudio alloc] initWithOptions:options];
            [self.audio setDelegate:self];
            [[NCTriggerManager sharedManager] registerTrigger:self.audio];
        }
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Helper Methods
- (BOOL)internetIsAvailable {
    BOOL reachable = NO;
    NetworkStatus netStatus = [self.hostReachability currentReachabilityStatus];
    if(netStatus == ReachableViaWWAN || netStatus == ReachableViaWiFi) {
        reachable = YES;
    } else {
        reachable = NO;
    }
    return reachable;
}
- (void)startAllTriggers {
    [self.audio start];
  
}

- (void)shutOffMicrophone {
    [self.audio stop];
}

#pragma mark - Trigger Detection

- (void)triggerDidRegister:(NCGenericTrigger *)trigger error:(NSError *)error {
    NSLog(@"Registered Trigger: %@ %@", trigger, error);
}

- (void)triggerDidUnregister:(NCGenericTrigger *)trigger error:(NSError *)error {
    NSLog(@"Unregistered Trigger: %@ %@", trigger, error);
}

- (void)trigger:(NCGenericTrigger *)trigger signal:(NCSignal *)signal didCatchContent:(NSArray <NCContent *>*)content error:(NSError *)error {
    if (!error) {
        if ([content count]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"didCatchContent" object:nil userInfo:nil];
        }
    }
}




@end
