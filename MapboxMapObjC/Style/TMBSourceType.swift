import Foundation
import MapboxMaps

/// Struct of supported Source Types
/// Docs : https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/
@objc open class TMBSourceType: NSObject {
    public let origin: SourceType
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: SourceType(rawValue: rawValue))
    }

    public init(origin: SourceType) {
       self.origin = origin
    }

    /// The raw value of the source type.

    /// A vector tile source.
    @objc public static let vector = TMBSourceType(origin: SourceType.vector)

    /// A raster tile source.
    @objc public static let raster = TMBSourceType(origin: SourceType.raster)

    /// A raster DEM source.
    @objc public static let rasterDem = TMBSourceType(origin: SourceType.rasterDem)

    /// A GeoJSON source.
    @objc public static let geoJson = TMBSourceType(origin: SourceType.geoJson)

    /// An image source.
    @objc public static let image = TMBSourceType(origin: SourceType.image)

    /// A model source.
    @objc public static let model = TMBSourceType(origin: SourceType.model)

    /// A raster array tile source.
        //@_spi(Experimental)
//    @objc public static let rasterArray = TMBSourceType(origin: SourceType.rasterArray)

    /// A custom geometry source.
    @objc public static let customGeometry = TMBSourceType(origin: SourceType.customGeometry)

    /// A custom raster source.
        //@_spi(Experimental)
//    @objc public static let customRaster = TMBSourceType(origin: SourceType.customRaster)

}
extension SourceType: ObjcConvertible {
    public func wrap() -> TMBSourceType {
        TMBSourceType(origin: self)
    }
    func sourceType() -> TMBSourceType { wrap() }
}
extension TMBSourceType: SwiftValueConvertible {
    public func unwrap() -> SourceType {
        self.origin
    }
    func sourceType() -> SourceType { unwrap() }
}
@objc extension TMBValue {
    @objc public class func sourceType(_ sourceType: TMBSourceType) -> TMBValue {
        return TMBValue(constant: sourceType.rawValue)
    }
}
extension MapboxMaps.Value where T == SourceType {
    func sourceType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [SourceType] {
    func arrayOfSourceType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension TMBValue {
    func sourceType() -> Value<SourceType>? {
        if let constant = self.constant as? String {
            return Value.constant(SourceType(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOfSourceType() -> Value<[SourceType]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ SourceType(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}


    /// The associated Swift struct type
