import Foundation
import MapboxMaps

import CoreLocation
import MapboxMaps


/// The azimuth (orientation) of the user’s device, relative to true or magnetic north.
@objc open class TMBHeading: NSObject {
    /// The heading direction (measured in degrees) relative to true or magnetic north.
    ///
    /// When heading is created from CLHeading, this value resolves to `trueHeading` (priority, if valid)
    /// or `magneticHeading`.
    @objc public var direction: CLLocationDirection

    /// The maximum deviation (measured in degrees) between the reported heading and the true geomagnetic heading.
    @objc public var accuracy: CLLocationDirection

    ///The time at which this heading was determined.
    @objc public var timestamp: Date

    /// Creates a heading.
    @objc public init(direction : CLLocationDirection, 
                accuracy : CLLocationDirection, 
                timestamp : Date ){
        self.direction = direction
        self.accuracy = accuracy
        self.timestamp = timestamp
    }

    /// Creates a heading from CLHeading.
    @objc public convenience init(from  clHeading: CLHeading){
        var direction = clHeading.trueHeading
        if direction < 0 {
            direction = clHeading.magneticHeading
        }
        self.init(
            direction: direction,
            accuracy: clHeading.headingAccuracy,
            timestamp: clHeading.timestamp
        )
    }
}
extension TMBHeading {
    func unwrap() -> Heading {
        Heading(direction: self.direction,
            accuracy: self.accuracy,
            timestamp: (self.timestamp))
    }
}
extension Heading {
    func wrap() -> TMBHeading {
        TMBHeading(direction: self.direction,
          accuracy: self.accuracy,
          timestamp: (self.timestamp))
    }
}
