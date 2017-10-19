//
//  NCScratcherState.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 6/22/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCGenericModel.h"

@interface NCScratcherState : NCGenericModel

@property (nonatomic) NSInteger dailyPlayed;
@property (nonatomic) NSInteger bonusPlayed;
@property (nonatomic) NSInteger dailyQuantity;
@property (nonatomic) NSInteger bonusQuantity;
@property (nonatomic) NSInteger shared;
@property (nonatomic, readonly) NSInteger remainingScratchers;

@end
