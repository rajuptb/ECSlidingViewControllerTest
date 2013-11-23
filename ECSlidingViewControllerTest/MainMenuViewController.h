//
//  MainMenuViewController.h
//
//  Created by Raju Nair on 23/11/13.
//  Copyright (c) 2013 Raju Nair. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController <UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@end
