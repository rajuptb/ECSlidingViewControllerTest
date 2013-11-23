//
//  AppDelegate.h
//  ECSlidingViewControllerTest
//
//  Created by Raju Nair on 23/11/13.
//  Copyright (c) 2013 Raju Nair. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) ECSlidingViewController *slidingViewController;
@property (strong, nonatomic) UIWindow *window;

@end
