//
//  MBState.h
//  Mobii
//
//  Created by Nikolai Annenkoff on 11/8/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBState : NSObject

+ (BOOL)isDevelopment;
+ (BOOL)isRelease;

+ (void)setUrl:(NSString *)url;
+ (NSString *)url;

+ (void)setKey:(NSString *)key;
+ (NSString *)key;

+ (void)setTouchDetection:(BOOL)isEnabled;
+ (BOOL)touchDetection;

+ (void)setAudioDetection:(BOOL)isEnabled;
+ (BOOL)audioDetection;

+ (void)setBeaconDetection:(BOOL)isEnabled;
+ (BOOL)beaconDetection;

+ (void)setGeofencenDetection:(BOOL)isEnabled;
+ (BOOL)geofenceDetection;

+ (NSURL *)termsURL;
+ (NSURL *)privacyURL;

@end
