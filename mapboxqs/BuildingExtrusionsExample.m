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
    
    MapInitOptionsBuilder* builder = [MapInitOptionsBuilder create];
    MapInitOptions* options = [[builder styleUriString:BuiltInStyles.light] build];
    
    self.mapView =[MapViewFactory createWithFrame:self.view.bounds
                                          options:options];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.mapView];

    [self.mapView onStyleLoaded:^(id _Nonnull obj) {
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
    [self.mapView setCameraTo: cameraOptions];
    
    __weak BuildingExtrusionsExample *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5.0), dispatch_get_main_queue(), ^{
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    });
}

// See https://docs.mapbox.com/mapbox-gl-js/example/3d-buildings/ for equivalent gl-js example
- (void) addBuildingExtrusions {
    [self.mapView addFillExtrusionLayer:@"3d-buildings"
                              configure:^(FillExtrusionLayerBuilder * _Nonnull builder) {
        [builder source:@"composite"];
        [builder minZoom: @15];
        [builder sourceLayer:@"building"];
        [builder fillExtrusionColor:[MBXValue constant:[UIColor lightGrayColor]]];
        [builder fillExtrusionOpacity:[MBXValue constant:@0.6]];
        [builder fillExtrusionAmbientOcclusionIntensity: [MBXValue constant:@0.3]];
        [builder fillExtrusionAmbientOcclusionRadius: [MBXValue constant:@3.0]];
        
        MBXExpression* filterExpression = [MBXExpression createWithOperator:MBXOperatorEq
                                                                  arguments:@[
            [MBXExpression createWithOperator:MBXOperatorGet
                                    arguments: @[ @"extrude" ]],
            @"true"
        ]];
        
        [builder filter:filterExpression];
        
        MBXExpression* fillExtrusionHeightExpression = [MBXExpression createWithOperator:MBXOperatorInterpolate
                                                                  arguments:@[
            [MBXExpression createWithOperator:MBXOperatorLinear],
            [MBXExpression createWithOperator:MBXOperatorZoom],
            @15,
            @0,
            @15.05,
            [MBXExpression createWithOperator:MBXOperatorGet
                                    arguments: @[ @"height" ]]
        ]];
        [builder fillExtrusionHeight:[MBXValue expression:fillExtrusionHeightExpression]];
        
        MBXExpression* fillExtrusionBaseExpression = [MBXExpression createWithOperator:MBXOperatorInterpolate
                                                                  arguments:@[
            [MBXExpression createWithOperator:MBXOperatorLinear],
            [MBXExpression createWithOperator:MBXOperatorZoom],
            @15,
            @0,
            @15.05,
            [MBXExpression createWithOperator:MBXOperatorGet
                                    arguments: @[ @"min_height" ]]
        ]];
        [builder fillExtrusionBase:[MBXValue expression:fillExtrusionBaseExpression]];
    }
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
