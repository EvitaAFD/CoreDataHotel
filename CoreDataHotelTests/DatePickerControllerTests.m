//
//  DatePickerControllerTests.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/27/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DatePickerViewController.h"

@interface DatePickerControllerTests : XCTestCase

@end

@implementation DatePickerControllerTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    
    [super tearDown];
}

-(void)testDatePickerControllerExists {

    DatePickerViewController *testDatePickerController = [[DatePickerViewController alloc]init];

    XCTAssert(testDatePickerController);
    
    
}


@end
