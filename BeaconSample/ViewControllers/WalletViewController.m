//
//  WalletViewController.m
//  DemoTriggerAT
//
//  Created by k2annex on 18/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "WalletViewController.h"
#import "TMRequestManager.h"
#import "RequestManager.h"
#import "WalletCell.h"
#import "MBProgressHUD.h"

@interface WalletViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrWalletResponse;
    MBProgressHUD *hud;
}
@property (weak, nonatomic) IBOutlet UITableView *tableWalletData;
@property (strong, nonatomic)NSMutableArray *arrWalletResponse;
@end

@implementation WalletViewController
@synthesize tableWalletData,lblTxt,arrWalletResponse;



- (void)viewDidLoad {
    [self.navigationItem setTitle:@"ACTV8me Wallet"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
   
    [super viewDidLoad];
    arrWalletResponse = [[NSMutableArray alloc]init];
    [self fetchWalletData];
   [self addFooterView];
    
    // Do any additional setup after loading the view.
    tableWalletData.delegate = self;
    tableWalletData.dataSource = self;
    
    lblTxt.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //(__bridge CGColorRef _Nullable)([UIColor colorWithRed:121.0/255.0 green:121.0/255.0 blue:121.0/255.0 alpha:1.0]);
    lblTxt.layer.borderWidth = 0.5;
    lblTxt.layer.masksToBounds = true;

    
     }




-(void)fetchWalletData{
    
  
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    TMRequestManager *requestManager = [TMRequestManager new];
    
    [requestManager hitWebServiceWithPostMethod:HTTP_METHOD_GET webServiceURL:CONTENT_BEACON withBody:nil andTag:TAG_REQUEST_CONTENT_BEACON completionHandler:^(id response, NSError *error, REQUEST_TAG tag)
     {
         
         NSLog(@"SERVER RESPONSE = %@",response);
         
         if (error == nil) {
             [self->hud hideAnimated:YES];
             NSArray *arrServerResponse = (NSArray*)response;
            [self.arrWalletResponse removeAllObjects];
             for (int i = 0; i < arrServerResponse.count; i ++){
                 NSDictionary *dict  = [arrServerResponse objectAtIndex:i];
                 AudioModel *objAudio = [[AudioModel alloc] initWithJson:dict];
                 [self.arrWalletResponse addObject:objAudio];
             }
             
             [self.tableWalletData reloadData];
             
         }else{
             NSLog(@"ERROR OCCURED = %@",error.localizedDescription);
         }
     }];
}

-(void)deleteWalletData
{
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    TMRequestManager *requestManager = [TMRequestManager new];
    
    [requestManager hitWebServiceWithPostMethod:HTTP_METHOD_DELETE webServiceURL:DELETE_WALLET_DATA withBody:nil andTag:TAG_DELETE_WALLET_BEACON completionHandler:^(id response, NSError *error, REQUEST_TAG tag)
     {
         if (error == nil) {
             [self->hud hideAnimated:YES];
             NSArray *arrServerResponse = (NSArray*)response;
             [self.arrWalletResponse removeAllObjects];
             
             for (int i = 0; i < arrServerResponse.count; i ++){
                 NSDictionary *dict  = [arrServerResponse objectAtIndex:i];
                 AudioModel *objAudio = [[AudioModel alloc] initWithJson:dict];
                 [self.arrWalletResponse addObject:objAudio];
             }
             
             [self.tableWalletData reloadData];
             
         }else{
             NSLog(@"ERROR OCCURED = %@",error.localizedDescription);
         }
     }];
}

//Table implementation Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //Here, for each section, you must return the number of rows it will contain
    
    return arrWalletResponse.count;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"WalletCell";
    
    WalletCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[WalletCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
  
    [cell bindCellData:[arrWalletResponse objectAtIndex:indexPath.row]];

    
    
    return cell;
}

-(void)addFooterView{
    UIView *footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,50 )];
    footerView.backgroundColor = [UIColor whiteColor];
    
    UIButton *refreshWallet=[UIButton buttonWithType:UIButtonTypeCustom];
    refreshWallet.layer.cornerRadius = 5.0;

    [refreshWallet setTitle:@"Refresh Wallet" forState:UIControlStateNormal];
    [refreshWallet setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    refreshWallet.titleLabel.font = [UIFont systemFontOfSize:13.0];

    [refreshWallet setBackgroundColor:[UIColor lightGrayColor]];
    [refreshWallet addTarget:self action:@selector(refreshWalletClicked:) forControlEvents:UIControlEventTouchUpInside];
    [refreshWallet setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];  //Set the color this is may be different for iOS 7
    refreshWallet.frame=CGRectMake(10, 0, (self.view.frame.size.width/2)-20, 40); //Set some large width for your title
    [footerView addSubview:refreshWallet];
    
    
    UIButton *deleteWalletData=[UIButton buttonWithType:UIButtonTypeCustom];
    deleteWalletData.layer.cornerRadius = 5.0;
    [deleteWalletData setTitle:@"Delete Saved Data" forState:UIControlStateNormal];
       [deleteWalletData setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     deleteWalletData.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [deleteWalletData setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deleteWalletData setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:30.0/255.0 blue:58.0/255.0 alpha:1.0]];
    [deleteWalletData addTarget:self action:@selector(deleteWalletClicked:) forControlEvents:UIControlEventTouchUpInside];
    [deleteWalletData setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];  //Set the color this is may be different for iOS 7
    deleteWalletData.frame=CGRectMake((self.view.frame.size.width/2)+10, 0, (self.view.frame.size.width/2)-20, 40); //Set some large width for your title
    [footerView addSubview:deleteWalletData];
    
    
    [tableWalletData setTableFooterView:footerView];
}


- (void)refreshWalletClicked:(id)sender
{
    [self fetchWalletData];
}

- (void)deleteWalletClicked:(id)sender
{
    [self deleteWalletData];
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
