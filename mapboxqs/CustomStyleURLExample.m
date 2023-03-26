//
//  CustomStyleURLExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "CustomStyleURLExample.h"

#import <MapboxMaps/MapboxMaps.h>
#import "MapboxMaps-Swift.h"
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "ExampleProtocol.h"

@interface CustomStyleURLExample () <ExampleProtocol>

@property (strong) MapView* mapView;

@end

@implementation CustomStyleURLExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MapInitOptionsBuilder* builder = [MapInitOptionsBuilder create];
    MapInitOptions* mapInitOptions = [[builder styleUriString: @"mapbox://styles/examples/cke97f49z5rlg19l310b7uu7j"] build];
    MapView* mapView = [MapViewFactory createWithFrame:self.view.bounds
                                               options:mapInitOptions];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [mapView ornamentsOptionsScaleBarVisibility: TMBOrnamentVisibilityVisible];
    
    __weak CustomStyleURLExample *weakSelf = self;
    [mapView onStyleLoaded:^(id _Nonnull) {
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    }];
        
    self.mapView = mapView;
    [self.view addSubview:mapView];
    
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
