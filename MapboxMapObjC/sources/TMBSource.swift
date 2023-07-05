import MapboxMaps

@objc open class TMBSource: NSObject {
    private var _self: Source
    internal init(_ _self: Source) {
        self._self = _self
    }
    public var rawValue: Source {
        return _self
    }
    
    /// Rendering type of this source.
    @objc public var type: TMBSourceType {
        return TMBSourceType(_self.type)
    }
}


/// Information about a layer
@objc open class TMBSourceInfo: NSObject {
    private var _self: SourceInfo
    init(_ _self: SourceInfo) {
        self._self = _self
    }
    public var rawValue: SourceInfo {
        return _self
    }
    
    /// The identifier of the layer
    @objc public var id: String {
        get {
            return _self.id
        }
        set {
            _self.id = newValue
        }
    }

    /// The type of the layer
    @objc public var type: TMBSourceType {
        get {
            return TMBSourceType(_self.type)
        }
        set {
            _self.type = newValue.rawValue
        }
    }
}

@objc public enum TMBPromoteIdType: Int{
    case string
    case object
}

@objc open class TMBPromoteId : NSObject {
    private let _self: PromoteId
    init(_ _self: PromoteId) {
        self._self = _self
    }
    public var rawValue: PromoteId {
        return _self
    }
    
    @objc public var type: TMBPromoteIdType {
        switch(_self) {
        case .string(_):
            return .string
        case .object(_):
            return .object
        }
    }
    
    @objc public class func string(value: String) -> TMBPromoteId {
        return TMBPromoteId(.string(value))
    }
    
    @objc public class func object(value: [String: String]) -> TMBPromoteId {
        return TMBPromoteId(.object(value))
    }
}

extension PromoteId: ObjcConvertible {
    public func objcValue() -> TMBPromoteId {
        return TMBPromoteId(self)
    }
}

/// Captures potential values of the `data` property of a GeoJSONSource
@objc public enum TMBGeoJSONSourceType: Int {
    
    /// The `data` property can be a url
    case url
    
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
        case .url(_):
            return .url;
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
    
    @objc public class func empty() -> TMBGeoJSONSourceData {
        return TMBGeoJSONSourceData(.empty)
    }
}

extension GeoJSONSourceData: ObjcConvertible {
    public func objcValue() -> TMBGeoJSONSourceData {
        return TMBGeoJSONSourceData(self)
    }
}
