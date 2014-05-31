//
//  MapViewViewController.m
//  Divvy
//
//  Created by Ryan Tiltz on 5/30/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import "MapViewViewController.h"

@interface MapViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;


@end

@implementation MapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = [self.ride objectForKey:@"stationName"];
    self.bikeAnnotation = [[MKPointAnnotation alloc] init];
    CGFloat longitude = [[self.ride objectForKey:@"longitude"] floatValue];
    CGFloat latitude = [[self.ride objectForKey:@"latitude"] floatValue];
    self.bikeAnnotation.coordinate = CLLocationCoordinate2DMake(latitude,longitude);
    [self.myMapView addAnnotation:self.bikeAnnotation];
    [self.myMapView showAnnotations:self.myMapView.annotations animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    pin.canShowCallout = YES;
    return pin;
}

@end