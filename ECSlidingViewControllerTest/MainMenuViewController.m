//
//  MainMenuViewController.m
//
//  Created by Raju Nair on 23/11/13.
//  Copyright (c) 2013 Raju Nair. All rights reserved.
//

#import "MainMenuViewController.h"


NSString * const kCellIdentifier = @"Cell";

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController
{
    NSMutableArray *menuItemsSec1 ;
}

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

    CGRect tblFrame=self.view.frame;
    tblFrame.origin.y=80;
    _myTableView = [[UITableView alloc] initWithFrame:tblFrame style:UITableViewStylePlain];
    [self.view addSubview:_myTableView];
    _myTableView.layer.borderColor =[UIColor clearColor].CGColor;
    _myTableView.layer.borderWidth = 1;
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    _myTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [_myTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    _myTableView.backgroundColor=[UIColor clearColor];
    
    menuItemsSec1 = [NSMutableArray arrayWithObjects:@"Home Screen",@"First Screen",@"Second Screen", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue {
    NSLog(@"MainMenuViewController.m - aunwindToMenuViewController");
}


#pragma mark -
#pragma mark Table View Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int i = indexPath.row;
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier ];
    if (myCell == nil) {
        myCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    myCell.textLabel.text = [NSString stringWithFormat:@"%@",[menuItemsSec1 objectAtIndex:i]];
    myCell.contentView.backgroundColor=[UIColor clearColor];
    return myCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        if(indexPath.row == 0){
            [self performSegueWithIdentifier:@"toHomeScreen" sender:self];
        }else if (indexPath.row == 1){
            [self performSegueWithIdentifier:@"toFirstScreen" sender:self];
        }else if (indexPath.row == 2){
            [self performSegueWithIdentifier:@"toSecondScreen" sender:self];
        }
    } else {
        //Your code for Section 2 with the index 1
    }

}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)] ;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"numberOfRowsInSection");
    switch (section) {
        case 0:
            return menuItemsSec1.count;
        default:
            return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Section 1";
            break;
        case 1:
            sectionName = @"Section 2";
            break;
    }
    return sectionName;
}




@end


