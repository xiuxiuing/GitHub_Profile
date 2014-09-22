//
//  ViewController.m
//  NSCodingDemo
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
    Code_Obj *thing = [[Code_Obj alloc] initWithName:@"name" magicNumber:20 shoseSize:30.5];
    NSLog(@"------%@",thing);
    
    NSData *freezeDrid = [NSKeyedArchiver archivedDataWithRootObject:thing];
    [freezeDrid writeToFile:@"/tmp/codeobj.txt" atomically:YES];
    Code_Obj *thing1 = [[Code_Obj alloc]initWithName:@"sssss" magicNumber:20 shoseSize:30.5];
    [thing1.subThingies addObject:thing];
    
    NSData *other = [NSKeyedArchiver archivedDataWithRootObject:thing1];
    [other writeToFile:@"/tmp/objandobj.txt" atomically:YES];
    
    NSData *fileData = [NSData dataWithContentsOfFile:@"/tmp/objandobj.txt"];
    Code_Obj *fromData = [ NSKeyedUnarchiver unarchiveObjectWithData:fileData];
    NSLog(@"----%@",fromData);
    
    NSString *str = @"abc";
    NSString *astr = @"efg";
    NSArray *Array = [NSArray arrayWithObjects:str, astr, nil];

    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];NSString *filename = [Path stringByAppendingPathComponent:@"test.plist"];
    [NSKeyedArchiver archiveRootObject:Array toFile:filename];
    NSLog(@"%@",filename);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
