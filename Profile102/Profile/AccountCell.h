//
//  AccountCell.h
//  Profile
//
//  Created by Mac_PC on 14-8-11.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;


@end
