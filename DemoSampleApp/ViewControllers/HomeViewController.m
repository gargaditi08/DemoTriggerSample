//
//  HomeViewController.m
//  DemoTriggerAT
//
//  Created by k2annex on 18/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "HomeViewController.h"
#import "RequestManager.h"
#import "HomeTableVC.h"

@interface HomeViewController ()
{
   
    MBProgressHUD *hud;
    
    __weak IBOutlet UIButton *btnAudio;
     __weak IBOutlet UIButton *btnBeacon;
     __weak IBOutlet UIButton *btnGeofence;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //NavigationBar
    [self.navigationItem setTitle:@"ACTV8me SDK Sample App"];

   [self.navigationController.navigationBar setTitleTextAttributes:
   @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
  //  [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    btnAudio.layer.cornerRadius = 10.0;
    btnBeacon.layer.cornerRadius = 10.0;
    btnGeofence.layer.cornerRadius = 10.0;
    
 
}

- (NSMutableDictionary*)prepareRequestParam{
    
    NSMutableDictionary *dictBody = [NSMutableDictionary new];
    [dictBody setObject:@"gargaditi08@gmail.com" forKey:@"email"];
    [dictBody setObject:@"0" forKey:@"gender"];
    [dictBody setObject:@"0" forKey:@"id"];
    [dictBody setObject:@"email" forKey:@"login_method"];
    [dictBody setObject:@"123456Aa" forKey:@"password"];
    
    [dictBody setObject:@"Jio 4G" forKey:@"carrier_name"];
    NSString * string =  [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    [dictBody setObject:string forKey:@"device_identifier"];
    
    [dictBody setObject:@"18.557788333333335" forKey:@"latitude"];
    [dictBody setObject:@"en_US" forKey:@"locale"];
  

    [dictBody setObject:@"73.793075" forKey:@"longitude"];
    
      NSString *manufacturerName = [UIDevice currentDevice].name;
    [dictBody setObject:manufacturerName forKey:@"manufacturer"];
    
     NSString *deviceModel = [UIDevice currentDevice].model;
    [dictBody setObject:deviceModel forKey:@"model"];
    
    NSString *systemName = [[UIDevice currentDevice] systemName];
    [dictBody setObject:systemName forKey:@"os_name"];
    
    NSString *versionName = [[UIDevice currentDevice] systemVersion];
    [dictBody setObject:versionName forKey:@"os_version"];
    [dictBody setObject:@"4.0" forKey:@"sdk_version"];
    [dictBody setObject:@"b488d9d9-c7c0-4e6f-b7c0-30c80e62e0bd" forKey:@"uuid"];
    
    return dictBody;
}

- (IBAction)AudioTriggerButtonPressed:(id)sender
{
    NSMutableDictionary *dictParams = [self prepareRequestParam];
    
    RequestManager *requestManager = [RequestManager new];
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [requestManager catchDataAudio:dictParams completionHandler:^(id response){

        NSMutableArray *arrAudioResponse = (NSMutableArray*)response;
        if (arrAudioResponse.count > 0)
        {
            [self->hud hideAnimated:YES];
            HomeTableVC *homeVC = (HomeTableVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"HomeTableVC"];
            homeVC.arrParsedData = arrAudioResponse;
            [self.navigationController pushViewController:homeVC animated:YES];
            
        }
    }];
    
}
- (IBAction)btnBeaconTriggerPressed:(id)sender
{
    NSMutableDictionary *dictParams = [self prepareRequestParam];
    
    RequestManager *requestManager = [RequestManager new];
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [requestManager catchDataBeacon:dictParams completionHandler:^(id response)
    {
        
        NSMutableArray *arrAudioResponse = (NSMutableArray*)response;
        if (arrAudioResponse.count > 0)
        {
            [self->hud hideAnimated:YES];
            HomeTableVC *homeVC = (HomeTableVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"HomeTableVC"];
            homeVC.arrParsedData = arrAudioResponse;
            [self.navigationController pushViewController:homeVC animated:YES];
            
        }
    }];
    
}

- (IBAction)btnGeofenceTriggerPressed:(id)sender
{
    NSMutableDictionary *dictParams = [self prepareRequestParam];
    
    RequestManager *requestManager = [RequestManager new];
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [requestManager catchDataGeofence:dictParams completionHandler:^(id response){
        
        NSMutableArray *arrAudioResponse = (NSMutableArray*)response;
        if (arrAudioResponse.count > 0)
        {
            [self->hud hideAnimated:YES];
            HomeTableVC *homeVC = (HomeTableVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"HomeTableVC"];
            homeVC.arrParsedData = arrAudioResponse;
            [self.navigationController pushViewController:homeVC animated:YES];
            
        }
    }];
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
