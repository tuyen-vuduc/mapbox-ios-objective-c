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
    
    CLLocation* centerLocation = [[CLLocation alloc] initWithLatitude:32.6141
                                                            longitude:-114.34411];
    
    MBMCameraOptions* cameraOptions = [[MBMCameraOptions alloc] initWithCenter:centerLocation
                                                                       padding:nil
                                                                        anchor:nil
                                                                          zoom:@13.1
                                                                       bearing:@80
                                                                         pitch:@85];
    
    MapInitOptionsBuilder* builder = [MapInitOptionsBuilder create];
    
    MapInitOptions* options = [[[builder
                                    cameraOptions:cameraOptions]
                                   styleUriString:@"mapbox://styles/mapbox-map-design/ckhqrf2tz0dt119ny6azh975y"] build];
    
    MapView* mapView = [MapViewFactory createWithFrame:self.view.bounds
                                               options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    __weak TerrainExample *weakSelf = self;
    [mapView onStyleLoaded:^(id _Nonnull) {
        [weakSelf addTerrain];
        
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    }];
    
    self.mapView = mapView;
    [self.view addSubview:mapView];
}

- (void) addTerrain {
    NSString* sourceId = @"mapbox-dem";
    [self.mapView addRasterDemSource: sourceId
                           configure:^(RasterDemSourceBuilder * _Nonnull builder) {
                                [builder url:@"mapbox://mapbox.mapbox-terrain-dem-v1"];
                                [builder tileSize:514.0];
                                [builder maxzoom:14.0];
                            }
                             onError:nil];
    
    MBXTerrain* terrain = [[MBXTerrain alloc] initWithSourceId:sourceId];
    MBXValue* value = [[MBXValue alloc] initWithConstant:@1.5];
    terrain.exaggeration = value;
    
    [self.mapView setTerrain:terrain onError:nil];
    
    [self.mapView addSkyLayer:@"sky-layer"
                  configure:^(SkyLayerBuilder * _Nonnull builder) {
                        MBXValue* skyType = [MBXValue constant: [NSNumber numberWithInt:MBXSkyTypeAtmosphere]];
                        [builder skyType: skyType];
                        MBXValue* skyAtmosphereSun = [MBXValue constant: @[@0.0, @0.0]];
                        [builder skyAtmosphereSun: skyAtmosphereSun];
                        MBXValue* skyAtmosphereSunIntensity = [MBXValue constant: @15.0];
                        [builder skyAtmosphereSunIntensity: skyAtmosphereSunIntensity];
                    }
                      onError:nil];
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
