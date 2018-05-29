//
//  VATriggerGeofence.h
//  ValenceGeofence
//
//  Created by Nikolai Annenkoff on 5/24/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Nucleus/NCGenericTrigger.h>
#import <Nucleus/NCGeofence.h>

@interface VATriggerGeofence : NCGenericTrigger

- (id)init;
- (id)initWithOptions:(NCGenericTriggerOptions *)options;

#pragma mark - Inherited Methods
- (void)start;
- (void)stop;


@end
