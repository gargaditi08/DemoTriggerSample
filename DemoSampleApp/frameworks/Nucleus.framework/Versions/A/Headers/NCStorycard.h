//
//  NCStorycard.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 8/8/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "NCGenericModel.h"

@interface NCStorycardButton : NCGenericModel

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *hex;
@property (nonatomic, strong) NSString *rgb;
@property (nonatomic, strong) NSString *textHex;
@property (nonatomic, strong) NSString *textRgb;
@property (nonatomic, strong) NSString *action;

@end

@interface NCStorycard : NCGenericModel

@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSDictionary *image;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NCStorycardButton *button1; // Thank you backend
@property (nonatomic, strong) NCStorycardButton *button2; // for this /s

@end
