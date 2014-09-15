//
//  ProfileViewController.h
//  Profile
//
//  Created by Mac_PC on 14-8-6.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "educationViewController.h"
#import "experienceViewController.h"
#import "ProfileCell.h"
#import "SeparatorLine.h"

@interface ProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
  
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void) eduClick:(id)sender;
- (void) expClick:(id)sender;
- (void) skillClick:(id)sender;
- (ProfileCell *)getCellFromIndexPath:(NSIndexPath*)indexPath;
@end
