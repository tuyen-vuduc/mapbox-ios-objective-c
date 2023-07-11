// This file is generated.
import Foundation
import MapboxMaps

/// Client-side hillshading visualization based on DEM data. Currently, the implementation only supports Mapbox Terrain RGB and Mapzen Terrarium tiles.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-hillshade)
@objc open class TMBHillshadeLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.hillshade)
        
        self.visibility = TMBValue(constant: TMBVisibility.visible)
    }
    
    private init(_ id: String = UUID().uuidString, type: TMBLayerType) {
        self.id = id
        self.type = type
    }

    // MARK: - Conformance to `Layer` protocol
    @objc public var id : String
    @objc public let type : TMBLayerType
    @objc public var filter : TMBExpression?
    @objc public var source : String?
    @objc public var sourceLayer : String?
    @objc public var minZoom : NSNumber?
    @objc public var maxZoom : NSNumber?

    /// Whether this layer is displayed.
    @objc public var visibility : TMBValue?

    /// The shading color used to accentuate rugged terrain like sharp cliffs and gorges.
    @objc public var hillshadeAccentColor : TMBValue?

    /// Transition options for `hillshadeAccentColor`.
    @objc public var hillshadeAccentColorTransition : TMBStyleTransition?

    /// Intensity of the hillshade
    @objc public var hillshadeExaggeration : TMBValue?

    /// Transition options for `hillshadeExaggeration`.
    @objc public var hillshadeExaggerationTransition : TMBStyleTransition?

    /// The shading color of areas that faces towards the light source.
    @objc public var hillshadeHighlightColor : TMBValue?

    /// Transition options for `hillshadeHighlightColor`.
    @objc public var hillshadeHighlightColorTransition : TMBStyleTransition?

    /// Direction of light source when map is rotated.
    @objc public var hillshadeIlluminationAnchor : TMBValue?

    /// The direction of the light source used to generate the hillshading with 0 as the top of the viewport if `hillshade-illumination-anchor` is set to `viewport` and due north if `hillshade-illumination-anchor` is set to `map`.
    @objc public var hillshadeIlluminationDirection : TMBValue?

    /// The shading color of areas that face away from the light source.
    @objc public var hillshadeShadowColor : TMBValue?

    /// Transition options for `hillshadeShadowColor`.
    @objc public var hillshadeShadowColorTransition : TMBStyleTransition?

}

extension TMBHillshadeLayer {
    public func mapTo(_ layer: inout HillshadeLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.hillshadeAccentColor = self.hillshadeAccentColor?.styleColor()
        layer.hillshadeAccentColorTransition = self.hillshadeAccentColorTransition?.styleTransition()
        layer.hillshadeExaggeration = self.hillshadeExaggeration?.double()
        layer.hillshadeExaggerationTransition = self.hillshadeExaggerationTransition?.styleTransition()
        layer.hillshadeHighlightColor = self.hillshadeHighlightColor?.styleColor()
        layer.hillshadeHighlightColorTransition = self.hillshadeHighlightColorTransition?.styleTransition()
        layer.hillshadeIlluminationAnchor = self.hillshadeIlluminationAnchor?.hillshadeIlluminationAnchor()
        layer.hillshadeIlluminationDirection = self.hillshadeIlluminationDirection?.double()
        layer.hillshadeShadowColor = self.hillshadeShadowColor?.styleColor()
        layer.hillshadeShadowColorTransition = self.hillshadeShadowColorTransition?.styleTransition()
    }
}

extension HillshadeLayer {
    public func mapTo(_ layer:inout TMBHillshadeLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = TMBValue.fromSwiftValue(self.visibility)
        layer.hillshadeAccentColor = TMBValue.fromSwiftValue(self.hillshadeAccentColor)
        layer.hillshadeAccentColorTransition = self.hillshadeAccentColorTransition?.objcValue()
        layer.hillshadeExaggeration = TMBValue.fromSwiftValue(self.hillshadeExaggeration)
        layer.hillshadeExaggerationTransition = self.hillshadeExaggerationTransition?.objcValue()
        layer.hillshadeHighlightColor = TMBValue.fromSwiftValue(self.hillshadeHighlightColor)
        layer.hillshadeHighlightColorTransition = self.hillshadeHighlightColorTransition?.objcValue()
        layer.hillshadeIlluminationAnchor = TMBValue.fromSwiftValue(self.hillshadeIlluminationAnchor)
        layer.hillshadeIlluminationDirection = TMBValue.fromSwiftValue(self.hillshadeIlluminationDirection)
        layer.hillshadeShadowColor = TMBValue.fromSwiftValue(self.hillshadeShadowColor)
        layer.hillshadeShadowColorTransition = self.hillshadeShadowColorTransition?.objcValue()
    }
}

extension TMBHillshadeLayer: SwiftValueConvertible {
    public func swiftValue() -> HillshadeLayer {
        var layer = HillshadeLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension HillshadeLayer: ObjcConvertible {
    public func objcValue() ->  TMBHillshadeLayer {
        var layer = TMBHillshadeLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}