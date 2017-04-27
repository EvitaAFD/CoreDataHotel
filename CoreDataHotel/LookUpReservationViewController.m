//
//  LookUpReservationViewController.m
//  CoreDataHotel
//
//  Created by Eve Denison on 4/26/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

#import "LookUpReservationViewController.h"

#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"

#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"

#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

#import "AutoLayout.h"

#import "AppDelegate.h"

@interface LookUpReservationViewController () <UITableViewDataSource, UISearchBarDelegate>

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSArray *reservationDetails;
@property(strong, nonatomic) UISearchBar *searchBar;
@property(strong, nonatomic) NSArray *searchResult;

@end

@implementation LookUpReservationViewController

-(NSArray *)reservationDetails {
    if (!_reservationDetails) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
        
        NSError *reservationError;
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
        NSArray *reservationDetails = [context executeFetchRequest:request error:&reservationError];
        
        if (reservationError) {
            NSLog(@"There was a reservation fetch error.");
        }
        _reservationDetails = reservationDetails;
        
    }
    return _reservationDetails;
}

-(void)loadView {
    [super loadView];
    
    [self setupViewLayout];
    
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setupViewLayout {
    self.searchBar = [[UISearchBar alloc]init];
    self.tableView = [[UITableView alloc]init];
    
    self.searchBar.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.tableView];
    
    float navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    CGFloat statusBarHeight = 20.0;
    CGFloat topMargin = navBarHeight + statusBarHeight;
    CGFloat windowHeight = self.view.frame.size.height;
    CGFloat frameHeight = (windowHeight - topMargin - statusBarHeight);
    
    NSDictionary *viewDictionary = @{@"searchBar": self.searchBar,
                                     @"tableView": self.tableView};
    
    NSDictionary *metricsDictionary = @{@"topMargin": [NSNumber numberWithFloat:topMargin], @"frameHeight": [NSNumber numberWithFloat:frameHeight]};
    
    NSString *visualFormatString = @"V:|-topMargin-[searchBar(==topMargin)][tableView(==frameHeight)]|";
    
    [AutoLayout leadingConstraintFrom:self.searchBar toView:self.view];
    [AutoLayout trailingConstraintFrom:self.searchBar toView:self.view];
    [AutoLayout leadingConstraintFrom:self.tableView toView:self.view];
    [AutoLayout trailingConstraintFrom:self.tableView toView:self.view];
    
    [AutoLayout constraintsWithVFLForViewDictionary:viewDictionary forMetricsDictionary:metricsDictionary withOptions:0 withVisualFormat:visualFormatString];
    
    [self.searchBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.reservationDetails.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    Reservation *reservations = self.reservationDetails[indexPath.row];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    
    NSString *formattedStartDateString = [dateFormatter stringFromDate:reservations.startDate];
    
    NSString *formattedEndDateString = [dateFormatter stringFromDate:reservations.endDate];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@: %@ in Room: %i, From: %@ to %@", reservations.guest.firstName, reservations.guest.lastName, reservations.room.hotel.name, reservations.room.number, formattedStartDateString, formattedEndDateString];
    cell.textLabel.numberOfLines = 0;
    
    return cell;
}



@end
