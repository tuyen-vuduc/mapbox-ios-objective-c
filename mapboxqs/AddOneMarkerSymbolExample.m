//
//  AddOneMarkerSymbolExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "AddOneMarkerSymbolExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"
#import <MapKit/MapKit.h>

@interface AddOneMarkerSymbolExample ()

@end

@implementation AddOneMarkerSymbolExample{
    MapView* mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationCoordinate2D centerLocation = CLLocationCoordinate2DMake(55.665957, 12.550343);
    
    TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerLocation padding:UIEdgeInsetsMake(0, 0, 0, 0) anchor:CGPointMake(0, 0) zoom:8 bearing:0 pitch:0];
    
    MapInitOptions* options= [MapInitOptionsFactory createWithMapOptions:nil cameraOptions:cameraOptions styleURI:nil styleJSON:nil antialiasingSampleCount:1];
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:mapView];
    
    
    __weak AddOneMarkerSymbolExample *weakSelf = self;
    // Allows the delegate to receive information about map events.
    
    [[mapView mapboxMap] loadStyleWithUri:BuiltInStyles.standard transition:nil completion: ^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        
        [self addMarkerAnnotation];
        
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    }];
}

- (void) addMarkerAnnotation {
    NSString* imageId = @"BLUE_ICON_ID";
    UIImage* image = [UIImage imageNamed:@"blue_marker_view"];
    
    [[mapView mapboxMap] addImage:image id:imageId sdf:false contentInsets:UIEdgeInsetsZero completion:nil];
    
    NSString* sourceId = @"SOURCE_ID";
    CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(55.665957, 12.550343);
    MBXGeometry* point = [GeometryHelper createPoint: [NSValue valueWithMKCoordinate:coordinates]];
    // TODO
//    [[mapView mapboxMap] addS addSourceWithId:sourceId geometry:point completion: ^(NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"%@", error);
//            return;
//        }
//    }];
    
    [[mapView mapboxMap]
     addLayer:[self createSymbolLayer:sourceId
                                 icon:imageId]
     layerPosition:nil
     completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (TMBSymbolLayer*) createSymbolLayer: (NSString*) sourceId
                                            icon: (NSString *) icon {
    TMBSymbolLayer* layer = [[TMBSymbolLayer alloc] initWithId: @"LAYER_ID" source:sourceId];
        
    layer.iconImage = [TMBValue constant:[TMBResolvedImage fromName:icon]];
    layer.iconAnchor =[TMBValue iconAnchor:TMBIconAnchor.bottom];
    
    return layer;
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
