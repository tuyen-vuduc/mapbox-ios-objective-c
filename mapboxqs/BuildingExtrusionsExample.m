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

@property UIColor* lightColor;
@property NSArray* lightPosition;

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
    
    firstPosition = @[@1.5, @90, @80];
    secondPosition = @[@1.15, @210, @30];
    
    [self initLightColorButton];
    [self initLightPositionButton];
    
    MapInitOptions* options = [MapInitOptionsFactory createWithResourceOptions:nil mapOptions:nil cameraOptions:nil styleURI:BuiltInStyles.light styleJSON:nil];
    
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
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:40.7135
                                                      longitude:-74.0066];
    
    MBMCameraOptions* cameraOptions = [[MBMCameraOptions alloc] initWithCenter:location
                                                                       padding:nil
                                                                        anchor:nil
                                                                          zoom:@15.5
                                                                       bearing:@-17.6
                                                                         pitch:@45];
    [[self.mapView mapboxMap] setCameraTo: cameraOptions];
    
    __weak BuildingExtrusionsExample *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5.0), dispatch_get_main_queue(), ^{
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    });
}

- (FillExtrusionLayerBuilder*) create3dBuildingsFillExtrusionLayerBuilder {
    FillExtrusionLayerBuilder* builder = [FillExtrusionLayerBuilder withId:@"3d-buildings"];
    
    [builder source:@"composite"];
    [builder minZoom: @15];
    [builder sourceLayer:@"building"];
    [builder fillExtrusionColor:[TMBValue constant:[UIColor lightGrayColor]]];
    [builder fillExtrusionOpacity:[TMBValue constant:@0.6]];
    [builder fillExtrusionAmbientOcclusionIntensity: [TMBValue constant:@0.3]];
    [builder fillExtrusionAmbientOcclusionRadius: [TMBValue constant:@3.0]];
    
    TMBExpression* filterExpression = [TMBExpression createWithOperator:TMBOperator.eq
                                                              arguments:@[
        [TMBExpression createWithOperator:TMBOperator.get
                                arguments: @[ @"extrude" ]],
        @"true"
    ]];
    
    [builder filter:filterExpression];
    
    TMBExpression* fillExtrusionHeightExpression = [TMBExpression createWithOperator:TMBOperator.interpolate
                                                              arguments:@[
        [TMBExpression createWithOperator:TMBOperator.linear],
        [TMBExpression createWithOperator:TMBOperator.zoom],
        @15,
        @0,
        @15.05,
        [TMBExpression createWithOperator:TMBOperator.get
                                arguments: @[ @"height" ]]
    ]];
    [builder fillExtrusionHeight:[TMBValue expression:fillExtrusionHeightExpression]];
    
    TMBExpression* fillExtrusionBaseExpression = [TMBExpression createWithOperator:TMBOperator.interpolate
                                                              arguments:@[
        [TMBExpression createWithOperator:TMBOperator.linear],
        [TMBExpression createWithOperator:TMBOperator.zoom],
        @15,
        @0,
        @15.05,
        [TMBExpression createWithOperator:TMBOperator.get
                                arguments: @[ @"min_height" ]]
    ]];
    [builder fillExtrusionBase:[TMBValue expression:fillExtrusionBaseExpression]];
    
    return builder;
}

// See https://docs.mapbox.com/mapbox-gl-js/example/3d-buildings/ for equivalent gl-js example
- (void) addBuildingExtrusions {
    [self.mapView addLayerWithBuilder:^id _Nonnull{
        return [self create3dBuildingsFillExtrusionLayerBuilder];
    }
                        layerPosition:TMBLayerPositionUnowned
                   layerPositionParam:nil
                              onError:^(NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

// MARK: - Actions

- (void) lightColorButtonTapped: (UIButton*) sender {
    if (self.lightColor == [UIColor redColor]) {
        self.lightColor = [UIColor blueColor];
        sender.tintColor = [UIColor blueColor];
    } else {
        self.lightColor = [UIColor redColor];
        sender.tintColor = [UIColor redColor];
    }
    
    [self.mapView lightColor:self.lightColor
                     onError:^(NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void) lightPositionButtonTapped: (UIButton*) sender {
    if (self.lightPosition == firstPosition) {
        self.lightPosition = secondPosition;
        sender.imageView.transform = CGAffineTransformIdentity;
    } else {
        self.lightPosition = firstPosition;
        sender.imageView.transform = CGAffineTransformMakeRotation(2.0*M_PI/3.0);
    }
    
    [self.mapView lightPosition:self.lightPosition
                        onError:^(NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}


@end
