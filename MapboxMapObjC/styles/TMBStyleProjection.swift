import MapboxMaps
/// Describes the projection used to render the map.
@objc open class TMBStyleProjection: NSObject {
    private var _self: StyleProjection
    init(_ _self: StyleProjection) {
        self._self = _self
    }
    public var rawValue: StyleProjection {
        return _self
    }

    /// The name of the projection.
    @objc public var name: TMBStyleProjectionName {
        get {
            _self.name.objcValue()
        }
        set {
            _self.name = newValue.swiftValue()
        }
    }

    /// Initializes a projection
    @objc public init(name: TMBStyleProjectionName) {
        self._self = StyleProjection(name: name.swiftValue())
    }
}

extension StyleProjection {
    func objcValue() -> TMBStyleProjection {
        return TMBStyleProjection(self)
    }
}
