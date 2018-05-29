//
//  RedeemInStoreVC.m
//  DemoTriggerAT
//
//  Created by k2annex on 23/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "RedeemInStoreVC.h"
#import "BarCodeGenerator.h"


@interface RedeemInStoreVC ()

@end

@implementation RedeemInStoreVC
@synthesize lblOfferHeader,lblBrandName,lblExpireyDate;
@synthesize codeBarcodeImg,txtVw,objDataRedeemPassed;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:173.0/255.0 blue:0.0/255.0 alpha:1.0]];
    self.title = @"Redeem In-Store";
    lblOfferHeader.text = objDataRedeemPassed.display_name;
    lblBrandName.text = objDataRedeemPassed.brand;
    lblExpireyDate.text = objDataRedeemPassed.end_at;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
 
    //[self.navigationItem setHidesBackButton:YES];

     [self generateCode];
}

-(void)generateCode{
    [self.view endEditing:true];
    
    
    CGFloat minSide = MIN(_imgBarcode.frame.size.width,_imgBarcode.frame.size.height);
   // [NSString stringWithFormat:@"%@%@",codeBarcodeImg,QRCODE]
    BarCodeGenerator *barCodeGen = [BarCodeGenerator new];
    UIImage *codeImage = [barCodeGen generateBarCode:codeBarcodeImg barCodeType:QRCODE imageSize:CGSizeMake(minSide, minSide)];
    _imgBarcode.image = codeImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
