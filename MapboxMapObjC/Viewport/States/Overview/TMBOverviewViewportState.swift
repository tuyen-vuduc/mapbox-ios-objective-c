//
//  TMBOverviewViewportState.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/18/24.
//

import Foundation
import Turf
import UIKit
import MapboxMaps

/// A ``ViewportState`` implementation that shows an overview of the geometry specified by its
/// ``OverviewViewportStateOptions/geometry``.
///
/// Use ``ViewportManager/makeOverviewViewportState(options:)`` to create instances of this
/// class.
@objc public class TMBOverviewViewportState: NSObject, TMBViewportState {

    /// Configuration options.
    ///
    /// When set, the viewport reframes the geometry using the new options and updates its camera with
    /// an ``CameraAnimationsManager/ease(to:duration:curve:completion:)``
    /// animation with a linear timing curve and duration specified by the new value's
    /// ``OverviewViewportStateOptions/animationDuration``.
    @objc public var options: TMBOverviewViewportStateOptions {
        set { self.origin.options = newValue.unwrap() }
        get { self.origin.options.wrap() }
    }
    
    private var origin: OverviewViewportState

    init(_ origin: OverviewViewportState) {
        self.origin = origin
    }
    
    /// :nodoc:
    /// See ``ViewportState/observeDataSource(with:)``.
    @objc public func observeDataSource(with handler: @escaping (TMBCameraOptions) -> Bool) -> TMBCancelable {
        return TMBCancelable(
            cancelable: self.origin.observeDataSource { cameraOptions in
                handler(cameraOptions.wrap())
            })
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

extension OverviewViewportState {
    func wrap() -> TMBOverviewViewportState {
        TMBOverviewViewportState(self)
    }
}
extension TMBOverviewViewportState {
    func unwrap() -> OverviewViewportState {
        self.origin
    }
}
