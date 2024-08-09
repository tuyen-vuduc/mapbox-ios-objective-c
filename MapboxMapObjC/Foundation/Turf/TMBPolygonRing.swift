import Turf

/**
 A [linear ring](https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.6) is a closed figure bounded by three or more straight line segments.
 */
@objc open class TMBPolygonRing : NSObject {
    /// The positions at which the linear ring is located.
    @objc public var coordinates: [LocationCoordinate2D]
    
    /**
     Initializes a linear ring defined by the given positions.
     
     - parameter coordinates: The positions at which the linear ring is located.
     */
    @objc public init(coordinates: [LocationCoordinate2D]) {
        self.coordinates = coordinates
    }
}
extension TMBPolygonRing {
    func unwrap() -> Ring {
        Ring(coordinates: self.coordinates)
    }
}
extension Ring {
    func wrap() -> TMBPolygonRing {
        TMBPolygonRing(coordinates: self.coordinates)
    }
}
