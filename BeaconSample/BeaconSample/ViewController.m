//
//  ViewController.m
//  BeaconSample
//
//  Created by Nikolai Annenkoff on 8/25/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "ViewController.h"
#import "NCTriggerManager.h"
#import "NCContentManager.h"
#import "VATriggerBeacon.h"

@interface ViewController () <NCTriggerDelegate>

@property (strong, nonatomic) VATriggerBeacon *beacon;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.beacon = [[VATriggerBeacon alloc] init];
    [self.beacon setDelegate:self];
    [self.beacon setNamespaceID:@"<your namespace>"];
    [[NCTriggerManager sharedManager] registerTrigger:self.beacon];
    [self.beacon start];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        [NCContentManager contentCatch:signal callback:^(NSArray <NCContent *>*content, NSError *error){
            if (!error) {
                for (NCContent *item in content) {
                    NSLog(@"Content found: %@", item.name);
                }
            }
        }];
    }
}


@end
