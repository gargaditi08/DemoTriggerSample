//
//  NCSessionManager.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/4/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

static NSString * const baseAPI;

@interface NCSessionManager : AFHTTPSessionManager

+ (id)sharedManager;

@end
