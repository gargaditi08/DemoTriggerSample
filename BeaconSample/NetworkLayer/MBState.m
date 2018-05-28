//
//  MBState.m
//  Mobii
//
//  Created by Nikolai Annenkoff on 11/8/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "MBState.h"

NSString * const customUrlKey = @"customUrlKey";
NSString * const customApiKey = @"customApiKey";
NSString * const touchDetectionKey = @"touchDetectionKey";
NSString * const audioDetectionKey = @"audioDetectionKey";
NSString * const beaconDetectionKey = @"beaconDetectionKey";
NSString * const geofenceDetectionKey = @"geofenceDetectionKey";

@implementation MBState

+ (BOOL)isDevelopment {
#ifdef DEBUG
    return YES;
#endif
    return NO;
}

+ (BOOL)isRelease {
#ifdef RELEASE
    return YES;
#endif
    return NO;
}

+ (void)setUrl:(NSString *)url {
    if ([url length]) {
        [[NSUserDefaults standardUserDefaults] setObject:url forKey:customUrlKey];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:customUrlKey];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)url {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:customUrlKey]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"secrets" ofType:@"plist"];
        NSDictionary *configuration = [[NSDictionary alloc] initWithContentsOfFile:path];
        return configuration[@"stage"][@"ACTV8me URL"];
    }
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:customUrlKey];
}

+ (void)setKey:(NSString *)key {
    if ([key length]) {
        [[NSUserDefaults standardUserDefaults] setObject:key forKey:customApiKey];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)key {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:customApiKey]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"secrets" ofType:@"plist"];
        NSDictionary *configuration = [[NSDictionary alloc] initWithContentsOfFile:path];
        return configuration[@"stage"][@"ACTV8me API KEY"];
    }
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:customApiKey];
}

+ (void)setTouchDetection:(BOOL)isEnabled {
    [[NSUserDefaults standardUserDefaults] setBool:isEnabled forKey:touchDetectionKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)touchDetection {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:touchDetectionKey]) {
        [MBState setTouchDetection:YES];
    }
    return [[NSUserDefaults standardUserDefaults] boolForKey:touchDetectionKey];
}

+ (void)setAudioDetection:(BOOL)isEnabled {
    [[NSUserDefaults standardUserDefaults] setBool:isEnabled forKey:audioDetectionKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)audioDetection {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:audioDetectionKey]) {
        [MBState setAudioDetection:YES];
    }
    return [[NSUserDefaults standardUserDefaults] boolForKey:audioDetectionKey];
}

+ (void)setBeaconDetection:(BOOL)isEnabled {
    [[NSUserDefaults standardUserDefaults] setBool:isEnabled forKey:beaconDetectionKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)beaconDetection {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:beaconDetectionKey]) {
        [MBState setBeaconDetection:YES];
    }
    return [[NSUserDefaults standardUserDefaults] boolForKey:beaconDetectionKey];
}

+ (void)setGeofencenDetection:(BOOL)isEnabled {
    [[NSUserDefaults standardUserDefaults] setBool:isEnabled forKey:geofenceDetectionKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)geofenceDetection {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:geofenceDetectionKey]) {
        [MBState setGeofencenDetection:YES];
    }
    return [[NSUserDefaults standardUserDefaults] boolForKey:geofenceDetectionKey];
}

+ (NSURL *)termsURL {
    return [NSURL URLWithString:@""];
}

+ (NSURL *)privacyURL {
    return [NSURL URLWithString:@""];
}

@end
