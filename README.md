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

# LICENSE
This library is release under MIT license. You are freely to use and make changes. 
However, this license doesn't override [the license from Mapbox](https://www.mapbox.com/legal/tos).