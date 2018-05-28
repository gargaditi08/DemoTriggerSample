//
//  HomeTableCell.m
//  DemoTriggerAT
//
//  Created by k2annex on 15/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "HomeTableCell.h"
#import "ImageDownloader.h"



@implementation HomeTableCell
@synthesize imgOffer,offerName,offerComapnyName,daysRemaining;


- (void)awakeFromNib {
    imgOffer.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    imgOffer.layer.borderWidth = 0.5;
    imgOffer.layer.cornerRadius = 8.0;
    imgOffer.clipsToBounds = YES;
    [super awakeFromNib];
    // Initialization code
}



-(void)bindCellData:(AudioModel*)audioModelData
{
    self.offerName.text = audioModelData.name;
    self.offerComapnyName.text = audioModelData.brand;
    self.daysRemaining.text = audioModelData.end_at;
    
    
    // Download Image
//    if (audioModelData.imageDownloaded){
//        self.imgOffer.image = audioModelData.imageDownloaded;
//    }else{
//        [ImageDownloader processImageDataWithURLString:audioModelData.image andBlock:^(UIImage *image) {
//            if (image != nil){
//                audioModelData.imageDownloaded = image;
//                self.imgOffer.image = image;
//            }
//        }];
//    }
//}
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       
                       __block NSData *imageData;
                       
                       dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                                     ^{
                                         imageData =  [NSData dataWithContentsOfURL:[NSURL URLWithString:audioModelData.image]];
                                         
                                         
                                         dispatch_sync(dispatch_get_main_queue(), ^{
                                             self.imgOffer.image = [UIImage imageWithData:imageData];                                        });
                                     });
                       
                       
                   });
    
    
}


   
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
