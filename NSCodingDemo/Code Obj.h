//
//  Code Obj.h
//  NSCodingDemo
//
//  Created by Mac_PC on 14-9-22.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Code_Obj : NSObject<NSCoding>{
    NSString *name;
    int       magicNumber;
    float     shoseSize;
    NSMutableArray *subThingies;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int magicNumber;
@property (nonatomic, assign) float shoseSize;
@property (nonatomic, retain) NSMutableArray *subThingies;

- (id) initWithName:(NSString *)n magicNumber:(int) mn shoseSize:(float)ss;

@end
