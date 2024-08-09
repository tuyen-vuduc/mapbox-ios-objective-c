//
//  PolygonAnnotationExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "PolygonAnnotationExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"
#import <MapKit/MapKit.h>

@interface PolygonAnnotationExample () <TMBAnnotationInteractionDelegate>

@end

@implementation PolygonAnnotationExample {
    MapView* mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CLLocationCoordinate2D centerLocation = CLLocationCoordinate2DMake(25.04579, -88.90136);
    
    TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerLocation padding:UIEdgeInsetsMake(0, 0, 0, 0) anchor:CGPointMake(0, 0) zoom:5 bearing:0 pitch:0];
    
    MapInitOptions* options = [MapInitOptionsFactory createWithMapOptions:nil cameraOptions:cameraOptions styleURI:nil styleJSON:nil antialiasingSampleCount:1];
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:mapView];
    
    
    __weak PolygonAnnotationExample *weakSelf = self;
    // Allows the delegate to receive information about map events.
    [[mapView mapboxMap] onMapLoaded:^(id _Nonnull _) {
        [self setupExample];
        
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    }];
}

// Wait for the map to load before adding an annotation.
- (void) setupExample {

    // Create the PolygonAnnotationManager
    // Annotation managers are kept alive by `AnnotationOrchestrator`
    // (`mapView.annotations`) until you explicitly destroy them
    // by calling `mapView.annotations.removeAnnotationManager(withId:)`
    TMBPolygonAnnotationManager* polygonAnnotationManager = [[mapView annotations] makePolygonAnnotationManagerWithId:nil
                                                                                      layerPosition:nil];
    // TODO Add event handler
//    // Set the delegate to receive callback if annotation is tapped or dragged
//    polygonAnnotationManager.delegate = self;

    // Create the polygon annotation
    TMBPolygonAnnotation* polygonAnnotation = [[TMBPolygonAnnotation alloc] initWithId:@"xxx-sample" polygon:[self makePolygon] isSelected:false isDraggable:false];

    // Style the polygon annotation
    polygonAnnotation.fillColor = [UIColor redColor];
    polygonAnnotation.fillOpacity = @0.8;

    // Add the polygon annotation to the manager
    polygonAnnotationManager.annotations = @[
        polygonAnnotation
    ];
}

- (TMBPolygon*) makePolygon {
    // Describe the polygon's geometry
    CLLocationCoordinate2D coord1 = CLLocationCoordinate2DMake(24.51713945052515, -89.857177734375);
    CLLocationCoordinate2D coord2 = CLLocationCoordinate2DMake(24.51713945052515, -87.967529296875);
    CLLocationCoordinate2D coord3 = CLLocationCoordinate2DMake(26.244156283890756, -87.967529296875);
    CLLocationCoordinate2D coord4 = CLLocationCoordinate2DMake(26.244156283890756, -89.857177734375);
    CLLocationCoordinate2D coord5 = CLLocationCoordinate2DMake(24.51713945052515, -89.857177734375);
    
    NSArray* outerRingCoords = @[
        [NSValue valueWithMKCoordinate: coord1],
        [NSValue valueWithMKCoordinate: coord2],
        [NSValue valueWithMKCoordinate: coord3],
        [NSValue valueWithMKCoordinate: coord4],
        [NSValue valueWithMKCoordinate: coord5]
    ];
    
    CLLocationCoordinate2D icoord1 = CLLocationCoordinate2DMake(25.085598897064752, -89.20898437499999);
    CLLocationCoordinate2D icoord2 = CLLocationCoordinate2DMake(25.085598897064752, -88.61572265625);
    CLLocationCoordinate2D icoord3 = CLLocationCoordinate2DMake(25.720735134412106, -88.61572265625);
    CLLocationCoordinate2D icoord4 = CLLocationCoordinate2DMake(25.720735134412106, -89.20898437499999);
    CLLocationCoordinate2D icoord5 = CLLocationCoordinate2DMake(25.085598897064752, -89.20898437499999);

    // This polygon has an intererior polygon which represents a hole in the shape.
    NSArray* innerRingCoords = @[
        [NSValue valueWithMKCoordinate: icoord1],
        [NSValue valueWithMKCoordinate: icoord2],
        [NSValue valueWithMKCoordinate: icoord3],
        [NSValue valueWithMKCoordinate: icoord4],
        [NSValue valueWithMKCoordinate: icoord5]
    ];
    
    TMBPolygonRing* outerRing = [[TMBPolygonRing alloc] initWithCoordinates:outerRingCoords];
    TMBPolygonRing* innerRing = [[TMBPolygonRing alloc] initWithCoordinates:innerRingCoords];
    
    return [[TMBPolygon alloc] initWithOuterRing:outerRing innerRings:@[innerRing]];
}

- (void)annotationManager:(id<TMBAnnotationManager> _Nonnull)manager didDetectTappedAnnotations:(NSArray<id<TMBAnnotation>> * _Nonnull)annotations {
    NSLog(@"AnnotationManager did detect tapped annotations: %@", annotations);
}
@end


