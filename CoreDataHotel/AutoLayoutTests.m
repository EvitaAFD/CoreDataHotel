//
//  AutoLayoutTests.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/26/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AutoLayout.h"

@interface AutoLayoutTests : XCTestCase

@property(strong, nonatomic) UIViewController *testContoller;

@property(strong, nonatomic) UIView *testView1;

@property(strong, nonatomic) UIView *testView2;

@end

@implementation AutoLayoutTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.testContoller = [[UIViewController alloc]init];
    self.testView1 = [[UIView alloc]init];
    self.testView2 = [[UIView alloc]init];

    [self.testContoller.view addSubview:self.testView1];
    [self.testContoller.view addSubview:self.testView2];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    //tearing down properties
    self.testContoller = nil;
    self.testView1 = nil;
    self.testView2 = nil;
    
    [super tearDown];
}

-(void)testGenericConstraintFromToViewWithAttribute {

    XCTAssertNotNil(self.testContoller, @"The testController is nil!");
    XCTAssertNotNil(self.testView1, @"self.testview1 is nil!");
    XCTAssertNotNil(self.testView2, @"self.testview2 is nil!");
    
    id constraint = [AutoLayout genericConstraintFrom:self.testView1 toView:self.testView2 withAttribute:NSLayoutAttributeTop];
    
    XCTAssert([constraint isKindOfClass:[NSLayoutConstraint class]], @"Constraint is not an instance of NSLayout constraint");
    
    XCTAssertTrue([(NSLayoutConstraint *)constraint isActive], @"Constraint was not activated.");

}


@end
