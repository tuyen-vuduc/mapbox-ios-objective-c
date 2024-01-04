//
//  SkyLayerExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "SkyLayerExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"

@interface SkyLayerExample ()

@end

@interface UIColor(SkyLayerExample)

+ (UIColor *) lightPink;
+ (UIColor *) skyBlue;

@end

@implementation SkyLayerExample {
    MapView* mapView;
    NSString* skyLayerId;
    UISegmentedControl* segmentedControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    skyLayerId = @"sky-layer";
    
    CLLocationCoordinate2D centerLocation = CLLocationCoordinate2DMake(35.67283, 127.60597);
    
    TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerLocation padding:UIEdgeInsetsMake(0, 0, 0, 0) anchor:CGPointMake(0, 0) zoom:12.5 bearing:0 pitch:83];
    
    MapInitOptions* options = [MapInitOptionsFactory createWithMapOptions:nil cameraOptions:cameraOptions styleURI:@"mapbox://styles/mapbox-map-design/ckhqrf2tz0dt119ny6azh975y" styleJSON:nil antialiasingSampleCount:1];
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:mapView];
    
    // Add a `UISegmentedControl` that toggles the sky layer type between `gradient` and `atmosphere`.
    [self addSegmentedControl];
     
     // Add a custom `SkyLayer` once the map's style is finished loading.
     __strong SkyLayerExample *weakSelf = self;
     [[mapView mapboxMap] onStyleLoaded:^(id _Nonnull _) {
         [self addSkyLayer];
         
         // Add a terrain layer.
         [self addTerrainLayer];
         
         if ([weakSelf respondsToSelector:@selector(finish)]) {
             [weakSelf finish];
         }
     }];
     
}

- (void) addSkyLayer {
    // Initialize a sky layer with a sky type of `gradient`, which applies a gradient effect to the sky.
    // Read more about sky layer types on the Mapbox blog: https://www.mapbox.com/blog/sky-api-atmospheric-scattering-algorithm-for-3d-maps
    [[mapView mapboxMap] addLayer:[self createSkyLayer] layerPosition:nil completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (TMBSkyLayer * ) createSkyLayer {
    TMBSkyLayer * builder = [[TMBSkyLayer alloc]  initWithId:skyLayerId];
    builder.skyType = [TMBValue skyType:TMBSkyType.gradient];
    
    // Define the position of the sun.
    // The azimuthal angle indicates the sun's position relative to 0 degrees north. When the map's bearing
    // is `0` and the azimuthal angle is `0`, the sun will appear horizontally centered.
    float azimuthalAngle = 0;

    // Indicates the sun's position relative to the horizon. A value of `90` places the sun's center at the
    // horizon line. Lower values place the sun below the horizon line, while higher values place the sun's
    // center further above the horizon line.
    float polarAngle = 90;
    builder.skyAtmosphereSun = [TMBValue constant:@[
            [NSNumber numberWithDouble:azimuthalAngle],
            [NSNumber numberWithDouble:polarAngle]
        ]
      ];

    // The intensity or brightness of the sun.
    builder.skyAtmosphereSunIntensity = [TMBValue doubleValue:10];

    // Set the sky's color to light blue with a light pink halo effect.
    builder.skyAtmosphereColor = [TMBValue constant:[UIColor skyBlue]];
    builder.skyAtmosphereHaloColor = [TMBValue constant:[UIColor lightPink]];
    
    return builder;
}

// Update the sky type when the `UISegmentedControl` value is changed.
- (void) updateSkyLayer: (UISegmentedControl *) sender {
    TMBValue* skyType;
    
    if (segmentedControl.selectedSegmentIndex == 0) {
        skyType = [TMBValue skyType:TMBSkyType.gradient];
    } else {
        skyType = [TMBValue skyType:TMBSkyType.atmosphere];
    }
    // TODO Check update method
//    [[mapView mapboxMap]
//     updateLayerWithId:skyLayerId
//     type:TMBLayerTypeSky
//     update:^id<TMBLayer> _Nonnull(id<TMBLayer> _Nonnull layer) {
//        TMBSkyLayer* skyLayer = (TMBSkyLayer*) layer;
//        skyLayer.skyType = skyType;
//        return skyLayer;
//    } completion:^(NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"%@", error);
//        }
//    }];
}

- (void) addTerrainLayer {
    NSString* sourceId = @"mapbox-dem";
    TMBRasterDemSource* rasterDemSource = [[TMBRasterDemSource alloc] initWithId:sourceId];
    rasterDemSource.url = @"mapbox://mapbox.mapbox-terrain-dem-v1";
    rasterDemSource.tileSize = @514;
    rasterDemSource.maxzoom = @14.0;
    
    // Add a `RasterDEMSource`. This will be used to create and add a terrain layer.
    [[mapView mapboxMap] addSource:rasterDemSource dataId:nil completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
    
    TMBTerrain* terrain = [[TMBTerrain alloc] initWithSourceId:sourceId];
    TMBValue* value = [[TMBValue alloc] initWithConstant:@1.5];
    terrain.exaggeration = value;
    [[mapView mapboxMap] setTerrain:terrain completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            
            NSLog(@"Failed to add a terrain layer to the map's style.");
        }
    }];
}

- (void) addSegmentedControl {
    segmentedControl = [[UISegmentedControl alloc] initWithItems:@[
        @"Gradient",
        @"Atmosphere"]
    ];
    segmentedControl.backgroundColor = [UIColor lightGrayColor];
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl addTarget:self
                         action:@selector(updateSkyLayer:)
               forControlEvents:UIControlEventValueChanged];
    [self.view insertSubview:segmentedControl aboveSubview:mapView];
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false;
    
    UILayoutGuide *safeArea = self.view.safeAreaLayoutGuide;
    
    [NSLayoutConstraint activateConstraints:@[
        [segmentedControl.bottomAnchor constraintEqualToAnchor:safeArea.bottomAnchor constant:-80],
        [segmentedControl.centerXAnchor constraintEqualToAnchor:safeArea.centerXAnchor]
    ]];
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

@implementation UIColor (SkyLayerExample)

+ (UIColor *)skyBlue {
    return [[UIColor alloc] initWithRed:0.53 green:0.81 blue:0.92 alpha:1.0];
}

+ (UIColor *)lightPink {
    return [[UIColor alloc] initWithRed:1.00 green: 0.82 blue: 0.88 alpha: 1.00];
}

@end
