//
//  MBNibs.h
//  Mobii
//
//  Created by Nikolai Annenkoff on 6/26/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString * const DefaultsOnboardingCompleteKey;
extern NSString * const DefaultsLoginStatTemp;

@interface MBNibs : NSObject

@property (nonatomic, strong) UIWindow *window;

+ (id)sharedManager;
+ (void)changeViewController:(UIViewController *)viewController;

@end

@interface MBNibs (Storyboards)

+ (UIStoryboard *)mainStoryboard;
+ (UIStoryboard *)loginStoryboard;
+ (UIStoryboard *)utilityStoryboard;

@end

@interface MBNibs (EntryPoints)

+ (UIViewController *)home;
+ (UINavigationController *)homeNavigation;
+ (UIViewController *)login;
+ (UIViewController *)onboarding;
+ (UIViewController *)permissionsViewController;
+ (UIViewController *)webViewController;

@end
