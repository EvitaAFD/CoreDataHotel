//
//  ViewController.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/24/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

@import Crashlytics;

#import "ViewController.h"

#import "AutoLayout.h"

#import "HotelsViewController.h"

#import "DatePickerViewController.h"

#import "LookUpReservationViewController.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupLayout];
}

-(void)setupLayout {
    
    //apply as a consant or a top constraint
    float navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    UIButton *browseButton = [self createButtonWithTitle:@"Browse"];
    UIButton *bookButton = [self createButtonWithTitle:@"Book"];
    UIButton *lookupButton = [self createButtonWithTitle:@"Look Up"];
    
    browseButton.backgroundColor = [UIColor colorWithRed:1.0 green:0.25 blue:1.0 alpha:1.0];
    bookButton.backgroundColor = [UIColor colorWithRed:0.75 green:0.50 blue:1.0 alpha:1.0];
    lookupButton.backgroundColor = [UIColor colorWithRed:0.85 green:0.50 blue:1.0 alpha:0.75];
    
    CGFloat statusBarHeight = 20.0;
    CGFloat topMargin = navBarHeight + statusBarHeight;
    CGFloat windowHeight = self.view.frame.size.height;
    CGFloat buttonHeight = ((windowHeight - topMargin) / 3);
    
    NSDictionary *viewDictionary = @{@"browseButton": browseButton, @"bookButton": bookButton, @"lookupButton": lookupButton};
    
    NSDictionary *metricsDictionary = @{@"topMargin": [NSNumber numberWithFloat:topMargin], @"buttonHeight": [NSNumber numberWithFloat:buttonHeight]};
    
    NSString *visualFormatString = @"V:|-topMargin-[browseButton(==buttonHeight)][bookButton(==browseButton)][lookupButton(==browseButton)]|";
    
    [AutoLayout constraintsWithVFLForViewDictionary:viewDictionary forMetricsDictionary:metricsDictionary withOptions:0 withVisualFormat:visualFormatString];
    
    [AutoLayout leadingConstraintFrom:browseButton toView:self.view];
    [AutoLayout trailingConstraintFrom:browseButton toView:self.view];
    
    [AutoLayout leadingConstraintFrom:bookButton toView:self.view];
    [AutoLayout trailingConstraintFrom:bookButton toView:self.view];
    
    [AutoLayout leadingConstraintFrom:lookupButton toView:self.view];
    [AutoLayout trailingConstraintFrom:lookupButton toView:self.view];
    
    [browseButton addTarget:self action:@selector(browseButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    [bookButton addTarget:self action:@selector(bookButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    [lookupButton addTarget:self action:@selector(lookupButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)bookButtonSelected {
    
    [Answers logCustomEventWithName:@"Book button pressed." customAttributes:nil];
    
    DatePickerViewController *datePickerController = [[DatePickerViewController alloc]init];
    
    [self.navigationController pushViewController:datePickerController animated:YES];
    
}

-(void)browseButtonSelected {
    
    [Answers logCustomEventWithName:@"Browse button pressed." customAttributes:nil];
    
    HotelsViewController *newHotelView = [[HotelsViewController alloc]init];
    
    [self.navigationController pushViewController:newHotelView animated:YES];
}

-(void)lookupButtonSelected{
    LookUpReservationViewController *lookUpView = [[LookUpReservationViewController alloc]init];
    
    [self.navigationController pushViewController:lookUpView animated:YES];
    
    
}

-(UIButton *)createButtonWithTitle:(NSString *)title {

    UIButton *button = [[UIButton alloc]init];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:button];
    
    return button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
