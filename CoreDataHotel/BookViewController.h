//
//  BookViewController.h
//  CoreDataHotel
//
//  Created by Eve Denison on 4/25/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface BookViewController : UIViewController

@property(strong, nonatomic) NSDate *startDate;
@property(strong,nonatomic) NSDate *endDate;
@property(strong, nonatomic) Room *room;

@end
