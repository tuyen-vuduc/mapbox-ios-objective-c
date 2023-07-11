import Foundation
import MapboxMaps

/// Enum of Source Types
/// Docs : https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/
@objc public enum TMBSourceType: Int {
    /// A vector tile source.
    case vector

    /// A raster tile source.
    case raster

    /// A raster DEM source.
    case rasterDem

    /// A GeoJSON source.
    case geoJson

    /// An image source.
    case image

    /// A model source
    case model

}
@objc extension TMBValue {
    @objc public class func sourceType(_ sourceType: TMBSourceType) -> TMBValue {
        return TMBValue(constant: NSNumber(value: sourceType.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withSourceType sourceType: TMBSourceType) -> NSNumber {
        return NSNumber(value: sourceType.rawValue)
    }
    
    @objc public func sourceType() -> TMBSourceType {
        return TMBSourceType(rawValue: self.intValue)!
    }
}

extension TMBSourceType: SwiftValueConvertible {
    public func swiftValue() -> SourceType {
        switch(self) {
            case .vector:
                return .vector
            case .raster:
                return .raster
            case .rasterDem:
                return .rasterDem
            case .geoJson:
                return .geoJson
            case .image:
                return .image
            case .model:
                return .model
        }
    }
}

extension SourceType: ObjcConvertible {
    public func objcValue() -> TMBSourceType {
        switch(self) {
            case .vector:
                return .vector
            case .raster:
                return .raster
            case .rasterDem:
                return .rasterDem
            case .geoJson:
                return .geoJson
            case .image:
                return .image
            case .model:
                return .model
        }
    }
}

    /// The associated Swift struct type
