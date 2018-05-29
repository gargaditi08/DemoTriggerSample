//
//  HomeTableCell.h
//  DemoTriggerAT
//
//  Created by k2annex on 15/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioModel.h"

@interface HomeTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgOffer;
@property (weak, nonatomic) IBOutlet UILabel *offerName;
@property (weak, nonatomic) IBOutlet UILabel *offerComapnyName;
@property (weak, nonatomic) IBOutlet UILabel *daysRemaining;



-(void)bindCellData:(AudioModel*)audioModelData;

@end
