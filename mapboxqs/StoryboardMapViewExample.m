//
//  StoryboardMapViewExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "StoryboardMapViewExample.h"

#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"
#import "ExampleProtocol.h"

@interface StoryboardMapViewExample () <MapInitOptionsProvider, ExampleProtocol>

@end

@implementation StoryboardMapViewExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (MapInitOptions * _Nonnull)mapInitOptions {
    CLLocationCoordinate2D centerLocation = CLLocationCoordinate2DMake(40.728, -74.0060);
    
    TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerLocation padding:UIEdgeInsetsMake(0, 0, 0, 0) anchor:CGPointMake(0, 0) zoom:10 bearing:0 pitch:0];
    
    return [MapInitOptionsFactory
            createWithMapOptions:nil
            cameraOptions:cameraOptions
            styleURI:BuiltInStyles.light
            styleJSON:nil
            antialiasingSampleCount:1];
}

@end
