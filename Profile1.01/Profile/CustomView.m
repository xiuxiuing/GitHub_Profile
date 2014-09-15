//
//  CustomView.m
//  Profile
//
//  Created by Mac_PC on 14-9-12.
//  Copyright (c) 2014年 H0meDev. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithType:(int)type
{
    NSArray *nibView = [[NSBundle mainBundle]loadNibNamed:@"CustomView" owner:nil options:nil];
    self = [nibView objectAtIndex:0];
    typeFlag = type;
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)awakeFromNib{
    flag = 2;
    NSMutableArray *year = [[NSMutableArray alloc]init];
    int j = 1980;
    for (int i =0; j <2050; i++) {
        [year insertObject:[NSString stringWithFormat:@"%i", j] atIndex:i];
        j++;
    }
    
    degreeData = [NSArray arrayWithObjects:@"本科",@"研究生",@"博士", nil];
    monthData  = [NSArray arrayWithObjects:@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec", nil];
    yearData = [NSArray arrayWithArray:year];
    
     
   UIImage *image = [UIImage imageNamed:@">>.png"];
    [self.button2 setImage:image forState:UIControlStateNormal];
    self.button2.imageEdgeInsets = UIEdgeInsetsMake(0, 80, 0, 0);
    [self.button3 setImage:image forState:UIControlStateNormal];
    self.button3.imageEdgeInsets = UIEdgeInsetsMake(0, 80, 0, 0);
    [self.button2.layer setBorderWidth:1.0];
    [self.button3.layer setBorderWidth:1.0];
 //   [self.scrollView setBackgroundColor: FONTCOLOR_GRAYWHITE   ];
    [self.label1 setBackgroundColor: BACKGROUNDCOLOR_WHITE ];
    [self.label2 setBackgroundColor:BACKGROUNDCOLOR_WHITE ];
    [self.button2 setBackgroundColor: BACKGROUNDCOLOR_WHITE ];
    [self.button3 setBackgroundColor: BACKGROUNDCOLOR_WHITE ];
    
    [self.label1 setFont:LABEL_FONT_SIZE];
    [self.label2 setFont:LABEL_FONT_SIZE];
    [self.label3 setFont:LABEL_FONT_SIZE];
    [self.label4 setFont:LABEL_FONT_SIZE];
    [self.label5 setFont:LABEL_FONT_SIZE];
    
    [self.textField1 setFont:TEXT_FONT_SIZE];
    [self.textField2 setFont:TEXT_FONT_SIZE];
    [self.button2.titleLabel setFont:TEXT_FONT_SIZE];
    [self.button3.titleLabel setFont:TEXT_FONT_SIZE];
    
    
    [self.view1 setBackgroundColor:FONTCOLOR_BLACKFIVE   ];
    [self.view2 setBackgroundColor:FONTCOLOR_BLACKFIVE   ];
    [self.view3 setBackgroundColor:FONTCOLOR_BLACKFIVE    ];
    [self.view4 setBackgroundColor:FONTCOLOR_BLACKFIVE   ];
    [self.button2.titleLabel setFont:TEXT_FONT_SIZE];
    
    self.textField1.delegate = self;
    self.textField2.delegate = self;
    self.textField3.delegate = self;
    self.scrollView.delegate = self;
    self.monthPicker.delegate = self;
    self.monthPicker.dataSource = self;
    [self.monthPicker setHidden:YES];

    
    
    self.label1.textColor = [UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0];
    self.label2.textColor = [UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0];
    self.label3.textColor = [UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0];
    self.label4.textColor = [UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0];
    self.label5.textColor = [UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0];
    
    [self.doneButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.button3 addTarget:self action:@selector(endClick:) forControlEvents:UIControlEventTouchUpInside];

}

#pragma -mark

- (void)applyConstraints{
    [self.customView removeConstraints:self.customView.constraints];
    
    NSDictionary *viewDicts;
    NSArray *constraints;
    
    viewDicts = NSDictionaryOfVariableBindings(_label1,_label2,_label3,_label4,_label5,_textField1,_textField2,_view1,_view2,_view3,_view4,_view5,_view6,_textField3,_button2,_button3,_button4,_switch1);
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_label1]-20-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_view1]-0-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-22-[_textField1]-20-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_view2]-0-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_label2]-20-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_view3]-0-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-22-[_textField2]-20-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_view4]-0-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_label3]-100-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_view5]-0-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_view6]-0-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_switch1]-20-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_textField3(100)]-200-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_label4(100)]-80-[_label5(100)]" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_button2(100)]" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_button3(100)]-20-|" options:0 metrics:nil views:viewDicts];
    [self.customView addConstraints:constraints];
     if (typeFlag == 1) {
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_label1]-3-[_view1(1)]-5-[_textField1]-5-[_view2(1)]-8-[_label2]-3-[_view3(1)]-5-[_textField2]-5-[_view4(1)]-30-[_label3]-5-[_textField3]-10-[_label4]-5-[_button2]" options:0 metrics:nil views:viewDicts];
        [self.customView addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_textField3]-10-[_label5]-5-[_button3]" options:0 metrics:nil views:viewDicts];
        [self.customView addConstraints:constraints];
    }
    else if(typeFlag == 2){
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_label1]-3-[_view1(1)]-5-[_textField1]-5-[_view2(1)]-8-[_label2]-3-[_view3(1)]-5-[_textField2]-5-[_view4(1)]-15-[_view5(1)]-5-[_label3]-5-[_view6(1)]-10-[_label4]-5-[_button2]" options:0 metrics:nil views:viewDicts];
        [self.customView addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_view6]-10-[_label5]-5-[_button3]" options:0 metrics:nil views:viewDicts];
        [self.customView addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_view5]-2-[_switch1]" options:0 metrics:nil views:viewDicts];
        [self.customView addConstraints:constraints];

       
    }
    
    
}

