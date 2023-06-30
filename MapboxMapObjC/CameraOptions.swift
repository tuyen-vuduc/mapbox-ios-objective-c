import Foundation
import MapboxMaps

extension MapboxCoreMaps.CameraOptions {
    internal convenience init(_ swiftValue: MapboxMaps.CameraOptions) {
        self.init(
            __center: swiftValue.center?.location,
            padding: swiftValue.padding?.toMBXEdgeInsetsValue(),
            anchor: swiftValue.anchor?.screenCoordinate,
            zoom: swiftValue.zoom?.NSNumber,
            bearing: swiftValue.bearing?.NSNumber,
            pitch: swiftValue.pitch?.NSNumber)
    }
    
    func swiftValue() -> MapboxMaps.CameraOptions {
        return MapboxMaps.CameraOptions(
            center: self.__center?.coordinate,
            padding: self.__padding?.toUIEdgeInsetsValue(),
            anchor: self.__anchor?.point,
            zoom: self.__zoom?.CGFloat,
            bearing: self.__bearing?.CLLocationDirection,
            pitch: self.__pitch?.CGFloat)
    }
}

// MARK: - CLLocationCoordinate2D
extension CLLocationCoordinate2D {

    /// Converts a `CLLocationCoordinate` to a `CLLocation`.
    internal var location: CLLocation {
        CLLocation(latitude: latitude, longitude: longitude)
    }

    /// Returns a new `CLLocationCoordinate` value with a new longitude constrained to [-180, +180] degrees.
    internal func wrap() -> CLLocationCoordinate2D {
        /**
         mbgl::geo.hpp equivalent:

         void wrap() {
             lon = util::wrap(lon, -util::LONGITUDE_MAX, util::LONGITUDE_MAX);
         }
         */

        let wrappedLongitude = Utils.wrap(forValue: longitude, min: -180.0, max: 180.0)

        return CLLocationCoordinate2D(latitude: latitude, longitude: wrappedLongitude)
    }

    /// Returns a new `CLLocationCoordinate` where the longitude is wrapped if
    /// the distance from start to end longitudes is between a half and full
    /// world, ensuring that the shortest path is taken.
    /// - Parameter end: The coordinate to possibly wrap, if needed.
    internal func unwrapForShortestPath(_ end: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let delta = fabs(end.longitude - longitude)

        if delta <= 180.0 || delta >= 360 {
            return self
        }

        var lon = longitude

        if longitude > 0 && end.longitude < 0 {
            lon -= 360.0
        } else if longitude < 0 && end.longitude > 0 {
            lon += 360.0
        }

        return CLLocationCoordinate2D(latitude: latitude, longitude: lon)
    }
}

// MARK: - Utils

internal struct Utils {
    /// Converts the given angle (in radians) to be numerically close to the anchor angle, allowing it to be
    /// interpolated properly without sudden jumps.
    /// - Parameters:
    ///   - sourceAngle: Angle in radians.
    ///   - anchorAngle: Angle in radians.
    /// - Returns: Normalized angle.
    internal static func normalize(angle sourceAngle: Double, anchorAngle: Double) -> Double {
        if sourceAngle.isNaN || anchorAngle.isNaN {
            return 0
        }

        var angle = Utils.wrap(forValue: sourceAngle, min: -Double.pi, max: Double.pi)
        if angle == -Double.pi {
            angle = Double.pi
        }

        let diff = fabs(angle - anchorAngle)

        if fabs(angle - (Double.pi * 2) - anchorAngle) < diff {
            angle -= (Double.pi * 2)
        } else if fabs(angle + (Double.pi * 2) - anchorAngle) < diff {
            angle += (Double.pi * 2)
        }

        return angle
    }

    internal static func wrap(forValue value: Double, min minValue: Double, max maxValue: Double) -> Double {

        if value >= minValue && value < maxValue {
            return value
        } else if value == maxValue {
            return minValue
        }

        let delta = maxValue - minValue
        let wrapped = minValue + ((value - minValue).truncatingRemainder(dividingBy: delta))
        return value < minValue ? wrapped + delta : wrapped
    }
}

internal extension EdgeInsets {
    func toUIEdgeInsetsValue() -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(self.top),
                            left: CGFloat(self.left),
                            bottom: CGFloat(self.bottom),
                            right: CGFloat(self.right))
    }
}

extension UIEdgeInsets {
    func toMBXEdgeInsetsValue() -> EdgeInsets {
        return EdgeInsets(top: Double(self.top),
                          left: Double(self.left),
                          bottom: Double(self.bottom),
                          right: Double(self.right))
    }
}
// MARK: - CLLocationDirection
extension CLLocationDirection {

    /// Converts a `CLLocationDirection` to an `NSNumber` containing a `Double`.
    internal var NSNumber: NSNumber {
        Foundation.NSNumber(value: Double(self))
    }
}

// MARK: - CGPoint
extension CGPoint {

    /// Converts a `CGPoint` to an internal `ScreenCoordinate` type.
    internal var screenCoordinate: ScreenCoordinate {
        ScreenCoordinate(x: Double(x), y: Double(y))
    }

    /// Interpolate a point along a fraction of a line between two points.
    /// - Parameters:
    ///   - origin: The starting point for the interpolation.
    ///   - destination: The ending point for the interpolation.
    ///   - fraction: A value between 0 and 1 that represents the fraction to interpolate to.
    ///               A value of 0 represents the start position, and a value of 1
    ///               represents the end position.
    /// - Returns: A `CGPoint` that represents the fractional point along the path
    ///            between the source and destination points.
    internal static func interpolate(origin: CGPoint, destination: CGPoint, fraction: CGFloat) -> CGPoint {
        return CGPoint(x: origin.x + fraction * (destination.x - origin.x),
                       y: origin.y + fraction * (destination.y - origin.y))
    }
}

// MARK: - CGFloat
extension CGFloat {

    /// Converts a `CGFloat` to a `NSValue` which wraps a `Double`.
    internal var NSNumber: NSNumber {
        Foundation.NSNumber(value: Double(self))
    }
}

extension MapboxMaps.CameraOptions {
    internal init(_ objcValue: MapboxCoreMaps.CameraOptions) {
        self.init(
            center: objcValue.__center?.coordinate,
            padding: objcValue.__padding?.toUIEdgeInsetsValue(),
            anchor: objcValue.__anchor?.point,
            zoom: objcValue.__zoom?.CGFloat,
            bearing: objcValue.__bearing?.CLLocationDirection,
            pitch: objcValue.__pitch?.CGFloat)
    }
}

extension MapboxCoreMaps.ScreenCoordinate {
    var point: CGPoint {
        get {
            return CGPoint(x: self.x, y: self.y)
        }
    }
}
