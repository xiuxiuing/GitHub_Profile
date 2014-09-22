//
//  Code Obj.m
//  NSCodingDemo
//
//  Created by Mac_PC on 14-9-22.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import "Code Obj.h"

@implementation Code_Obj
@synthesize name;
@synthesize magicNumber;
@synthesize shoseSize;
@synthesize subThingies;

- (id)initWithName:(NSString *)n magicNumber:(int)mn shoseSize:(float)ss{
    if (self = [super init]) {
        self.name = n;
        self.magicNumber = mn;
        self.shoseSize = ss;
        self.subThingies = [NSMutableArray array];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:name forKey:@"name"];
    [aCoder encodeInteger:magicNumber forKey:@"magicNumber"];
    [aCoder encodeFloat:shoseSize forKey:@"shoseSize"];
    [aCoder encodeObject:subThingies forKey:@"subTingies"];
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.magicNumber = [aDecoder decodeIntegerForKey:@"magicNumber"];
        self.shoseSize = [aDecoder decodeFloatForKey:@"shoseSize"];
        self.subThingies = [aDecoder decodeObjectForKey:@"subTingies"];
    }
    return self;
}

- (NSString *)description{
    NSString *descripton=[NSString stringWithFormat:@"%@:%d,%.1f,%@",name,magicNumber,
                          shoseSize,subThingies];
    return (descripton);
}
@end
