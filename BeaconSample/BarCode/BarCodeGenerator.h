//
//  BarCodeGenerator.h
//  APISample
//
//  Created by Kuldeep Saini on 23/05/18.
//  Copyright © 2018 Kuldeep Saini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define QRCODE @"CIQRCodeGenerator"
#define PDF147 @"CIPDF417BarcodeGenerator"


@interface BarCodeGenerator : NSObject

-(UIImage*)generateBarCode:(NSString*)code barCodeType:(NSString*)codeType imageSize:(CGSize)size;

@end
