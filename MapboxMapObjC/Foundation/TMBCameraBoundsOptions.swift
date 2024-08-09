import Foundation
import MapboxMaps

import CoreLocation
import MapboxMaps


/// Holds options to be used for setting camera bounds.
@objc open class TMBCameraBoundsOptions: NSObject {

    /// The latitude and longitude bounds to which the camera center is constrained.
    /// Defaults to: Southwest: (-90, -180) and Northeast: (90, 180).
    @objc public var bounds: CoordinateBounds?

    /// The maximum zoom level, in mapbox zoom levels 0-25.5. At low zoom levels,
    /// a small set of map tiles covers a large geographical area. At higher
    /// zoom levels, a larger number of tiles cover a smaller geographical area.
    /// Defaults to 22.
    @objc public var maxZoom: CGFloat

    /// The minimum zoom level, in mapbox zoom levels 0-25.5.
    /// Defaults to 0.
    @objc public var minZoom: CGFloat

    /// The maximum allowed pitch value in degrees.
    /// Defaults to 85.
    @objc public var maxPitch: CGFloat

    /// The minimum allowed pitch value degrees.
    /// Defaults to 0.
    @objc public var minPitch: CGFloat

    @objc public init(bounds : CoordinateBounds?, 
                maxZoom : CGFloat, 
                minZoom : CGFloat, 
                maxPitch : CGFloat, 
                minPitch : CGFloat){
        self.bounds = bounds
        self.maxZoom = maxZoom
        self.minZoom = minZoom
        self.maxPitch = maxPitch
        self.minPitch = minPitch
    }
}
extension TMBCameraBoundsOptions {
    func unwrap() -> CameraBoundsOptions {
        CameraBoundsOptions(bounds: self.bounds,
            maxZoom: self.maxZoom,
            minZoom: self.minZoom,
            maxPitch: self.maxPitch,
            minPitch: self.minPitch)
    }
}
extension CameraBoundsOptions {
    func wrap() -> TMBCameraBoundsOptions {
        TMBCameraBoundsOptions(bounds: self.bounds,
          maxZoom: self.maxZoom ?? CGFloat(),
          minZoom: self.minZoom ?? CGFloat(),
          maxPitch: self.maxPitch ?? CGFloat(),
          minPitch: self.minPitch ?? CGFloat())
    }
}
