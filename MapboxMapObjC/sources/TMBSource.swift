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
    @objc var type: TMBSourceType {
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
    public var id: String {
        get {
            return _self.id
        }
        set {
            _self.id = newValue
        }
    }

    /// The type of the layer
    public var type: TMBSourceType {
        get {
            return TMBSourceType(_self.type)
        }
        set {
            _self.type = newValue.rawValue
        }
    }
}
