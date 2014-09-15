//
//  experienceViewController.m
//  Profile
//
//  Created by Mac_PC on 14-8-6.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import "experienceViewController.h"

@interface experienceViewController ()

@end

@implementation experienceViewController{
   
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [mainView.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 650)];
}
-(void)viewDidAppear:(BOOL)animated{
    [mainView.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 650)];
       
   }

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // NSArray *nibView = [[NSBundle mainBundle]loadNibNamed:@"CustomView" owner:nil options:nil];
   // mainView = [nibView objectAtIndex:0];
     mainView = [[CustomView alloc]initWithType:2];
    mainView.frame = CGRectMake(0, 0, 320, 568);
    self.view = mainView;
    mainView.label1.text = @"Company";
    mainView.textField1.placeholder = @"Acme Corporation";
    mainView.label2.text = @"Position";
    mainView.textField2.placeholder = @"Business Development";
    mainView.label3.text = @"Currently Employed?";
    mainView.label4.text = @"Start Date";
    mainView.label5.text = @"End Date";
    mainView.switch1.hidden = NO;
    mainView.textField3.hidden = YES;
    [mainView.switch1 addTarget:self action:@selector(SwitchAction:) forControlEvents:UIControlEventValueChanged];
    [mainView applyConstraints];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"X" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 30, 20);
    btn.titleLabel.font =  NAV_TITLE_FONT;
    btn.titleLabel.textColor = NAV_TITLE_COLOR;
    [btn addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftItem;   
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setTitle:@"Done" forState:UIControlStateNormal];
    btnRight.frame = CGRectMake(0, 0, 50, 20);
    btnRight.titleLabel.font =  NAV_TITLE_FONT;
    btnRight.titleLabel.textColor = NAV_TITLE_COLOR;
    [btnRight addTarget:self action:@selector(doneClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Click响应


- (void) onclick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)doneClick:(id)sender{
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *string = [mainView.textField1.text stringByTrimmingCharactersInSet:whiteSpace];
    if (string.length <= 0) {
        NSLog(@"内容不能为空");
    }
    string = [mainView.textField2.text stringByTrimmingCharactersInSet:whiteSpace];
    if (string.length <= 0) {
        NSLog(@"内容不能为空");
    }
    if (mainView.button2.titleLabel.text.length>0 && mainView.button3.titleLabel.text.length > 0) {
        NSLog(@"%@", [mainView.button2.titleLabel.text substringWithRange:NSMakeRange(4, 4)]);
        if ([[mainView.button2.titleLabel.text substringWithRange:NSMakeRange(4, 4)] compare:[mainView.button3.titleLabel.text substringWithRange:NSMakeRange(4, 4)]] >=0) {
            NSLog(@"StartDate >= Enddate");
        }
    }

    _dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:mainView.textField1.text,@"Company",mainView.textField2.text,@"Position",[NSString stringWithFormat:@"%i",[mainView.switch1 isOn]],@"EmployeeSwitch",mainView.button2.titleLabel.text, @"Start Date", mainView.button3.titleLabel.text,@"End Date",nil];
    NSLog(@"%@", _dict);
}

- (IBAction)SwitchAction:(id)sender {
    
    if ([mainView.switch1 isOn]) {
        mainView.label5.hidden = NO;
        mainView.button3.hidden = NO;
    }
    else{
        mainView.label5.hidden = YES;
        mainView.button3.hidden = YES;
        }
  }







@end
