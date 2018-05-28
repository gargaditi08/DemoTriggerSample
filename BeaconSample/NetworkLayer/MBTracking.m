//
//  MBTracking.m
//  Mobii
//
//  Created by Nikolai Annenkoff on 11/7/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "MBTracking.h"
#import <Nucleus/Nucleus.h>
#import "MBState.h"

@interface MBTracking ()

//@property (nonatomic, strong) id <GAITracker>tracker;
@property (nonatomic, strong) NSMutableDictionary *objects;

@end

@implementation MBTracking

+ (id)sharedInstance {
    static MBTracking *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        manager.objects = [NSMutableDictionary new];
    });
    
    NSString *trackingId = @"UA-112378068-1";
   // manager.tracker = [[GAI sharedInstance] trackerWithTrackingId:trackingId];
    
    NCUser *user = [NCAPIManager user];
    if (user) {
//        if ([user.name length]) [[Crashlytics sharedInstance] setUserName:user.name];
//        if ([user.name length]) [[Crashlytics sharedInstance] setUserEmail:user.email];
//        [[Crashlytics sharedInstance] setObjectValue:user.login_method forKey:@"login_method"];
//        [[Crashlytics sharedInstance] setUserIdentifier:[NSString stringWithFormat:@"%@", user.Id]];
//
        NSString *englishLocale = @"en";
        NSString *spanishLocale = @"es";
        NSArray *array = @[englishLocale, spanishLocale];
        
        for (NSString *locale in array) {
            if ([[[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0] isEqualToString:locale]) {
             //   [[Crashlytics sharedInstance] setObjectValue:locale forKey:@"locale"];
                break;
            }
        }
        
       // [[Crashlytics sharedInstance] setObjectValue:englishLocale forKey:@"locale"];
    }
    
    return manager;
}

+ (void)startTimerFor:(NSString *)key {
    if ([[self sharedInstance] objects][key] != nil) {
        NSAssert(YES, @"key already being monitored");
    }
    @synchronized([[self sharedInstance] objects]) {
        [[[self sharedInstance] objects] setObject:[NSDate date] forKey:key];
    }
}

+ (NSTimeInterval)stopTimerFor:(NSString *)key {
    NSMutableDictionary *items = [[self sharedInstance] objects];
    NSTimeInterval difference = [items[key] timeIntervalSinceNow];
    @synchronized([[self sharedInstance] objects]) {
        [[[self sharedInstance] objects] removeObjectForKey:key];
    }
    
    return difference;
}

+ (void)registerScreenName:(NSString *)name {
//    id <GAITracker>tracker = [[MBTracking sharedInstance] tracker];
//    [tracker set:kGAIScreenName value:name];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

+ (void)registerAction:(NSString *)actionName label:(NSString *)label value:(NSNumber *)value {
//    id <GAITracker>tracker = [[MBTracking sharedInstance] tracker];
//    NSMutableDictionary *event = [[GAIDictionaryBuilder createEventWithCategory:@"Action" action:actionName label:label value:value] build];
//    [tracker send:event];
}

+ (void)registerData:(NSString *)name value:(NSDictionary *)value {
//    id <GAITracker>tracker = [[MBTracking sharedInstance] tracker];
//    NSMutableDictionary *event = [[GAIDictionaryBuilder createEventWithCategory:name action:nil label:nil value:@(0)] build];
//    for (NSString *key in [value allKeys]) {
//        [event setObject:value[key] forKey:[GAIFields customMetricForIndex:[[value allKeys] indexOfObject:key]]];
//    }
//
//    [tracker send:event];
}

@end
