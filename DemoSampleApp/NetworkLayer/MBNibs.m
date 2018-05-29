//
//  MBNibs.m
//  Mobii
//
//  Created by Nikolai Annenkoff on 6/26/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "MBNibs.h"

NSString * const DefaultsOnboardingCompleteKey = @"DefaultsOnboardingCompleteKey";
NSString * const DefaultsLoginStatTemp = @"DefaultsLoginStatTemp";

NSString * const mainStoryboardName = @"Main";
NSString * const loginStoryboardName = @"LoginFlow";
NSString * const utilityStoryboardName = @"Utility";

NSString * const homeViewControllerName = @"HomeViewController";
NSString * const homeTabNavigationName = @"homeTabNavigationName";
NSString * const loginViewControllerName = @"LoginViewController";
NSString * const webViewControllerName = @"WebViewController";
NSString * const onBoardViewControllerName = @"OnboardViewController";
NSString * const permissionsViewControllerName = @"PermissionsViewController";

@class BubbleTransition;
@class AppDelegate;
@implementation MBNibs

+ (id)sharedManager {
    static MBNibs *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

+ (void)changeViewController:(UIViewController *)viewController {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[self sharedManager] window];
        if (!window.rootViewController) {
            window.rootViewController = viewController;
            return;
        }
        
        UIView *snapshot = [window snapshotViewAfterScreenUpdates:YES];
        [viewController.view addSubview:snapshot];
        window.rootViewController = viewController;
        [window makeKeyAndVisible];
        [UIView animateWithDuration:0.5f
                         animations:^{
                             snapshot.layer.opacity = 0.0f;
                             snapshot.layer.transform = CATransform3DMakeScale(1.5f, 1.5f, 1.5f);
                         } completion:^(BOOL completion){
                             [snapshot removeFromSuperview];
                         }];
    });
}

@end

@implementation MBNibs (Storyboards)

+ (UIStoryboard *)mainStoryboard {
    return [UIStoryboard storyboardWithName:mainStoryboardName bundle:[NSBundle mainBundle]];
}

+ (UIStoryboard *)loginStoryboard {
    return [UIStoryboard storyboardWithName:loginStoryboardName bundle:[NSBundle mainBundle]];
}

+ (UIStoryboard *)utilityStoryboard {
    return [UIStoryboard storyboardWithName:utilityStoryboardName bundle:[NSBundle mainBundle]];
}

@end

@implementation MBNibs (EntryPoints)

+ (UIViewController *)home {
    return [[MBNibs mainStoryboard] instantiateViewControllerWithIdentifier:homeViewControllerName];
}

+ (UINavigationController *)homeNavigation {
    return [[MBNibs mainStoryboard] instantiateViewControllerWithIdentifier:homeTabNavigationName];
}

+ (UIViewController *)login {
    return [[MBNibs loginStoryboard] instantiateViewControllerWithIdentifier:loginViewControllerName];
}

+ (UIViewController *)onboarding {
    return [[MBNibs utilityStoryboard] instantiateViewControllerWithIdentifier:onBoardViewControllerName];
}

+ (UIViewController *)permissionsViewController {
    return [[MBNibs utilityStoryboard] instantiateViewControllerWithIdentifier:permissionsViewControllerName];
}

+ (UIViewController *)webViewController {
    return [[MBNibs utilityStoryboard] instantiateViewControllerWithIdentifier:webViewControllerName];
}

@end
