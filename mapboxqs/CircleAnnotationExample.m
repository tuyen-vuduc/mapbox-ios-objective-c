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
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:nil];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:mapView];
    
    // Create the CircleAnnotationManager
    // Annotation managers are kept alive by `AnnotationOrchestrator`
    // (`mapView.annotations`) until you explicitly destroy them
    // by calling `mapView.annotations.removeAnnotationManager(withId:)`
    TMBCircleAnnotationManager* circleAnnotationManager = [mapView circleAnnotationManagerWithId:nil
                                                                                   layerPosition:TMBLayerPositionUnowned
                                                                              layerPositionParam:nil];
    circleAnnotationManager.delegate = self;

    NSMutableArray* annotations = [[NSMutableArray alloc] initWithCapacity:2000];
    for (int i=0; i< 2000; i++) {
        TMBCircleAnnotation* annotation = [TMBCircleAnnotation fromCenter:[self randomCoordinate]];
        annotation.circleColor = [self randomColor];
        annotation.circleRadius = @12;
        annotation.isDraggable = true;
        
        [annotations addObject:annotation];
    }

    circleAnnotationManager.annotations = annotations;
    // The following line is just for testing purposes.
    if ([self respondsToSelector:@selector(finish)]) {
        [self finish];
    }
}

- (CLLocationCoordinate2D) randomCoordinate {
    return CLLocationCoordinate2DMake(
                                      arc4random_uniform(180) - 90,
                                      arc4random_uniform(360) - 180
                                  );
}

- (UIColor *) randomColor {
    return  [[UIColor alloc] initWithRed: arc4random_uniform(255)/255.0
                                   green: arc4random_uniform(255)/255.0
                                    blue: arc4random_uniform(255)/255.0
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
