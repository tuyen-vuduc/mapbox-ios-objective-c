import MapboxCoreMaps
import MapboxMaps
import MapboxCommon

/// Represents a specific feature rendered on the layer.
@objc open class TMBAnnotatedFeatureLayerFeature: NSObject {
    /// Identifier of the layer, that renders the feature.
    @objc public var layerId: String {
        origin.layerId
    }

    /// Feature identifier. If not specified, the annotation will appear on any feature from that layer.
    @objc public var featureId: String? {
        origin.featureId
    }
    
    public let origin: AnnotatedFeature.LayerFeature
    
    public init(origin: AnnotatedFeature.LayerFeature) {
        self.origin = origin
    }
}

/// Represents either a GeoJSON geometry or an annotated layer feature.
@objc open class TMBAnnotatedFeature: NSObject {

    /// GeoJSON geometry.
    @objc public var geometry: MapboxCommon.Geometry? {
        guard let g = self.origin.geometry else {
            return nil
        }
        
        return MapboxCommon.Geometry(g)
    }

    /// Layer feature.
    @objc public var layerFeature: TMBAnnotatedFeatureLayerFeature?
    
    public let origin: AnnotatedFeature
    public init(origin: AnnotatedFeature) {
        self.origin = origin
    }

    /// Creates Annotated feature from layer feature.
    ///
    /// - Parameters:
    ///   - layerId: Identifier of the layer, that renders the feature.
    ///   - featureId: Feature identifier. If not specified, the annotation will appear on any feature from that layer.
    @objc public static func layerFeature(layerId: String, featureId: String? = nil) -> TMBAnnotatedFeature {
        let origin = AnnotatedFeature.layerFeature(layerId: layerId, featureId: featureId)
        return TMBAnnotatedFeature(origin: origin)
    }

    /// Creates Annotated feature from GeoJSON geometry.
    ///
    /// - Parameters:
    ///  - geometry: A geometry-convertible object, such as `Point`, `LineString` and others.
    @objc public static func geometry(_ geometry: MapboxCommon.Geometry) -> TMBAnnotatedFeature {
        let origin = AnnotatedFeature.geometry(Turf.Geometry(geometry)!)
        return TMBAnnotatedFeature(origin: origin)
    }
}
extension TMBAnnotatedFeature {
    func unwrap() -> AnnotatedFeature {
        self.origin
    }
}
extension AnnotatedFeature {
    func wrap() -> TMBAnnotatedFeature {
        TMBAnnotatedFeature(origin: self)
    }
}
extension TMBAnnotatedFeatureLayerFeature {
    func unwrap() -> AnnotatedFeature.LayerFeature {
        self.origin
    }
}
extension AnnotatedFeature.LayerFeature {
    func wrap() -> TMBAnnotatedFeatureLayerFeature {
        TMBAnnotatedFeatureLayerFeature(origin: self)
    }
}