- (IBAction)startClick:(id)sender{
    flag = 2;
    startFlag = YES;
    //  [degreePickerView setHidden:YES];
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
    [self.textField3 resignFirstResponder];
    [self monthPickerAnimation];
    [self.monthPicker reloadAllComponents];
    [self setDataSelected];
    [self.button2 setTitle:[NSString stringWithFormat:@"%@ %@",[monthData objectAtIndex:[self.monthPicker selectedRowInComponent:0 ]],[yearData objectAtIndex:[self.monthPicker selectedRowInComponent:1                                                                                                                      ]]] forState:UIControlStateNormal];
    self.button2.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
}
- (IBAction)endClick:(id)sender{
    flag = 2;
    startFlag = NO;
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
    [self.textField3 resignFirstResponder];
    [self monthPickerAnimation];
    [self.monthPicker reloadAllComponents];
    [self setDataSelected];
    [self.button3 setTitle:[NSString stringWithFormat:@"%@ %@",[monthData objectAtIndex:[self.monthPicker selectedRowInComponent:0 ]],[yearData objectAtIndex:[self.monthPicker selectedRowInComponent:1                                                                                                                      ]]] forState:UIControlStateNormal];
    self.button3.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    CGPoint offest = self.scrollView.contentOffset;
    NSLog(@"%f",offest.y);
}

- (IBAction)doneButtonClick:(id)sender{
    
    [UIView beginAnimations:@"MonthPicker" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.monthView.frame = CGRectMake(0, 568, self.frame.size.width, 192);
    [UIView commitAnimations];
    
    CGPoint offest = self.scrollView.contentOffset;
    if (offest.y > self.monthPicker.frame.size.height) {
        [self.scrollView setContentOffset:CGPointMake(0, offest.y - self.monthPicker.frame.size.height) animated:YES];
    }
    else{
        if ([[UIDevice currentDevice]systemVersion].floatValue >= 7.0) {
            [self.scrollView setContentOffset:CGPointMake(0, -64) animated:YES];
        }
        else{
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        
    }
    
}

- (void) monthPickerAnimation{
    [self.monthPicker setHidden:NO];
    [UIView beginAnimations:@"MonthPicker" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    [self.monthView setFrame:CGRectMake(0, self.frame.size.height - 192, self.frame.size.width, 192)];
    [UIView commitAnimations];
    CGPoint offest = self.scrollView.contentOffset;
    float height = self.frame.size.height - (self.button2
                                                  .frame.origin.y + self.button2.frame.size.height - offest.y);
    if (height >= self.monthView.frame.size.height + 10) {
        
    }else{
        [self
         .scrollView setContentOffset:CGPointMake(0, offest.y + self.monthView.frame.size.height - height+10) animated:YES];
    }
    
}


- (void) setDataSelected{
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    int year=(int)[comps year];
    int month = (int)[comps month];
    [self.monthPicker selectRow:month-1 inComponent:0 animated:NO];
    [self.monthPicker selectRow:year-1980 inComponent:1 animated:NO];
}

#pragma mark - textField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    [self
     .scrollView setContentOffset:CGPointMake(0,0) animated:YES];
    
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
  //  [self doneButtonClick:textField];
    [UIView beginAnimations:@"MonthPicker" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.monthView.frame = CGRectMake(0, 568, self.frame.size.width, 192);
    [UIView commitAnimations];

    textFrame = textField.frame;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification{
    
    NSValue *keyboardBoundsValue = [[notification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardBounds;
    [keyboardBoundsValue getValue:&keyboardBounds];
    CGPoint offest = self.scrollView.contentOffset;
    NSLog(@"offest %f  %f", offest.y,textFrame.origin.y);
    if (self.frame.size.height - keyboardBounds.size.height < textFrame.origin.y +30 -offest.y) {
        [self
         .scrollView setContentOffset:CGPointMake(0, offest.y +textFrame.origin.y +30- self.frame.size.height + keyboardBounds.size.height ) animated:YES];
    }
}

#pragma mark -UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    if (flag == 1) {
        return 1;
    }
    else if(flag == 2) {
        return 2;
    }
    return 0;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (flag == 1) {
        return [degreeData count];
    }
    if (flag == 2) {
        if (component == 0) {
            
            return [monthData count];
        }
        else {
            
            return  [yearData count];
        }
    }
    return 0;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (flag == 1) {
        return [degreeData objectAtIndex:row];
    }
    if (flag == 2) {
        if (component == 0) {
            return [monthData objectAtIndex:row];
        }
        else {
            return [yearData objectAtIndex:row];
        }
    }
    return nil;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 80;
}

-  (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
   
    if (flag == 1) {
        
    }
    if (flag == 2) {
        if (startFlag) {
            [self.button2 setTitle:[NSString stringWithFormat:@"%@ %@",[monthData objectAtIndex:[self.monthPicker selectedRowInComponent:0 ]],[yearData objectAtIndex:[self.monthPicker selectedRowInComponent:1                                                                                                                      ]]] forState:UIControlStateNormal];        }
        else{
            [self.button3 setTitle:[NSString stringWithFormat:@"%@ %@",[monthData objectAtIndex:[self.monthPicker selectedRowInComponent:0 ]],[yearData objectAtIndex:[self.monthPicker selectedRowInComponent:1                                                                                                                      ]]] forState:UIControlStateNormal];
        }
    }
    
}


@end
