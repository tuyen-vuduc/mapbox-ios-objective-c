//
//  CircleAnnotationExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "CircleAnnotationExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"

@interface CircleAnnotationExample () <TMBAnnotationInteractionDelegate>

@end

@implementation CircleAnnotationExample{
    MapView* mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CLLocationCoordinate2D centerLocation = CLLocationCoordinate2DMake(0, 0);
    
    TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerLocation
                                                                       padding:UIEdgeInsetsZero
                                                                        anchor:CGPointMake(0, 0)
                                                                          zoom:2
                                                                       bearing:0
                                                                         pitch:0];
    
    MapInitOptions* options = [MapInitOptionsFactory createWithMapOptions:nil 
                                                            cameraOptions:cameraOptions
                                                                 styleURI:nil
                                                                styleJSON:nil
                                                  antialiasingSampleCount:1];
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:mapView];
    
    // Create the CircleAnnotationManager
    // Annotation managers are kept alive by `AnnotationOrchestrator`
    // (`mapView.annotations`) until you explicitly destroy them
    // by calling `mapView.annotations.removeAnnotationManager(withId:)`
    TMBCircleAnnotationManager* circleAnnotationManager = [[mapView annotations] makeCircleAnnotationManagerWithId:nil
                                                                                   layerPosition:nil];

    NSMutableArray* annotations = [[NSMutableArray alloc] initWithCapacity:2000];
    for (int i=0; i< 2000; i++) {
        TMBCircleAnnotation* annotation = [[TMBCircleAnnotation alloc] initWithId: [[NSNumber numberWithInt:i+1] stringValue] centerCoordinate:[self randomCoordinate] isSelected:false isDraggable:true];
        annotation.circleColor = [self randomColor];
        annotation.circleStrokeColor = UIColor.blackColor;
        annotation.circleRadius = @12;
        annotation.isDraggable = true;
        annotation.circleStrokeWidth = 0;
        
        
        [annotations addObject:annotation];
    }

    circleAnnotationManager.annotations = annotations;
    // The following line is just for testing purposes.
    if ([self respondsToSelector:@selector(finish)]) {
        [self finish];
    }
}

- (CLLocationCoordinate2D) randomCoordinate {
    double lat = arc4random() % 181 - 90.0;
    double lng = arc4random() % 361 - 180.0;
    return CLLocationCoordinate2DMake(
                                      lat,
                                      lng
                                  );
}

- (UIColor *) randomColor {
    return  [[UIColor alloc] initWithRed: arc4random_uniform(256)/255.0
                                   green: arc4random_uniform(256)/255.0
                                    blue: arc4random_uniform(256)/255.0
                                   alpha: 1];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)annotationManager:(id<TMBAnnotationManager> _Nonnull)manager
didDetectTappedAnnotations:(NSArray<id<TMBAnnotation>> * _Nonnull)annotations {
    NSLog(@"AnnotationManager did detect tapped annotations: %@", annotations);
}

@end
