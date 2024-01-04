//
//  BuildingExtrusionsExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "BuildingExtrusionsExample.h"

#import <SceneKit/SceneKit.h>
#import <Metal/Metal.h>
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"
#import "ExampleProtocol.h"

@interface BuildingExtrusionsExample ()<ExampleProtocol>

@property UIButton* lightPositionButton;
@property UIButton* lightColorButton;
@property MapView* mapView;

@property TMBAmbientLight* ambientLight;
@property TMBDirectionalLight* directionalLight;

@end

@implementation BuildingExtrusionsExample {
    NSArray* firstPosition;
    NSArray* secondPosition;
}

- (void) initLightPositionButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.translatesAutoresizingMaskIntoConstraints = false;
    button.backgroundColor = [UIColor systemBlueColor];
    button.tintColor = [UIColor whiteColor];
    button.layer.cornerRadius = 4;
    button.clipsToBounds = true;
    button.contentEdgeInsets = UIEdgeInsetsMake(4, 4, 4, 4);
    
    if (@available(iOS 13.0, *)) {
        [button setImage:[UIImage systemImageNamed:@"flashlight.on.fill"] forState:UIControlStateNormal];
    } else {
        [button setTitle:@"Position" forState:UIControlStateNormal];
    }
    
    [button addTarget:self
               action:@selector(lightPositionButtonTapped:)
     forControlEvents: UIControlEventTouchUpInside ];
    
    self.lightPositionButton = button;
}

- (void) initLightColorButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.translatesAutoresizingMaskIntoConstraints = false;
    button.backgroundColor = [UIColor systemBlueColor];
    button.tintColor = [UIColor whiteColor];
    button.layer.cornerRadius = 4;
    button.clipsToBounds = true;
    button.contentEdgeInsets = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    if (@available(iOS 13.0, *)) {
        [button setImage:[UIImage systemImageNamed:@"paintbrush.fill"]
                forState:UIControlStateNormal];
    } else {
        [button setTitle:@"Color" forState:UIControlStateNormal];
    }
    
    [button addTarget:self action:@selector(lightColorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.lightColorButton = button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ambientLight = [[TMBAmbientLight alloc] initWithId:@"ambient"];
    self.ambientLight.color = [TMBValue constant:UIColor.blueColor];
    self.ambientLight.intensity = [TMBValue constant:@0.9];
    
    self.directionalLight = [[TMBDirectionalLight alloc] initWithId:@"directional"];
    self.directionalLight.color = [TMBValue constant:UIColor.whiteColor];
    self.directionalLight.intensity = [TMBValue constant:@0.9];
    self.directionalLight.castShadows = [TMBValue constant:@true];
    self.directionalLight.direction = [TMBValue constant: @[@0.0, @15.0]];
    
    firstPosition = @[@1.5, @90, @80];
    secondPosition = @[@1.15, @210, @30];
    
    [self initLightColorButton];
    [self initLightPositionButton];
    
    MapInitOptions* options = [MapInitOptionsFactory createWithMapOptions:nil cameraOptions:nil styleURI:BuiltInStyles.light styleJSON:nil antialiasingSampleCount:1];
    
    self.mapView =[MapViewFactory createWithFrame:self.view.bounds
                                          options:options];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.mapView];

    [[self.mapView mapboxMap] onStyleLoaded:^(id _Nonnull obj) {
            [self setupExample];
    }];
    
    [self.view addSubview:_lightPositionButton];
    [self.view addSubview:_lightColorButton];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.view.trailingAnchor constraintEqualToSystemSpacingAfterAnchor:self.lightPositionButton.trailingAnchor multiplier:1],
        [self.view.bottomAnchor constraintEqualToAnchor:self.lightPositionButton.bottomAnchor constant:100],
        [self.view.trailingAnchor constraintEqualToSystemSpacingAfterAnchor:self.lightColorButton.trailingAnchor multiplier:1],
        [self.lightPositionButton.topAnchor constraintEqualToAnchor:self.lightColorButton.bottomAnchor constant:1],
        [self.lightColorButton.widthAnchor constraintEqualToAnchor:self.lightPositionButton.widthAnchor],
        [self.lightColorButton.heightAnchor constraintEqualToAnchor:self.lightPositionButton.heightAnchor]
    ]];
}

