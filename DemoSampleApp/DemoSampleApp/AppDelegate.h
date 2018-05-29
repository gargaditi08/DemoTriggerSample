//
//  AppDelegate.h
//  DemoAudioTouch
//
//  Created by k2annex on 18/05/18.
//  Copyright © 2018 k2annex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ValenceAudio/VATriggerAudio.h>
#import <Nucleus/Nucleus.h>
#import <AVFoundation/AVFoundation.h>
#import "MBState.h"
#import "MBTracking.h"
#import "MBNibs.h"
#import "Availablility.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) VATriggerAudio *audio;
@property (nonatomic) Availablility *hostReachability;

- (BOOL)internetIsAvailable;

@end

