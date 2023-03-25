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
    
    // Do any additional setup after loading the view.
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
    
    [mapView loadStyle:BuiltInStyles.streets completion:^(MBXStyle * _Nullable style, NSError * _Nullable error) {
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

- (void) addMarkerAnnotation: (MBXStyle *) style {
    NSString* imageId = @"BLUE_ICON_ID";
    UIImage* image = [UIImage imageNamed:@"blue_marker_view"];
    
    [style addImage:image
                 id:imageId
         completion:nil];
    
//    var source = GeoJSONSource()
//    source.data = .geometry(Geometry.point(Point(Constants.coordinate)))
//    try? style.addSource(source, id: Constants.SOURCE_ID)
//
//    var layer = SymbolLayer(id: Constants.LAYER_ID)
//    layer.source = Constants.SOURCE_ID
//    layer.iconImage = .constant(.name(Constants.BLUE_ICON_ID))
//    layer.iconAnchor = .constant(.bottom)
//    try? style.addLayer(layer)
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
