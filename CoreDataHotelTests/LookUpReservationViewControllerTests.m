//
//  LookUpReservationViewControllerTests.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/27/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import "LookUpReservationViewController.h"

#import <XCTest/XCTest.h>

@interface LookUpReservationViewControllerTests : XCTestCase

@property(strong, nonatomic)NSDate *testDate;

@end

@implementation LookUpReservationViewControllerTests

- (void)setUp {
    [super setUp];
    
    self.testDate = [[NSDate alloc]init];

}

- (void)tearDown {
    
    self.testDate = nil;
    
    [super tearDown];
}

-(void)testStringValidity {
    id secondTestDate = [LookUpReservationViewController getDateString:self.testDate];
    
    XCTAssert([secondTestDate isKindOfClass:[NSString class]], @"This is not of NSString class type");
    XCTAssertNoThrow(secondTestDate, @"This did throw an exception");
    XCTAssertThrows([LookUpReservationViewController getDateString:nil], @"Throw failed when expected");
}

@end
