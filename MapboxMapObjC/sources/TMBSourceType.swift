import MapboxMaps
extension SourceType {
    func objcValue() -> TMBSourceType {
        TMBSourceType(self)
    }
}
@objc
open class TMBSourceType :NSObject, NamedString {
    private let _self: SourceType
    init(_ value: SourceType) {
        self._self = value
    }
    public var rawValue: SourceType {
        return _self
    }
    
    @objc
    public func stringValue() -> String {
        return _self.rawValue
    }
        
    /// A vector tile source.
    @objc
    public static let vector:TMBSourceType = TMBSourceType(.vector)

    /// A raster tile source.
    @objc
    public static let raster:TMBSourceType = TMBSourceType(.raster)

    /// A raster DEM source.
    @objc
    public static let rasterDem:TMBSourceType = TMBSourceType(.rasterDem)

    /// A GeoJSON source.
    @objc
    public static let geoJson:TMBSourceType = TMBSourceType(.geoJson)

    /// An image source.
    @objc
    public static let image:TMBSourceType = TMBSourceType(.image)

    /// A model source
    @objc
    public static let model:TMBSourceType = TMBSourceType(.model)
}
