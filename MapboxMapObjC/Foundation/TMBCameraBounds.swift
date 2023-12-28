import Foundation
import MapboxMaps

import CoreLocation
import MapboxMaps


/// Holds information about camera bounds.
@objc open class TMBCameraBounds: NSObject {
    /// The latitude and longitude bounds to which the camera center are constrained.
    /// Defaults to: Southwest: (-90, -180) and Northeast: (90, 180).
    @objc public var bounds: CoordinateBounds {
        origin.bounds
    }

    /// The maximum zoom level, in mapbox zoom levels 0-25.5. At low zoom levels,
    /// a small set of map tiles covers a large geographical area. At higher zoom
    /// levels, a larger number of tiles cover a smaller geographical area.
    /// Defaults to 22.
    @objc public var maxZoom: CGFloat {
        origin.maxZoom
    }

    /// The minimum zoom level, in mapbox zoom levels 0-25.5.
    /// Defaults to 0.
    @objc public var minZoom: CGFloat {
        origin.minZoom
    }

    /// The maximum allowed pitch value in degrees.
    /// Defaults to 85.
    @objc public var maxPitch: CGFloat {
        origin.maxPitch
    }

    /// The minimum allowed pitch value degrees.
    /// Defaults to 0.
    @objc public var minPitch: CGFloat {
        origin.minPitch
    }
    
    private var origin: CameraBounds
    init(origin: CameraBounds) {
        self.origin = origin
    }
}

extension CameraBounds {
    func wrap() -> TMBCameraBounds {
        TMBCameraBounds(origin: self)
    }
}
