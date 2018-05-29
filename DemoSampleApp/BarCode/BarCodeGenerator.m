//
//  BarCodeGenerator.m
//  APISample
//
//  Created by Kuldeep Saini on 23/05/18.
//  Copyright © 2018 Kuldeep Saini. All rights reserved.
//

#import "BarCodeGenerator.h"

@implementation BarCodeGenerator

-(UIImage*)generateBarCode:(NSString*)code barCodeType:(NSString*)codeType imageSize:(CGSize)size{
    
    CIFilter *filter = [self filter:code andCodeType:codeType];
    if (filter != nil){
        return [self getImage:filter withImageSize:size];
    }
    return nil;
}


-(CIFilter*)filter:(NSString*)code andCodeType:(NSString*)codeType{
    
    CIFilter *qrCodeFilter = [CIFilter filterWithName:codeType];
    [qrCodeFilter setDefaults];

    NSData *codeData = [code dataUsingEncoding:NSUTF8StringEncoding];
    [qrCodeFilter setValue:codeData forKey:@"inputMessage"];
    return  qrCodeFilter;
}

-(UIImage*)getImage:(CIFilter*)filter withImageSize:(CGSize)size{
    if (filter.outputImage != nil){
        
        CGFloat scaleX = size.width / filter.outputImage.extent.size.width;
        CGFloat scaleY = size.height / filter.outputImage.extent.size.height;
        CGAffineTransform transform = CGAffineTransformMakeScale(scaleX, scaleY);
        
        CIImage *image = [filter.outputImage imageByApplyingTransform:transform];
        return [UIImage imageWithCIImage:image];
    }
    return nil;
}


@end
