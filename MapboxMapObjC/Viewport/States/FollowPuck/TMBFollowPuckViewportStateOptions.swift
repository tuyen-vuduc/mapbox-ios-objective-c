//
//  TMBFollowPuckViewportStateOptions.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/18/24.
//

import Foundation
import UIKit
import MapboxMaps

/// Configuration options for ``FollowPuckViewportState``.
///
/// Each of the ``CameraOptions-swift.struct``-related properties is optional, so that the state can be configured to
/// only modify certain aspects of the camera if desired. This can be used, to achieve effects like allowing
/// zoom gestures to work simultaneously with ``FollowPuckViewportState``.
///
/// - SeeAlso: ``ViewportOptions/transitionsToIdleUponUserInteraction``
@objc public class TMBFollowPuckViewportStateOptions: NSObject {

    /// The value to use for ``CameraOptions-swift.struct/padding`` when setting the camera. If `nil`, padding
    /// will not be modified.
    @objc public var padding: NSValue?

    /// The value to use for ``CameraOptions-swift.struct/zoom`` when setting the camera. If `nil`, zoom will
    /// not be modified.
    @objc public var zoom: NSNumber?

    /// Indicates how to obtain the value to use for ``CameraOptions-swift.struct/bearing`` when setting the
    /// camera. If `nil`, bearing will not be modified.
    @objc public var bearing: TMBFollowPuckViewportStateBearing?

    /// The value to use for ``CameraOptions-swift.struct/pitch`` when setting the camera. If `nil`, pitch will
    /// not be modified.
    @objc public var pitch: NSNumber?

    /// Creates options.
    ///
    /// - Parameters:
    ///   - padding: Camera padding.
    ///   - zoom: Camera zoom. Default value is 16.35.
    ///   - bearing: camera bearing, by default bearing will be taken from heading data.
    ///   - pitch: Camera pitch. Default value is 45.
    @objc public init(
        padding: NSValue? = nil,
        zoom: NSNumber? = 16.35,
        bearing: TMBFollowPuckViewportStateBearing? = TMBFollowPuckViewportStateBearing.heading,
        pitch: NSNumber? = 45) {
        self.padding = padding
        self.zoom = zoom
        self.bearing = bearing
        self.pitch = pitch
    }
}

extension TMBFollowPuckViewportStateOptions {
    func unwrap() -> FollowPuckViewportStateOptions {
        FollowPuckViewportStateOptions(
            padding: self.padding?.uiEdgeInsetsValue,
            zoom: self.zoom?.CGFloat,
            bearing: self.bearing?.unwrap(),
            pitch: self.pitch?.CGFloat)
    }
}

extension FollowPuckViewportStateOptions {
    func wrap() -> TMBFollowPuckViewportStateOptions {
        TMBFollowPuckViewportStateOptions(
            padding: self.padding != nil ? NSValue(uiEdgeInsets: self.padding!) : nil,
            zoom: self.zoom != nil ? NSNumber(floatLiteral: self.zoom!) : nil,
            bearing: self.bearing?.wrap(),
            pitch: self.pitch != nil ? NSNumber(floatLiteral: self.pitch!) : nil)
    }
}
