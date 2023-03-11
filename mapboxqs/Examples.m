//
//  Examples.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "Examples.h"
#import "ExampleModel.h"

#import "BasicMapExampleViewController.h"
#import "CustomStyleURLExample.h"
#import "StoryboardMapViewExample.h"
#import "DebugMapExample.h"
#import "TerrainExample.h"
#import "SceneKitExample.h"
#import "BuildingExtrusionsExample.h"
#import "SkyLayerExample.h"
#import "PolygonAnnotationExample.h"
#import "AddOneMarkerSymbolExample.h"
#import "CircleAnnotationExample.h"
#import "SymbolClusteringExample.h"
#import "PointAnnotationClusteringExample.h"
#import "AddMarkersSymbolExample.h"
#import "CustomPointAnnotationExample.h"
#import "LineAnnotationExample.h"
#import "AnimatedMarkerExample.h"
#import "IconSizeChangeExample.h"
#import "MultipleGeometriesExample.h"
#import "ViewAnnotationWithPointAnnotationExample.h"
#import "ViewAnnotationBasicExample.h"
#import "ViewAnnotationMarkerExample.h"
#import "FrameViewAnnotationsExample.h"
#import "ViewAnnotationAnimationExample.h"
#import "CameraAnimatorsExample.h"
#import "CameraAnimationExample.h"
#import "ViewportExample.h"
#import "AdvancedViewportGesturesExample.h"
#import "PitchAndDistanceExample.h"
#import "ResizableImageExample.h"
#import "LargeGeoJSONPerformanceExample.h"

#import "TrackingModeExample.h"
#import "BasicLocationPulsingExample.h"
#import "Custom2DPuckExample.h"
#import "Custom3DPuckExample.h"
#import "CustomLocationProviderExample.h"
#import "NavigationSimulatorExample.h"

@implementation Examples

+ (NSArray *)all {
    return @[
        @{
           @"title": @"Getting started",
           @"examples": [Examples gettingStartedExamples]
        },
        @{
           @"title": @"3D and Fill Extrusions",
           @"examples": [Examples threeDExamples]
        },
        @{
           @"title": @"Annotations",
           @"examples": [Examples annotationExamples]
        },
        @{
           @"title": @"Camera",
           @"examples": [Examples cameraExamples]
        },
        @{
           @"title": @"Lab",
           @"examples": [Examples labExamples]
        },
        @{
           @"title": @"Location",
           @"examples": [Examples locationExamples]
        },
        @{
           @"title": @"Offline",
           @"examples": [Examples offlineExamples]
        },
        @{
           @"title": @"Snapshot",
           @"examples": [Examples snapshotExamples]
        },
        @{
           @"title": @"Style",
           @"examples": [Examples styleExamples]
        },
        @{
           @"title": @"User Interaction",
           @"examples": [Examples userInteractionExamples]
        },
        @{
           @"title": @"Accessibility",
           @"examples": [Examples accessibilityExamples]
        },
        @{
           @"title": @"Globe and Atmosphere",
           @"examples": [Examples globeAndAtmosphere]
        }
    ];
}

