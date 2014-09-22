//
//  ViewController.m
//  ReachabilityDemo
//
//  Created by Mac_PC on 14-9-22.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Reachability *r = [Reachability reachabilityWithHostName:@"http://www.zhihuihb.net/college/setting"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            NSLog(@"无网络连接");
            break;
            
        case ReachableViaWWAN:
            NSLog(@"使用3G网络连接");
            break;
        case ReachableViaWiFi:
            NSLog(@"使用Wifi网络连接");
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
