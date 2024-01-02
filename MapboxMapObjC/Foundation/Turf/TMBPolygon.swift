import CoreLocation
import Turf
import MapboxCommon

/**
 A [Polygon geometry](https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.6) is conceptually a collection of `Ring`s that form a single connected geometry.
 */
@objc open class TMBPolygon: NSObject {
    /// The positions at which the polygon is located. Each nested array corresponds to one linear ring.
    @objc public let coordinates: [[LocationCoordinate2D]]
    
    /**
     Initializes a polygon defined by the given positions.
     
     This initializer is equivalent to the [`polygon`](https://turfjs.org/docs/#polygon) function in the turf-helpers package of Turf.js ([source code](https://github.com/Turfjs/turf/tree/master/packages/turf-helpers/)).
     
     - parameter coordinates: The positions at which the polygon is located. Each nested array corresponds to one linear ring.
     */
    @objc public init(_ coordinates: [[LocationCoordinate2D]]) {
        self.coordinates = coordinates
    }
    
    /**
     Initializes a polygon defined by the given linear rings.
     
     - parameter outerRing: The outer linear ring.
     - parameter innerRings: The inner linear rings that define “holes” in the polygon.
     */
    public init(outerRing: Ring, innerRings: [Ring] = []) {
        self.coordinates = ([outerRing] + innerRings).map { $0.coordinates }
    }

    /**
     Initializes a polygon as a given center coordinate with a given number of
     vertices, as a means to approximate a circle.
     
     This initializer is equivalent to the [turf-circle](https://turfjs.org/docs/#circle) package of Turf.js ([source code](https://github.com/Turfjs/turf/tree/master/packages/turf-circle/)).

     - Parameter center: The center coordinate for the polygon.
     - Parameter radius: The radius of the polygon, measured in meters.
     - Parameter vertices: The number of vertices the polygon will have.
                           The recommended amount is 64.
     - Returns: A polygon shape which approximates a circle.
     */
    @objc public init(center: LocationCoordinate2D, radius: LocationDistance, vertices: Int) {
        // The first and last coordinates in a polygon must be identical,
        // which is why we're using the inclusive range operator in this case.
        // Ported from https://github.com/Turfjs/turf/blob/17002ccd57e04e84ddb38d7e3ac8ede35b019c58/packages/turf-circle/index.ts
        let coordinates = (0...vertices).map { ( step ) -> LocationCoordinate2D in
            let bearing = fabs(LocationDirection(step * -360 / vertices))
            return center.coordinate(at: radius, facing: bearing)
        }

        self.coordinates = [coordinates]
    }
}

extension TMBPolygon {
    func unwrap() -> Polygon {
        Polygon(self.coordinates)
    }
    func geometry() -> MapboxCommon.Geometry {
        MapboxCommon.Geometry(polygon: self.coordinates.map{ $0.map { $0.toValue() }})
    }
}

extension Polygon {
    func wrap() -> TMBPolygon {
        TMBPolygon(self.coordinates)
    }
}
