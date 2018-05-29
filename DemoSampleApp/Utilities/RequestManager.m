//
//  RequestManager.m
//  DemoTriggerAT
//
//  Created by k2annex on 12/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "RequestManager.h"
#import "MBProgressHUD.h"

@implementation RequestManager

//Catch Audio Home Data
-(void)catchDataAudio:(NSMutableDictionary*)dictParams completionHandler:(ResponseCompletionBlock)completionBlock{
 
    NSMutableArray *arrAudioFiles = [NSMutableArray new];

    TMRequestManager *requestManager = [TMRequestManager new];
    
    [requestManager hitWebServiceWithPostMethod:HTTP_METHOD_POST webServiceURL:CATCH_AUDIO withBody:dictParams andTag:TAG_REQUEST_CATCH_AUDIO completionHandler:^(id response, NSError *error, REQUEST_TAG tag) {
        
        if (error == nil) {
            
            NSLog(@"SERVER RESPONSE = %@",response);
            NSArray *arrResponse = (NSArray*)response;
            for (int i = 0; i < arrResponse.count; i ++){
                NSDictionary *dict  = [response objectAtIndex:i];
                AudioModel *objAudio = [[AudioModel alloc] initWithJson:dict];
                [arrAudioFiles addObject:objAudio];
            }
            
            completionBlock(arrAudioFiles);
        }
        else{
            NSLog(@"Error Occured = %@",error.description);
            completionBlock(arrAudioFiles);

        }
    }];
    
}

//Catch Beacon Data
-(void)catchDataBeacon:(NSMutableDictionary*)dictParams completionHandler:(ResponseCompletionBlock)completionBlock{
    
    NSMutableArray *arrAudioFiles = [NSMutableArray new];
    
    TMRequestManager *requestManager = [TMRequestManager new];
    
    [requestManager hitWebServiceWithPostMethod:HTTP_METHOD_POST webServiceURL:CATCH_BEACON withBody:dictParams andTag:TAG_REQUEST_CATCH_BEACON completionHandler:^(id response, NSError *error, REQUEST_TAG tag) {
        
        if (error == nil) {
            
            NSLog(@"SERVER RESPONSE = %@",response);
            NSArray *arrResponse = (NSArray*)response;
            for (int i = 0; i < arrResponse.count; i ++){
                NSDictionary *dict  = [response objectAtIndex:i];
                AudioModel *objAudio = [[AudioModel alloc] initWithJson:dict];
                [arrAudioFiles addObject:objAudio];
            }
            
            completionBlock(arrAudioFiles);
        }
        else{
            NSLog(@"Error Occured = %@",error.description);
            completionBlock(arrAudioFiles);
            
        }
    }];
    
}

//Catch Geofence Data
-(void)catchDataGeofence:(NSMutableDictionary*)dictParams completionHandler:(ResponseCompletionBlock)completionBlock{
    
    NSMutableArray *arrAudioFiles = [NSMutableArray new];
    
    TMRequestManager *requestManager = [TMRequestManager new];
    
    [requestManager hitWebServiceWithPostMethod:HTTP_METHOD_POST webServiceURL:CATCH_GEOFENCE withBody:dictParams andTag:TAG_REQUEST_CATCH_GEOFENCE completionHandler:^(id response, NSError *error, REQUEST_TAG tag) {
        
        if (error == nil) {
            
            NSLog(@"SERVER RESPONSE = %@",response);
            NSArray *arrResponse = (NSArray*)response;
            for (int i = 0; i < arrResponse.count; i ++){
                NSDictionary *dict  = [response objectAtIndex:i];
                AudioModel *objAudio = [[AudioModel alloc] initWithJson:dict];
                [arrAudioFiles addObject:objAudio];
            }
            
            completionBlock(arrAudioFiles);
        }
        else{
            NSLog(@"Error Occured = %@",error.description);
            completionBlock(arrAudioFiles);
            
        }
    }];
    
}
//Catch Audio Wallet Data

-(void)contentDataAudioForWallet: (NSMutableDictionary*)dictParams completionHandler:(ResponseCompletionBlock)completionBlock{
    
    NSMutableArray *arrAudioFiles = [NSMutableArray new];
    
    TMRequestManager *requestManager = [TMRequestManager new];
    
    [requestManager hitWebServiceWithPostMethod:HTTP_METHOD_GET webServiceURL:CONTENT_BEACON withBody:dictParams andTag:TAG_REQUEST_CONTENT_BEACON completionHandler:^(id response, NSError *error, REQUEST_TAG tag) {
        
        if (error == nil) {
            NSLog(@"SERVER RESPONSE = %@",response);
            NSArray *arrResponse = (NSArray*)response;
            for (int i = 0; i < arrResponse.count; i ++){
                NSDictionary *dict  = [response objectAtIndex:i];
                AudioModel *objAudio = [[AudioModel alloc] initWithJson:dict];
                [arrAudioFiles addObject:objAudio];
            }
            
            completionBlock(arrAudioFiles);
        }
        else{
            NSLog(@"Error Occured = %@",error.description);
            completionBlock(arrAudioFiles);
            
        }
    }];
}

@end
