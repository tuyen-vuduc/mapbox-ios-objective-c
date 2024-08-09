// This file is generated.
import Foundation
import MapboxMaps


/// The global terrain source.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#terrain)
@objc open class TMBTerrain: NSObject {
    @objc public init(sourceId: String) {
        self.source = sourceId
    }

    @objc public var source: String
    @objc public var exaggeration: TMBValue?

}

extension TMBTerrain {
    public func mapTo(_ source: inout Terrain) {
        source.source = self.source
    }
}

extension Terrain {
    public func mapTo(_ source:inout TMBTerrain) {
        source.source = self.source
    }
}

extension TMBTerrain: SwiftValueConvertible {
    public func unwrap() -> Terrain {
        var source = Terrain(sourceId: self.source)
        
        self.mapTo(&source)
        
        return source
    }
}

extension Terrain {
    public func wrap() ->  TMBTerrain {
        var source = TMBTerrain(sourceId: self.source)
        
        self.mapTo(&source)
        
        return source
    }
}
