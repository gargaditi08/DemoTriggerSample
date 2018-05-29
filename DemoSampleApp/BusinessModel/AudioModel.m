//
//  AudioModel.m
//  DemoTriggerAT
//
//  Created by k2annex on 15/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "AudioModel.h"

@implementation AudioModel

- (instancetype)initWithJson:(NSDictionary*)dictJsonResponse
{
    self = [super init];
    if (self) {
        self.actv8_reference_id = [self checkNullValue:[dictJsonResponse objectForKey:@"actv8_reference_id"]];
        self.brand= [self checkNullValue:[dictJsonResponse objectForKey:@"brand"]];
        self.display_name= [self checkNullValue:[dictJsonResponse objectForKey:@"display_name"]];
        self.audio_id= [self checkNullValue:[dictJsonResponse objectForKey:@"audio_id"]];
        self.name= [self checkNullValue:[dictJsonResponse objectForKey:@"name"]];
        self.type= [self checkNullValue:[dictJsonResponse objectForKey:@"type"]];
        self.end_at= [self checkNullValue:[dictJsonResponse objectForKey:@"end_at"]];
        self.descriptionValue = [self checkNullValue:[dictJsonResponse objectForKey:@"description"]];
        self.image = [self checkNullValue:[[[dictJsonResponse objectForKey:@"images"]objectForKey:@"hero"]objectForKey:@"url"]];
        
        if([NSNull null] != [dictJsonResponse objectForKey:@"redemption"]) {
             self.redemptionOnline =[[dictJsonResponse objectForKey:@"redemption"]objectForKey:@"url"];
        }
        else
        {
            self.redemptionOnline = @"";
        }
        
       // self.redemptionOnline = [self checkNullValue:[[dictJsonResponse objectForKey:@"redemption"]objectForKey:@"url"]];
        NSLog(@"%@",[dictJsonResponse objectForKey:@"redemption"]);
        
        if([NSNull null] != [dictJsonResponse objectForKey:@"redemption"]) {
            self.redemptionStore =[[[dictJsonResponse objectForKey:@"redemption"]objectForKey:@"code"]objectForKey:@"value"];
        }
        else
        {
            self.redemptionStore = @"";
        }
//        self.redemptionStore =[self checkNullValue:[[[dictJsonResponse objectForKey:@"redemption"]objectForKey:@"code"]objectForKey:@"value"]];

    }
    return self;
}

-(NSString*)checkNullValue:(id)text
{
    NSString *parsedText = @"";
    if([text isKindOfClass:[NSDictionary class]])
    {
        if([text isEqualToString:@"(null)"] || [text isEqualToString:@"(no summary)"])
            parsedText = @"";
        else{
            parsedText = text;
        }
    }
    
   else if([text isKindOfClass:[NSString class]])
    {
        if([text isEqualToString:@"(null)"] || [text isEqualToString:@"(no summary)"])
            parsedText = @"";
        else{
            parsedText = text;
        }
    }
    else if ([text isKindOfClass:[NSNumber class]]){
        parsedText = [text stringValue];
    }
    return parsedText;
}



@end
