# Mapbox in Objective-C

Mapbox iOS SDK is built entirely in Swift and not fully compatible with Objective-C.

This library is a part of a QuickStart to work with Mapbox in Objective-C.
It provides convenient methods to intialize Mapview instance.

# Usage

```objective-c
MBMResourceOptions* myResourceOptions = [[MBMResourceOptions alloc]
                                            initWithAccessToken: @"your_public_access_token"
                                                        baseURL: nil
                                                       dataPath: nil
                                                      assetPath: nil
                                                      tileStore: nil];
    
    
MapInitOptions* mapInitOptions = [MapInitOptionsFactory 
                                    createWithResourceOptions: myResourceOptions 
                                                   mapOptions: nil 
                                                cameraOptions: nil 
                                                     styleURI: nil];

self.mapView = [MapViewFactory 
                    createWithFrame: self.view.bounds 
                            options: mapInitOptions];

self.mapView.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
                                    UIViewAutoresizingFlexibleHeight);

[self.view addSubview:self.mapView];
```

# Installation

```
pod 'MapboxMapObjC', '10.5.0'
```

# Ported Examples

| # | Example | Ported |
| - | - | - |
| 1 | [AddMarkersSymbolExample](./mapboxqs/AddMarkersSymbolExample.m) |  |
| 2 | [AddOneMarkerSymbolExample](./mapboxqs/AddOneMarkerSymbolExample.m) | OK |
| 3 | [AdvancedViewportGesturesExample](./mapboxqs/AdvancedViewportGesturesExample.m) |  |
| 4 | [AnimateGeoJSONLineExample](./mapboxqs/AnimateGeoJSONLineExample.m) |  |
| 5 | [AnimateImageLayerExample](./mapboxqs/AnimateImageLayerExample.m) |  |
| 6 | [AnimateLayerExample](./mapboxqs/AnimateLayerExample.m) |  |
| 7 | [AnimatedMarkerExample](./mapboxqs/AnimatedMarkerExample.m) |  |
| 8 | [BasicLocationPulsingExample](./mapboxqs/BasicLocationPulsingExample.m) |  |
| 9 | [BasicMapExample](./mapboxqs/BasicMapExample.m) | OK |
| 10 | [BuildingExtrusionsExample](./mapboxqs/BuildingExtrusionsExample.m) | OK |
| 11 | [CameraAnimationExample](./mapboxqs/CameraAnimationExample.m) |  |
| 12 | [CameraAnimatorsExample](./mapboxqs/CameraAnimatorsExample.m) |  |
| 13 | [CircleAnnotationExample](./mapboxqs/CircleAnnotationExample.m) |  |
| 14 | [ColorExpressionExample](./mapboxqs/ColorExpressionExample.m) |  |
| 15 | [Custom2DPuckExample](./mapboxqs/Custom2DPuckExample.m) |  |
| 16 | [Custom3DPuckExample](./mapboxqs/Custom3DPuckExample.m) |  |
| 17 | [CustomLayerExample](./mapboxqs/CustomLayerExample.m) |  |
| 18 | [CustomLocationProviderExample](./mapboxqs/CustomLocationProviderExample.m) |  |
| 19 | [CustomPointAnnotationExample](./mapboxqs/CustomPointAnnotationExample.m) |  |
| 20 | [CustomStyleURLExample](./mapboxqs/CustomStyleURLExample.m) | OK |
| 21 | [DataDrivenSymbolsExample](./mapboxqs/DataDrivenSymbolsExample.m) |  |
| 22 | [DataJoinExample](./mapboxqs/DataJoinExample.m) |  |
| 23 | [DebugMapExample](./mapboxqs/DebugMapExample.m) | OK |
| 24 | [DistanceExpressionExample](./mapboxqs/DistanceExpressionExample.m) |  |
| 25 | [ExternalVectorSourceExample](./mapboxqs/ExternalVectorSourceExample.m) |  |
| 26 | [FeatureStateExample](./mapboxqs/FeatureStateExample.m) |  |
| 27 | [FeaturesAtPointExample](./mapboxqs/FeaturesAtPointExample.m) |  |
| 28 | [FrameViewAnnotationsExample](./mapboxqs/FrameViewAnnotationsExample.m) |  |
| 29 | [GlobeExample](./mapboxqs/GlobeExample.m) |  |
| 30 | [GlobeFlyToExample](./mapboxqs/GlobeFlyToExample.m) |  |
| 31 | [HeatmapLayerGlobeExample](./mapboxqs/HeatmapLayerGlobeExample.m) |  |
| 32 | [IconSizeChangeExample](./mapboxqs/IconSizeChangeExample.m) |  |
| 33 | [LargeGeoJSONPerformanceExample](./mapboxqs/LargeGeoJSONPerformanceExample.m) |  |
| 34 | [LayerPositionExample](./mapboxqs/LayerPositionExample.m) |  |
| 35 | [LineAnnotationExample](./mapboxqs/LineAnnotationExample.m) |  |
| 36 | [LineGradientExample](./mapboxqs/LineGradientExample.m) |  |
| 37 | [LiveDataExample](./mapboxqs/LiveDataExample.m) |  |
| 38 | [LocalizationExample](./mapboxqs/LocalizationExample.m) |  |
| 39 | [MultipleGeometriesExample](./mapboxqs/MultipleGeometriesExample.m) |  |
| 40 | [NavigationSimulatorExample](./mapboxqs/NavigationSimulatorExample.m) |  |
| 41 | [OfflineManagerExample](./mapboxqs/OfflineManagerExample.m) |  |
| 42 | [OfflineRegionManagerExample](./mapboxqs/OfflineRegionManagerExample.m) |  |
| 43 | [PitchAndDistanceExample](./mapboxqs/PitchAndDistanceExample.m) |  |
| 44 | [PointAnnotationClusteringExample](./mapboxqs/PointAnnotationClusteringExample.m) |  |
| 45 | [PointClusteringExample](./mapboxqs/PointClusteringExample.m) |  |
| 46 | [PolygonAnnotationExample](./mapboxqs/PolygonAnnotationExample.m) | OK |
| 47 | [RasterTileSourceExample](./mapboxqs/RasterTileSourceExample.m) |  |
| 48 | [ResizableImageExample](./mapboxqs/ResizableImageExample.m) |  |
| 49 | [RestrictCoordinateBoundsExample](./mapboxqs/RestrictCoordinateBoundsExample.m) |  |
| 50 | [SceneKitExample](./mapboxqs/SceneKitExample.m) | OK |
| 51 | [ShowHideLayerExample](./mapboxqs/ShowHideLayerExample.m) |  |
| 52 | [SkyLayerExample](./mapboxqs/SkyLayerExample.m) | OK |
| 53 | [SnapshotterCoreGraphicsExample](./mapboxqs/SnapshotterCoreGraphicsExample.m) |  |
| 54 | [SnapshotterExample](./mapboxqs/SnapshotterExample.m) |  |
| 55 | [SpinningGlobeExample](./mapboxqs/SpinningGlobeExample.m) |  |
| 56 | [StoryboardMapViewExample](./mapboxqs/StoryboardMapViewExample.m) | OK |
| 57 | [SwitchStylesExample](./mapboxqs/SwitchStylesExample.m) |  |
| 58 | [SymbolClusteringExample](./mapboxqs/SymbolClusteringExample.m) |  |
| 59 | [TerrainExample](./mapboxqs/TerrainExample.m) | OK |
| 60 | [TrackingModeExample](./mapboxqs/TrackingModeExample.m) |  |
| 61 | [ViewAnnotationAnimationExample](./mapboxqs/ViewAnnotationAnimationExample.m) |  |
| 62 | [ViewAnnotationBasicExample](./mapboxqs/ViewAnnotationBasicExample.m) |  |
| 63 | [ViewAnnotationMarkerExample](./mapboxqs/ViewAnnotationMarkerExample.m) |  |
| 64 | [ViewAnnotationWithPointAnnotationExample](./mapboxqs/ViewAnnotationWithPointAnnotationExample.m) |  |
| 65 | [ViewportExample](./mapboxqs/ViewportExample.m) |  |
| 66 | [VoiceOverAccessibilityExample](./mapboxqs/VoiceOverAccessibilityExample.m) |  |

# LICENSE
This library is release under MIT license. You are freely to use and make changes. 
However, this license doesn't override [the license from Mapbox](https://www.mapbox.com/legal/tos).