//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/25/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property(strong, nonatomic) UIDatePicker *endDate;


@end

@implementation DatePickerViewController

-(void)loadView {
    [super loadView];
    
    [self setUpDatePickers];
    [self setupDoneButton];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)setupDoneButton {
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    
    [self.navigationItem setRightBarButtonItem:doneButton];
}

-(void)doneButtonPressed {
    
    NSDate *endDate = self.endDate.date;
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]) {
        self.endDate.date = [NSDate date];
        return;
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)setUpDatePickers {
    
    self.endDate = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode = UIDatePickerModeDate;
    
    self.endDate.frame = CGRectMake(0, 84.0, self.view.frame.size.width, 200.0);
    
    [self.view addSubview:self.endDate];
    
}

@end
