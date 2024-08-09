//
//  TMBCameraChanged.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/18/24.
//

import Foundation
import MapboxMaps

@objc open class TMBCameraChanged: NSObject {
    /// The current state of the camera.
    @objc public let cameraState: TMBCameraState
    
    /// The time when the camera was changed.
    @objc public let timestamp: Date
    
    @objc public init(cameraState: TMBCameraState, timestamp: Date) {
        self.cameraState = cameraState
        self.timestamp = timestamp
    }
}

extension CameraChanged {
    func wrap() -> TMBCameraChanged {
        return TMBCameraChanged(cameraState: self.cameraState.wrap(), timestamp: self.timestamp)
    }
}
