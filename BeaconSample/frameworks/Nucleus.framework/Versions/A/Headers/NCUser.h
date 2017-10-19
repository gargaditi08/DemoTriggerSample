//
//  NCUser.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/3/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "NCGenericModel.h"

typedef NS_ENUM(NSUInteger, NCUserGender) {
    NCUserGenderUnkown,
    NCUserGenderMale,
    NCUserGenderFemale,
};

@interface NCUser : NCGenericModel

@property (nonatomic) NSNumber *Id;
@property (nonatomic, strong) NSString *externalId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email; // Required
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSNumber *gender;
@property (nonatomic, strong) NSString *password; // Required
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *login_method;

@end
