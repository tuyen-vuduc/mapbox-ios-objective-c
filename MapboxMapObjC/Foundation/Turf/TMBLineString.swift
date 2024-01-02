import CoreLocation
import Turf
import MapboxCommon

/**
 A [LineString geometry](https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.4) is a collection of two or more positions, each position connected to the next position linearly.
 */
@objc open class TMBLineString: NSObject {
    /// The positions at which the line string is located.
    @objc public let coordinates: [LocationCoordinate2D]
    
    /**
     Initializes a line string defined by given positions.
     
     This initializer is equivalent to the [`lineString`](https://turfjs.org/docs/#lineString) function in the turf-helpers package of Turf.js ([source code](https://github.com/Turfjs/turf/tree/master/packages/turf-helpers/)).
     
     - parameter coordinates: The positions at which the line string is located.
     */
    public init(_ coordinates: [LocationCoordinate2D]) {
        self.coordinates = coordinates
    }
    
    /**
     Initializes a line string coincident to the given linear ring.
     
     This initializer is roughly equivalent to the [`polygon-to-line`](https://turfjs.org/docs/#polygonToLine) package of Turf.js ([source code](https://github.com/Turfjs/turf/tree/master/packages/turf-polygon-to-line/)), except that it accepts a linear ring instead of a full polygon.
     
     - parameter ring: The linear ring coincident to the line string.
     */
    public init(_ ring: Ring) {
        self.coordinates = ring.coordinates
    }
    
    /**
     Representation of current `LineString` as an array of `LineSegment`s.
     */
    var segments: [LineSegment] {
        return zip(coordinates.dropLast(), coordinates.dropFirst()).map { LineSegment($0.0, $0.1) }
    }
}

extension TMBLineString {
    func unwrap() -> LineString {
        LineString(self.coordinates)
    }
    func geometry() -> MapboxCommon.Geometry {
        MapboxCommon.Geometry(line: self.coordinates.map{ $0.toValue() })
    }
}

extension LineString {
    func wrap() -> TMBLineString {
        TMBLineString(self.coordinates)
    }
}
