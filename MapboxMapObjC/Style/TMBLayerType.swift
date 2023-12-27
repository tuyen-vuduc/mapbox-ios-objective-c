import Foundation
import MapboxMaps
import MapboxCoreMaps
import MapboxMaps

/// Struct of supported Layer rendering types
@objc open class TMBLayerType: NSObject {

    /// A filled polygon with an optional stroked border.
    @objc public static let fill = TMBLayerType(origin: LayerType.fill)

    /// A stroked line.
    @objc public static let line = TMBLayerType(origin: LayerType.line)

    /// An icon or a text label.
    @objc public static let symbol = TMBLayerType(origin: LayerType.symbol)

    /// A filled circle.
    @objc public static let circle = TMBLayerType(origin: LayerType.circle)

    /// A heatmap.
    @objc public static let heatmap = TMBLayerType(origin: LayerType.heatmap)

    /// An extruded (3D) polygon.
    @objc public static let fillExtrusion = TMBLayerType(origin: LayerType.fillExtrusion)

    /// Raster map textures such as satellite imagery.
    @objc public static let raster = TMBLayerType(origin: LayerType.raster)

    /// Client-side hillshading visualization based on DEM data.
    /// Currently, the implementation only supports Mapbox Terrain RGB and Mapzen Terrarium tiles.
    @objc public static let hillshade = TMBLayerType(origin: LayerType.hillshade)

    /// The background color or pattern of the map.
    @objc public static let background = TMBLayerType(origin: LayerType.background)

    /// Layer representing the location indicator
    @objc public static let locationIndicator = TMBLayerType(origin: LayerType.locationIndicator)

    /// Layer representing the sky
    @objc public static let sky = TMBLayerType(origin: LayerType.sky)

    /// Layer with custom rendering implementation (``CustomLayerHost``)
    ///
    /// - SeeAlso: ``CustomLayer``
    @objc public static let custom = TMBLayerType(origin: LayerType.custom)
    public let origin: LayerType
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: LayerType(rawValue: rawValue))
    }

    public init(origin: LayerType) {
       self.origin = origin
    }
}
extension LayerType {
    func wrap() -> TMBLayerType {
        TMBLayerType(origin: self)
    }
}
extension TMBLayerType {
    func unwrap() -> LayerType {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func layerType(_ value: TMBLayerType) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == LayerType {
    func layerType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [LayerType] {
    func arrayOfLayerType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func layerType() -> Value<LayerType>? {
        if let constant = self.constant as? String {
            return Value.constant(LayerType(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfLayerType() -> Value<[LayerType]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ LayerType(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}