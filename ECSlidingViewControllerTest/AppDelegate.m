//
//  AppDelegate.m
//  ECSlidingViewControllerTest
//
//  Created by Raju Nair on 23/11/13.
//  Copyright (c) 2013 Raju Nair. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle: nil];
    
    UIViewController *topViewController = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeScreen"];
    UIViewController *underLeftViewController  = [mainStoryboard instantiateViewControllerWithIdentifier: @"MainMenuViewController"];
    
    
    UIImage *imgSideBarBtn = [UIImage imageNamed:@"Menu"];
    CGRect frameSideBarBtn = CGRectMake(0, 0, 25, 22);
    UIButton *btnSideBar = [[UIButton alloc] initWithFrame:frameSideBarBtn];
    [btnSideBar setBackgroundImage:imgSideBarBtn forState:UIControlStateNormal];
    [btnSideBar addTarget:self action:@selector(anchorRight) forControlEvents:UIControlEventTouchUpInside];
    [btnSideBar setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *anchorRightButton =[[UIBarButtonItem alloc] initWithCustomView:btnSideBar];

    
    
    //UIBarButtonItem *anchorRightButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(anchorRight)];
    topViewController.navigationItem.title = @"ECSlidingVC Demo";
    topViewController.navigationItem.leftBarButtonItem  = anchorRightButton;
    topViewController.navigationItem.hidesBackButton = NO;
    topViewController.navigationController.navigationBarHidden = NO;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:topViewController];
    
    // configure under left view controller
    underLeftViewController.edgesForExtendedLayout = UIRectEdgeTop | UIRectEdgeBottom | UIRectEdgeLeft; // don't go under the top view
    
    
    // configure sliding view controller
    self.slidingViewController = [ECSlidingViewController slidingWithTopViewController:navigationController];
    self.slidingViewController.underLeftViewController  = underLeftViewController;
    
    // enable swiping on the top view
    //[navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    // configure anchored layout
    self.slidingViewController.anchorRightPeekAmount  = 100.0;
    self.slidingViewController.anchorLeftRevealAmount = 250.0;
    
    self.window.rootViewController = self.slidingViewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)anchorRight {
    NSLog(@"AppDelegate - anchorRight");
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

- (void)anchorLeft {
    NSLog(@"AppDelegate - anchorLeft");
    [self.slidingViewController anchorTopViewToLeftAnimated:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
