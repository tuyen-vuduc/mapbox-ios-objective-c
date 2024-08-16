// This file is generated.
import UIKit
import MapboxMaps

/// Client-side hillshading visualization based on DEM data. Currently, the implementation only supports Mapbox Terrain RGB and Mapzen Terrarium tiles.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-hillshade)
@objc open class TMBHillshadeLayer: NSObject, TMBLayer {
    @objc public init(id: String, source: String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.hillshade
        self.visibility = .visibility(.visible)
    }

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
    @objc public var id: String

    /// Rendering type of this layer.
    @objc public let type: TMBLayerType

    /// An expression specifying conditions on source features.
    /// Only features that match the filter are displayed.
    @objc public var filter: TMBExpression?

    /// Name of a source description to be used for this layer.
    /// Required for all layer types except ``BackgroundLayer``, ``SkyLayer``, and ``LocationIndicatorLayer``.
    @objc public var source: String?

    /// Layer to use from a vector tile source.
    ///
    /// Required for vector tile sources.
    /// Prohibited for all other source types, including GeoJSON sources.
    @objc public var sourceLayer: String?

    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc public var slot: TMBSlot?

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc public var minZoom: NSNumber?

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc public var maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var visibility: TMBValue

    /// The shading color used to accentuate rugged terrain like sharp cliffs and gorges.
    /// Default value: "#000000".
    @objc public var hillshadeAccentColor: TMBValue?

    /// Transition options for `hillshadeAccentColor`.
    @objc public var hillshadeAccentColorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features.
    /// Default value: 0. Minimum value: 0.
    @objc public var hillshadeEmissiveStrength: TMBValue?

    /// Transition options for `hillshadeEmissiveStrength`.
    @objc public var hillshadeEmissiveStrengthTransition: TMBStyleTransition?

    /// Intensity of the hillshade
    /// Default value: 0.5. Value range: [0, 1]
    @objc public var hillshadeExaggeration: TMBValue?

    /// Transition options for `hillshadeExaggeration`.
    @objc public var hillshadeExaggerationTransition: TMBStyleTransition?

    /// The shading color of areas that faces towards the light source.
    /// Default value: "#FFFFFF".
    @objc public var hillshadeHighlightColor: TMBValue?

    /// Transition options for `hillshadeHighlightColor`.
    @objc public var hillshadeHighlightColorTransition: TMBStyleTransition?

    /// Direction of light source when map is rotated.
    /// Default value: "viewport".
    @objc public var hillshadeIlluminationAnchor: TMBValue?

    /// The direction of the light source used to generate the hillshading with 0 as the top of the viewport if `hillshade-illumination-anchor` is set to `viewport` and due north if `hillshade-illumination-anchor` is set to `map` and no 3d lights enabled. If `hillshade-illumination-anchor` is set to `map` and 3d lights enabled, the direction from 3d lights is used instead.
    /// Default value: 335. Value range: [0, 359]
    @objc public var hillshadeIlluminationDirection: TMBValue?

    /// The shading color of areas that face away from the light source.
    /// Default value: "#000000".
    @objc public var hillshadeShadowColor: TMBValue?

    /// Transition options for `hillshadeShadowColor`.
    @objc public var hillshadeShadowColorTransition: TMBStyleTransition?

}

extension TMBHillshadeLayer {
    func mapTo(_ source: inout HillshadeLayer) {
        source.id = self.id
        source.filter = self.filter?.expression()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.hillshadeAccentColor = self.hillshadeAccentColor?.styleColor()
        source.hillshadeAccentColorTransition = self.hillshadeAccentColorTransition?.styleTransition()
        source.hillshadeEmissiveStrength = self.hillshadeEmissiveStrength?.double()
        source.hillshadeEmissiveStrengthTransition = self.hillshadeEmissiveStrengthTransition?.styleTransition()
        source.hillshadeExaggeration = self.hillshadeExaggeration?.double()
        source.hillshadeExaggerationTransition = self.hillshadeExaggerationTransition?.styleTransition()
        source.hillshadeHighlightColor = self.hillshadeHighlightColor?.styleColor()
        source.hillshadeHighlightColorTransition = self.hillshadeHighlightColorTransition?.styleTransition()
        source.hillshadeIlluminationAnchor = self.hillshadeIlluminationAnchor?.hillshadeIlluminationAnchor()
        source.hillshadeIlluminationDirection = self.hillshadeIlluminationDirection?.double()
        source.hillshadeShadowColor = self.hillshadeShadowColor?.styleColor()
        source.hillshadeShadowColorTransition = self.hillshadeShadowColorTransition?.styleTransition()
    }
}

extension HillshadeLayer {
    func mapTo(_ source:inout TMBHillshadeLayer) {
        source.id = self.id
        source.filter = self.filter?.wrap()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.hillshadeAccentColor = self.hillshadeAccentColor?.styleColor()
        source.hillshadeAccentColorTransition = self.hillshadeAccentColorTransition?.wrap()
        source.hillshadeEmissiveStrength = self.hillshadeEmissiveStrength?.double()
        source.hillshadeEmissiveStrengthTransition = self.hillshadeEmissiveStrengthTransition?.wrap()
        source.hillshadeExaggeration = self.hillshadeExaggeration?.double()
        source.hillshadeExaggerationTransition = self.hillshadeExaggerationTransition?.wrap()
        source.hillshadeHighlightColor = self.hillshadeHighlightColor?.styleColor()
        source.hillshadeHighlightColorTransition = self.hillshadeHighlightColorTransition?.wrap()
        source.hillshadeIlluminationAnchor = self.hillshadeIlluminationAnchor?.hillshadeIlluminationAnchor()
        source.hillshadeIlluminationDirection = self.hillshadeIlluminationDirection?.double()
        source.hillshadeShadowColor = self.hillshadeShadowColor?.styleColor()
        source.hillshadeShadowColorTransition = self.hillshadeShadowColorTransition?.wrap()
    }
}

extension TMBHillshadeLayer: SwiftValueConvertible {
    public func unwrap() -> HillshadeLayer {
        var result = HillshadeLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}

extension HillshadeLayer {
    func wrap() -> TMBHillshadeLayer {
        var result = TMBHillshadeLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}