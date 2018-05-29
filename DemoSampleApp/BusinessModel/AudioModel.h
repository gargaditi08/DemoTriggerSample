//
//  AudioModel.h
//  DemoTriggerAT
//
//  Created by k2annex on 15/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface AudioModel : NSObject

@property(nonatomic,strong) NSString *actv8_reference_id;
@property(nonatomic,strong) NSString *brand;
@property(nonatomic,strong) NSString *display_name;
@property(nonatomic,strong) NSString *audio_id;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *end_at;
@property(nonatomic,strong) NSString *descriptionValue;
@property(nonatomic,strong) NSString *image;
@property(nonatomic,strong) NSDictionary *scratcher;
@property(nonatomic,strong) NSString *redemptionOnline;
@property(nonatomic,strong) NSString *redemptionStore;
@property(nonatomic,strong) UIImage *imageDownloaded;

- (instancetype)initWithJson:(NSDictionary*)dictJsonResponse;

@end
