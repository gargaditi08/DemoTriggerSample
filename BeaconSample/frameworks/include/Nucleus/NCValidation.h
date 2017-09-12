//
//  NCValidation.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 9/12/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NCValidation : NSObject

/**
 * Validates an email address
 */
+ (BOOL)isValidEmail:(NSString *)email;

/**
 * Validates a password
 */
+ (BOOL)isValidPassword:(NSString *)password;

@end
