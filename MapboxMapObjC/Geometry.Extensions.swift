import Turf
import MapboxMaps
import MapboxCommon

extension MapboxCommon.Geometry {

    /// Allows a `MapboxCommon.Geometry` to be initialized with a `GeometryConvertible`.
    /// - Parameter geometry: The `GeometryConvertible` to transform into a `MapboxCommon.Geometry`.
    internal convenience init(_ geometry: GeometryConvertible) {
        switch geometry.geometry {
        case .point(let point):
            self.init(point: point.coordinates.toValue())
        case .lineString(let line):
            self.init(line: line.coordinates.map { $0.toValue() })
        case .polygon(let polygon):
            self.init(polygon: polygon.coordinates.map { $0.map { $0.toValue() } })
        case .multiPoint(let multiPoint):
            self.init(multiPoint: multiPoint.coordinates.map { $0.toValue() })
        case .multiLineString(let multiLine):
            self.init(multiLine: multiLine.coordinates.map { $0.map { $0.toValue() } })
        case .multiPolygon(let multiPolygon):
            self.init(multiPolygon: multiPolygon.coordinates.map { $0.map { $0.map { $0.toValue() } } })
        case .geometryCollection(let geometryCollection):
            self.init(geometryCollection: geometryCollection.geometries.map(MapboxCommon.Geometry.init(_:)))

        #if USING_TURF_WITH_LIBRARY_EVOLUTION
        @unknown default:
            fatalError("Could not determine Geometry from given Turf Geometry")
        #endif
        }
    }
}

extension CLLocationCoordinate2D {
    /// Convert a `CLLocationCoordinate` to a `NSValue` which wraps a `CGPoint`.
    internal func toValue() -> NSValue {
        return NSValue(cgPoint: CGPoint(x: latitude, y: longitude))
    }
}

extension Turf.Geometry {

    /// Allows a Turf object to be initialized with an internal `Geometry` object.
    /// - Parameter geometry: The `Geometry` object to transform.
    internal init?(_ geometry: MapboxCommon.Geometry) {
        let optionalResult: Turf.Geometry?
        switch geometry.geometryType {
        case GeometryType_Point:
            optionalResult = geometry.extractLocations().map {
                .point(Point($0.coordinateValue()))
            }
        case GeometryType_Line:
            optionalResult = geometry.extractLocationsArray().map {
                .lineString(LineString($0.map { $0.coordinateValue() }))
            }
        case GeometryType_Polygon:
            optionalResult = geometry.extractLocations2DArray().map {
                .polygon(Polygon($0.map(NSValue.toCoordinates(array:))))
            }
        case GeometryType_MultiPoint:
            optionalResult = geometry.extractLocationsArray().map {
                .multiPoint(MultiPoint($0.map({ $0.coordinateValue() })))
            }
        case GeometryType_MultiLine:
            optionalResult = geometry.extractLocations2DArray().map {
                .multiLineString(MultiLineString($0.map(NSValue.toCoordinates(array:))))
            }
        case GeometryType_MultiPolygon:
            optionalResult = geometry.extractLocations3DArray().map {
                .multiPolygon(MultiPolygon($0.map(NSValue.toCoordinates2D(array:))))
            }
        case GeometryType_GeometryCollection:
            optionalResult = geometry.extractGeometriesArray().map {
                .geometryCollection(GeometryCollection(geometries: $0.compactMap(Geometry.init(_:))))
            }
        default:
            optionalResult = nil
        }

        guard let result = optionalResult else {
            return nil
        }
        self = result
    }
}

extension MapboxMaps.Feature {

    /// Initialize a `Feature` with a `MapboxCommon.Feature` object.
    /// - Parameter feature: The `MapboxCommon.Feature` to use to create the `Feature`.
    internal init(_ feature: MapboxCommon.Feature) {
        self.init(geometry: Turf.Geometry(feature.geometry))

        /**
         Features may or may not have an identifier. If they have one,
         it is either a number or string value.
         */
        switch feature.identifier {
        case let identifier as NSNumber:
            self.identifier = .number(identifier.doubleValue)
        case let identifier as String:
            self.identifier = .string(identifier)
        default:
            break
        }

        properties = JSONObject(rawValue: feature.properties)
    }
}

extension NSValue {

    /// Converts the `CGPoint` value of an `NSValue` to a `CLLocationCoordinate2D`.
    func coordinateValue() -> CLLocationCoordinate2D {
        let point = cgPointValue
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(point.x), longitude: CLLocationDegrees(point.y))
    }

    /// Converts an array of `CGPoint` values wrapped in an `NSValue`
    /// to an array of `CLLocationCoordinate2D`.
    internal static func toCoordinates(array: [NSValue]) -> [CLLocationCoordinate2D] {
        return array.map({ $0.coordinateValue() })
    }

    /// Converts a two-dimensional array of `CGPoint` values wrapped in an `NSValue`
    /// to a two-dimensional array of `CLLocationCoordinate2D`.
    internal static func toCoordinates2D(array: [[NSValue]]) -> [[CLLocationCoordinate2D]] {
        return array.map({ toCoordinates(array: $0) })
    }

    /// Converts a three-dimensional array of `CGPoint` values wrapped in an `NSValue`
    /// to a three-dimensional array of `CLLocationCoordinate2D`.
    internal static func toCoordinates3D(array: [[[NSValue]]]) -> [[[CLLocationCoordinate2D]]] {
        return array.map({ toCoordinates2D(array: $0) })
    }
}
