//
//  NCGenericTrigger.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/22/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCSignal.h"

@class NCGenericTrigger;
@protocol NCTriggerDelegate <NSObject>
@optional
- (void)triggerDidRegister:(NCGenericTrigger *)trigger error:(NSError *)error;
- (void)triggerDidUnregister:(NCGenericTrigger *)trigger error:(NSError *)error;
- (void)trigger:(NCGenericTrigger *)trigger foundBluetooth:(NSArray *)devices;

@required
- (void)trigger:(NCGenericTrigger *)trigger signal:(NCSignal *)signal didCatchContent:(NSArray <NCContent *>*)content error:(NSError *)error;

@end

@interface NCGenericTriggerOptions : NSObject

/**
 * @see NCTriggerDelegate <br>
 * Flag that allows (if nessisary) perimissions to be set in triggerDidRegister: <br>
 * Defaults to YES
 */
@property (nonatomic) BOOL requestPermissionsOnRegister;

/**
 * The amount of time in milliseconds till the trigger manager can catch a trigger with the same trigger value
 */
@property (nonatomic) NSTimeInterval TTL;

@end

/**
 * NCGenericTrigger
 * Conforms to NCTriggerDelegate
 *
 *
 *   @optional
 *   - (void)triggerDidRegister:(NCGenericTrigger *)trigger error:(NSError *)error;
 *   - (void)triggerDidUnregister:(NCGenericTrigger *)trigger error:(NSError *)error;
 *
 *   @required
 *   - (void)trigger:(NCGenericTrigger *)trigger signal:(NCTrigger *)signal didCatchContent:(NSArray <NCContent *>*)content error:(NSError *)error;
 */

@interface NCGenericTrigger : NSObject

/**
 * Delegate property <br>
 *
 *
 *   @optional
 *   - (void)triggerDidRegister:(NCGenericTrigger *)trigger error:(NSError *)error <br>
 *   - (void)triggerDidUnregister:(NCGenericTrigger *)trigger error:(NSError *)error <br>
 *
 *   Required methods <br>
 *   - (void)trigger:(NCGenericTrigger *)trigger signal:(NCTrigger *)signal didCatchContent:(NSArray <NCContent *>*)content error:(NSError *)error
 */
@property (strong, nonatomic) id <NCTriggerDelegate> delegate;

/**
 * This should only be set once, and should be set before validateTrigger: is called
 * @code
 *
 *   NSMutableArray <NCContent *>*array = [[NCContentManager sharedManager] wallet];
 *   NCContent *content = [array firstObject];
 *   NCTrigger *trigger = [[NCTrigger alloc] initWithUUID:content.UUID];
 *   [trigger setType:@"touch"];
 *   [[NCTriggerManager sharedManager] validateTrigger:self against:trigger];
 *
 * @endcode
 */
@property (strong, nonatomic) NSString *triggerType;

/**
 * Used to apply custom options that can be set per trigger <br>
 * NOT Required - Defaults will be used
 * @see NCGenericTriggerOptions
 */
- (id)initWithOptions:(NCGenericTriggerOptions *)options;

/**
 * This method should never be called on the base classe, call the subclassed methods instead<br>
 * This method starts the nessisary services required for the trigger <br>
 * Permissions (if nessisary) need to be requested before calling this method
 */
- (void)start;

/**
 * This method should never be called on the base classe, call the subclassed methods instead<br>
 * This method stops the nessisary services required for the trigger <br>
 */
- (void)stop;

/**
 * This method should never be called on the base classe, call the subclassed methods instead<br>
 * This method request the nessisary permissions required for the trigger <br>
 */
- (void)requestPermission;

/**
 * For reference only this should not be changed here.
 * create a new trigger instance instead, unregister -> register
 * @see NCTriggerManager
 */
- (NCGenericTriggerOptions *)triggerOptions;

@end
