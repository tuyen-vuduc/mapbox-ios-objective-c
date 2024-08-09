import CoreLocation
import MapboxMaps

/// A collection of [Spherical Mercator](https://en.wikipedia.org/wiki/Web_Mercator_projection) projection methods.
@objc open class TMBProjection : NSObject {
    /// Maximum supported latitude value.
    @objc public static let latitudeMax: CLLocationDegrees = +85.051128779806604
    /// Minimum supported latitude value.
    @objc public static let latitudeMin: CLLocationDegrees = -85.051128779806604
    /// Valid mercator latitude range.
    /// TODO mapto ObjC
    public static let latitudeRange = (latitudeMin...latitudeMax)

    /// Calculate distance spanned by one pixel at the specified latitude and
    /// zoom level.
    ///
    /// - Parameters:
    ///   - latitude: The latitude for which to return the value
    ///   - zoom: The zoom level
    ///
    /// - Returns: Meters
    @objc public static func metersPerPoint(for latitude: CLLocationDegrees, zoom: CGFloat) -> Double {
        Projection.metersPerPoint(for: latitude, zoom: zoom)
    }

    /// Calculate Spherical Mercator ProjectedMeters coordinates.
    /// - Parameter coordinate: Coordinate at which to calculate the projected
    ///     meters
    ///
    /// - Returns: Spherical Mercator ProjectedMeters coordinates
    @objc public static func projectedMeters(for coordinate: CLLocationCoordinate2D) -> ProjectedMeters {
        Projection.projectedMeters(for: coordinate)
    }

    /// Calculate a coordinate for a Spherical Mercator projected
    /// meters.
    ///
    /// - Parameter projectedMeters: Spherical Mercator ProjectedMeters coordinates
    ///
    /// - Returns: A coordinate
    @objc public static func coordinate(for projectedMeters: ProjectedMeters) -> CLLocationCoordinate2D {
        Projection.coordinate(for: projectedMeters)
    }

    /// Calculate a point on the map in Mercator Projection for a given
    /// coordinate at the specified zoom scale.
    ///
    /// - Parameters:
    ///   - coordinate: The coordinate for which to return the value.
    ///   - zoomScale: The current zoom factor applied on the map, is used to
    ///         calculate the world size as tileSize * zoomScale (i.e.
    ///         512 * 2 ^ Zoom level) where tileSize is the width of a tile
    ///         in points.
    /// - Returns: Mercator coordinate
    ///
    /// - Note: Coordinate latitudes will be clamped to
    ///     [Projection.latitudeMin, Projection.latitudeMax]
    @objc public static func project(_ coordinate: CLLocationCoordinate2D, zoomScale: CGFloat) -> MercatorCoordinate {
        Projection.project(coordinate, zoomScale: zoomScale)
    }

    /// Calculate a coordinate for a given point on the map in Mercator Projection.
    ///
    /// - Parameters:
    ///   - mercatorCoordinate: Point on the map in Mercator projection.
    ///   - zoomScale: The current zoom factor applied on the map, is used to
    ///         calculate the world size as tileSize * zoomScale (i.e.
    ///         512 * 2 ^ Zoom level) where tileSize is the width of a tile in
    ///         points.
    /// - Returns: Unprojected coordinate
    @objc public static func unproject(_ mercatorCoordinate: MercatorCoordinate, zoomScale: CGFloat) -> CLLocationCoordinate2D {
        Projection.unproject(mercatorCoordinate, zoomScale: zoomScale)
    }
}
