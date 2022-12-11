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

extension MapView {
    @objc public func setLocationDelegate(_ delegate: LocationPermissionsDelegate) {
        self.location.delegate = delegate
    }
    
    @objc public func requestTemporaryFullAccuracyPermissions(_ customKey: String) {
        self.location.requestTemporaryFullAccuracyPermissions(withPurposeKey: customKey)
    }
    
    @objc public func puck2D() {
        self.location.options.puckType = .puck2D();
        
        self.gestures.delegate = self;
    }
    
//    @objc public func puck3D() {
////        self.location.options.puckType = .puck3D();
//    }
}


