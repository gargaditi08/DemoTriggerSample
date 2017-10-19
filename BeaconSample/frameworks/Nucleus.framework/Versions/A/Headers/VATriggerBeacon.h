//
//  VATriggerBeacon.h
//  ValenceBeacon
//
//  Created by Nikolai Annenkoff on 5/24/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Nucleus/NCGenericTrigger.h>

/**
 * Bluetooth Permissions required <br>
 * Bluetooth Usage strings required <br>
 * @see NCGenericTrigger in the Base SDK documentation for usage
 */
@interface VATriggerBeacon : NCGenericTrigger

/**
 * Namespace ID assigned to the beacon set
 */
@property (nonatomic, strong) NSString *namespaceID;

@end
