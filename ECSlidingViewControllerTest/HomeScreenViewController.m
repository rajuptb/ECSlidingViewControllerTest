//
//  HomeScreenViewController.m
//
//  Created by Raju Nair on 23/11/13.
//  Copyright (c) 2013 Raju Nair. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "UIViewController+ECSlidingViewController.h"


@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue { }

- (void) swipeLeft{
    
    //[self.slidingViewController anchorTopViewToRightAnimated:YES];
    //[UIApplication.sharedApplication.delegate.slidingViewController anchorTopViewToRightAnimated:YES];
    // Get a reference to my appDelegate
    //AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    //[appDelegate.slidingViewController anchorTopViewToRightAnimated:YES];
    //[self.slidingViewController anchorTopViewToRightAnimated:YES]
}

@end
