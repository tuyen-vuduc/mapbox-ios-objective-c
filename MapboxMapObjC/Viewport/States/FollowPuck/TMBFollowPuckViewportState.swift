//
//  TMBFollowPuckViewportState.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/18/24.
//

import Foundation
import UIKit
import MapboxMaps

/// A ``ViewportState`` implementation that tracks the location puck (to show a puck, use
/// ``LocationOptions/puckType``)
///
/// Use ``ViewportManager/makeFollowPuckViewportState(options:)`` to create instances of this
/// class.
@objc public final class TMBFollowPuckViewportState : NSObject, TMBViewportState {

    /// Configuration options for this state.
    @objc public var options: TMBFollowPuckViewportStateOptions {
        get { self.origin.options.wrap() }
        set { self.origin.options = newValue.unwrap() }
    }
    
    private var origin: FollowPuckViewportState

    public init(_ origin: FollowPuckViewportState) {
        self.origin = origin
    }
    
    /// :nodoc:
    /// See ``ViewportState/observeDataSource(with:)``.
    @objc public func observeDataSource(with handler: @escaping (TMBCameraOptions) -> Bool) -> TMBCancelable {
        return self.origin.observeDataSource { cameraOptions in
                handler(cameraOptions.wrap())
        }.wrap()
    }

    /// :nodoc:
    /// See ``ViewportState/startUpdatingCamera()``.
    @objc public func startUpdatingCamera() {
        self.origin.startUpdatingCamera()
    }

    /// :nodoc:
    /// See ``ViewportState/stopUpdatingCamera()``.
    @objc public func stopUpdatingCamera() {
        self.origin.stopUpdatingCamera()
    }
}

extension TMBFollowPuckViewportState {
    func unwrap() -> FollowPuckViewportState {
        self.origin
    }
}
extension FollowPuckViewportState {
    func wrap() -> TMBFollowPuckViewportState {
        TMBFollowPuckViewportState(self)
    }
}
