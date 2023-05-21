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

@interface AddOneMarkerSymbolExample ()

@end

@implementation AddOneMarkerSymbolExample{
    MapView* mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocation* centerLocation = [[CLLocation alloc] initWithLatitude: 55.665957
                                                            longitude: 12.550343];
    
    MBMCameraOptions* cameraOptions = [[MBMCameraOptions alloc] initWithCenter:centerLocation
                                                                       padding:nil
                                                                        anchor:nil
                                                                          zoom:@8
                                                                       bearing:nil
                                                                         pitch:nil];
    MapInitOptionsBuilder* builder = [MapInitOptionsBuilder create];
    
    MapInitOptions* options = [[builder
                                 cameraOptions:cameraOptions]
                               build];
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:mapView];
    
    
    __weak AddOneMarkerSymbolExample *weakSelf = self;
    // Allows the delegate to receive information about map events.
    
    [mapView loadStyle:BuiltInStyles.streets completion:^(TMBStyle * _Nullable style, NSError * _Nullable error) {
        if (error) {
            NSLog(error.description);
            return;
        }
        
        [self addMarkerAnnotation: style];
        
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    }];
}

- (void) addMarkerAnnotation: (TMBStyle *) style {
    NSString* imageId = @"BLUE_ICON_ID";
    UIImage* image = [UIImage imageNamed:@"blue_marker_view"];
    
    [style addImageWithId:imageId
                    image:image
                      sdf: false
            contentInsets: UIEdgeInsetsZero
               completion:nil];
    NSString* sourceId = @"SOURCE_ID";
    CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(55.665957, 12.550343);
    TMBPoint* point = [TMBPoint withCoordinates: coordinates];
    [mapView addSourceWithId:sourceId
                    geometry:[TMBGeometry fromData:point]
                     onError:nil];
    
    [mapView addLayerWithBuilder:^id _Nonnull{
        return [self createSymbolLayerBuilder:sourceId
                                         icon:imageId];
    }
                   layerPosition:TMBLayerPositionUnowned
              layerPositionParam:nil
                         onError:nil];
}

- (SymbolLayerBuilder*) createSymbolLayerBuilder: (NSString*) sourceId
                                            icon: (NSString *) icon {
    SymbolLayerBuilder* builder = [SymbolLayerBuilder withId: @"LAYER_ID"];
        
    [builder source:sourceId];
    [builder iconImage:[TMBValue constant:[TMBResolvedImage fromName:icon]]];
    [builder iconAnchor:[TMBValue constant: TMBIconAnchor.bottom]];
    return builder;
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
