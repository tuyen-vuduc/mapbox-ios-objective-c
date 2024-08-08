import MapboxMaps
import Turf

@objc
extension MapView {
    @objc public func location() -> TMBLocationManager {
        return TMBLocationManager(origin: self.location)
    }
}

@objc
extension TMBLocationManager {
    /**
    Returns the direction from the receiver to the given coordinate.

    This method is equivalent to the [turf-bearing](https://turfjs.org/docs/#bearing) package of Turf.js ([source code](https://github.com/Turfjs/turf/tree/master/packages/turf-bearing/)).
    */
    @objc public static func direction(
        from: CLLocationCoordinate2D,
        to coordinate: CLLocationCoordinate2D) -> CLLocationDirection {
        return from.direction(to: coordinate)
    }
    
    /// Returns a coordinate a certain Haversine distance away in the given direction.
    @objc public static func coordinate(
        from: CLLocationCoordinate2D,
        at distance: CLLocationDistance,
        facing direction: CLLocationDirection) -> CLLocationCoordinate2D {
        return from.coordinate(at: distance, facing: direction)
    }
          
    /**
    Returns the Haversine distance between two coordinates measured in degrees.

    This method is equivalent to the [turf-distance](https://turfjs.org/docs/#distance) package of Turf.js ([source code](https://github.com/Turfjs/turf/tree/master/packages/turf-distance/)).
    */
    @objc public static func distance(
        from: CLLocationCoordinate2D,
        to coordinate: CLLocationCoordinate2D) -> CLLocationDistance {
            return from.distance(to: coordinate)
    }
}
