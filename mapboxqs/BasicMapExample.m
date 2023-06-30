//
//  BasicMapExampleViewController.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "BasicMapExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"

@interface BasicMapExample ()

@property (strong) MapView* mapView;

@end

@implementation BasicMapExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MapView* mapView = [MapViewFactory createWithFrame:self.view.bounds options:nil];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    TMBOrnamentOptions* ornamentOptions = [[mapView ornaments] options];
    [[ornamentOptions scaleBar] setVisibility:TMBOrnamentVisibilityVisible];
    
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
