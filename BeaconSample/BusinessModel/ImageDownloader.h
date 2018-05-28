//
//  ImageDownloader.h
//  DemoTriggerAT
//
//  Created by k2annex on 23/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ImageDownloader : NSObject

// This takes in a string and imagedata object and returns imagedata processed on a background thread
+ (void)processImageDataWithURLString:(NSString *)urlString andBlock:(void (^)(UIImage *image))processImage;

@end