+ (NSArray<ExampleModel *> *) gettingStartedExamples {
    return @[
        [[ExampleModel alloc] initWithTitle: @"Display a map view"
                                   subtitle: @"Create and display a map that uses the default Mapbox streets style. This example also shows how to update the starting camera for a map."
                                       type: BasicMapExample.class],
        [[ExampleModel alloc] initWithTitle: @"Use a custom map style"
                                   subtitle: @"Set and use a custom map style URL."
                                       type: CustomStyleURLExample.class],
        [[ExampleModel alloc] initWithTitle: @"Display a map view using storyboard"
                                   subtitle: @"Create and display a map using a storyboard."
                                       type: StoryboardMapViewExample.class],
        [[ExampleModel alloc] initWithTitle: @"Debug Map"
                                   subtitle: @"This example shows how the map looks with different debug options"
                                       type: DebugMapExample.class]
    ];
}
+ (NSArray<ExampleModel *> *) threeDExamples {
    return @[
        [[ExampleModel alloc] initWithTitle: @"Show 3D terrain"
                                   subtitle: @"Show realistic elevation by enabling terrain."
                                       type: TerrainExample.class],
        [[ExampleModel alloc] initWithTitle: @"SceneKit rendering on map"
                                   subtitle: @"Use custom layer to render SceneKit model over terrain."
                                       type: SceneKitExample.class],
        [[ExampleModel alloc] initWithTitle: @"Display 3D buildings"
                                   subtitle: @"Extrude the building layer in the Mapbox Light style using FillExtrusionLayer and set up the light position."
                                       type: BuildingExtrusionsExample.class],
        [[ExampleModel alloc] initWithTitle: @"Add a sky layer"
                                   subtitle: @"Add a customizable sky layer to simulate natural lighting with a Terrain layer."
                                       type: SkyLayerExample.class]
    ];
}
+ (NSArray<ExampleModel *> *) annotationExamples {
    return @[
        [[ExampleModel alloc] initWithTitle: @"Add a polygon annotation"
                                   subtitle: @"Add a polygon annotation to the map."
                                       type: PolygonAnnotationExample.class],
        [[ExampleModel alloc] initWithTitle: @"Add a marker symbol"
                                   subtitle: @"Add a blue teardrop-shaped marker image to a style and display it on the map using a SymbolLayer."
                                       type: AddOneMarkerSymbolExample.class],
        [[ExampleModel alloc] initWithTitle: @"Add Circle Annotations"
                                   subtitle: @"Show circle annotations on a map"
                                       type: CircleAnnotationExample.class],
        [[ExampleModel alloc] initWithTitle: @"Add Cluster Symbol Annotations"
                                   subtitle: @"Show fire hydrants in Washington DC area in a cluster using a symbol layer."
                                       type: SymbolClusteringExample.class],
        [[ExampleModel alloc] initWithTitle: @"Add Cluster Point Annotations"
                                   subtitle: @"Show fire hydrants in Washington DC area in a cluster using point annotations."
                                       type: PointAnnotationClusteringExample.class],
        [[ExampleModel alloc] initWithTitle: @"Add markers to a map"
                                   subtitle: @"Add markers that use different icons."
                                       type: AddMarkersSymbolExample.class],
        [[ExampleModel alloc] initWithTitle: @"Add Point Annotations"
                                   subtitle: @"Show point annotations on a map"
                                       type: CustomPointAnnotationExample.class],
        [[ExampleModel alloc] initWithTitle: @"Add Polylines Annotations"
                                   subtitle: @"Show polyline annotations on a map."
                                       type: LineAnnotationExample.class],
        [[ExampleModel alloc] initWithTitle: @"Animate Marker Position"
                                   subtitle: @"Animate updates to a marker/annotation's position."
                                       type: AnimatedMarkerExample.class],
        [[ExampleModel alloc] initWithTitle: @"Change icon size"
                                   subtitle: @"Change icon size with Symbol layer."
                                       type: IconSizeChangeExample.class],
        [[ExampleModel alloc] initWithTitle: @"Draw multiple geometries"
                                   subtitle: @"Draw multiple shapes on a map."
                                       type: MultipleGeometriesExample.class],
// TODO       [[ExampleModel alloc] initWithTitle: @"Use a map & annotations with SwiftUI"
//                subtitle: @"Use the UIViewRepresentable protocol to wrap a MapView in a SwiftUI view."
//                type: SwiftUIExample.class],
        [[ExampleModel alloc] initWithTitle: @"View annotation with point annotation"
                                   subtitle: @"Add view annotation to a point annotation"
                                       type: ViewAnnotationWithPointAnnotationExample.class],
        [[ExampleModel alloc] initWithTitle: @"View annotations: basic example"
                                   subtitle: @"Add view annotation on a map with a click."
                                       type: ViewAnnotationBasicExample.class],
        [[ExampleModel alloc] initWithTitle: @"View annotations: advanced example"
                                   subtitle: @"Add view annotations anchored to a symbol layer feature."
                                       type: ViewAnnotationMarkerExample.class],
        [[ExampleModel alloc] initWithTitle: @"View annotations: Frame list of annotations"
                                   subtitle: @"Animates to camera framing the list of selected view annotations."
                                       type: FrameViewAnnotationsExample.class],
        [[ExampleModel alloc] initWithTitle: @"View annotations: animation"
                                   subtitle: @"Animate a view annotation along a route"
// TODO                testTimeout: 60
                                       type: ViewAnnotationAnimationExample.class],
    ];
}
+ (NSArray<ExampleModel *> *) cameraExamples {
    return @[
        [[ExampleModel alloc] initWithTitle: @"Use custom camera animations"
                                   subtitle: @"Animate the map camera to a new position using camera animators. Individual camera properties such as zoom, bearing, and center coordinate can be animated independently."
                                       type: CameraAnimatorsExample.class],
        [[ExampleModel alloc] initWithTitle: @"Use camera animations"
                                   subtitle: @"Use ease(to:) to animate updates to the camera's position."
                                       type: CameraAnimationExample.class],
        [[ExampleModel alloc] initWithTitle: @"Viewport"
                                   subtitle: @"Viewport camera showcase"
                                       type: ViewportExample.class],
        [[ExampleModel alloc] initWithTitle: @"Advanced Viewport Gestures"
                                   subtitle: @"Viewport configured to allow gestures"
                                       type: AdvancedViewportGesturesExample.class],
        [[ExampleModel alloc] initWithTitle: @"Filter symbols based on pitch and distance"
                                   subtitle: @"Use pitch and distance-from-center expressions in the filter field of a symbol layer to remove large size POI labels in the far distance at high pitch"
                                       type: PitchAndDistanceExample.class]
];
}
+ (NSArray<ExampleModel *> *) labExamples {
    return @[
        [[ExampleModel alloc] initWithTitle: @"Resizable image"
                                   subtitle: @"Add a resizable image with cap insets to a style."
                                       type: ResizableImageExample.class],
        [[ExampleModel alloc] initWithTitle: @"Geojson performance"
                                   subtitle: @"Display long route as large geojson"
                                       type: LargeGeoJSONPerformanceExample.class]
    ];
}
+ (NSArray<ExampleModel *> *) locationExamples {
    return @[
        [[ExampleModel alloc] initWithTitle: @"Display the user's location"
                                   subtitle: @"Display the user's location on a map with the default user location puck."
                                       type: TrackingModeExample.class],
        [[ExampleModel alloc] initWithTitle: @"Basic pulsing circle"
                                   subtitle: @"Display sonar-like animation radiating from the location puck."
                                       type: BasicLocationPulsingExample.class],
        [[ExampleModel alloc] initWithTitle: @"Customize the location puck"
                                   subtitle: @"Customized the location puck on the map"
                                       type: Custom2DPuckExample.class],
        [[ExampleModel alloc] initWithTitle: @"Use a 3D model to show the user's location"
                                   subtitle: @"A 3D model is used to represent the user's location."
                                       type: Custom3DPuckExample.class],
        [[ExampleModel alloc] initWithTitle: @"Add a custom location provider"
                                   subtitle: @"Display the location puck at a custom location."
                                       type: CustomLocationProviderExample.class],
        [[ExampleModel alloc] initWithTitle: @"Simulate navigation"
                                   subtitle: @"Simulate a driving trip from LA to San Francisco along a pre-defined route"
                                       type: NavigationSimulatorExample.class]
    ];
}
+ (NSArray<ExampleModel *> *) offlineExamples {
    return @[
        [[ExampleModel alloc] initWithTitle: @"Use OfflineManager and TileStore to download a region"
                                   subtitle: @"Shows how to use OfflineManager and TileStore to download regions for offline use. By default, users may download up to 750 tile packs for offline use across all regions. If the limit is hit, any loadRegion call will fail until excess regions are deleted. This limit is subject to change. Please contact Mapbox if you require a higher limit. Additional charges may apply."
                                       type: OfflineManagerExample.class],
        [[ExampleModel alloc] initWithTitle: @"Use OfflineRegionManager to download a region"
                                   subtitle: @"Use the deprecated OfflineRegionManager to download regions for offline use."
// TODO                testTimeout: 120,
                                       type: OfflineRegionManagerExample.class]
    ];
}
+ (NSArray<ExampleModel *> *) snapshotExamples {
    return @[];
}
+ (NSArray<ExampleModel *> *) styleExamples {
    return @[];
}
+ (NSArray<ExampleModel *> *) userInteractionExamples {
    return @[];
}
+ (NSArray<ExampleModel *> *) accessibilityExamples {
    return @[];
}
+ (NSArray<ExampleModel *> *) globeAndAtmosphere {
    return @[];
}
@end
