//
//  AnimateGeoJSONLineExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "AnimateGeoJSONLineExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import <MapboxCommon/MapboxCommon.h>
#import "MapboxMaps-Swift.h"
#import <MapKit/MapKit.h>

@interface AnimateGeoJSONLineExample ()

@property int currentIndex;
@property TMBGeoJSONSource* routeLineSource;
@property MapView* mapView;
@property NSString* sourceIdentifier;
@property NSArray* allCoordinates;

@end

@implementation AnimateGeoJSONLineExample {
    TMBCancelable* cancelables;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sourceIdentifier = @"route-source-identifier";
    self.allCoordinates = @[
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.52214, -122.63748)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.52218, -122.64855)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.52219, -122.6545)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.52196, -122.65497)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.52104, -122.65631)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51935, -122.6578)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51848, -122.65867)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51293, -122.65872)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51295, -122.66576)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51252, -122.66745)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51244, -122.66813)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51385, -122.67359)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51406, -122.67415)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51484, -122.67481)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51532, -122.676)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.51668, -122.68106)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50934, -122.68503)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50858, -122.68546)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50783, -122.6852)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50714, -122.68424)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50585, -122.68433)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50521, -122.68429)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50445, -122.68456)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50371, -122.68538)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50311, -122.68653)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50292, -122.68731)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50253, -122.68742)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50239, -122.6867)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.5026, -122.68545)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50294, -122.68407)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50271, -122.68357)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.50055, -122.68236)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49994, -122.68233)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49955, -122.68267)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49919, -122.68257)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49842, -122.68376)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49821, -122.68428)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49798, -122.68573)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49805, -122.68923)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49857, -122.68926)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49911, -122.68814)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49921, -122.68865)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49905, -122.6897)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49917, -122.69346)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49902, -122.69404)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49796, -122.69438)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49697, -122.69504)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49661, -122.69624)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.4955, -122.69781)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49517, -122.69803)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49508, -122.69711)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.4948, -122.69688)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49368, -122.69744)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49311, -122.69702)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49294, -122.69665)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49212, -122.69788)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49264, -122.69771)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49332, -122.69835)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49334, -122.7007)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49358, -122.70167)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49401, -122.70215)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49439, -122.70229)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49566, -122.70185)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49635, -122.70215)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49674, -122.70346)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49758, -122.70517)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49736, -122.70614)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49736, -122.70663)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49767, -122.70807)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49798, -122.70807)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49798, -122.70717)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.4984, -122.70713)],
        [NSValue valueWithMKCoordinate: CLLocationCoordinate2DMake(45.49893, -122.70774)]
    ];
    
    CLLocationCoordinate2D centerLocation = CLLocationCoordinate2DMake(45.5076, -122.6736);
    
    TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerLocation padding:UIEdgeInsetsMake(0, 0, 0, 0) anchor:CGPointMake(0, 0) zoom:11 bearing:0 pitch:0];
    
    MapInitOptions* options = [MapInitOptionsFactory
                               createWithMapOptions:nil
                               cameraOptions:cameraOptions
                               styleURI:nil
                               styleJSON:nil
                               antialiasingSampleCount:1];
    
    self.mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:options];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    

    // Wait for the map to load its style before adding data.
    cancelables = [self.mapView.mapboxMap onMapLoaded:^(id _Nonnull _) {
        [self addLine];
        [self animatePolyline];

        // The below line is used for internal testing purposes only.
        if ([self respondsToSelector:@selector(finish)]) {
            [self finish];
        }
    }];
    
    [self.view addSubview:self.mapView];
}

- (void) addLine {

    // Create a GeoJSON data source.
    self.routeLineSource = [[TMBGeoJSONSource alloc] initWithId: self.sourceIdentifier];
    MBXGeometry* geometry = [[MBXGeometry alloc] initWithLine:@[self.allCoordinates[self.currentIndex]]];
    MBXFeature* feature = [[MBXFeature alloc] initWithIdentifier:[NSObject new] geometry:geometry properties:@{}];
    self.routeLineSource.data = [TMBGeoJSONSourceData feature:feature];
        
    // Create a line layer
    TMBLineLayer* lineLayer = [[TMBLineLayer alloc] initWithId:@"line-layer" source: self.sourceIdentifier];
    lineLayer.lineColor = [TMBValue constant:UIColor.redColor];

    float lowZoomWidth = 5;
    float highZoomWidth = 20;

    // Use an expression to define the line width at different zoom extents
    TMBExpression* expression = [TMBExpression interpolate:@[
        [TMBExpression linear],
        [TMBExpression zoom],
        @14,
        [NSNumber numberWithFloat:lowZoomWidth],
        @18,
        [NSNumber numberWithFloat:highZoomWidth]
    ]];
    lineLayer.lineWidth = [TMBValue expression:expression];
    lineLayer.lineCap = [TMBValue lineCap:[TMBLineCap round]];
    lineLayer.lineJoin = [TMBValue lineJoin:[TMBLineJoin round]];

    // Add the lineLayer to the map.
    [self.mapView.mapboxMap addSource:self.routeLineSource dataId:nil completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"addSource ERR: %@", error.debugDescription);
        }
    }];
    [self.mapView.mapboxMap addLayer:lineLayer layerPosition:nil completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"addLayer ERR: %@", error.debugDescription);
        }
    }];
}

- (void) animatePolyline {

    // Start a timer that will add a new coordinate to the line and redraw it every time it repeats.
    __weak AnimateGeoJSONLineExample *weakSelf = self;
    [NSTimer scheduledTimerWithTimeInterval:0.10 repeats:true block:^(NSTimer * _Nonnull timer) {
        if (!weakSelf) {
            [timer invalidate];
            return;
        }
            
        if (weakSelf.currentIndex >= weakSelf.allCoordinates.count) {
            [timer invalidate];
            return;
        }
        
        weakSelf.currentIndex++;
        
        NSArray* currentCoordinates = [weakSelf.allCoordinates subarrayWithRange:NSMakeRange(0, weakSelf.currentIndex)];
        
        MBXGeometry* geometry = [[MBXGeometry alloc] initWithLine:currentCoordinates];
        MBXFeature* feature = [[MBXFeature alloc] initWithIdentifier:[NSObject new] geometry:geometry properties:@{}];
        
        weakSelf.routeLineSource.data = [TMBGeoJSONSourceData feature:feature];
        [weakSelf.mapView.mapboxMap updateGeoJSONSourceWithId:weakSelf.sourceIdentifier data:[TMBGeoJSONSourceData feature:feature] dataId:nil];
    }];
}

@end
