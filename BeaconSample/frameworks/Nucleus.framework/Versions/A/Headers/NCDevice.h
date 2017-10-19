//
//  NCDevice.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/3/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "NCGenericModel.h"

@interface NCDevice : NCGenericModel

@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *locale;
@property (nonatomic, strong) NSString *operatingSystem;
@property (nonatomic, strong) NSString *carrierId;

@end
