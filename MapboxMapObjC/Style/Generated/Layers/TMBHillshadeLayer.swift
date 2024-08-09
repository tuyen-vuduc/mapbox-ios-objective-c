// This file is generated.
import Foundation
import MapboxMaps


/// Client-side hillshading visualization based on DEM data. Currently, the implementation only supports Mapbox Terrain RGB and Mapzen Terrarium tiles.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-hillshade)
@objc open class TMBHillshadeLayer: NSObject, TMBLayer {

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
    @objc public var  id: String

    /// Rendering type of this layer.
    @objc public let  type: TMBLayerType

    /// An expression specifying conditions on source features.
    /// Only features that match the filter are displayed.
    @objc public var  filter: TMBExpression?

    /// Name of a source description to be used for this layer.
    /// Required for all layer types except ``BackgroundLayer``, ``SkyLayer``, and ``LocationIndicatorLayer``.
    @objc public var  source: String?

    /// Layer to use from a vector tile source.
    ///
    /// Required for vector tile sources.
    /// Prohibited for all other source types, including GeoJSON sources.
    @objc public var  sourceLayer: String?
    
    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc public var  slot: TMBSlot?

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc public var  minZoom: NSNumber?

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc public var  maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var  visibility: TMBValue

    /// The shading color used to accentuate rugged terrain like sharp cliffs and gorges.
    @objc public var  hillshadeAccentColor: TMBValue?

    /// Transition options for `hillshadeAccentColor`.
    @objc public var  hillshadeAccentColorTransition: TMBStyleTransition?

    /// Intensity of the hillshade
    @objc public var  hillshadeExaggeration: TMBValue?

    /// Transition options for `hillshadeExaggeration`.
    @objc public var  hillshadeExaggerationTransition: TMBStyleTransition?

    /// The shading color of areas that faces towards the light source.
    @objc public var  hillshadeHighlightColor: TMBValue?

    /// Transition options for `hillshadeHighlightColor`.
    @objc public var  hillshadeHighlightColorTransition: TMBStyleTransition?

    /// Direction of light source when map is rotated.
    @objc public var  hillshadeIlluminationAnchor: TMBValue?

    /// The direction of the light source used to generate the hillshading with 0 as the top of the viewport if `hillshade-illumination-anchor` is set to `viewport` and due north if `hillshade-illumination-anchor` is set to `map`.
    @objc public var  hillshadeIlluminationDirection: TMBValue?

    /// The shading color of areas that face away from the light source.
    @objc public var  hillshadeShadowColor: TMBValue?

    /// Transition options for `hillshadeShadowColor`.
    @objc public var  hillshadeShadowColorTransition: TMBStyleTransition?

    
    @objc public init(id : String, source : String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.hillshade
        self.visibility = .visibility(.visible)
    }
}
extension TMBHillshadeLayer: SwiftValueConvertible {
    public func unwrap() -> HillshadeLayer {
        var result = HillshadeLayer(id: self.id,
            source: self.source!)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout HillshadeLayer) {
        dest.filter = self.filter?.unwrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.unwrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.hillshadeAccentColor = self.hillshadeAccentColor?.styleColor()
        dest.hillshadeAccentColorTransition = self.hillshadeAccentColorTransition?.unwrap()
        dest.hillshadeExaggeration = self.hillshadeExaggeration?.double()
        dest.hillshadeExaggerationTransition = self.hillshadeExaggerationTransition?.unwrap()
        dest.hillshadeHighlightColor = self.hillshadeHighlightColor?.styleColor()
        dest.hillshadeHighlightColorTransition = self.hillshadeHighlightColorTransition?.unwrap()
        dest.hillshadeIlluminationAnchor = self.hillshadeIlluminationAnchor?.hillshadeIlluminationAnchor()
        dest.hillshadeIlluminationDirection = self.hillshadeIlluminationDirection?.double()
        dest.hillshadeShadowColor = self.hillshadeShadowColor?.styleColor()
        dest.hillshadeShadowColorTransition = self.hillshadeShadowColorTransition?.unwrap()
    }
}
extension HillshadeLayer {
    func wrap() -> TMBHillshadeLayer {
        var result = TMBHillshadeLayer(id: self.id,
          source: self.source!)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBHillshadeLayer)  {
        dest.filter = self.filter?.wrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.wrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.hillshadeAccentColor = self.hillshadeAccentColor?.styleColor()
        dest.hillshadeAccentColorTransition = self.hillshadeAccentColorTransition?.wrap()
        dest.hillshadeExaggeration = self.hillshadeExaggeration?.double()
        dest.hillshadeExaggerationTransition = self.hillshadeExaggerationTransition?.wrap()
        dest.hillshadeHighlightColor = self.hillshadeHighlightColor?.styleColor()
        dest.hillshadeHighlightColorTransition = self.hillshadeHighlightColorTransition?.wrap()
        dest.hillshadeIlluminationAnchor = self.hillshadeIlluminationAnchor?.hillshadeIlluminationAnchor()
        dest.hillshadeIlluminationDirection = self.hillshadeIlluminationDirection?.double()
        dest.hillshadeShadowColor = self.hillshadeShadowColor?.styleColor()
        dest.hillshadeShadowColorTransition = self.hillshadeShadowColorTransition?.wrap()
    }
}
