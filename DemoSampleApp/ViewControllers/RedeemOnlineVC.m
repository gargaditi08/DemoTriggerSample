//
//  RedeemOnlineVC.m
//  DemoTriggerAT
//
//  Created by k2annex on 23/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "RedeemOnlineVC.h"
#import "AudioModel.h"



@interface RedeemOnlineVC ()
{
    __weak IBOutlet UIWebView *webView;
    AudioModel *audioModel;
}
@end

@implementation RedeemOnlineVC
@synthesize webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:173.0/255.0 blue:0.0/255.0 alpha:1.0]];
    self.title = @"Redeem Online";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
   // [self.navigationItem setHidesBackButton:YES];
   
    NSURL *url = [NSURL URLWithString:_urlOnline];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    webView.translatesAutoresizingMaskIntoConstraints = false;
    [webView loadRequest:urlRequest];
    [self.view addSubview:webView];
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
