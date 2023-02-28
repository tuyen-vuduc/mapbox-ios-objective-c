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
    
    @objc public func puck2D(_ build: ((_ builder: Puck2DConfigurationBuilder) -> Void)?) {
        if let build {
            let builder = Puck2DConfigurationBuilder()
            build(builder)
            self.location.options.puckType = .puck2D(builder.build())
        } else {
            self.location.options.puckType = .puck2D()
        }
    }
    
    @objc public func puckBearingSource(_ source: MBXPuckBearingSource) {
        self.location.options.puckBearingSource = source == .heading ? .heading : .course
    }
}

@objc public enum MBXPuckBearingSource : Int {
    case heading
    case course
}
