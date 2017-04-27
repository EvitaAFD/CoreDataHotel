//
//  HotelService.h
//  CoreDataHotel
//
//  Created by Eve Denison on 4/27/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CoreDataHotel+CoreDataModel.h"
#import "Hotel+CoreDataProperties.h"

@interface HotelService : NSObject

@property(strong, nonatomic) NSFetchedResultsController *availableRooms;
@property(strong, nonatomic) NSDate *startDate;
@property(strong, nonatomic) NSDate *endDate;

+(NSFetchedResultsController *)availableRoomsWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;
@end

