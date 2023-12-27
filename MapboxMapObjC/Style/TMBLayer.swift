import MapboxMaps

@objc public protocol TMBLayer {
    /// Unique layer name
    @objc var id: String { get }
    
    /// Rendering type of this layer.
    @objc var type: TMBLayerType { get }
    
    /// An expression specifying conditions on source features.
    /// Only features that match the filter are displayed.
    @objc var filter: TMBExpression? { get set }
    
    /// Name of a source description to be used for this layer.
    /// Required for all layer types except background.
    @objc var source: String? { get set }
    
    /// Layer to use from a vector tile source.
    /// Required for vector tile sources.
    /// Prohibited for all other source types, including GeoJSON sources.
    @objc var sourceLayer: String? { get set }
    
    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc var minZoom: NSNumber? { get set }
    
    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc var maxZoom: NSNumber? { get set }
}

public protocol SwiftValueConvertible<T> {
    associatedtype T
    func swiftValue() -> T
}

/// Information about a layer
@objc open class TMBLayerInfo: NSObject {
    private var _self: LayerInfo
    init(_ _self: LayerInfo) {
        self._self = _self
    }
    public var rawValue: LayerInfo {
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
    @objc public var type: TMBLayerType {
        get {
            return _self.type.objcValue()
        }
        set {
            _self.type = newValue.swiftValue()
        }
    }
}
