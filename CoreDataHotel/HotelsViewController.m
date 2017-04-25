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
#import "AutoLayout.h"
#import "RoomsViewController.h"

@interface HotelsViewController () <UITableViewDataSource, UITableViewDelegate>

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
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:@"cell"];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [AutoLayout fullScreenConstraintsWithVFLForView:self.tableView];
}

-(NSArray *)allHotels {
    if (!_allHotels) {
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        
        
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    Hotel *hotel = self.allHotels[indexPath.row];
    
    cell.textLabel.text = hotel.name;
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RoomsViewController *roomView = [[RoomsViewController alloc]init];
    
    [self.navigationController pushViewController:roomView animated:YES];
    

}



@end
