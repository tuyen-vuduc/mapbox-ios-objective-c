import MapboxMaps

@objc open class TMBLayer: NSObject {
    private var _self: Layer
    init (_ _self: Layer) {
        self._self = _self
    }
    public var rawValue: Layer {
        return _self
    }
    
    /// Unique layer name
    @objc var id: String {
        get {
            _self.id
        }
        set {
            _self.id = newValue
        }
    }

    /// Rendering type of this layer.
    @objc var type: TMBLayerType {
        return _self.type.objcValue()!
    }

    /// An expression specifying conditions on source features.
    /// Only features that match the filter are displayed.
    @objc var filter: TMBExpression? {
        get {
            return _self.filter?.objcValue()
        }
        set {
            _self.filter = newValue?.rawValue
        }
    }

    /// Name of a source description to be used for this layer.
    /// Required for all layer types except background.
    @objc var source: String? {
        get {
            _self.source
        }
        set {
            _self.source = newValue
        }
    }

    /// Layer to use from a vector tile source.
    /// Required for vector tile sources.
    /// Prohibited for all other source types, including GeoJSON sources.
    @objc var sourceLayer: String? {
        get {
            _self.sourceLayer
        }
        set {
            _self.sourceLayer = newValue
        }
    }

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc var minZoom: NSNumber? {
        get {
            _self.minZoom?.NSNumber
        }
        set {
            _self.minZoom = newValue?.doubleValue
        }
    }

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc var maxZoom: NSNumber? {
        get {
            _self.maxZoom?.NSNumber
        }
        set {
            _self.maxZoom = newValue?.doubleValue
        }
    }
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
    public var id: String {
        get {
            return _self.id
        }
        set {
            _self.id = newValue
        }
    }

    /// The type of the layer
    public var type: TMBLayerType {
        get {
            return _self.type.objcValue()!
        }
        set {
            _self.type = newValue.swiftValue()!
        }
    }
}