- (void) setupExample {
    [self addBuildingExtrusions];
    
    CLLocationCoordinate2D centerLocation = CLLocationCoordinate2DMake(40.7135, -74.0060);
    
    TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerLocation padding:UIEdgeInsetsMake(0, 0, 0, 0) anchor:CGPointMake(0, 0) zoom:10 bearing:0 pitch:0];
    
    [[self.mapView mapboxMap] setCameraTo: cameraOptions];
    
    __weak BuildingExtrusionsExample *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5.0), dispatch_get_main_queue(), ^{
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    });
}

- (TMBFillExtrusionLayer*) create3dBuildingsFillExtrusionLayer {
    TMBFillExtrusionLayer* layer = [[TMBFillExtrusionLayer alloc] initWithId:@"3d-buildings" source:@"composite"];
    
    layer.minZoom = @15;
    layer.sourceLayer = @"building";
    layer.fillExtrusionColor = [TMBValue constant:[UIColor lightGrayColor]];
    layer.fillExtrusionOpacity = [TMBValue constant:@0.6];
    layer.fillExtrusionAmbientOcclusionIntensity = [TMBValue constant:@0.3];
    layer.fillExtrusionAmbientOcclusionRadius = [TMBValue constant:@3.0];
    
    TMBExpression* filterExpression = [TMBExpression eq:@[
        [TMBExpression get: @[ @"extrude" ]],
        @"true"
    ]];
    
    layer.filter = filterExpression;
    
    TMBExpression* fillExtrusionHeightExpression = [TMBExpression interpolate:@[
                                                        [TMBExpression linear],
                                                        [TMBExpression zoom],
                                                        @15,
                                                        @0,
                                                        @15.05,
                                                        [TMBExpression get: @[ @"height" ]]
                                                    ]
    ];
    layer.fillExtrusionHeight = [TMBValue expression:fillExtrusionHeightExpression];
    
    TMBExpression* fillExtrusionBaseExpression = [TMBExpression interpolate:@[
                                                    [TMBExpression linear],
                                                    [TMBExpression zoom],
                                                    @15,
                                                    @0,
                                                    @15.05,
                                                    [TMBExpression get: @[ @"min_height" ]]
                                                ]
    ];
    layer.fillExtrusionBase = [TMBValue expression:fillExtrusionBaseExpression];
    
    return layer;
}

// See https://docs.mapbox.com/mapbox-gl-js/example/3d-buildings/ for equivalent gl-js example
- (void) addBuildingExtrusions {
    [[self.mapView mapboxMap]
     addLayer:[self create3dBuildingsFillExtrusionLayer]
     layerPosition:nil
     completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

// MARK: - Actions

- (void) lightColorButtonTapped: (UIButton*) sender {
    if ([self.ambientLight.color.constant isEqual:[UIColor redColor]]) {
        self.ambientLight.color = [TMBValue constant:[UIColor blueColor]];
        sender.tintColor = [UIColor blueColor];
    } else {
        self.ambientLight.color = [TMBValue constant:[UIColor redColor]];
        sender.tintColor = [UIColor redColor];
    }
    
    [[self.mapView mapboxMap] setLightsWithAmbient:self.ambientLight directional:self.directionalLight completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (void) lightPositionButtonTapped: (UIButton*) sender {
    if ([self.directionalLight.direction.constant isEqual:firstPosition]) {
        self.directionalLight.direction = [TMBValue constant:secondPosition];
        sender.imageView.transform = CGAffineTransformIdentity;
    } else {
        self.directionalLight.direction = [TMBValue constant:firstPosition];
        sender.imageView.transform = CGAffineTransformMakeRotation(2.0*M_PI/3.0);
    }
    
    [[self.mapView mapboxMap] setLightsWithAmbient:self.ambientLight directional:self.directionalLight completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

@end
