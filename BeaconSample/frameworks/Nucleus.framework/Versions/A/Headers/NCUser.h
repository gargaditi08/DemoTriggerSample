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

@interface NCToken : NCGenericModel

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *access;
@property (nonatomic, strong) NSString *refresh;
@property (nonatomic, strong) NSNumber *expires_in;

@end

extern NSString * const NCLoginMethodEmail;
extern NSString * const NCLoginMethodSyndicated;
extern NSString * const NCLoginMethodFacebook;

@interface NCUser : NCGenericModel

@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, strong) NSNumber *facebook_id;
@property (nonatomic, strong) NSString *externalId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *birthdate;
@property (nonatomic, strong) NSNumber *gender;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NCToken *token;
@property (nonatomic, strong) NSString *login_method;
@property (nonatomic) BOOL privacy_enabled;

@end
