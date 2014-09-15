//
//  accountViewController.h
//  Profile
//
//  Created by Mac_PC on 14-8-11.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileViewController.h"
#import "AccountCell.h"
#import "SeparatorLine.h"

@interface accountViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


- (IBAction)profileClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (void)deactiveButtonClick:(id)sender;
- (void)logOutClick:(id)sender;

@end
