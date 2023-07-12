import MapboxMaps

@objc
open class TMBTerrain : NSObject {
    private var _self: Terrain
    init(_ _self: Terrain) {
        self._self = _self
    }
    public var rawValue: Terrain {
        return _self
    }
    
    @objc public var sourceId: String {
        get {
            _self.source
        }
        set {
            _self.source = newValue
        }
    }

    /// Exaggerates the elevation of the terrain by multiplying the data from the DEM with this value.
    @objc public var exaggeration: TMBValue? {
        get {
            return _self.exaggeration?.double()
        }
        set {
            _self.exaggeration = newValue?.double()
        }
    }
    
    @objc public init(sourceId: String) {
        self._self = Terrain(sourceId: sourceId)
    }
}

extension Terrain: ObjcConvertible {
    public func objcValue() -> TMBTerrain {
        return TMBTerrain(self)
    }
}
