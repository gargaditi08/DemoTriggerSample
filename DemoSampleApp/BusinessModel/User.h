//
//  User.h
//  DemoTriggerAT
//
//  Created by k2annex on 10/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic,strong) NSString *auth_token;

+ (instancetype)sharedInstance;

@end
