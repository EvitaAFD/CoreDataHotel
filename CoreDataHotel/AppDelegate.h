//
//  AppDelegate.h
//  CoreDataHotel
//
//  Created by Eve Denison on 4/24/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

