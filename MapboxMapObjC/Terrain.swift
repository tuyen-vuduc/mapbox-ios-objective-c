import MapboxMaps

extension MapView {
    @objc public func setTerrain(_ value: TMBTerrain, onError: ((Error)->Void)?) {
        let swiftOnly = value.swiftOnly()
        
        do
        {
            try self.mapboxMap.style.setTerrain(swiftOnly)
        } catch {
            onError?(error)
        }
    }
}

@objc
open class TMBTerrain : NSObject {
    public var sourceId: String

    @objc public init(sourceId: String) {
        self.sourceId = sourceId
    }

    /// Exaggerates the elevation of the terrain by multiplying the data from the DEM with this value.
    @objc public var exaggeration: TMBValue?
}


extension TMBTerrain {
    func swiftOnly() -> Terrain {
        var result = Terrain(sourceId: self.sourceId)
        
        if let exaggeration = self.exaggeration,
           let doubleValue = exaggeration.constant as? Double {
            result.exaggeration = .constant(doubleValue)
        }
        
        return result;
    }
}
