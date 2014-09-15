//
//  AccountCell.m
//  Profile
//
//  Created by Mac_PC on 14-8-11.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import "AccountCell.h"

@implementation AccountCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.infoLabel.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
