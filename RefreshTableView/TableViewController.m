//
//  TableViewController.m
//  RefreshTableView
//
//  Created by Mac_PC on 14-9-15.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.timeArray = [[NSMutableArray alloc]init];
    NSString *syseTiem = nil;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //创建的时间格式
    syseTiem = [formatter stringFromDate:[NSDate date]];
    [self.timeArray insertObject:syseTiem atIndex:0];
    [self setbeginRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma 开始刷新函数
- (void)setbeginRefreshing
{
    refresh = [[UIRefreshControl alloc]init];
    //刷新图形颜色
    refresh.tintColor = [UIColor lightGrayColor];
    //刷新的标题
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    
    // UIRefreshControl 会触发一个UIControlEventValueChanged事件，通过监听这个事件，我们就可以进行类似数据请求的操作了
    [refresh addTarget:  self action:@selector(refreshTableviewAction:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl =refresh;
}
-(void)refreshTableviewAction:(UIRefreshControl *)refreshs
{
    if (refreshs.refreshing) {
        refreshs.attributedTitle = [[NSAttributedString alloc]initWithString:@"正在刷新"];
        [self performSelector:@selector(refershData) withObject:nil afterDelay:1];
    }
}
-(void)refershData
{
    NSString *syseTiem = nil;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //创建的时间格式
    syseTiem = [formatter stringFromDate:[NSDate date]];
    NSString *lastUpdated = [NSString stringWithFormat:@"上一次更新时间为 %@", [formatter stringFromDate:[NSDate date]]];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated] ;
    [self.timeArray insertObject:syseTiem atIndex:0];
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.timeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    cell.textLabel.text = [self.timeArray objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
