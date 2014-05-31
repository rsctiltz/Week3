//
//  ViewController.m
//  Divvy
//
//  Created by Ryan Tiltz on 5/30/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import "ViewController.h"
#import "BikeViewController.h"
#import <MapKit/MapKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import "MapViewViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@property NSDictionary *ride;
@property NSArray *stationList;
@end

@implementation ViewController
- (IBAction)viewMapButton:(UIButton *)sender {
}

- (void)viewDidLoad
{

    [super viewDidLoad];


    NSURL *url = [NSURL URLWithString:@"http://www.divvybikes.com/stations/json/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {

         self.stationList = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError] [@"stationBeanList"];

         [self.myTableView reloadData];

     }];
}
#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.stationList.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBikeCellID"];

    NSDictionary *ride = [self.stationList objectAtIndex:indexPath.row];
    cell.textLabel.text = [ride objectForKey:@"stationName"];
    NSString *availableBikes = [ride objectForKey:@"availableBikes"];
    NSString *availableDocks = [ride objectForKey:@"availableDocks"];
    NSString *bikeInfo = [NSString stringWithFormat:@"Open Bikes: %@  Open Docks: %@",availableBikes,availableDocks];
    cell.detailTextLabel.text = bikeInfo;


    return cell;

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MapViewController *nextViewController = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = self.myTableView.indexPathForSelectedRow;
    NSDictionary *ride = [self.stationList objectAtIndex:selectedIndexPath.row];
    nextViewController.ride = ride;
}

@end
