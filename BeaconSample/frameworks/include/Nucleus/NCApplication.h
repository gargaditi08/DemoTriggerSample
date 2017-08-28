//
//  NCApplication.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/3/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "NCGenericModel.h"

@interface NCApplication : NCGenericModel

@property (nonatomic, strong, readonly) NSString *uuid;
@property (nonatomic, strong, readonly) NSString *deviceId;
@property (nonatomic, strong) NSString *apiKey;
@property (nonatomic, strong) NSString *manufacturer;
@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *locale;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *osName;
@property (nonatomic, strong) NSString *osVersion;
@property (nonatomic, strong) NSString *sdkVersion;
@property (nonatomic, strong) NSString *carrier;

- (id)initWithAPIKey:(NSString *)key;
+ (NSDictionary *)JSONKeyPathsByPropertyKey;

@end
