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
    
    CLLocation* centerLocation = [[CLLocation alloc] initWithLatitude: 35.67283
                                                            longitude: 127.60597];
    
    MBMCameraOptions* cameraOptions = [[MBMCameraOptions alloc] initWithCenter:centerLocation
                                                                       padding:nil
                                                                        anchor:nil
                                                                          zoom:@12.5
                                                                       bearing:nil
                                                                         pitch:@83];
    MapInitOptionsBuilder* builder = [MapInitOptionsBuilder create];
    
    MapInitOptions* options = [[[builder
                                 cameraOptions:cameraOptions]
                                styleUriString:@"mapbox://styles/mapbox-map-design/ckhqrf2tz0dt119ny6azh975y"]
                               build];
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:mapView];
    
    // Add a `UISegmentedControl` that toggles the sky layer type between `gradient` and `atmosphere`.
    [self addSegmentedControl];
     
     // Add a custom `SkyLayer` once the map's style is finished loading.
     __strong SkyLayerExample *weakSelf = self;
     [mapView onStyleLoaded:^(id _Nonnull _) {
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
    [mapView addLayerWithTarget:self
                       selector:@selector(createSkyLayerBuilder)
                  layerPosition:MBXLayerPositionUnowned
             layerPositionParam:nil
                        onError: ^(NSError* error) {
        NSLog(@"%@", error);
    }];
}

- (SkyLayerBuilder * ) createSkyLayerBuilder {
    SkyLayerBuilder * builder = [SkyLayerBuilder withId:skyLayerId];
    
    [builder skyType:[MBXValue intValue:MBXSkyTypeGradient]];
    
    
    // Define the position of the sun.
    // The azimuthal angle indicates the sun's position relative to 0 degrees north. When the map's bearing
    // is `0` and the azimuthal angle is `0`, the sun will appear horizontally centered.
    float azimuthalAngle = 0;

    // Indicates the sun's position relative to the horizon. A value of `90` places the sun's center at the
    // horizon line. Lower values place the sun below the horizon line, while higher values place the sun's
    // center further above the horizon line.
    float polarAngle = 90;
    [builder skyAtmosphereSun:[MBXValue constant:@[
            [NSNumber numberWithDouble:azimuthalAngle],
            [NSNumber numberWithDouble:polarAngle]
        ]
      ]
    ];

    // The intensity or brightness of the sun.
    [builder skyAtmosphereSunIntensity:[MBXValue doubleValue:10]];

    // Set the sky's color to light blue with a light pink halo effect.
    [builder skyAtmosphereColor:[MBXValue constant:[UIColor skyBlue]]];
    [builder skyAtmosphereHaloColor:[MBXValue constant:[UIColor lightPink]]];
    
    return builder;
}

// Update the sky type when the `UISegmentedControl` value is changed.
- (void) updateSkyLayer: (UISegmentedControl *) sender {
    MBXValue* skyType;
    
    if (segmentedControl.selectedSegmentIndex == 0) {
        skyType = [MBXValue intValue:MBXSkyTypeGradient];
    } else {
        skyType = [MBXValue intValue:MBXSkyTypeAtmosphere];
    }
    
    [mapView updateSkyLayer: skyLayerId
                  configure:^(SkyLayerBuilder * _Nonnull builder) {
        [builder skyType:skyType];
    } onError:^(NSError * _Nonnull _) {
        NSLog(@"Failed to update the sky type for layer with id %@.", self->skyLayerId);
    }];
}

- (void) addTerrainLayer {
    NSString* sourceId = @"mapbox-dem";
        // Add a `RasterDEMSource`. This will be used to create and add a terrain layer.
    [mapView addRasterDemSource:sourceId
                      configure:^(RasterDemSourceBuilder * _Nonnull builder) {
        [builder url:@"mapbox://mapbox.mapbox-terrain-dem-v1"];
        [builder tileSize:514];
        [builder maxzoom:14.0];
    }
                        onError:^(NSError * _Nonnull _) {
            NSLog(@"Failed to add a RasterDEMSource to the map's style.");
    }];
    
    MBXTerrain* terrain = [[MBXTerrain alloc] initWithSourceId:sourceId];
    MBXValue* value = [[MBXValue alloc] initWithConstant:@1.5];
    terrain.exaggeration = value;
    [mapView setTerrain:terrain onError:^(NSError * _Nonnull _) {
        NSLog(@"Failed to add a terrain layer to the map's style.");
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
