//
//  NCContent.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/3/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "NCGenericModel.h"
#import "NCContentTerms.h"

typedef NS_ENUM(NSUInteger, NCStatus) {
    NCStatusUnknown,
    NCStatusCatch,
    NCStatusView,
    NCStatusAccept,
    NCStatusDeclined,
    NCStatusRedeemInStore,
    NCStatusRedeemOnline,
    NCStatusRedeemDelete
};

@interface NCContentStatus : NCGenericModel

@property (nonatomic, strong) NSNumber *status;

@end

@interface NCImageMeta : NCGenericModel

@property (nonatomic, strong) NSString *heroImageUrl;
@property (nonatomic, strong) NSString *bodyImageUrl;
@property (nonatomic, strong) NSString *overlayImageUrl;
@property (nonatomic, strong) NSString *thumbnailImageUrl;

@end

@interface NCScratcherMeta : NCGenericModel

@property (nonatomic) BOOL enabled;
@property (nonatomic, strong) NCImageMeta *images;
@property (nonatomic, strong) NSString *scratcherDescription;
@property (nonatomic, strong) NSString *exclamation;

@end

@interface NCRedemptionCode : NCGenericModel

@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *format;

@end

@interface NCRedemptionMeta : NCGenericModel

@property (nonatomic, strong) NCRedemptionCode *code;
@property (nonatomic, strong) NSNumber *method;

@end

@interface NCContent : NCGenericModel

@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, strong) NSString *externalId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *contentDescription;
@property (nonatomic, strong) NSString *UUID;
@property (nonatomic, strong) NSString *expiration;
@property (nonatomic, strong) NCScratcherMeta *scratcher;
@property (nonatomic, strong) NCImageMeta *image;
@property (nonatomic, strong) NSNumber *quantity;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NCRedemptionMeta *redemption;
@property (nonatomic, strong) NSString *scratcherName;
@property (nonatomic, strong) NSString *scratcherDescription;
@property (nonatomic, strong) NSNumber *contentTermsId;

@end
