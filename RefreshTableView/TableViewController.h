//
//  TableViewController.h
//  RefreshTableView
//
//  Created by Mac_PC on 14-9-15.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *timeArray;
    UIRefreshControl *refresh;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *timeArray;
@property (strong, nonatomic) UIRefreshControl *refresh;
@end
