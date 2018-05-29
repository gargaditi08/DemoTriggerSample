//
//  VATriggerAudio.h
//  ValenceAudio
//
//  Created by Nikolai Annenkoff on 5/24/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Nucleus/NCGenericTrigger.h>

// This Trigger requires the NSMicrophoneUsageDescription permission

@interface VATriggerAudio : NCGenericTrigger

@property (nonatomic) BOOL autoMode;

- (id)initWithOptions:(NCGenericTriggerOptions *)options;

#pragma mark - Inherited Methods
- (void)start;
- (void)stop;

@end
