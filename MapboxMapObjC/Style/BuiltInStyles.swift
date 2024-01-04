import MapboxMaps
@objc
open class BuiltInStyles : NSObject {
    /// Mapbox Standard is a general-purpose style with 3D visualization.
    @objc
     public class var standard: String {
        StyleURI.standard.rawValue
    }
    
    /// Mapbox Streets is a general-purpose style with detailed road and transit networks.
    @objc
     public class var streets: String {
        StyleURI.streets.rawValue
    }

    /// Mapbox Outdoors is a general-purpose style tailored to outdoor activities.
    @objc
     public class var outdoors: String {
        StyleURI.outdoors.rawValue
    }

    /// Mapbox Light is a subtle, light-colored backdrop for data visualizations.
    @objc
     public class var light: String {
            StyleURI.light.rawValue
        }

    /// Mapbox Dark is a subtle, dark-colored backdrop for data visualizations.
    @objc
     public class var dark: String {
            StyleURI.dark.rawValue
        }

    /// The Mapbox Satellite style is a base-map of high-resolution satellite and aerial imagery.
    @objc
     public class var satellite: String {
            StyleURI.satellite.rawValue
        }

    /// The Mapbox Satellite Streets style combines the high-resolution satellite and aerial imagery
    /// of Mapbox Satellite with unobtrusive labels and translucent roads from Mapbox Streets.
    @objc
     public class var satelliteStreets: String {
            StyleURI.satelliteStreets.rawValue
        }
}
