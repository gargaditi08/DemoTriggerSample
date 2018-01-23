//
//  ViewController.m
//  BeaconSample
//
//  Created by Nikolai Annenkoff on 8/25/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "ViewController.h"
#import <Nucleus/Nucleus.h>
#import <ValenceBeacon/VATriggerBeacon.h>

@interface ViewController () <NCTriggerDelegate>

@property (strong, nonatomic) VATriggerBeacon *beacon;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NCUser *user = [NCUser new];
    user.email = @"<user email>";
    user.password = @"<password>";
    user.login_method = @"email";
    
    [NCAPIManager setBaseUrl:@"<URL>"];
    [NCAPIManager setAPIKey:@"<API KEY>"];
    
    [NCAPIManager login:user callback:^(NSDictionary *response, NSError *error){
        if (error) {
            if (error.code == 404) {
                [NCAPIManager registerUser:user callback:^(NSError *error) {
                    if (!error) {
                        [NCAPIManager login:user callback:^(NSDictionary *response, NSError *error){
                            [self setupBeacons];
                        }];
                    }
                }];
            }
        } else {
            [self setupBeacons];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupBeacons {
    self.beacon = [[VATriggerBeacon alloc] init];
    [self.beacon setDelegate:self];
    [self.beacon setNamespaceID:@"<Namespace Id>"];
    [[NCTriggerManager sharedManager] registerTrigger:self.beacon];
    [self.beacon start];
}

#pragma mark - TriggerManager Callbacks

- (void)triggerDidRegister:(NCGenericTrigger *)trigger error:(NSError *)error {
    NSLog(@"Registered Trigger: %@ %@", trigger, error);
}

- (void)triggerDidUnregister:(NCGenericTrigger *)trigger error:(NSError *)error {
    NSLog(@"Unregistered Trigger: %@ %@", trigger, error);
}

- (void)trigger:(NCGenericTrigger *)trigger signal:(NCSignal *)signal didCatchContent:(NSArray <NCContent *>*)content error:(NSError *)error {
    if (!error) {
        for (NCContent *item in content) {
            NSLog(@"Content found: %@", item.name);
            NCContentStatus *itemStatus = [NCContentStatus new];
            itemStatus.status = @(NCStatusCatch);
            [NCContentManager contentUpdate:item status:itemStatus];
        }
    }
}

#pragma mark - Hypothetical Methods

- (void)didView:(NCContent *)content {
    NCContentStatus *itemStatus = [NCContentStatus new];
    itemStatus.status = @(NCStatusView);
    [NCContentManager contentUpdate:content status:itemStatus];
}

- (void)didAccept:(NCContent *)content {
    NCContentStatus *itemStatus = [NCContentStatus new];
    itemStatus.status = @(NCStatusAccept);
    [NCContentManager contentUpdate:content status:itemStatus];
}

- (void)didDecline:(NCContent *)content {
    NCContentStatus *itemStatus = [NCContentStatus new];
    itemStatus.status = @(NCStatusDeclined);
    [NCContentManager contentUpdate:content status:itemStatus];
}


@end
