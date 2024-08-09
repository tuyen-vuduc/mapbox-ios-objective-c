//
//  SymbolClusteringExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "SymbolClusteringExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"

@interface SymbolClusteringExample ()

@end

@implementation SymbolClusteringExample {
    MapView* mapView;
    NSMutableSet<TMBCancelable*>* cancelables;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cancelables = [[NSMutableSet alloc] init];
    
    // Create a `MapView` centered over Washington, DC.
    CLLocationCoordinate2D centerLocation = CLLocationCoordinate2DMake(38.889215, -77.039354);
    
    TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerLocation padding:UIEdgeInsetsMake(0, 0, 0, 0) anchor:CGPointMake(0, 0) zoom:11 bearing:0 pitch:0];
    
    MapInitOptions* options = [MapInitOptionsFactory
                               createWithMapOptions:nil
                               cameraOptions:cameraOptions
                               styleURI:BuiltInStyles.dark
                               styleJSON:nil
                               antialiasingSampleCount:1];
    
    mapView = [MapViewFactory createWithFrame:self.view.bounds
                                      options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:mapView];
        
    __weak SymbolClusteringExample *weakSelf = self;
    // Add the source and style layers once the map has loaded.
    [cancelables addObject:[[mapView mapboxMap] onMapLoaded:^(id _Nonnull _) {
        [weakSelf addSymbolClusteringLayers];
    }]];

