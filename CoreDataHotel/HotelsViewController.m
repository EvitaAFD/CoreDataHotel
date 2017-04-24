//
//  HotelsViewController.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/24/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import "HotelsViewController.h"
#import "AppDelegate.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"

@interface HotelsViewController () <UITableViewDataSource>

@property (strong, nonatomic) NSArray *allHotels;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation HotelsViewController

-(void)loadView{
    [super loadView];
    //add tableview as subview and apply constraints
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:@"cell"];
    
}

-(NSArray *)allHotels {
    if (!_allHotels) {
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotels"];
        
        
        NSError *fetchError;
        NSArray *hotels = [context executeFetchRequest:request error:&fetchError];
        
        if (fetchError) {
            NSLog(@"There was an error fatching hotels from Core Data!");
        }
        
        _allHotels = hotels;
    }
    
    return _allHotels;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allHotels.count;
}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

@end
