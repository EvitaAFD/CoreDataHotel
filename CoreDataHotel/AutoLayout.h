//
//  AutoLayout.h
//  CoreDataHotel
//
//  Created by Eve Denison on 4/24/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

@import UIKit;

@interface AutoLayout : NSObject

+(NSLayoutConstraint *)genericConstraintFrom: (UIView *)view
                                      toView:(UIView *)superView
                               withAttribute: (NSLayoutAttribute)attribute
                               andMultiplier: (CGFloat)multiplier;

//Helper function for above
+(NSLayoutConstraint *)genericConstraintFrom: (UIView *)view
                                      toView:(UIView *)superView
                               withAttribute: (NSLayoutAttribute)attribute;


+(NSArray *)fullScreenConstraintsWithVFLForView: (UIView *)view;

//Leading
+(NSLayoutConstraint *)equalHeightConstraintFromView:(UIView *)view
                                              toView:(UIView *)otherView
                                      withMultiplier:(CGFloat)multiplier;

+(NSLayoutConstraint *)leadingConstraintFrom:(UIView *)view
                                          toView:(UIView *)otherView;

//Trailing
+(NSLayoutConstraint *)trailingConstraintFrom:(UIView *)view
                                       toView:(UIView *)otherView;
//Nameless
+(NSArray *)constraintsWithVFLForViewDictionary:(NSDictionary *)viewDictionary
                           forMetricsDictionary:(NSDictionary *)metricsDictionary
                                    withOptions:(NSLayoutFormatOptions)options
                               withVisualFormat:(NSString *)visualFormat;

@end
