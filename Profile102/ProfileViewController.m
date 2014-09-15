//
//  ProfileViewController.m
//  Profile
//
//  Created by Mac_PC on 14-8-6.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import "ProfileViewController.h"



@interface ProfileViewController (){
    NSArray *_expTitleData;
    NSArray *_expInfoData;
    NSArray *_skillsData;
    NSArray *_eduTitleData;
    NSArray *_eduInfoData;
    
    NSArray *_headerTitle;
    NSMutableDictionary *_cellCache;
}

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated{
   
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _headerTitle = [NSArray arrayWithObjects:@"Experience",@"Skills",@"Education", nil];
    _expTitleData = [NSArray arrayWithObjects:@"Senior Interactive Designer at Merck Millipore",@"Information Assurance", nil];
    _expInfoData = [NSArray arrayWithObjects:@"Greater Boston Area,July 2012-Present",@"Adobe,January 2011-June 2012", nil];
    _skillsData = [NSArray arrayWithObjects:@"HTML",@"JavaScript", nil];
    _eduTitleData = [NSArray arrayWithObjects:@"WuHan Univeristy of Science and Technology", nil];
    _eduInfoData = [NSArray arrayWithObjects:@"The infilite non-metaillic materials engineering Bacherlor's Degree,2008-2-12", nil];
    _cellCache = [NSMutableDictionary dictionary];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
     self.tableView.separatorColor = FONTCOLOR_BLACKFIVE ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self.tableView reloadData];
}
#pragma mark - Click事件
-(void)eduClick:(id)sender{
    educationViewController *educationVC = [[educationViewController alloc]init];
    educationVC.title = @"Add Education";
    [self.navigationController pushViewController:educationVC animated:YES];
}

- (void)expClick:(id)sender{
    experienceViewController *experienceVC = [[experienceViewController alloc]init];
    experienceVC.title = @"Add Experience";
    [self.navigationController pushViewController:experienceVC animated:YES];
}
- (void)skillClick:(id)sender{
    NSLog(@"Add skill");
}

#pragma mark - TableView 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return  _expTitleData.count;
    }else if (section == 1){
        return _skillsData.count;
    }
    else if (section == 2){
        return _eduTitleData.count;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProfileCell *cell = [self getCellFromIndexPath:indexPath];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    [cell.contentView setNeedsLayout];
    [cell.contentView layoutIfNeeded];
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    NSLog(@"height:%f", height);
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProfileCell *cachedCell = [_cellCache objectForKey:@(indexPath.row)];
    if (!cachedCell) {
        return [self getCellFromIndexPath:indexPath];
    }
    return cachedCell;
}
- (ProfileCell *)getCellFromIndexPath:(NSIndexPath*)indexPath
{
    static NSString *CellIdentifier;
    if (indexPath.section == 0) {
        CellIdentifier = @"ProfileCell1";
    }else if (indexPath.section == 1){
        CellIdentifier = @"ProfileCell2";
    }else if (indexPath.section == 2)
    {
        CellIdentifier = @"ProfileCell3";
    }
    
    //注意在heightForRowAtIndexPath:indexPath无法使用dequeueReusableCellWithIdentifier:forIndexPath:
    ProfileCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //用dequeueReusableCellWithIdentifier:就得判断Cell为nil的情况
    if (!cell)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"ProfileCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        UIView *tempView = [[UIView alloc]init];
        [cell setBackgroundView:tempView];

     //   [cell setBackgroundColor:[UIColor whiteColor]];
    }
    switch (indexPath.section) {
            
        case 0:
            //    [cell.infiLabel setHidden:NO];
            cell.titleLabel.text = [_expTitleData objectAtIndex:indexPath.row];
            cell.infiLabel.text = [_expInfoData objectAtIndex:indexPath.row];
            
            break;
        case 1:
            cell.titleLabel.text = [_skillsData objectAtIndex:indexPath.row];
            cell.infiLabel.text = @"";
            //  [cell.infiLabel setHidden:YES];
            break;
        case 2:
            //   [cell.infiLabel setHidden:NO];
            cell.titleLabel.text = [_eduTitleData objectAtIndex:indexPath.row];
            cell.infiLabel.text = [_eduInfoData objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    //这里把数据设置给Cell
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
   
    
    view.backgroundColor = FONTCOLOR_BLACKEIGHT  ;
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 25, 100, 10)];
    headerLabel.textColor = [UIColor grayColor];
    headerLabel.font = [UIFont systemFontOfSize:12];
    headerLabel.text = [_headerTitle objectAtIndex:section];
    [view addSubview:headerLabel];
    [view addSeparatorLineWithType:SeparatorLineButtom orginX:0 color:FONTCOLOR_BLACKFIVE ];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return  30;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"add.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
   
    button.frame = CGRectMake(0, 0, 200, 30);
    [button setTitle:[NSString stringWithFormat:@"Add %@",[_headerTitle objectAtIndex:section]] forState:UIControlStateNormal];
    if (section == 0) {
         button.imageEdgeInsets = UIEdgeInsetsMake(0,-20, 0, 0);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button addTarget:self action:@selector(expClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if (section == 1){
         button.imageEdgeInsets = UIEdgeInsetsMake(0,-70, 0, 0);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -60, 0, 0);
        [button addTarget:self action:@selector(skillClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        button.imageEdgeInsets = UIEdgeInsetsMake(0,-30, 0, 0);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [button addTarget:self action:@selector(eduClick:) forControlEvents:UIControlEventTouchUpInside];
    }
   [button setTitleColor:BACKGROUNDCOLOR_BLUE  forState:UIControlStateNormal];
    
    [view addSubview:button];
      [view addSeparatorLineWithType:SeparatorLineButtom orginX:0 color:FONTCOLOR_BLACKFIVE ];
    
    return view;
}
/*
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
         if ([[UIDevice currentDevice]systemVersion].floatValue >= 7.0) {
           scrollView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
         }
         else{
             scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);

         }
    }
}*/

@end
