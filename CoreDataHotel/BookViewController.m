//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/25/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//
#import "BookViewController.h"
#import "AutoLayout.h"
#import "AppDelegate.h"

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"

#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"

#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"

@interface BookViewController ()

@property(strong, nonatomic) UITextField *firstName;
@property(strong, nonatomic) UITextField *lastName;
@property(strong, nonatomic) UITextField *email;

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setupBooking];
    [self setupSaveButton];
   
}

-(void)setupBooking {

    self.firstName = [[UITextField alloc]init];
    self.lastName = [[UITextField alloc]init];
    self.email = [[UITextField alloc]init];
    self.email.keyboardType = UIKeyboardTypeEmailAddress;
    
    [self.view addSubview:self.firstName];
    [self.view addSubview:self.lastName];
    [self.view addSubview:self.email];
    
    self.firstName.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastName.translatesAutoresizingMaskIntoConstraints = NO;
    self.email.translatesAutoresizingMaskIntoConstraints = NO;
    
    [AutoLayout setConstraintConstantsFrom:self.firstName toView:self.view withAttribute:NSLayoutAttributeTop andConstant:150];
    [AutoLayout setConstraintConstantsFrom:self.firstName toView:self.view withAttribute:NSLayoutAttributeLeft andConstant:40];
    [AutoLayout setConstraintConstantsFrom:self.firstName toView:self.view withAttribute:NSLayoutAttributeRight andConstant:-40];
    self.firstName.placeholder = @"First Name, DO OR DIE aka REQUIRED";
    
    [AutoLayout setConstraintConstantsFrom:self.lastName toView:self.firstName withAttribute:NSLayoutAttributeTop andConstant:100];
    [AutoLayout setConstraintConstantsFrom:self.lastName toView:self.view withAttribute:NSLayoutAttributeLeft andConstant:40];
    [AutoLayout setConstraintConstantsFrom:self.lastName toView:self.view withAttribute:NSLayoutAttributeRight andConstant:-40];
    self.lastName.placeholder = @"Last Name, DO OR DIE aka REQUIRED";
    
    [AutoLayout setConstraintConstantsFrom:self.email toView:self.lastName withAttribute:NSLayoutAttributeTop andConstant:100];
    [AutoLayout setConstraintConstantsFrom:self.email toView:self.view withAttribute:NSLayoutAttributeLeft andConstant:40];
    [AutoLayout setConstraintConstantsFrom:self.email toView:self.view withAttribute:NSLayoutAttributeRight andConstant:-40];
    self.email.placeholder = @"Email";
    
    
    
}

-(void)setupSaveButton {
    //add code from today
    UIBarButtonItem *bookingSaveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(bookingSaveButtonPressed)];
    
    [self.navigationItem setRightBarButtonItem:bookingSaveButton];
    
}

-(void)bookingSaveButtonPressed {

        [self.navigationController popViewControllerAnimated:YES];
}


@end
