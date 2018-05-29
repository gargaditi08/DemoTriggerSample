//
//  TMRequestManager.m
///  DemoTriggerAT
//
//  Created by k2annex on 2/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "TMRequestManager.h"

@implementation TMRequestManager

-(void)hitWebServiceWithPostMethod:(NSString*)method webServiceURL:(NSString *)apiURL withBody:(id)requestBody andTag:(REQUEST_TAG)tag completionHandler:(APICompletionBlock)completionBlock
{
    NSString *requestURL=[NSString stringWithFormat:@"%@%@",BASE_URL,apiURL];
    NSLog(@"requestURL = %@",requestURL);
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    
    // Set Header Fields With Auth Token
    
    NSString *authToken = [NSString stringWithFormat:@"Bearer %@",[User sharedInstance].auth_token];
    [request setValue:authToken forHTTPHeaderField:API_AUTHORIZATION];
    [request setValue:@"application/json" forHTTPHeaderField:API_CONTENT_TYPE];
    [request setValue:AUDIO_API_KEY forHTTPHeaderField:API_KEY];
    [request setValue:AUDIO_API_VERSION forHTTPHeaderField:API_VERSION];
    [request setValue:AUDIO_DEVICE_UDID forHTTPHeaderField:API_DEVICE_UUID];
    
    NSLog(@"Request Header Fields = %@", request.allHTTPHeaderFields);
    
    
    [request setHTTPMethod:method];
    
    if (requestBody != nil)
    {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:requestBody options:NSJSONWritingPrettyPrinted error:nil];
        [request setHTTPBody: jsonData];
    }
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            if (!error) {
             
                NSString*  responseString =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@" response =%@",responseString);
                
                NSError *errorResponse;
                
                if([responseString length]==0)
                {
                    NSError* error = nil;
                    
                    NSMutableDictionary* details = [NSMutableDictionary dictionary];
                    [details setValue:@"Invalid Response Value,please retry" forKey:NSLocalizedDescriptionKey];
                    // populate the error object with the details
                    error = [NSError errorWithDomain:@"API Manager" code:200 userInfo:details];
                    //invalid  not equal
                    completionBlock(nil,error,tag);
                }
                
                NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
                id jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:kNilOptions
                                                                    error:&errorResponse];
                
                if (errorResponse == nil) {
                    // Success Case
                    completionBlock(jsonResponse,errorResponse,tag);
                }
                else{
                    completionBlock(nil,errorResponse,tag);
                }
            }//close else
            else{
                completionBlock(nil,error,tag);
            }
            
        });
    }];
    
    [postDataTask resume];
}
@end
