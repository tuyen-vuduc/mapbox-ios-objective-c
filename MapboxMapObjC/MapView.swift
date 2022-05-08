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
    @objc public static func create(frame: CGRect, options: MapInitOptions) -> MapView {
        return MapView(frame: frame, mapInitOptions: options)
    }
}
