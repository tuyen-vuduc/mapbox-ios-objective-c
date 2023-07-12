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

    @available(*, deprecated, message: "Unsupported layer type")
    case model

}

@objc extension TMBValue {
    @objc public class func layerType(_ layerType: TMBLayerType) -> TMBValue {
        return TMBValue(constant: NSNumber(value: layerType.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withLayerType layerType: TMBLayerType) -> NSNumber {
        return NSNumber(value: layerType.rawValue)
    }
    
    @objc public func layerType() -> TMBLayerType {
        return TMBLayerType(rawValue: self.intValue)!
    }
}

extension NSNumber {
    public var LayerType: LayerType {
        return layerType().swiftValue()
    }
}

extension TMBLayerType: SwiftValueConvertible {
    public func swiftValue() -> LayerType {
        switch(self) {
            case .fill:
                return .fill
            case .line:
                return .line
            case .symbol:
                return .symbol
            case .circle:
                return .circle
            case .heatmap:
                return .heatmap
            case .fillExtrusion:
                return .fillExtrusion
            case .raster:
                return .raster
            case .hillshade:
                return .hillshade
            case .background:
                return .background
            case .locationIndicator:
                return .locationIndicator
            case .sky:
                return .sky
            case .model:
                return .model
        }
    }

    func asNumber() -> NSNumber {
        return NSNumber(value: self.rawValue)
    }
}

extension LayerType: ObjcConvertible {
    public func objcValue() -> TMBLayerType {
        switch(self) {
            case .fill:
                return .fill
            case .line:
                return .line
            case .symbol:
                return .symbol
            case .circle:
                return .circle
            case .heatmap:
                return .heatmap
            case .fillExtrusion:
                return .fillExtrusion
            case .raster:
                return .raster
            case .hillshade:
                return .hillshade
            case .background:
                return .background
            case .locationIndicator:
                return .locationIndicator
            case .sky:
                return .sky
            case .model:
                return .model
        }
    }

    func asNumber() -> NSNumber {
        return NSNumber(value: objcValue().rawValue)
    }
}

extension MapboxMaps.Value where T == LayerType {
    func layerType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.asNumber())
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [LayerType] {
    func arrayOfLayerType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.asNumber() })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension TMBValue {
    func layerType() -> Value<LayerType>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.LayerType)
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOfLayerType() -> Value<[LayerType]>? {
        if let constant = self.constant as? [NSNumber] {
            return Value.constant(constant.map({ $0.LayerType }))
        }
        
        return Value.expression(expression!.rawValue)
    }
}



    /// The associated Swift struct type
