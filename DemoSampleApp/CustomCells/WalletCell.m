//
//  WalletCell.m
//  DemoTriggerAT
//
//  Created by k2annex on 21/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "WalletCell.h"
#import "ImageDownloader.h"

@implementation WalletCell
@synthesize imgOffer,offerName,offerComapnyName,daysRemaining;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    imgOffer.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    imgOffer.layer.borderWidth = 0.5;
    imgOffer.layer.cornerRadius = 8.0;
    imgOffer.clipsToBounds = YES;
    // Initialization code
}

-(void)bindCellData:(AudioModel*)audioModelData
{
    self.offerName.text = audioModelData.name;
    self.offerComapnyName.text = audioModelData.brand;
    self.daysRemaining.text = audioModelData.end_at;
    
    
        if (audioModelData.imageDownloaded){
            self.imgOffer.image = audioModelData.imageDownloaded;
        }
        else{
            [ImageDownloader processImageDataWithURLString:audioModelData.image andBlock:^(UIImage *image) {
                if (image != nil){
                    audioModelData.imageDownloaded = image;
                    self.imgOffer.image = image;
                }
            }];
        }
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
