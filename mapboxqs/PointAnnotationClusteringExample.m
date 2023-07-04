//
//  PointAnnotationClusteringExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "PointAnnotationClusteringExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"

@interface PointAnnotationClusteringExample ()

@end

@implementation PointAnnotationClusteringExample {
    MapView* mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Center the map over Washington, D.C.
    CLLocation* centerLocation = [[CLLocation alloc] initWithLatitude: 38.889215
                                                            longitude: -77.039354];
    
    MBMCameraOptions* cameraOptions = [[MBMCameraOptions alloc] initWithCenter:centerLocation
                                                                       padding:nil
                                                                        anchor:nil
                                                                          zoom:@11
                                                                       bearing:nil
                                                                         pitch:nil];
    MapInitOptions* options = [MapInitOptionsFactory
                               createWithResourceOptions:nil
                               mapOptions:nil
                               cameraOptions:cameraOptions
                               styleURI:BuiltInStyles.light
                               styleJSON:nil];
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:mapView];
        
    __weak PointAnnotationClusteringExample *weakSelf = self;
    
//    // Add an additional target to the single tap gesture recognizer for when users click on a cluster
//    mapView.gestures.singleTapGestureRecognizer.addTarget(self, action: #selector(handleTap(gestureRecognizer:)))

    // Add the source and style layers once the map has loaded.
    [[mapView mapboxMap] onMapLoaded:^(id _Nonnull _) {
        [weakSelf addPointAnnotations];
    }];
}

- (void) addPointAnnotations {
    // The image named `fire-station-11` is included in the app's Assets.xcassets bundle.
    UIImage *image = [UIImage imageNamed: @"fire-station-11"];
    
    // Fire_Hydrants.geojson contains information about fire hydrants in Washington, D.C.
    // It was downloaded on 6/10/21 from https://opendata.dc.gov/datasets/DCGIS::fire-hydrants/about
    // Decode the GeoJSON into a feature collection on a background thread
    [NSBundle.mainBundle URLForResource:@"Fire_Hydrants" withExtension: @"geojson"];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
    });
    
//    DispatchQueue.global(qos: .userInitiated).async {
//        guard let featureCollection = try? self.decodeGeoJSON(from: "Fire_Hydrants") else {
//            return
//        }
//
//        // Create an array of annotations for each fire hydrant
//        var annotations = [PointAnnotation]()
//        for feature in featureCollection.features {
//            guard let geometry = feature.geometry, case let Geometry.point(point) = geometry else {
//                return
//            }
//            var pointAnnotation = PointAnnotation(coordinate: point.coordinates)
//            pointAnnotation.image = .init(image: image, name: "fire-station-11")
//            annotations.append(pointAnnotation)
//        }
//        DispatchQueue.main.async {
//            self.createClusters(annotations: annotations)
//        }
//    }
}

// Load GeoJSON file from local bundle and decode into a `FeatureCollection`.
- (void) decodeGeoJSONWithFileName: (NSString* ) fileName {
    NSString* path = [NSBundle.mainBundle pathForResource:fileName ofType:@"geojson"];
    
    if (!path) {
        NSLog(@"%@ not found", fileName);
        return;
    }
    
    NSURL* filePath = [NSURL fileURLWithPath:path];
//    var featureCollection: FeatureCollection?
//    do {
//        let data = try Data(contentsOf: filePath)
//        featureCollection = try JSONDecoder().decode(FeatureCollection.self, from: data)
//    } catch {
//        print("Error parsing data: \(error)")
//    }
//    return featureCollection
}

@end
