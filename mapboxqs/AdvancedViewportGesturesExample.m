//
//  AdvancedViewportGesturesExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "AdvancedViewportGesturesExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxCommon/MapboxCommon.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"
#import <MapKit/MapKit.h>

typedef enum {
    StateFollowing,
    StateOverview
} State;

@interface AdvancedViewportGesturesExample()
@property (nonatomic) State state;
@end

@implementation AdvancedViewportGesturesExample {
    MapView* mapView;
    TMBFollowPuckViewportState *followPuckViewportState;
    TMBOverviewViewportState *overviewViewportState;
}

- (void)setState:(State)state {
    if (_state != state) {
        _state = state;
        
        [self syncWithState];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:nil];
//    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:mapView];
    
    CLLocationCoordinate2D cupertino = CLLocationCoordinate2DMake(37.3230, -122.0322);
    
    [[mapView mapboxMap] setCameraTo:[[TMBCameraOptions alloc] initWithCenter:cupertino
                                                                      padding:UIEdgeInsetsZero
                                                                       anchor:CGPointZero
                                                                         zoom:14
                                                                      bearing:0
                                                                        pitch:0]];
    TMBLocationManager *locationManager = [mapView location];
    TMBLocationOptions *locationOptions = locationManager.options;
    locationOptions.puckType = [TMBPuck2DConfiguration makeDefaultWithShowBearing:true];
    locationOptions.puckBearing = TMBPuckBearingCourse;
    locationOptions.puckBearingEnabled = true;
    
    locationManager.options = locationOptions;

    TMBViewportManager *viewportManager = [mapView viewport];
    
    followPuckViewportState = [viewportManager makeFollowPuckViewportStateWithOptions:[[TMBFollowPuckViewportStateOptions alloc] initWithPadding:nil
                                                                                                                                            zoom:nil
                                                                                                                                         bearing:[TMBFollowPuckViewportStateBearing course]
                                                                                                                                           pitch:nil]];
    
    int vertices = 100;
    int radius = 20000;
    NSMutableArray<NSValue*> *coordinates = [[NSMutableArray alloc] initWithCapacity:vertices];
    
    for (int i=0; i<vertices; i++) {
        float bearing = fabs(i * -360.0/vertices);
        CLLocationCoordinate2D coord = [TMBLocationManager coordinateFrom:cupertino
                                                                       at:radius
                                                                   facing:bearing];
        [coordinates addObject: [NSValue valueWithMKCoordinate:coord]];
    }
    
    MBXGeometry *polygon = [GeometryHelper createPolygonWithCenter:cupertino radius:20000 vertices:100];
    TMBOverviewViewportStateOptions *overviewViewportStateOptions =
        [[TMBOverviewViewportStateOptions alloc] initWithGeometry:polygon
                                                  geometryPadding:UIEdgeInsetsZero
                                                          bearing:nil
                                                            pitch:nil
                                                          padding:nil
                                                          maxZoom:nil
                                                           offset:nil
                                                animationDuration:0];
    overviewViewportState = [viewportManager makeOverviewViewportStateWithOptions:overviewViewportStateOptions] ;
    
    

    [mapView gestures].delegate = self;
    
    [self syncWithState];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([self respondsToSelector:@selector(finish)]){
        [self finish];
    }
    
    [[mapView viewport] addStatusObserver:self];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[mapView viewport] removeStatusObserver:self];
}


- (void) toggleViewportState {
    switch (self.state) {
    case StateOverview:
        self.state = StateFollowing;
        break;
    case StateFollowing:
        self.state = StateOverview;
    }
}

- (void) syncWithState {
    switch (self.state) {
    case StateFollowing:
        [[mapView viewport] transitionTo:followPuckViewportState
                              transition:nil
                              completion:nil];
        
        break;
    case StateOverview:
        [[mapView viewport] transitionTo:overviewViewportState
                              transition:nil
                              completion:nil];
        break;
    }
    
    TMBViewportOptions *viewportOptions = [mapView viewport].options;
    viewportOptions.transitionsToIdleUponUserInteraction = self.state == StateOverview;
    [mapView viewport].options = viewportOptions;
    
    TMBGestureManager *gestureManager = [mapView gestures];
    
    TMBGestureOptions *gestureOptions = gestureManager.gestureOptions;
    gestureOptions.panEnabled = self.state == StateOverview;
    gestureOptions.pinchEnabled = self.state == StateOverview;
    
    gestureManager.gestureOptions = gestureOptions;
}

/*
#pragma mark - TMBGestureManagerDelegate
*/

- (void)gestureManagerWithDidBegin:(enum TMBGestureType)gestureType { 
    switch (gestureType) {
        case TMBGestureTypePitch:
            followPuckViewportState.options.pitch = nil;
            break;
        case TMBGestureTypeDoubleTapToZoomIn:
        case TMBGestureTypeDoubleTouchToZoomOut:
        case TMBGestureTypeQuickZoom:
            followPuckViewportState.options.zoom = nil;
            break;
        default:
            break;
    }
}

- (void)gestureManagerWithDidEnd:(enum TMBGestureType)gestureType willAnimate:(BOOL)willAnimate { 
    switch (gestureType) {
        case TMBGestureTypePitch:
            if (self.state == StateFollowing) {
                float pitch = [mapView mapboxMap].cameraState.pitch;
                followPuckViewportState.options.pitch = [NSNumber numberWithFloat:pitch];
            }
            break;
        case TMBGestureTypeQuickZoom:
            if (self.state == StateFollowing) {
                float zoom = [mapView mapboxMap].cameraState.zoom;
                followPuckViewportState.options.zoom = [NSNumber numberWithFloat:zoom];
            }
            break;
        case TMBGestureTypeSingleTap:
            [self toggleViewportState];
            break;
        default:
            break;
    }
}

- (void)gestureManagerWithDidEndAnimatingFor:(enum TMBGestureType)gestureType { 
    switch (gestureType) {
        case TMBGestureTypeDoubleTapToZoomIn:
        case TMBGestureTypeDoubleTouchToZoomOut:
            if (self.state == StateFollowing) {
                float zoom = [mapView mapboxMap].cameraState.zoom;
                followPuckViewportState.options.zoom = [NSNumber numberWithFloat:zoom];
            }
        default:
            break;
    }
}

/*
#pragma mark - TMBViewportStatusObserver
*/
- (void)viewportStatusDidChangeFrom:(TMBViewportStatus * _Nonnull)fromStatus to:(TMBViewportStatus * _Nonnull)toStatus reason:(TMBViewportStatusChangeReason * _Nonnull)reason {
    NSLog(@"Viewport.status changed\n    from: %@\n    to: %@\n    with reason: %@", fromStatus, toStatus, reason);
}

@end
