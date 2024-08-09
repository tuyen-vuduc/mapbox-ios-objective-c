//
//  TMBTransitionOptions.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 6/27/24.
//

import Foundation
import MapboxMaps

extension TransitionOptions {
    internal init(_ objValue: MapboxCoreMaps.TransitionOptions) {
        self.init(duration: objValue.__duration?.doubleValue,
                  delay: objValue.__delay?.doubleValue,
                  enablePlacementTransitions: objValue.__enablePlacementTransitions?.boolValue)
    }
}

extension MapboxCoreMaps.TransitionOptions {
    internal convenience init(_ swiftValue: TransitionOptions) {
        self.init(__duration: swiftValue.duration.map(NSNumber.init(value:)),
                  delay: swiftValue.delay.map(NSNumber.init(value:)),
                  enablePlacementTransitions: swiftValue.enablePlacementTransitions.map(NSNumber.init(value:)))
    }
}
