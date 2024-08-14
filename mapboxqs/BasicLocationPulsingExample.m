//
//  BasicLocationPulsingExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "BasicLocationPulsingExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxCommon/MapboxCommon.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"
#import <MapKit/MapKit.h>

@interface BasicLocationPulsingExample ()

@end

@implementation BasicLocationPulsingExample {
    MapView* mapView;
    NSMutableSet<TMBCancelable*>* cancelables;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    cancelables = [NSMutableSet new];
    
    MapInitOptions *options = [MapInitOptionsFactory
                                   createWithMapOptions:nil
                                   cameraOptions:nil
                                   styleURI:BuiltInStyles.streets
                                   styleJSON:nil
                               antialiasingSampleCount:1];
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:options];
//    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    mapView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview:mapView];
    
    [NSLayoutConstraint activateConstraints: @[
        [mapView.topAnchor constraintEqualToAnchor: self.view.topAnchor],
        [mapView.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor],
        [mapView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor],
        [mapView.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor]
    ]];
    
    TMBPuck2DConfiguration* puckConfiguration = [TMBPuck2DConfiguration makeDefaultWithShowBearing:false];
    puckConfiguration.pulsing = [TMBPuck2DConfigurationPulsing default];
    
    TMBLocationManager* location = [mapView location];
    TMBLocationOptions* loptions = location.options;
    loptions.puckType = puckConfiguration;
    location.options = loptions;
    
    TMBCancelable* cancelable = [location onLocationChangeWithHandler:^(NSArray<MBXLocation *> * _Nonnull newLocation) {
        if (newLocation.count <= 0) return;
        
        MBXLocation* center = newLocation[newLocation.count -1];
        CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(center.latitude, center.longitude);
        
        TMBMapboxMap* map = [self->mapView mapboxMap];
        TMBCameraOptions* options = [[TMBCameraOptions alloc] initWithCenter: coords
                                                                     padding:UIEdgeInsetsZero
                                                                      anchor:CGPointZero
                                                                        zoom:18
                                                                     bearing:0
                                                                       pitch:0];
        [map setCameraTo:options];
    }];
    [cancelables addObject:cancelable];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    if ([self respondsToSelector:@selector(finish)]){
        [self finish];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
