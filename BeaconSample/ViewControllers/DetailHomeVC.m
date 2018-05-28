//
//  DetailHomeVC.m
//  DemoTriggerAT
//
//  Created by k2annex on 15/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "DetailHomeVC.h"
#import "TMRequestManager.h"
#import "ImageCell.h"
#import "AboutOfferCell.h"
#import "DetailTableCell.h"
#import "RedeemOnlineVC.h"
#import "RedeemInStoreVC.h"
#import "ImageDownloader.h"

@interface DetailHomeVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableCompleteOffer;
@end

@implementation DetailHomeVC
@synthesize objSelectedModel;
@synthesize tableCompleteOffer;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Offer";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
   
    
    // Do any additional setup after loading the view.
    tableCompleteOffer.delegate = self;
    tableCompleteOffer.dataSource = self;
    tableCompleteOffer.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableCompleteOffer.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:173.0/255.0 blue:0.0/255.0 alpha:1.0]];
   

    [self addFooterView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    if (indexPath.section==0) {
        return 180;
    }
    else if (indexPath.section==1)
    {
        return 80;
    }
    
    else if (indexPath.section==2) {
        CGFloat retVal = 155.0;
        if (objSelectedModel.descriptionValue)
           
        {
             NSLog(@"%@",objSelectedModel.descriptionValue);
            NSString *textDetail = objSelectedModel.descriptionValue;
            CGRect dynamicHeight = [self rectForText:textDetail usingFont:[UIFont systemFontOfSize:17.0] boundedBySize:CGSizeMake(self.view.frame.size.width-40, 1000.0)];
            retVal = MAX(150, dynamicHeight.size.height) ;
            
        }
        else
        {
             NSLog(@"%@",objSelectedModel.descriptionValue);
            retVal = 0.0;
        }
      
        
        return retVal;
    }
    else
    {
        return 50;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //Here, for each section, you must return the number of rows it will contain
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2 || section == 3 || section == 4)
    {
        return 10.0;
    }
    else
        return 0.001;
    
    
}


- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    //check header height is valid
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,10)];
    headerView.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"ImageCell";
        
        ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        // Download Image
        if (self.objSelectedModel.imageDownloaded){
            cell.ImgProduct.image = self.objSelectedModel.imageDownloaded;
        }else{
            [ImageDownloader processImageDataWithURLString:self.objSelectedModel.image andBlock:^(UIImage *image) {
                if (image != nil){
                    self.objSelectedModel.imageDownloaded = image;
                    cell.ImgProduct.image = image;
                }
            }];
        }
        return cell;
    }
        
    else if (indexPath.section == 1) {
        static NSString *CellIdentifier = @"AboutOfferCell";
        AboutOfferCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.lblOfferDiscount.text = self.objSelectedModel.name;
        cell.lblCompanyName.text = self.objSelectedModel.brand;
        cell.lblExpireyDate.text = self.objSelectedModel.end_at;
        return cell;
    }
    else if (indexPath.section == 2 || indexPath.section == 3)
    {
        static NSString *CellIdentifier = @"DetailTableCell";
        DetailTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.section == 2) {
            cell.lblDetailTitle.text = @"Details";
            cell.lblDetailDescription.text = self.objSelectedModel.descriptionValue;
        }
        else
        {
            cell.lblDetailTitle.text = @"Show Terms & Conditions";
        }
        return cell;
        
    }
  
    return [UITableViewCell new];
}


-(void)addFooterView
{
    UIView *footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,55 )];
    footerView.backgroundColor = [UIColor whiteColor];
    
    if ([objSelectedModel.redemptionOnline isEqualToString:@"<null>"]|| [objSelectedModel.redemptionOnline isEqualToString:@""])
    {
        UIButton *redeemStore=[UIButton buttonWithType:UIButtonTypeCustom];
        redeemStore.layer.cornerRadius = 10.0;
        [redeemStore setTitle:@"Redeem In-Store" forState:UIControlStateNormal];
        [redeemStore setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:173.0/255.0 blue:228.0/255.0 alpha:1.0]];
        [redeemStore addTarget:self action:@selector(redeemStoreClicked:) forControlEvents:UIControlEventTouchUpInside];
        [redeemStore setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];  //Set the color this is may be different for iOS 7
        redeemStore.frame=CGRectMake(20, 0, (self.view.frame.size.width)-40, 40); //Set some large width for your title
        [footerView addSubview:redeemStore];

    }
    else {
        NSLog(@"online value = %@",objSelectedModel.redemptionOnline);
    UIButton *redeemOnline=[UIButton buttonWithType:UIButtonTypeCustom];
    redeemOnline.layer.cornerRadius = 5.0;
    [redeemOnline setTitle:@"Redeem Online" forState:UIControlStateNormal];
    [redeemOnline setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:173.0/255.0 blue:228.0/255.0 alpha:1.0]];
    [redeemOnline addTarget:self action:@selector(redeemOnlineClicked:) forControlEvents:UIControlEventTouchUpInside];
    [redeemOnline setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];  //Set the color this is may be different for iOS 7
    redeemOnline.frame=CGRectMake(10, 0, (self.view.frame.size.width/2)-20, 40); //Set some large width for your title
    [footerView addSubview:redeemOnline];
    
    
    UIButton *redeemStore=[UIButton buttonWithType:UIButtonTypeCustom];
    redeemStore.layer.cornerRadius = 5.0;
    [redeemStore setTitle:@"Redeem In-Store" forState:UIControlStateNormal];
    [redeemStore setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:173.0/255.0 blue:228.0/255.0 alpha:1.0]];
    [redeemStore addTarget:self action:@selector(redeemStoreClicked:) forControlEvents:UIControlEventTouchUpInside];
    [redeemStore setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];  //Set the color this is may be different for iOS 7
    redeemStore.frame=CGRectMake((self.view.frame.size.width/2)+10, 0, (self.view.frame.size.width/2)-20, 40); //Set some large width for your title
        
    
    [footerView addSubview:redeemStore];
    }

    
    [self.tableCompleteOffer setTableFooterView:footerView];
}


- (void)redeemStoreClicked:(id)sender
{
    RedeemInStoreVC *redeemStoreVC = (RedeemInStoreVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"RedeemInStoreVC"];
    redeemStoreVC.codeBarcodeImg = objSelectedModel.redemptionStore;
    redeemStoreVC.objDataRedeemPassed = objSelectedModel;
    [self.navigationController pushViewController:redeemStoreVC animated:YES];
    
}

- (void)redeemOnlineClicked:(id)sender
{
    RedeemOnlineVC *redeemOnlineVC = (RedeemOnlineVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"RedeemOnlineVC"];
    redeemOnlineVC.urlOnline = objSelectedModel.redemptionOnline;
    [self.navigationController pushViewController:redeemOnlineVC animated:YES];
 
}

-(CGRect)rectForText:(NSString *)text
           usingFont:(UIFont *)font
       boundedBySize:(CGSize)maxSize
{
    
    NSDictionary *dictFont = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dictFont context:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
