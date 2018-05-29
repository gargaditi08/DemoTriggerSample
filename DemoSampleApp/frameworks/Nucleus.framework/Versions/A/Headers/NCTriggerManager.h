//
//  NCTriggerManager.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/25/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCGenericTrigger.h"

@interface NCTriggerManager : NSObject

+ (nonnull id)sharedManager;

#pragma mark - Triggers

/**
 * Used to register the corresponding trigger with the singleton
 * @code
 *   self.beacon = [[VATriggerBeacon alloc] init];
 8   [self.beacon setDelegate:self];
 *   [self.beacon setNamespaceID:@"f7826da64fa24e988024"];
 *   [[NCTriggerManager sharedManager] registerTrigger:self.beacon];
 *   [self.beacon start];
 * @endcode
 */
- (void)registerTrigger:(nonnull NCGenericTrigger *)trigger;

/**
 * Useful to have a trigger stop listening
 */
- (void)unregisterTrigger:(nonnull NCGenericTrigger *)trigger;

/**
 * Enables callback for classes dependent on knowing if devices were found <br>
 * only for beacons
 */
- (void)trigger:(nonnull NCGenericTrigger *)trigger foundDevices:(nullable NSArray *)devices;

/**
 * Compares a signal to a trigger, and request content if they match <br>
 * Calls the following method from NCGenericTrigger
 * @code
 * - (void)trigger:(NCGenericTrigger *)trigger signal:(NCTrigger *)signal didCatchContent:(NSArray <NCContent *>*)content error:(NSError *)error
 * @endcode
 * @see NCGenericTrigger
 */
- (void)validateTrigger:(nonnull NCGenericTrigger *)trigger against:(nonnull NCSignal *)signal;

/**
 * For reference only this should not be changed here.
 */
- (nullable NSArray *)registeredTriggers;

/**
 * For reference only this should not be changed here.
 */
- (nullable NSArray *)recentSignals;

/**
 * Clear signals caught from sources
 * used typically between users
 */
- (void)clearSignals;

@end
