//
//  RedeemInStoreVC.h
//  DemoTriggerAT
//
//  Created by k2annex on 23/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioModel.h"

@interface RedeemInStoreVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblOfferHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblBrandName;
@property (weak, nonatomic) IBOutlet UILabel *lblExpireyDate;
@property (weak, nonatomic) IBOutlet UIImageView *imgBarcode;
@property (weak, nonatomic) IBOutlet UITextView *txtVw;
@property(nonatomic,strong) AudioModel *objDataRedeemPassed;

@property(nonatomic,strong) NSString *codeBarcodeImg;
@end
