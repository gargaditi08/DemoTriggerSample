//
//  MBTracking.h
//  Mobii
//
//  Created by Nikolai Annenkoff on 11/7/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBTracking : NSObject

+ (id)sharedInstance;

/**
 * Tracks time for a specific key
 */
+ (void)startTimerFor:(NSString *)key;
+ (NSTimeInterval)stopTimerFor:(NSString *)key;

+ (void)registerScreenName:(NSString *)name;

+ (void)registerAction:(NSString *)actionName label:(NSString *)label value:(NSNumber *)value;

+ (void)registerData:(NSString *)name value:(NSDictionary *)value;

@end
