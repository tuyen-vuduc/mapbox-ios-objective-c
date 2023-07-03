import Foundation
import MapboxMaps

/// Layer rendering types
@objc public enum TMBLayerType: Int {
    /// A filled polygon with an optional stroked border.
    case fill

    /// A stroked line.
    case line

    /// An icon or a text label.
    case symbol

    /// A filled circle.
    case circle

    /// A heatmap.
    case heatmap

    /// An extruded (3D) polygon.
    case fillExtrusion

    /// Raster map textures such as satellite imagery.
    case raster

    /// Client-side hillshading visualization based on DEM data.
    /// Currently, the implementation only supports Mapbox Terrain RGB and Mapzen Terrarium tiles.
    case hillshade

    /// The background color or pattern of the map.
    case background

    /// Layer representing the location indicator
    case locationIndicator

    /// Layer representing the sky
    case sky

    public init?(rawValue: String) {
        guard let matchingCase = TMBLayerType.supportedTypes.first(where: { $0.value == rawValue }) else {
            return nil
        }

        self = matchingCase.key
    }
    
    public static let supportedTypes: [TMBLayerType: String] = [
        .fill: "fill",
        .line: "line",
        .symbol: "symbol",
        .circle: "circle",
        .heatmap: "heatmap",
        .fillExtrusion: "fill-extrusion",
        .raster: "raster",
        .hillshade: "hillshade",
        .background: "background",
        .locationIndicator: "location-indicator",
        .sky: "sky"
    ]
}

extension TMBLayerType {
    public static let layerTypeMapping: [TMBLayerType: LayerType] = [
        .fill: .fill,
        .line: .line,
        .symbol: .symbol,
        .circle: .circle,
        .heatmap: .heatmap,
        .fillExtrusion: .fillExtrusion,
        .raster: .raster,
        .hillshade: .hillshade,
        .background: .background,
        .locationIndicator: .locationIndicator,
        .sky: .sky
    ]
    
    public func swiftValue() -> LayerType? {
        return TMBLayerType.layerTypeMapping[self]
    }
}

extension LayerType {
    public static let layerTypeMapping: [LayerType: TMBLayerType] = [
        .fill: .fill,
        .line: .line,
        .symbol: .symbol,
        .circle: .circle,
        .heatmap: .heatmap,
        .fillExtrusion: .fillExtrusion,
        .raster: .raster,
        .hillshade: .hillshade,
        .background: .background,
        .locationIndicator: .locationIndicator,
        .sky: .sky
    ]
    
    public func objcValue() -> TMBLayerType? {
        return LayerType.layerTypeMapping[self]
    }
}
