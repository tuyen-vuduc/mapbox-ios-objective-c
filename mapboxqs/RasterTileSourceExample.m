//
//  RasterTileSourceExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "RasterTileSourceExample.h"
#import "MapboxMaps/MapboxMaps-Swift.h"
#import "MapboxMapObjC/MapboxMapObjC-Swift.h"

NSString* sourceId = @"raster-source";

@interface RasterTileSourceExample ()

@property MapView* mapView;

@end

@implementation RasterTileSourceExample {
    TMBCancelable* cancelables;
    bool isTileRequestDelayEnabled;
    UIButton* button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Initialize a `MapView` that is centered over the southeastern United States.
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(40, -74.5);
    TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerCoordinate padding:UIEdgeInsetsZero anchor:CGPointZero zoom:2 bearing:0 pitch:0];
    MapInitOptions* mapInitOptions = [MapInitOptionsFactory createWithMapOptions:nil cameraOptions:cameraOptions styleURI:[BuiltInStyles satellite] styleJSON:nil antialiasingSampleCount:1];

    self.mapView = [MapViewFactory createWithFrame:self.view.bounds options:mapInitOptions];
    
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    // Wait for the map to load its style before adding data.
    cancelables = [self.mapView.mapboxMap onMapLoaded:^(id _Nonnull _) {
        [self addRasterSource];

        // The below line is used for internal testing purposes only.
        if ([self respondsToSelector:@selector(finish)]) {
            [self finish];
        }
    }];
    
    [self.view addSubview:self.mapView];
    
    
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Enable tile request delay" forState: UIControlStateNormal];
    button.backgroundColor = UIColor.whiteColor;
    button.contentEdgeInsets = UIEdgeInsetsMake(8, 16, 8, 16);
    button.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview:button];
    
    [NSLayoutConstraint activateConstraints:@[
        [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [button.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];
    
    [button addTarget:self action:@selector(toggleTileRequestDelay) forControlEvents:UIControlEventTouchUpInside];
}


- (void) toggleTileRequestDelay {
    isTileRequestDelayEnabled = !isTileRequestDelayEnabled;
    
    TMBMapboxMap* mapboxMap = [self.mapView mapboxMap];
    
    [mapboxMap setSourcePropertyFor:sourceId
                           property:@"tile-requests-delay"
                              value:isTileRequestDelayEnabled ? @5000 : @0 completion:^(NSError * _Nullable _) {
            
    }];
    
    [button setTitle: isTileRequestDelayEnabled ? @"Disable tile request delay" : @"Enable tile request delay"
            forState: UIControlStateNormal];
}

- (void) addRasterSource {

    // This URL points to raster tiles from OpenStreetMap
    NSString* sourceUrl = @"https://tile.openstreetmap.org/{z}/{x}/{y}.png";

    // Create a `RasterSource` and set the source's `tiles` to the Stamen watercolor raster tiles.
    TMBRasterSource* rasterSource = [[TMBRasterSource alloc] initWithId:sourceId];
    rasterSource.tiles = @[sourceUrl];

    // Specify the tile size for the `RasterSource`.
    rasterSource.tileSize = @256;

    // Specify that the layer should use the source with the ID `raster-source`. This ID will be
    // assigned to the `RasterSource` when it is added to the style.
    TMBRasterLayer* rasterLayer = [[TMBRasterLayer alloc] initWithId:@"raster-layer" source: sourceId];

    TMBMapboxMap* mapboxMap = [self.mapView mapboxMap];
    [mapboxMap addSource:rasterSource dataId:nil completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"ERR add source: %@", error);
        }
    }];
    
    [mapboxMap addLayer:rasterLayer layerPosition:nil completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"ERR add layer: %@", error);
        }
    }];
}

@end
