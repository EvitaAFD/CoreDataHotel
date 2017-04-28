//
//  HotelService.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/27/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//
@import Crashlytics;

#import "HotelService.h"

#import "AppDelegate.h"

#import "AvailabilityViewController.h"

#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"

#import "BookViewController.h"

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

//MARK: Booking Method

+(void)reservationBookingWithStartDate:(NSDate *)startDate
                           withEndDate:(NSDate *)endDate
                              withRoom:(Room *)room
                         withFirstName:(NSString *)firstName withLastName:(NSString *)lastName andEmail:(NSString *)email{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:context];
    
    reservation.startDate = [NSDate date];
    reservation.endDate = endDate;
    reservation.room = room;
    
    room.reservation = [room.reservation setByAddingObject:reservation];
    
    reservation.guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
    reservation.guest.firstName = firstName;
    reservation.guest.lastName = lastName;
    reservation.guest.email = email;
    
    NSError *saveError;
    [context save:&saveError];
    
    if (saveError) {
        
        NSDictionary *attributeDictionary = @{@"Save Error: " :saveError.localizedDescription};
        
        [Answers logCustomEventWithName:@"Save reservation error." customAttributes:attributeDictionary];
        
        NSLog(@"Save error is %@", saveError);
        
    }else{
        
        [Answers logCustomEventWithName:@"Reservation Saved" customAttributes:nil];
        
        NSLog(@"Save reservation successful");
    }

}



@end
