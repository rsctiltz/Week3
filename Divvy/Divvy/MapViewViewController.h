//
//  MapViewViewController.h
//  Divvy
//
//  Created by Ryan Tiltz on 5/30/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController : ViewController
@property NSDictionary *ride;
@property MKPointAnnotation *bikeAnnotation;
@end