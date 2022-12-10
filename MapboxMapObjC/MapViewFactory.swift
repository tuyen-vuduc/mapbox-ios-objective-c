//
//  MapView.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 5/8/22.
//

import Foundation
import MapboxMaps

@objc
open class MapViewFactory : NSObject {
    /// :nodoc:
    /// See https://developer.apple.com/forums/thread/650054 for context
    @available(*, unavailable)
    internal override init() {
        fatalError("This initializer should not be called.")
    }
    
    @objc public static func create(frame: CGRect, options: MapInitOptions?) -> MapView {
        return MapView(frame: frame, mapInitOptions: options ?? MapInitOptions())
    }
}
