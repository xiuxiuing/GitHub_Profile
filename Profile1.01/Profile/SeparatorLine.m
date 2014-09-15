//
//  SeparatorLine.m
//  PRJ_Linkr
//
//  Created by fan.gao on 14-8-11.
//  Copyright (c) 2014年 haoqi. All rights reserved.
//

#import "SeparatorLine.h"
#import <QuartzCore/QuartzCore.h>

#define ALL_SEPREATE_LINE_HEIGHT                        0.5

@implementation UIView(SeparatorLine)

- (void)addSeparatorLineWithType:(enum SeparatorLine)type orginX:(float)orginX color:(UIColor *)color
{
    CAShapeLayer *lineShape = nil;
    CGMutablePathRef linePath = nil;
    linePath = CGPathCreateMutable();
    lineShape = [CAShapeLayer layer];
    lineShape.lineWidth = ALL_SEPREATE_LINE_HEIGHT;
    lineShape.lineCap = kCALineCapRound;;
    lineShape.strokeColor = color.CGColor;
    float x = orginX;
    float y = 0;
    float toX = self.bounds.size.width - 2*orginX;
    float toY = 0;
    
    if (type==SeparatorLineTop) {
        y = 0;
        toY = 0;
    }else if (type==SeparatorLineButtom)
    {
        y = self.bounds.size.height;
        toY = y;
    }else if (type==SeparatorLineMiddle)
    {
        y = self.bounds.size.height/2;
        toY = y;
    }
    CGPathMoveToPoint(linePath, NULL, x, y);
    CGPathAddLineToPoint(linePath, NULL, toX, toY);
    lineShape.path = linePath;
    CGPathRelease(linePath);
    [self.layer addSublayer:lineShape];
}

@end
