//
//  ImageDownloader.m
//  DemoTriggerAT
//
//  Created by k2annex on 23/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader


+ (void)processImageDataWithURLString:(NSString *)urlString andBlock:(void (^)(UIImage *image))processImage;
{
    NSURL *url = [NSURL URLWithString:urlString];
    
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
        ^{
        NSData * storeImageData = [NSData dataWithContentsOfURL:url];
        processImage([UIImage imageWithData:storeImageData]);
            
        dispatch_sync(dispatch_get_main_queue(), ^{
        processImage([UIImage imageWithData:storeImageData]);
            
        });
 

        
    });
}


@end
