import Foundation
import MapboxMaps

import CoreLocation
import MapboxMaps


/// A struct to configure a `LocationManager`
@objc open class TMBLocationOptions: NSObject {
    /// Sets the type of puck that should be used
    @objc public var puckType: TMBPuckTypeConfiguration?

    /// Specifies if a `Puck` should use `Heading` or `Course` for the bearing.
    ///
    /// The default value is `PuckBearing.heading`.
    @objc public var puckBearing: TMBPuckBearing

    /// Whether the puck rotates to track the bearing source.
    ///
    /// The default value is `false`.
    @objc public var puckBearingEnabled: Bool

    /// Initializes a `LocationOptions`.
    /// - Parameters:
    ///   - puckType: Sets the type of puck that should be used.
    ///   - puckBearing: Specifies if a `Puck` should use `Heading` or `Course` for the bearing.
    ///   - puckBearingEnabled: Whether the puck rotates to track the bearing source.
    @objc public init(
        puckType : TMBPuckTypeConfiguration?,
        puckBearing : TMBPuckBearing,
        puckBearingEnabled : Bool ){
        self.puckType = puckType
        self.puckBearing = puckBearing
        self.puckBearingEnabled = puckBearingEnabled
    }
}
extension TMBLocationOptions {
    func unwrap() -> LocationOptions {
        LocationOptions(puckType: (self.puckType)?.unwrap(),
            puckBearing: (self.puckBearing).unwrap(),
            puckBearingEnabled: self.puckBearingEnabled)
    }
}
extension LocationOptions {
    func wrap() -> TMBLocationOptions {
        TMBLocationOptions(puckType: (self.puckType)?.wrap(),
          puckBearing: (self.puckBearing).wrap(),
          puckBearingEnabled: self.puckBearingEnabled)
    }
}

/// Controls how the puck is oriented
@objc public enum TMBPuckBearing: Int {
    /// The puck should set its bearing using `heading: CLHeading`. Bearing will mimic user's
    /// spatial orientation.
    case heading

    /// The puck should set its bearing using `course: CLLocationDirection`. Bearing will mimic
    /// the general direction of travel.
    case course
}
extension PuckBearing {
    func wrap() -> TMBPuckBearing {
        switch self {
        case .heading:
            return .heading
        case .course:
            return .course
        }
    }
}
extension TMBPuckBearing {
    func unwrap() -> PuckBearing {
        switch self {
        case .heading:
            return .heading
        case .course:
            return .course
        }
    }
}
