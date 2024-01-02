import CoreLocation
import Turf
import MapboxCommon

/**
 A [Point geometry](https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.2) represents a single position.
 */
@objc open class TMBPoint: NSObject {
    /**
     The position at which the point is located.
     
     This property has a plural name for consistency with [RFC 7946](https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.2). For convenience, it is represented by a `LocationCoordinate2D` instead of a dedicated `Position` type.
     */
    @objc public let coordinates: CLLocationCoordinate2D
    
    /**
     Initializes a point defined by the given position.
     
     - parameter coordinates: The position at which the point is located.
     */
    @objc public init(_ coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
    }
}

extension TMBPoint {
    func unwrap() -> Point {
        Point(self.coordinates)
    }
    func geometry() -> MapboxCommon.Geometry {
        MapboxCommon.Geometry(point: self.coordinates.toValue())
    }
}
extension Point {
    func wrap() -> TMBPoint {
        TMBPoint(self.coordinates)
    }
}
