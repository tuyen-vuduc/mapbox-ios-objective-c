//
//  AdvancedViewportGesturesExample.h
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import <UIKit/UIKit.h>
#import "ExampleProtocol.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdvancedViewportGesturesExample : UIViewController<
    ExampleProtocol
    , TMBGestureManagerDelegate
    , TMBViewportStatusObserver>

@end

NS_ASSUME_NONNULL_END
