import Foundation
import MapboxMaps

import CoreLocation
import MapboxMaps


/// A struct to configure a `LocationManager`
@objc open class TMBLocationOptions: NSObject {

    /// Specifies the minimum distance (measured in meters) a device must move horizontally
    /// before a location update is generated.
    ///
    /// The default value of this property is `kCLDistanceFilterNone`.
    @objc public var distanceFilter: CLLocationDistance 

    /// Specifies the accuracy of the location data.
    ///
    /// The default value is `kCLLocationAccuracyBest`.
    @objc public var desiredAccuracy: CLLocationAccuracy 

    /// Sets the type of user activity associated with the location updates.
    ///
    /// The default value is `CLActivityType.other`.
    @objc public var activityType: CLActivityType 

    /// Sets the type of puck that should be used
    @objc public var puckType: TMBPuckType?

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
        puckType : TMBPuckType?, 
        puckBearing : TMBPuckBearing , 
        puckBearingEnabled : Bool ){
        self.puckType = puckType
        self.puckBearing = puckBearing
        self.puckBearingEnabled = puckBearingEnabled
    }
}
extension TMBLocationOptions {
    func unwrap() -> LocationOptions {
        LocationOptions(puckType: (self.puckType).unwrap(),
            puckBearing: (self.puckBearing).unwrap(),
            puckBearingEnabled: self.puckBearingEnabled)
    }
}
extension LocationOptions {
    func wrap() -> TMBLocationOptions {
        TMBLocationOptions(puckType: (self.puckType).wrap(),
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
@objc extension TMBValue {
    @objc public class func puckBearing(_ value: TMBPuckBearing) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == PuckBearing {
    func puckBearing() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [PuckBearing] {
    func arrayOfPuckBearing() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func puckBearing() -> Value<PuckBearing> {
        if let constant = self.constant as? String,
            let value = PuckBearing(rawValue: constant) {
            return Value.constant(value)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfPuckBearing() -> Value<[PuckBearing]> {
        if let constant = self.constant as? [String] {
            return Value.constant(constant
                .map{ PuckBearing(rawValue: $0) }
                .filter { $0 != nil }
                .map{ $0! })
        }
        
        return Value.expression(expression!.rawValue)
    }
}