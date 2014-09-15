//
//  SeparatorLine.h
//  PRJ_Linkr
//
//  Created by fan.gao on 14-8-11.
//  Copyright (c) 2014年 haoqi. All rights reserved.
//

#import <UIKit/UIKit.h>

enum SeparatorLine
{
    SeparatorLineTop = 0,
    SeparatorLineButtom = 1,
    SeparatorLineMiddle = 2
};

@interface UIView(SeparatorLine)

//横分割线
- (void)addSeparatorLineWithType:(enum SeparatorLine)type orginX:(float)orginX color:(UIColor *)color;

@end
