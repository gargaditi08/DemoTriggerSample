//
//  NCContent.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/3/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "NCGenericModel.h"
#import "NCContentTerms.h"

typedef NS_ENUM(NSUInteger, NCContentStatus) {
    NCContentStatusUnknown,
    NCContentStatusCatch,
    NCContentStatusView,
    NCContentStatusAccept,
    NCContentStatusDeclined,
    NCContentStatusRedeemInStore,
    NCContentStatusRedeemOnline,
    NCContentStatusRedeemDelete
};

@interface NCImageMeta : NCGenericModel

@property (nonatomic, strong) NSString *heroImageUrl;
@property (nonatomic, strong) NSString *bodyImageUrl;
@property (nonatomic, strong) NSString *thumbnailImageUrl;

@end

@interface NCScratcherMeta : NCGenericModel

@property (nonatomic) BOOL enabled;
@property (nonatomic, strong) NSString *overlayUrl;
@property (nonatomic, strong) NSString *heroUrl;

@end

@interface NCContent : NCGenericModel

@property (nonatomic) NSNumber *Id;
@property (nonatomic, strong) NSString *name; // Required
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *contentDescription;
@property (nonatomic, strong) NSString *UUID;
@property (nonatomic, strong) NSString *expiration;
@property (nonatomic, strong) NCScratcherMeta *scratcher;
@property (nonatomic, strong) NCImageMeta *image;
@property (nonatomic) NSNumber *quantity;
@property (nonatomic, strong) NSString *type; // Required
@property (nonatomic) NSNumber *redemptionMethod; // 1 Online, 2 In Store, 3 Online & In Store
@property (nonatomic, strong) NSString *redemptionCode;
@property (nonatomic, strong) NSString *redemptionUrl;
@property (nonatomic, strong) NSString *scratcherName;
@property (nonatomic, strong) NSString *scratcherDescription;
@property (nonatomic, strong) NSNumber *contentTermsId;
@property (nonatomic, strong) NCContentTerms *terms;

@end
