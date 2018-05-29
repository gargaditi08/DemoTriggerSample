//
//  TMRequestManager.h
//  DemoTriggerAT
//
//  Created by k2annex on 21/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

typedef enum {
  TAG_REQUEST_CATCH_AUDIO = 100,
  TAG_REQUEST_CATCH_BEACON,
  TAG_REQUEST_CATCH_GEOFENCE,
  TAG_REQUEST_CONTENT_BEACON,
  TAG_DELETE_WALLET_BEACON,
}REQUEST_TAG;

// BASE API URLS
#define BASE_URL             @"http://api-staging-v4.actv8technologies.com"
#define CATCH_AUDIO             @"/audio/77314694/catch"
#define CATCH_BEACON             @"/beacon/6f5177693232/catch"
#define CATCH_GEOFENCE             @"/geofence/5ac6a29ef2e20e22bc1646e2/catch"
#define CONTENT_BEACON           @"/user/25183/content"
#define DELETE_WALLET_DATA       @"/user/25183/content"




// SERVER PARAMS
#define AUDIO_API_KEY @"da84e7b0445891cb7a16280e15c0c9e73df3424d"
#define AUDIO_API_VERSION @"4.0"
#define AUDIO_DEVICE_UDID @"038556A7-7401-42A8-8EBE-AA457BD29858"

// Request Header Key
#define API_AUTHORIZATION @"Authorization"
#define API_CONTENT_TYPE @"Content-Type"
#define API_KEY @"X-Api-Key"
#define API_VERSION @"X-Api-Version"
#define API_DEVICE_UUID @"X-Device-uuid"


// API Completion Block with Response
typedef void(^APICompletionBlock)(id response, NSError *error , REQUEST_TAG tag);

#define HTTP_METHOD_GET @"GET"
#define HTTP_METHOD_POST @"POST"
#define HTTP_METHOD_PUT @"PUT"
#define HTTP_METHOD_DELETE @"DELETE"

@interface TMRequestManager : NSObject

-(void)hitWebServiceWithPostMethod:(NSString*)method webServiceURL:(NSString *)apiURL withBody:(id)requestBody andTag:(REQUEST_TAG)tag completionHandler:(APICompletionBlock)completionBlock;

@end
