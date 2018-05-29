//
//  RequestManager.h
//  DemoTriggerAT
//
//  Created by k2annex on 12/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMRequestManager.h"
#import "AudioModel.h"

@interface RequestManager : NSObject

typedef void(^ResponseCompletionBlock)(id response);

-(void)catchDataAudio:(NSMutableDictionary*)dictParams completionHandler:(ResponseCompletionBlock)completionBlock;
-(void)catchDataBeacon:(NSMutableDictionary*)dictParams completionHandler:(ResponseCompletionBlock)completionBlock;
-(void)catchDataGeofence:(NSMutableDictionary*)dictParams completionHandler:(ResponseCompletionBlock)completionBlock;
-(void)contentDataAudioForWallet: (NSMutableDictionary*)dictParams completionHandler:(ResponseCompletionBlock)completionBlock;
@end