//    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureRecognizer:)))
//    mapView.addGestureRecognizer(tapGestureRecognizer)
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void) addSymbolClusteringLayers {
    // The image named `fire-station-11` is included in the app's Assets.xcassets bundle.
    // In order to recolor an image, you need to add a template image to the map's style.
    // The image's rendering mode can be set programmatically or in the asset catalogue.
    UIImage* image = [[UIImage imageNamed:@"fire-station-11"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    // Add the image tp the map's style. Set `sdf` to `true`. This allows the icon images to be recolored.
    // For more information about `SDF`, or Signed Distance Fields, see
    // https://docs.mapbox.com/help/troubleshooting/using-recolorable-images-in-mapbox-maps/#what-are-signed-distance-fields-sdf
    [[mapView mapboxMap] addImage:image id:@"fire-station-icon" sdf:true contentInsets:UIEdgeInsetsZero completion:nil];
    
    // Fire_Hydrants.geojson contains information about fire hydrants in the District of Columbia.
    // It was downloaded on 6/10/21 from https://opendata.dc.gov/datasets/DCGIS::fire-hydrants/about
    NSString* url = [[NSBundle mainBundle] pathForResource: @"Fire_Hydrants" ofType:@"geojson"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:url encoding:NSUTF8StringEncoding error:&error];
    
    
    // Create expression to identify the max flow rate of one hydrant in the cluster
    // ["max", ["get", "FLOW"]]
    TMBExpression* maxExpression = [TMBExpression max: @[
        [TMBExpression get:@[@"FLOW"]]]];
    
    // Create expression to determine if a hydrant with EngineID E-9 is in the cluster
    // ["any", ["==", ["get", "ENGINEID"], "E-9"]]
    TMBExpression* ine9Expression = [TMBExpression any:@[
        [TMBExpression eq:@[
            [TMBExpression get:@[@"ENGINEID"]],
            @"E-9"
        ]]
    ]];
    
    // Create expression to get the sum of all of the flow rates in the cluster
    // [["+", ["accumulated"], ["get", "sum"]], ["get", "FLOW"]]
    TMBExpression* sumExpression = [TMBExpression args:@[
        [TMBExpression sum:@[
            [TMBExpression accumulated:@[]],
            [TMBExpression get:@[@"sum"]],
        ]],
        [TMBExpression get:@[@"FLOW"]]
    ]];
    
    // Add the expressions to the cluster as ClusterProperties so they can be accessed below
    NSDictionary<NSString*, TMBExpression*>* clusterProperties = @{
        @"max": maxExpression,
        @"in_e9": ine9Expression,
        @"sum": sumExpression,
    };

    NSDictionary<NSString*, NSObject*> *source = @{
        @"type": @"geojson",
        @"id": @"fire-hydrants",
        @"cluster": @true,
        @"clusterRadius": @75,
        @"clusterProperties": clusterProperties
    };
    
    // TODO addGeoJSONSourceWithId
//    [[mapView mapboxMap] addGeoJSONSourceWithId:@"fire-hydrant-source" properties:source geojson:fileContents onComplete:^(NSError * _Nullable error) {
//
//    }];
    
//    // Enable clustering for this source.
//    source.cluster = true
//    source.clusterRadius = 75
//
//    // Create expression to identify the max flow rate of one hydrant in the cluster
//    // ["max", ["get", "FLOW"]]
//    let maxExpression = Exp(.max) {Exp(.get) { "FLOW" }}
//
//    // Create expression to determine if a hydrant with EngineID E-9 is in the cluster
//    // ["any", ["==", ["get", "ENGINEID"], "E-9"]]
//    let ine9Expression = Exp(.any) {
//        Exp(.eq) {
//            Exp(.get) { "ENGINEID" }
//            "E-9"
//        }
//    }
//
//    // Create expression to get the sum of all of the flow rates in the cluster
//    // [["+", ["accumulated"], ["get", "sum"]], ["get", "FLOW"]]
//    let sumExpression = Exp {
//        Exp(.sum) {
//            Exp(.accumulated)
//            Exp(.get) { "sum" }
//        }
//        Exp(.get) { "FLOW" }
//    }
//
//    // Add the expressions to the cluster as ClusterProperties so they can be accessed below
//    let clusterProperties: [String: Expression] = [
//        "max": maxExpression,
//        "in_e9": ine9Expression,
//        "sum": sumExpression
//    ]
//    source.clusterProperties = clusterProperties
//
//    let sourceID = "fire-hydrant-source"
//
//    var clusteredLayer = createClusteredLayer()
//    clusteredLayer.source = sourceID
//
//    var unclusteredLayer = createUnclusteredLayer()
//    unclusteredLayer.source = sourceID
//
//    // `clusterCountLayer` is a `SymbolLayer` that represents the point count within individual clusters.
//    var clusterCountLayer = createNumberLayer()
//    clusterCountLayer.source = sourceID
//
//    var _x = try! JSONEncoder().encode(source)
//    let _json = String(data: _x, encoding: String.Encoding.utf8)
//
//    // Add the source and two layers to the map.
//    try! style.addSource(source, id: sourceID)
//    try! style.addLayer(clusteredLayer)
//    try! style.addLayer(unclusteredLayer, layerPosition: .below(clusteredLayer.id))
//    try! style.addLayer(clusterCountLayer)
//
//    // This is used for internal testing purposes only and can be excluded
//    // from your implementation.
//    [self finish];
}

- (void) createClusteredLayer {
//    // Create a symbol layer to represent the clustered points.
//    var clusteredLayer = CircleLayer(id: "clustered-circle-layer")
//
//    // Filter out unclustered features by checking for `point_count`. This
//    // is added to clusters when the cluster is created. If your source
//    // data includes a `point_count` property, consider checking
//    // for `cluster_id`.
//    clusteredLayer.filter = Exp(.has) { "point_count" }
//
//    // Set the color of the icons based on the number of points within
//    // a given cluster. The first value is a default value.
//    clusteredLayer.circleColor = .expression(Exp(.step) {
//        Exp(.get) { "point_count" }
//        UIColor.systemGreen
//        50
//        UIColor.systemBlue
//        100
//        UIColor.systemRed
//    })
//
//    clusteredLayer.circleRadius = .constant(25)
//
//    return clusteredLayer
}

- (void) createUnclusteredLayer {
//    // Create a symbol layer to represent the points that aren't clustered.
//    var unclusteredLayer = SymbolLayer(id: "unclustered-point-layer")
//
//    // Filter out clusters by checking for `point_count`.
//    unclusteredLayer.filter = Exp(.not) {
//        Exp(.has) { "point_count" }
//    }
//    unclusteredLayer.iconImage = .constant(.name("fire-station-icon"))
//    unclusteredLayer.iconColor = .constant(StyleColor(.white))
//
//    // Rotate the icon image based on the recorded water flow.
//    // The `mod` operator allows you to use the remainder after dividing
//    // the specified values.
//    unclusteredLayer.iconRotate = .expression(Exp(.mod) {
//        Exp(.get) { "FLOW" }
//        360
//    })
//
//    return unclusteredLayer
}

- (void) createNumberLayer {
//    var numberLayer = SymbolLayer(id: "cluster-count-layer")
//
//    // check whether the point feature is clustered
//    numberLayer.filter = Exp(.has) { "point_count" }
//
//    // Display the value for 'point_count' in the text field
//    numberLayer.textField = .expression(Exp(.get) { "point_count" })
//    numberLayer.textSize = .constant(12)
//    return numberLayer
}

- (void) handleTap: (UITapGestureRecognizer*) gestureRecognizer {
//    let point = gestureRecognizer.location(in: mapView)
//
//    // Look for features at the tap location within the clustered and
//    // unclustered layers.
//    mapView.mapboxMap.queryRenderedFeatures(with: point,
//                                            options: RenderedQueryOptions(layerIds: ["unclustered-point-layer", "clustered-circle-layer"],
//                                            filter: nil)) { [weak self] result in
//        switch result {
//        case .success(let queriedFeatures):
//            // Return the first feature at that location, then pass attributes to the alert controller.
//            // Check whether the feature has values for `ASSETNUM` and `LOCATIONDETAIL`. These properties
//            // come from the fire hydrant dataset and indicate that the selected feature is not clustered.
//            if let selectedFeatureProperties = queriedFeatures.first?.feature.properties,
//               case let .string(featureInformation) = selectedFeatureProperties["ASSETNUM"],
//               case let .string(location) = selectedFeatureProperties["LOCATIONDETAIL"] {
//                self?.showAlert(withTitle: "Hydrant \(featureInformation)", and: "\(location)")
//            // If the feature is a cluster, it will have `point_count` and `cluster_id` properties. These are assigned
//            // when the cluster is created.
//            } else if let selectedFeatureProperties = queriedFeatures.first?.feature.properties,
//              case let .number(pointCount) = selectedFeatureProperties["point_count"],
//              case let .number(clusterId) = selectedFeatureProperties["cluster_id"],
//              case let .number(maxFlow) = selectedFeatureProperties["max"],
//              case let .number(sum) = selectedFeatureProperties["sum"],
//              case let .boolean(in_e9) = selectedFeatureProperties["in_e9"] {
//            // If the tap landed on a cluster, pass the cluster ID and point count to the alert.
//                let inEngineNine = in_e9 ? "Some hydrants belong to Engine 9." : "No hydrants belong to Engine 9."
//                self?.showAlert(withTitle: "Cluster ID \(Int(clusterId))", and: "There are \(Int(pointCount)) hydrants in this cluster. The highest water flow is \(Int(maxFlow)) and the collective flow is \(Int(sum)). \(inEngineNine)")
//            }
//        case .failure(let error):
//            self?.showAlert(withTitle: "An error occurred: \(error.localizedDescription)", and: "Please try another hydrant")
//        }
//    }
}

// Present an alert with a given title and message.
- (void) showAlert: (NSString*) title message:(NSString*) message {
//    UIAlertController* alertController = UIAlertController(title: title,
//                                        message: message,
//                                        preferredStyle: .alert)
//
//alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//present(alertController, animated: true, completion: nil)
}

@end
