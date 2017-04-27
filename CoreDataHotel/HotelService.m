//
//  HotelService.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/27/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import "HotelService.h"

#import "AppDelegate.h"

#import "AvailabilityViewController.h"

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"

#import "CoreDataHotel+CoreDataModel.h"


@implementation HotelService


//MARK: Availble Rooms Method

+(NSFetchedResultsController *)availableRoomsWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate {
    
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
        
        request.predicate = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate >= %@", endDate,startDate];
        
        NSError *roomError;
        NSArray *results = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&roomError];
        
        NSMutableArray *unavailableRooms = [[NSMutableArray alloc]init];
        
        for (Reservation *reservation in results) {
            [unavailableRooms addObject:reservation.room];
        }
        
        NSFetchRequest *roomRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
        roomRequest.predicate = [NSPredicate predicateWithFormat:@"NOT self IN %@", unavailableRooms];
        
        NSSortDescriptor *roomSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"hotel.name" ascending:YES];
        
        NSSortDescriptor *roomNumberSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];
        
        roomRequest.sortDescriptors = @[roomSortDescriptor, roomNumberSortDescriptor];
        
        
        NSError *availableRoomError;
        
        NSFetchedResultsController *availableRooms = [[NSFetchedResultsController alloc] initWithFetchRequest:roomRequest managedObjectContext:appDelegate.persistentContainer.viewContext sectionNameKeyPath:@"hotel.name" cacheName:nil];
        
        [availableRooms performFetch:&availableRoomError];
    
        return availableRooms;
}



@end
