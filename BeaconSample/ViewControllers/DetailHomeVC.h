//
//  DetailHomeVC.h
//  DemoTriggerAT
//
//  Created by k2annex on 15/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioModel.h"

@interface DetailHomeVC : UIViewController

@property(nonatomic,strong) AudioModel *objSelectedModel;
@property(nonatomic,strong)NSString *stringURL;
@end
