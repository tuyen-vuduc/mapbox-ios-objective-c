//
//  TerrainExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "TerrainExample.h"

#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"
#import "ExampleProtocol.h"

@interface TerrainExample () <ExampleProtocol>

@property MapView* mapView;
- (void) addTerrain;

@end

@implementation TerrainExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationCoordinate2D centerLocation = CLLocationCoordinate2DMake(32.6141, -114.34411);
    
    TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerLocation padding:UIEdgeInsetsMake(0, 0, 0, 0) anchor:CGPointMake(0, 0) zoom:13.1 bearing:80 pitch:85];
    
    MapInitOptions* options = [MapInitOptionsFactory
                               createWithMapOptions:nil
                               cameraOptions:cameraOptions
                               styleURI:@"mapbox://styles/mapbox-map-design/ckhqrf2tz0dt119ny6azh975y"
                               styleJSON:nil
                               antialiasingSampleCount:1];
    
    MapView* mapView = [MapViewFactory createWithFrame:self.view.bounds
                                               options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    __weak TerrainExample *weakSelf = self;
    [[mapView mapboxMap] onStyleLoaded:^(id _Nonnull) {
        [weakSelf addTerrain];
        
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    }];
    
    self.mapView = mapView;
    [self.view addSubview:mapView];
}

- (TMBSkyLayer*) createSkyLayer {
    TMBSkyLayer* layer = [[TMBSkyLayer alloc] initWithId:@"sky-layer"];
    
    layer.skyType = [TMBValue skyType:TMBSkyType.atmosphere];
    layer.skyAtmosphereSun = [TMBValue constant: @[@0.0, @0.0]];
    layer.skyAtmosphereSunIntensity = [TMBValue constant: @15.0];
    
    return layer;
}

- (void) addTerrain {
    NSString* sourceId = @"mapbox-dem";
    // Use builder
    //    [self.mapView addRasterDemSource: sourceId
    //                           configure:^(RasterDemSourceBuilder * _Nonnull builder) {
    //                                [builder url:@"mapbox://mapbox.mapbox-terrain-dem-v1"];
    //                                [builder tileSize:514.0];
    //                                [builder maxzoom:14.0];
    //                            }
    //                             onError:nil];
    [[self.mapView mapboxMap] addSourceWithId:sourceId
     properties:@{
        @"type": @"raster-dem",
        @"url": @"mapbox://mapbox.mapbox-terrain-dem-v1",
        @"tileSize": @514.0,
        @"maxzoom": @14.0
    }
     completion:^(NSError * _Nonnull error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
    
    TMBTerrain* terrain = [[TMBTerrain alloc] initWithSourceId:sourceId];
    TMBValue* value = [[TMBValue alloc] initWithConstant:@1.5];
    terrain.exaggeration = value;
    
    [[self.mapView mapboxMap] setTerrain:terrain completion:^(NSError * _Nonnull error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
    
    [[self.mapView mapboxMap]
     addLayer:[self createSkyLayer]
     layerPosition:nil
     completion:^(NSError * _Nullable error) {
       if (error) {
           NSLog(@"%@", error);
       }
    }];
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
