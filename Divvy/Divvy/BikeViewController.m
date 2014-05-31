//
//  BikeViewController.m
//  Divvy
//
//  Created by Ryan Tiltz on 5/30/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//
#import "BikeViewController.h"
#import "DetailedBikeViewController.h"



@interface BikeViewController ()

{
    //    __weak IBOutlet UINavigationBar *navBarTitle;
   // __weak IBOutlet UILabel *availableBikesLabel;
    //__weak IBOutlet UILabel *availableLabel;
    //__weak IBOutlet UIButton *mapButton;

       NSString *urlForWebView;

}
@end

@implementation BikeViewController
@synthesize divvy;


- (void)viewDidLoad
{
    [super viewDidLoad];

    
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebsiteViewController *wvc = segue.destinationViewController;
    wvc.urlString = urlForWebView;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

