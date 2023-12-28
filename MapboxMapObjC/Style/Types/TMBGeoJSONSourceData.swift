import MapboxMaps

/// Captures potential values of the `data` property of a GeoJSONSource
@objc public enum TMBGeoJSONSourceType: Int {
    
    /// The `data` property can be an URL or inlined GeoJSON string.
    case string
    
    /// The `data` property can be a feature
    case feature
    
    /// The `data` property can be a feature collection
    case featureCollection
    
    /// The `data` property can be a geometry with no associated properties.
    case geometry
    
    /// Empty data to be used for initialization
    case empty
}

@objc open class TMBGeoJSONSourceData: NSObject {
    private let _self: GeoJSONSourceData
    init(_ _self: GeoJSONSourceData) {
        self._self = _self
    }
    public var rawValue: GeoJSONSourceData {
        return _self
    }
    
    @objc public var type: TMBGeoJSONSourceType {
        switch(_self) {
        case .string(_):
            return .string;
        case .feature(_):
            return .feature;
        case .featureCollection(_):
            return .featureCollection;
        case .geometry(_):
            return .geometry;
        case .empty:
            return .empty;
        }
    }
    
    @objc public class func url(url: URL) -> TMBGeoJSONSourceData {
        return TMBGeoJSONSourceData(.url(url))
    }
    
    @objc public class func string(string: String) -> TMBGeoJSONSourceData {
        return TMBGeoJSONSourceData(.string(string))
    }
    
    @objc public class func feature(feature: MapboxCommon.Feature) -> TMBGeoJSONSourceData {
        return TMBGeoJSONSourceData(.feature(Turf.Feature(feature)))
    }
    
    @objc public class func featureCollection(features: [MapboxCommon.Feature]) -> TMBGeoJSONSourceData {
        let xfeatures = features.map { Turf.Feature($0) }
        return TMBGeoJSONSourceData(.featureCollection(FeatureCollection(features: xfeatures)))
    }
    
    @objc public class func geometry(geometry: MapboxCommon.Geometry) -> TMBGeoJSONSourceData {
        return TMBGeoJSONSourceData(.geometry(Turf.Geometry(geometry)!))
    }
}

extension GeoJSONSourceData: ObjcConvertible {
    public func wrap() -> TMBGeoJSONSourceData {
        return TMBGeoJSONSourceData(self)
    }
    public func geoJSONSourceData() -> TMBGeoJSONSourceData {
        return wrap()
    }
}

extension TMBGeoJSONSourceData: SwiftValueConvertible {
    public func unwrap() -> GeoJSONSourceData {
        return self.rawValue
    }
    public func geoJSONSourceData() -> GeoJSONSourceData {
        return unwrap()
    }
}
