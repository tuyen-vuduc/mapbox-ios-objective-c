import MapboxMaps
extension SourceType {
    func objcValue() -> TMBSourceType {
        TMBSourceType(value: self)
    }
}
@objc
open class TMBSourceType :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }
    init(value: SourceType) {
        self.value = value.rawValue
    }
    func swiftValue() -> SourceType{
        SourceType(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }
        
    /// A vector tile source.
    @objc
    public static let vector:TMBSourceType = TMBSourceType(value: .vector)

    /// A raster tile source.
    @objc
    public static let raster:TMBSourceType = TMBSourceType(value: .raster)

    /// A raster DEM source.
    @objc
    public static let rasterDem:TMBSourceType = TMBSourceType(value: .rasterDem)

    /// A GeoJSON source.
    @objc
    public static let geoJson:TMBSourceType = TMBSourceType(value: .geoJson)

    /// An image source.
    @objc
    public static let image:TMBSourceType = TMBSourceType(value: .image)

    /// A model source
    @objc
    public static let model:TMBSourceType = TMBSourceType(value: .model)
}
