//
//  TMBOverviewViewportStateOptions.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/18/24.
//

import Foundation
import Turf
import CoreLocation
import UIKit
import MapboxCoreMaps
import MapboxCommon
import MapboxMaps

/// Configuration options for ``OverviewViewportState``.
@objc public class TMBOverviewViewportStateOptions: NSObject {

    /// The geometry that the ``OverviewViewportState`` should use when calculating its camera.
    @objc public var geometry: MapboxCommon.Geometry

    /// The padding that ``OverviewViewportState`` should add to geometry when calculating fitting camera.
    ///
    /// - Note: This is different from camera padding, see ``OverviewViewportStateOptions/padding``.
    @objc public var geometryPadding: UIEdgeInsets

    /// The bearing that ``OverviewViewportState`` should use when calcualting its camera.
    @objc public var bearing: NSNumber?

    /// The pitch that ``OverviewViewportState`` should use when calculating its camera.
    @objc public var pitch: NSNumber?

    /// Camera padding to set as camera options.
    @objc public var padding: NSValue?

    /// The maximum zoom level to allow.
    @objc public var maxZoom: NSNumber?

    /// The center of the given bounds relative to the map's center, measured in points.
    @objc public var offset: NSValue?

    /// The length of the animation performed by ``OverviewViewportState`` when it starts updating
    /// the camera and any time ``OverviewViewportState/options`` is set. See
    /// ``OverviewViewportState/options`` for details.
    @objc public var animationDuration: TimeInterval

    /// Memberwise initializer for `OverviewViewportStateOptions`.
    ///
    /// `geometry` is required, but all other parameters have default values.
    ///
    /// - Parameters:
    ///   - geometry: The geometry for which an overview should be shown.
    ///   - geometryPadding: The padding to add to geometry when calculating fitting camera.
    ///   - bearing: Camera bearing.
    ///   - pitch: Camera pitch.
    ///   - padding: Camera padding.
    ///   - maxZoom: The maximum zoom level to allow.
    ///   - offset: The center of the given bounds relative to the map's center, measured in points.
    ///   - animationDuration: Defaults to 1.
    @objc public init(
        geometry: MapboxCommon.Geometry,
        geometryPadding: UIEdgeInsets = .zero,
        bearing: NSNumber? = 0,
        pitch: NSNumber? = 0,
        padding: NSValue? = nil,
        maxZoom: NSNumber? = nil,
        offset: NSValue? = nil,
        animationDuration: TimeInterval = 1) {
        self.geometry = geometry
        self.geometryPadding = geometryPadding
        self.bearing = bearing
        self.pitch = pitch
        self.padding = padding
        self.maxZoom = maxZoom
        self.offset = offset
        self.animationDuration = animationDuration
    }
}

extension TMBOverviewViewportStateOptions {
    func unwrap() -> OverviewViewportStateOptions {
        OverviewViewportStateOptions(
            geometry: self.geometry.unwrap(),
            geometryPadding: self.geometryPadding,
            bearing: self.bearing?.doubleValue,
            pitch: self.pitch?.CGFloat,
            padding: self.padding?.uiEdgeInsetsValue,
            maxZoom: self.maxZoom?.doubleValue,
            offset: self.offset?.cgPointValue,
            animationDuration: self.animationDuration)
        
    }
}
extension OverviewViewportStateOptions {
    func wrap() -> TMBOverviewViewportStateOptions {
        TMBOverviewViewportStateOptions(
            geometry: self.geometry.wrap(),
            geometryPadding: self.geometryPadding,
            bearing: self.bearing?.NSNumber,
            pitch: self.pitch?.NSNumber,
            padding: self.padding?.NSValue,
            maxZoom: self.maxZoom?.NSNumber,
            offset: self.offset?.NSValue,
            animationDuration: self.animationDuration)
    }
}
