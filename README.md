# Mapbox in Objective-C

Mapbox is a well-known service which provide mapping and navigation services across platforms from iOS/Android and Web.
Their SDK for iOS was migrated to Swift entirely and no longer fully compatible with Objective-C, if not say very little.

This library is to provide Objective-C compabatible APIs to work with Mapbox fully in Objective-C and other cross platform frameworks like Xamarin.
This repo is built as an input for the libaray [Xamarin.iOS for Mapbox.iOS](https://github.com/tuyen-vuduc/mapbox-ios-binding.git).

# Usage

```objective-c
CLLocationCoordinate2D centerLocation = CLLocationCoordinate2DMake(55.665957, 12.550343);
    
TMBCameraOptions* cameraOptions = [[TMBCameraOptions alloc] initWithCenter:centerLocation padding:UIEdgeInsetsMake(0, 0, 0, 0) anchor:CGPointMake(0, 0) zoom:8 bearing:0 pitch:0];

MapInitOptions* options= [MapInitOptionsFactory createWithMapOptions:nil cameraOptions:cameraOptions styleURI:nil styleJSON:nil antialiasingSampleCount:1];

self.mapView = [MapViewFactory createWithFrame:self.view.bounds
                                options:options];
self.mapView.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
                                    UIViewAutoresizingFlexibleHeight);

[self.view addSubview:self.mapView];
```

# Installation

```
pod 'MapboxMapObjC', '11.0.0'
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
| 13 | [CircleAnnotationExample](./mapboxqs/CircleAnnotationExample.m) | OK |
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
| 41 | [OfflineManagerExample](./mapboxqs/OfflineManagerExample.m) | OK |
| 42 | [OfflineRegionManagerExample](./mapboxqs/OfflineRegionManagerExample.m) |  |
| 43 | [PitchAndDistanceExample](./mapboxqs/PitchAndDistanceExample.m) |  |
| 44 | [PointAnnotationClusteringExample](./mapboxqs/PointAnnotationClusteringExample.m) |  |
| 45 | [PointClusteringExample](./mapboxqs/PointClusteringExample.m) |  |
| 46 | [PolygonAnnotationExample](./mapboxqs/PolygonAnnotationExample.m) | OK |
| 47 | [RasterTileSourceExample](./mapboxqs/RasterTileSourceExample.m) | OK |
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

## Maintainer
This project is maintained by [tuyen-vuduc](https://github.com/tuyen-vuduc) in his spare time and/or when requested.<br>

If you find this project is helpful, please give it a star, become a sponsor of the project and/or buy him a coffee.

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/tuyen.vuduc)

# LICENSE
This library is release under The BSD 3-Clause License. You are freely to use and make changes. 
However, this license doesn't override [the license from Mapbox](https://www.mapbox.com/legal/tos).