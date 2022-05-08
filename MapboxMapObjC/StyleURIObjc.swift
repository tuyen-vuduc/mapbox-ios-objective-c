import Foundation
import MapboxMaps

@objcMembers
open class StyleURIObjc : NSObject {
    public typealias RawValue = String

    public let rawValue: String

    /// Create a custom StyleURI from a String. The String may be a full HTTP or HTTPS URI, a Mapbox style URI
    /// (mapbox://styles/{user}/{style}), or a path to a local file relative to the application’s
    /// resource path.
    /// Returns nil if the String is invalid.
    /// - Parameter rawValue: String representation of the URI for the style
    public init?(rawValue: String) {
        guard let url = URL(string: rawValue), url.scheme != nil else {
            return nil
        }
        self.rawValue = rawValue
    }

    /// Create a custom StyleURI from a URL. The URL may be a full HTTP or HTTPS URI, a Mapbox style URI
    /// (mapbox://styles/{user}/{style}), or a path to a local file relative to the application’s
    /// resource path.
    /// Returns nil if the URL is invalid.
    /// - Parameter url: URL for the style
    public convenience init?(url: URL) {
        self.init(rawValue: url.absoluteString)
    }

    /// Mapbox Streets is a general-purpose style with detailed road and transit networks.
    public static let streets = StyleURIObjc(rawValue: StyleURI.streets.rawValue)!

    /// Mapbox Outdoors is a general-purpose style tailored to outdoor activities.
    public static let outdoors = StyleURIObjc(rawValue: StyleURI.outdoors.rawValue)!

    /// Mapbox Light is a subtle, light-colored backdrop for data visualizations.
    public static let light = StyleURIObjc(rawValue: StyleURI.light.rawValue)!

    /// Mapbox Dark is a subtle, dark-colored backdrop for data visualizations.
    public static let dark = StyleURIObjc(rawValue: StyleURI.dark.rawValue)!

    /// The Mapbox Satellite style is a base-map of high-resolution satellite and aerial imagery.
    public static let satellite = StyleURIObjc(rawValue: StyleURI.satellite.rawValue)!

    /// The Mapbox Satellite Streets style combines the high-resolution satellite and aerial imagery
    /// of Mapbox Satellite with unobtrusive labels and translucent roads from Mapbox Streets.
    public static let satelliteStreets = StyleURIObjc(rawValue: StyleURI.satelliteStreets.rawValue)!
}
