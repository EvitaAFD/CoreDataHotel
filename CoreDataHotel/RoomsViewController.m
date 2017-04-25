//
//  RoomsViewController.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/24/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import "RoomsViewController.h"
#import "AutoLayout.h"
#import "AppDelegate.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface RoomsViewController () <UITableViewDataSource>

@property (strong, nonatomic) UITableView *roomsTableView;
@property (strong, nonatomic) NSArray *allRooms;

@end

@implementation RoomsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.roomsTableView.backgroundColor = [UIColor whiteColor];
    self.roomsTableView = [[UITableView alloc]init];
    
    self.roomsTableView.dataSource = self;
    
    [self.view addSubview:self.roomsTableView];
    
    [self.roomsTableView registerClass:[UITableViewCell class]forCellReuseIdentifier:@"roomCell"];
    
    self.roomsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [AutoLayout fullScreenConstraintsWithVFLForView:self.roomsTableView];
}


-(NSArray *)allRooms {
    if (!_allRooms) {
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
        
        
        NSError *fetchError;
        NSArray *rooms = [context executeFetchRequest:request error:&fetchError];
        
        if (fetchError) {
            NSLog(@"There was an error fatching rooms from Core Data!");
        }
        
        _allRooms = rooms;
    }
    
    return _allRooms;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allRooms.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *roomCell = [tableView dequeueReusableCellWithIdentifier:@"roomCell"];
    if (roomCell == nil) {
        roomCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"roomCell"];
    }
    
    Room *room = [self.allRooms objectAtIndex:indexPath.row];
    
    roomCell.textLabel.text = [NSString stringWithFormat:@"%hd",room.number];
    
    return roomCell;
    
    
}



@end
