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
#import "Hotel+CoreDataClass.h"

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

#import "BookViewController.h"

@interface HotelService : NSObject

@property(strong, nonatomic) NSFetchedResultsController *availableRooms;
@property(strong, nonatomic) NSDate *startDate;
@property(strong, nonatomic) NSDate *endDate;

+(NSFetchedResultsController *)availableRoomsWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;

+(void)reservationBookingWithStartDate:(NSDate *)startDate
                           withEndDate:(NSDate *)endDate
                              withRoom:(Room *)room
                         withFirstName:(NSString *)firstName withLastName:(NSString *)lastName andEmail:(NSString *)email;
@end

