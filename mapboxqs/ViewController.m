//
//  ViewController.m
//  mapboxqs
//
//  Created by Tuyen Vu on 5/6/22.
//

#import "ViewController.h"
#import "MapboxMaps-Swift.h"
#import <MapboxCommon/MapboxCommon.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>

#import <MapboxMapObjC/MapboxMapObjC-Swift.h>

@interface ViewController ()

@property (strong, nonatomic) MapView* mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MBMResourceOptions* myResourceOptions = [[MBMResourceOptions alloc]
                                                initWithAccessToken: @"your_public_access_token"
                                                baseURL:nil
                                                dataPath:nil
                                                assetPath:nil
                                                tileStore:nil];
    
    
    MapInitOptions* mapInitOptions = [[MapInitOptions alloc] initWithResourceOptions:myResourceOptions mapOptions:nil cameraOptions:nil styleURI:nil];
    
    self.mapView = [[MapView alloc] initWithFrame:self.view.bounds options:mapInitOptions];
    
    self.mapView.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
                                     UIViewAutoresizingFlexibleHeight);
    
    [self.view addSubview:self.mapView];
}


@end
