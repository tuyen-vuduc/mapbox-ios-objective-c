//
//  ViewController.m
//  mapboxqs
//
//  Created by Tuyen Vu on 5/6/22.
//

#import "ViewController.h"
#import <MapboxCommon/MapboxCommon.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>

#import <MapboxMapObjC/MapboxMapObjC-Swift.h>

@interface ViewController ()

@property (strong, nonatomic) MapView* mapView;

@end

@implementation ViewController

- (void) locationManager:(LocationManager *)locationManager didChangeAccuracyAuthorization:(CLAccuracyAuthorization)accuracyAuthorization {
    if(accuracyAuthorization == CLAccuracyAuthorizationFullAccuracy) {
         // Perform an action in response to the new change in accuracy
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MBMResourceOptions* myResourceOptions = [[MBMResourceOptions alloc]
                                                initWithAccessToken: @"pk.eyJ1IjoidHV5ZW52IiwiYSI6ImNsMnpzNzh4NjBnNG0zZHBzYTFmYmxhOWUifQ.Az2oICdp9k0Hb5tu_M8b-g"
                                                baseURL:nil
                                                dataPath:nil
                                                assetPath:nil
                                                tileStore:nil];
    
    
    MapInitOptions* mapInitOptions = [MapInitOptionsFactory createWithResourceOptions:myResourceOptions mapOptions:nil cameraOptions:nil stylePath:nil];
    
    NSArray* data = [mapInitOptions options];
    
    self.mapView = [MapViewFactory createWithFrame:self.view.bounds options:mapInitOptions];
    
    self.mapView.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
                                     UIViewAutoresizingFlexibleHeight);
    
    [self.mapView setLocationDelegate:self];
    
    [self.mapView puck2D: ^(Puck2DConfigurationBuilder* builder) {
        [[builder setAccuracyRingColor:UIColor.redColor] setShowsAccuracyRing:true];
    }];
    
    [self.mapView puckBearingSource: MBXPuckBearingSourceCourse];
    
    [self.view addSubview:self.mapView];
}


@end
