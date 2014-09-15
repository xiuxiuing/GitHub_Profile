//
//  accountViewController.m
//  Profile
//
//  Created by Mac_PC on 14-8-11.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import "accountViewController.h"

@interface accountViewController ()
{
    NSArray *_titleData;
    NSArray *_infoData;
    NSArray *_imageData;
}
@end

@implementation accountViewController

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
    if ([[UIDevice currentDevice]systemVersion].floatValue >= 7.0) {
        [self.navigationController.navigationBar setBarTintColor: NavBarColor];
    }
    else{
        [self.navigationController.navigationBar setTintColor:NavBarColor];
    }
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    _imageData =[NSArray arrayWithObjects:@"Phone.png",@"Name.png",@"Password.png",@"Bio.png",@"Profile.png",@"MyCollection.png", nil];
    _titleData = [NSArray arrayWithObjects:@"Phone",@"Name",@"Password",@"Bio",@"Profile",@"My Collection", nil];
    _infoData = [NSArray arrayWithObjects:@"189713897876",@"Stanley Chen", @"123456",@"Senior Interactive Designer",@"",@"",nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 120);
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"head.png"]];
    imageView.frame = CGRectMake(view.frame.size.width/2 -40, view.frame.size.height/2-40, 80, 80);
    UIButton *cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cameraButton setBackgroundImage:[UIImage imageNamed:@"相机.png"] forState:UIControlStateNormal];
    cameraButton.frame = CGRectMake(imageView.frame.size.width-30, imageView.frame.size.height-20, 30, 20);
    
    [view addSeparatorLineWithType:SeparatorLineButtom orginX:0 color:FONTCOLOR_BLACKFIVE ];
   
    [view addSubview:imageView];
   
    [imageView addSubview:cameraButton];
    self.tableView.tableHeaderView = view;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
   
    
    UIView *footView = [[UIView alloc]init];
    footView.backgroundColor =  FONTCOLOR_WHITE;
    footView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 80);
    
    [footView addSeparatorLineWithType:SeparatorLineTop orginX:0 color:FONTCOLOR_BLACKFIVE ];
    [footView addSeparatorLineWithType:SeparatorLineButtom orginX:0 color:FONTCOLOR_BLACKFIVE ];
    [footView addSeparatorLineWithType:SeparatorLineMiddle orginX:0 color:FONTCOLOR_BLACKFIVE ];
   
    UIButton *logOut = [UIButton buttonWithType:UIButtonTypeCustom];
    [logOut setTitle:@"Log out" forState:UIControlStateNormal];
    [logOut setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    logOut.frame = CGRectMake(view.frame.size.width/2 - 40, 10, 80, 20);
    [logOut addTarget:self action:@selector(logOutClick:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:logOut];
    
    UIButton *deactiveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deactiveButton setTitle:@"Deactive my account" forState:UIControlStateNormal];
    [deactiveButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    deactiveButton.frame = CGRectMake(footView.frame.size.width/2-90, 50, 180, 20);
    [deactiveButton addTarget:self action:@selector(deactiveButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:deactiveButton];
    self.tableView.tableFooterView = footView;
    self.tableView.backgroundColor = FONTCOLOR_BLACKSEVEN ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self viewDidLoad];
    [self.tableView reloadData];
}
#pragma mark - Click事件
- (IBAction)profileClick:(id)sender {
       
    ProfileViewController *profileVC = [[ProfileViewController alloc]init];
    profileVC.title = @"Profile";
    [self.navigationController pushViewController:profileVC animated:YES];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    
}
- (void)deactiveButtonClick:(id)sender{
    NSLog(@"deactive");
}
- (void)logOutClick:(id)sender{
    NSLog(@"logout");
}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 4;
            break;
        case 1:
            return 1;
            break;
        default:
            return 1;
            break;
    }
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 10)];
    view.backgroundColor = [UIColor clearColor];
     [view addSeparatorLineWithType:SeparatorLineButtom orginX:0 color:FONTCOLOR_BLACKFIVE ];
    return view;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   if(section == 2)
   {
       return 20;
   }
   else{
       return 10;
   }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
     UIView *view = [[UIView alloc]init];
    view.backgroundColor =FONTCOLOR_BLACKSEVEN  ;
    int height;
    if (section == 2) {
        height = 20;
    }
    else{
        height = 10;
    }
    view.frame = CGRectMake(0, 0, tableView.frame.size.width, height);
    [view addSeparatorLineWithType:SeparatorLineTop orginX:0 color:FONTCOLOR_BLACKFIVE ];
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"AccountCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        UIView *tempView = [[UIView alloc]init];
        tempView.backgroundColor = [UIColor whiteColor];
        [cell setBackgroundView:tempView];
//        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"AccountCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
    }
  //   [cell setImage:[[UIImageView alloc]initWithImage:[UIImage imageNamed:[_imageData objectAtIndex:indexPath.row]]]];
  
   
    if (indexPath.section == 0) {
          if (indexPath.row ==0) {
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(0, 0, 20, 20);
        [cell setAccessoryView:view];
          }
    cell.imageView.image = [UIImage imageNamed:[_imageData objectAtIndex:indexPath.row]];
    cell.textLabel.text = [_titleData objectAtIndex:indexPath.row];
       
    cell.detailTextLabel.text = [_infoData objectAtIndex:indexPath.row];
     
    }else if (indexPath.section == 1){
        cell.imageView.image = [UIImage imageNamed:@"Profile.png"];
        cell.textLabel.text = @"Profile";
    }
    else{
        cell.imageView.image = [UIImage imageNamed:@"MyCollection.png"];
        cell.textLabel.text = @"My Collection";
    }
       cell.detailTextLabel.backgroundColor = [UIColor clearColor];
     cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 53;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 0) {
        [self profileClick:tableView];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}


@end
