//
//  educationViewController.m
//  Profile
//
//  Created by Mac_PC on 14-8-6.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import "educationViewController.h"

@interface educationViewController ()

@end

@implementation educationViewController{
   
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}


- (void)viewDidAppear:(BOOL)animated{
 
   [mainView.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 650)];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [mainView.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 650)];
  //  [self.doneButton setFrame:CGRectMake(100, 100 , self.view.frame.size.width, 30)];
   }

- (void)viewDidLoad
{
    [super viewDidLoad];
  //  NSArray *nibView = [[NSBundle mainBundle]loadNibNamed:@"CustomView" owner:nil options:nil];
  //  mainView = [nibView objectAtIndex:0];
    mainView = [[CustomView alloc]initWithType:1];
    mainView.frame = CGRectMake(0, 0, 320, 568);
    self.view = mainView;
    
    mainView.label1.text = @"School";
    mainView.textField1.placeholder = @"XXX University";
    mainView.label2.text = @"Marjor";
    mainView.textField2.placeholder = @"Field of Study";
    mainView.label3.text = @"Degree";
    mainView.label4.text = @"Start Date";
    mainView.label5.text = @"End Date";
    mainView.switch1.hidden = YES;
    [mainView applyConstraints];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"X" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 30, 20);
    btn.titleLabel.font = NAV_TITLE_FONT;
    btn.titleLabel.textColor = NAV_TITLE_COLOR;
    [btn addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setTitle:@"Done" forState:UIControlStateNormal];
    btnRight.frame = CGRectMake(0, 0, 50, 20);
    btnRight.titleLabel.font = NAV_TITLE_FONT;
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
  
    _dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:mainView.textField1.text,@"School",mainView.textField2.text,@"Marjor",mainView.textField3.text,@"Degree",mainView.button2.titleLabel.text, @"Start Date", mainView.button3.titleLabel.text,@"End Date",nil];
    NSLog(@"%@", _dict);
}






@end
