//
//  NCSignal.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/8/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "NCGenericModel.h"
#import "NCContent.h"

@interface NCSignal : NCGenericModel

@property (strong, nonatomic) NSString *uuid; // Input
@property (strong, nonatomic) NSDictionary *contents; // Output
@property (strong, nonatomic) NCContent *content; // Output
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSDate *timestamp;
@property (strong, nonatomic) id original; // original object

- (instancetype)initWithUUID:(NSString *)uuid;

@end
