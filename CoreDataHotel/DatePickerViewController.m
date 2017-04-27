//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/25/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import "DatePickerViewController.h"
#import "AvailabilityViewController.h"
#import "AutoLayout.h"

@interface DatePickerViewController ()

@property(strong, nonatomic) UIDatePicker *endDate;
@property(strong, nonatomic) UIDatePicker *startDate;

@end

@implementation DatePickerViewController

-(void)loadView {
    [super loadView];
    
    [self setUpDatePickers];
    [self setupDoneButton];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)setupDoneButton {
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(doneButtonPressed)];
    
    [self.navigationItem setRightBarButtonItem:doneButton];
}

-(void)doneButtonPressed {
    
    NSDate *startDate = self.startDate.date;
    NSDate *endDate = self.endDate.date;
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]) {
        self.endDate.date = [NSDate date];
        return;
    }
    
    AvailabilityViewController *availabilityController = [[AvailabilityViewController alloc]init];
    availabilityController.endDate = endDate;
    availabilityController.startDate = startDate;
    
    [self.navigationController pushViewController:availabilityController animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)setUpDatePickers {
    
    self.startDate = [[UIDatePicker alloc]init];
    self.startDate.datePickerMode = UIDatePickerModeDate;
    
    [self.view addSubview:self.startDate];
    
    self.endDate = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode = UIDatePickerModeDate;
    
    [self.view addSubview:self.endDate];
    
    float navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    CGFloat statusBarHeight = 20.0;
    CGFloat topMargin = navBarHeight + statusBarHeight;
    CGFloat windowHeight = self.view.frame.size.height;
    CGFloat frameHeight = ((windowHeight -topMargin) / 2);
    
    NSDictionary *viewDictionary = @{@"startDate": self.startDate, @"endDate": self.endDate};
    
    NSDictionary *metricsDictionary = @{@"topMargin": [NSNumber numberWithFloat:topMargin], @"frameHeight": [NSNumber numberWithFloat:frameHeight]};
    
    NSString *visualFormatString = @"V:|-topMargin-[startDate(==frameHeight)][endDate(==startDate)]|";
    
    [AutoLayout leadingConstraintFrom:self.startDate toView:self.view];
    [AutoLayout trailingConstraintFrom:self.startDate toView:self.view];
    [AutoLayout leadingConstraintFrom:self.endDate toView:self.view];
    [AutoLayout trailingConstraintFrom:self.endDate toView:self.view];
    
    [AutoLayout constraintsWithVFLForViewDictionary:viewDictionary forMetricsDictionary:metricsDictionary withOptions:0 withVisualFormat:visualFormatString];
    
    [self.startDate setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self.endDate setTranslatesAutoresizingMaskIntoConstraints:NO];
}

@end
