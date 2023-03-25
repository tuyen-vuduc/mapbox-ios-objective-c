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
    NSString* defaultAccessToken = MapInitOptionsBuilder.defaultResourceOptions.accessToken;
    CLLocation* centerLocation = [[CLLocation alloc] initWithLatitude:40.728 longitude:-74.0060];
    
    MBMCameraOptions* cameraOptions = [[MBMCameraOptions alloc] initWithCenter:centerLocation
                                                                 padding:nil
                                                                  anchor:nil
                                                                    zoom:@10
                                                                 bearing:nil
                                                                pitch:nil];
    
    MapInitOptionsBuilder* builder = [MapInitOptionsBuilder create];
    
    return [[[[builder accessToken:defaultAccessToken] cameraOptions:cameraOptions] styleUriString:BuiltInStyles.light] build];
}

@end
