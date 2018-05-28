//
//  RedeemOnlineVC.h
//  DemoTriggerAT
//
//  Created by k2annex on 23/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioModel.h"

@interface RedeemOnlineVC : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic,strong) NSString *urlOnline;
@end
