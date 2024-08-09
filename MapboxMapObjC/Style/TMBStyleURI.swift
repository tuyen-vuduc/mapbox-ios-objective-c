import Foundation
import MapboxMaps


/// Enum representing the latest version of the Mapbox styles (as of publication). In addition,
/// you can provide a custom URL or earlier version of a Mapbox style by using the `.custom` case.
@objc open class TMBStyleURI: NSObject {
    public typealias RawValue = String

    public let origin: StyleURI
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: StyleURI(rawValue: rawValue)!)
    }

    public init(origin: StyleURI) {
       self.origin = origin
    }

    /// Mapbox Streets is a general-purpose style with detailed road and transit networks.
    @objc public static let streets = TMBStyleURI(origin: StyleURI.streets)

    /// Mapbox Outdoors is a general-purpose style tailored to outdoor activities.
    @objc public static let outdoors = TMBStyleURI(origin: StyleURI.outdoors)

    /// Mapbox Light is a subtle, light-colored backdrop for data visualizations.
    @objc public static let light = TMBStyleURI(origin: StyleURI.light)

    /// Mapbox Dark is a subtle, dark-colored backdrop for data visualizations.
    @objc public static let dark = TMBStyleURI(origin: StyleURI.dark)

    /// The Mapbox Satellite style is a base-map of high-resolution satellite and aerial imagery.
    @objc public static let satellite = TMBStyleURI(origin: StyleURI.satellite)

    /// The Mapbox Satellite Streets style combines the high-resolution satellite and aerial imagery
    /// of Mapbox Satellite with unobtrusive labels and translucent roads from Mapbox Streets.
    @objc public static let satelliteStreets = TMBStyleURI(origin: StyleURI.satelliteStreets)

    /// Mapbox Standard is a general-purpose style with 3D visualization.
    @objc public static let standard = TMBStyleURI(origin: StyleURI.standard)
}
extension StyleURI {
    func wrap() -> TMBStyleURI {
        TMBStyleURI(origin: self)
    }
}
extension TMBStyleURI {
    func unwrap() -> StyleURI {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func styleURI(_ value: TMBStyleURI) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
