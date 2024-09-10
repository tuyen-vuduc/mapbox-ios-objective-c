// This file is generated.
import UIKit
import MapboxMaps

/// An extruded (3D) polygon.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-fill-extrusion)
@objc open class TMBFillExtrusionLayer: NSObject, TMBLayer {
    @objc public init(id: String, source: String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.fillExtrusion
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

    /// Radius of a fill extrusion edge in meters. If not zero, rounds extrusion edges for a smoother appearance.
    /// Default value: 0. Value range: [0, 1]
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionEdgeRadius: Value<Double>?

    /// Provides a control to futher fine-tune the look of the ambient occlusion on the ground beneath the extruded buildings. Lower values give the effect a more solid look while higher values make it smoother.
    /// Default value: 0.69. Value range: [0, 1]
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionAmbientOcclusionGroundAttenuation: Value<Double>?

    /// Transition options for `fillExtrusionAmbientOcclusionGroundAttenuation`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionAmbientOcclusionGroundAttenuationTransition: StyleTransition?

    /// The extent of the ambient occlusion effect on the ground beneath the extruded buildings in meters.
    /// Default value: 3. Minimum value: 0.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionAmbientOcclusionGroundRadius: Value<Double>?

    /// Transition options for `fillExtrusionAmbientOcclusionGroundRadius`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionAmbientOcclusionGroundRadiusTransition: StyleTransition?

    /// Controls the intensity of shading near ground and concave angles between walls. Default value 0.0 disables ambient occlusion and values around 0.3 provide the most plausible results for buildings.
    /// Default value: 0. Value range: [0, 1]
    @objc public var fillExtrusionAmbientOcclusionIntensity: TMBValue?

    /// Transition options for `fillExtrusionAmbientOcclusionIntensity`.
    @objc public var fillExtrusionAmbientOcclusionIntensityTransition: TMBStyleTransition?

    /// Shades area near ground and concave angles between walls where the radius defines only vertical impact. Default value 3.0 corresponds to height of one floor and brings the most plausible results for buildings. This property works only with legacy light. When 3D lights are enabled `fill-extrusion-ambient-occlusion-wall-radius` and `fill-extrusion-ambient-occlusion-ground-radius` are used instead.
    /// Default value: 3. Minimum value: 0.
    @objc public var fillExtrusionAmbientOcclusionRadius: TMBValue?

    /// Transition options for `fillExtrusionAmbientOcclusionRadius`.
    @objc public var fillExtrusionAmbientOcclusionRadiusTransition: TMBStyleTransition?

    /// Shades area near ground and concave angles between walls where the radius defines only vertical impact. Default value 3.0 corresponds to height of one floor and brings the most plausible results for buildings.
    /// Default value: 3. Minimum value: 0.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionAmbientOcclusionWallRadius: Value<Double>?

    /// Transition options for `fillExtrusionAmbientOcclusionWallRadius`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionAmbientOcclusionWallRadiusTransition: StyleTransition?

    /// The height with which to extrude the base of this layer. Must be less than or equal to `fill-extrusion-height`.
    /// Default value: 0. Minimum value: 0.
    @objc public var fillExtrusionBase: TMBValue?

    /// Transition options for `fillExtrusionBase`.
    @objc public var fillExtrusionBaseTransition: TMBStyleTransition?

    /// The base color of the extruded fill. The extrusion's surfaces will be shaded differently based on this color in combination with the root `light` settings. If this color is specified as `rgba` with an alpha component, the alpha component will be ignored; use `fill-extrusion-opacity` to set layer opacity.
    /// Default value: "#000000".
    @objc public var fillExtrusionColor: TMBValue?

    /// Transition options for `fillExtrusionColor`.
    @objc public var fillExtrusionColorTransition: TMBStyleTransition?

    /// This parameter defines the range for the fade-out effect before an automatic content cutoff on pitched map views. Fade out is implemented by scaling down and removing buildings in the fade range in a staggered fashion. Opacity is not changed. The fade range is expressed in relation to the height of the map view. A value of 1.0 indicates that the content is faded to the same extent as the map's height in pixels, while a value close to zero represents a sharp cutoff. When the value is set to 0.0, the cutoff is completely disabled. Note: The property has no effect on the map if terrain is enabled.
    /// Default value: 0. Value range: [0, 1]
    @objc public var fillExtrusionCutoffFadeRange: TMBValue?

    /// Controls the intensity of light emitted on the source features.
    /// Default value: 0. Minimum value: 0.
    @objc public var fillExtrusionEmissiveStrength: TMBValue?

    /// Transition options for `fillExtrusionEmissiveStrength`.
    @objc public var fillExtrusionEmissiveStrengthTransition: TMBStyleTransition?

    /// The color of the flood light effect on the walls of the extruded buildings.
    /// Default value: "#ffffff".
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionFloodLightColor: Value<StyleColor>?

    /// Transition options for `fillExtrusionFloodLightColor`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionFloodLightColorTransition: StyleTransition?

    /// Provides a control to futher fine-tune the look of the flood light on the ground beneath the extruded buildings. Lower values give the effect a more solid look while higher values make it smoother.
    /// Default value: 0.69. Value range: [0, 1]
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionFloodLightGroundAttenuation: Value<Double>?

    /// Transition options for `fillExtrusionFloodLightGroundAttenuation`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionFloodLightGroundAttenuationTransition: StyleTransition?

    /// The extent of the flood light effect on the ground beneath the extruded buildings in meters.
    /// Default value: 0.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionFloodLightGroundRadius: Value<Double>?

    /// Transition options for `fillExtrusionFloodLightGroundRadius`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionFloodLightGroundRadiusTransition: StyleTransition?

    /// The intensity of the flood light color.
    /// Default value: 0. Value range: [0, 1]
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionFloodLightIntensity: Value<Double>?

    /// Transition options for `fillExtrusionFloodLightIntensity`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionFloodLightIntensityTransition: StyleTransition?

    /// The extent of the flood light effect on the walls of the extruded buildings in meters.
    /// Default value: 0. Minimum value: 0.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionFloodLightWallRadius: Value<Double>?

    /// Transition options for `fillExtrusionFloodLightWallRadius`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionFloodLightWallRadiusTransition: StyleTransition?

    /// The height with which to extrude this layer.
    /// Default value: 0. Minimum value: 0.
    @objc public var fillExtrusionHeight: TMBValue?

    /// Transition options for `fillExtrusionHeight`.
    @objc public var fillExtrusionHeightTransition: TMBStyleTransition?

    /// The opacity of the entire fill extrusion layer. This is rendered on a per-layer, not per-feature, basis, and data-driven styling is not available.
    /// Default value: 1. Value range: [0, 1]
    @objc public var fillExtrusionOpacity: TMBValue?

    /// Transition options for `fillExtrusionOpacity`.
    @objc public var fillExtrusionOpacityTransition: TMBStyleTransition?

    /// Name of image in sprite to use for drawing images on extruded fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var fillExtrusionPattern: TMBValue?

    /// Indicates whether top edges should be rounded when fill-extrusion-edge-radius has a value greater than 0. If false, rounded edges are only applied to the sides. Default is true.
    /// Default value: true.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionRoundedRoof: Value<Bool>?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up (on the flat plane), respectively.
    /// Default value: [0,0].
    @objc public var fillExtrusionTranslate: TMBValue?

    /// Transition options for `fillExtrusionTranslate`.
    @objc public var fillExtrusionTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `fill-extrusion-translate`.
    /// Default value: "map".
    @objc public var fillExtrusionTranslateAnchor: TMBValue?

    /// Whether to apply a vertical gradient to the sides of a fill-extrusion layer. If true, sides will be shaded slightly darker farther down.
    /// Default value: true.
    @objc public var fillExtrusionVerticalGradient: TMBValue?

    /// A global multiplier that can be used to scale base, height, AO, and flood light of the fill extrusions.
    /// Default value: 1. Minimum value: 0.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionVerticalScale: Value<Double>?

    /// Transition options for `fillExtrusionVerticalScale`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var fillExtrusionVerticalScaleTransition: StyleTransition?

}

extension TMBFillExtrusionLayer {
    func mapTo(_ source: inout FillExtrusionLayer) {
        source.id = self.id
        source.filter = self.filter?.expression()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.fillExtrusionAmbientOcclusionIntensity = self.fillExtrusionAmbientOcclusionIntensity?.double()
        source.fillExtrusionAmbientOcclusionIntensityTransition = self.fillExtrusionAmbientOcclusionIntensityTransition?.styleTransition()
        source.fillExtrusionAmbientOcclusionRadius = self.fillExtrusionAmbientOcclusionRadius?.double()
        source.fillExtrusionAmbientOcclusionRadiusTransition = self.fillExtrusionAmbientOcclusionRadiusTransition?.styleTransition()
        source.fillExtrusionBase = self.fillExtrusionBase?.double()
        source.fillExtrusionBaseTransition = self.fillExtrusionBaseTransition?.styleTransition()
        source.fillExtrusionColor = self.fillExtrusionColor?.styleColor()
        source.fillExtrusionColorTransition = self.fillExtrusionColorTransition?.styleTransition()
        source.fillExtrusionCutoffFadeRange = self.fillExtrusionCutoffFadeRange?.double()
        source.fillExtrusionEmissiveStrength = self.fillExtrusionEmissiveStrength?.double()
        source.fillExtrusionEmissiveStrengthTransition = self.fillExtrusionEmissiveStrengthTransition?.styleTransition()
        source.fillExtrusionHeight = self.fillExtrusionHeight?.double()
        source.fillExtrusionHeightTransition = self.fillExtrusionHeightTransition?.styleTransition()
        source.fillExtrusionOpacity = self.fillExtrusionOpacity?.double()
        source.fillExtrusionOpacityTransition = self.fillExtrusionOpacityTransition?.styleTransition()
        source.fillExtrusionPattern = self.fillExtrusionPattern?.resolvedImage()
        source.fillExtrusionTranslate = self.fillExtrusionTranslate?.arrayOfDouble()
        source.fillExtrusionTranslateTransition = self.fillExtrusionTranslateTransition?.styleTransition()
        source.fillExtrusionTranslateAnchor = self.fillExtrusionTranslateAnchor?.fillExtrusionTranslateAnchor()
        source.fillExtrusionVerticalGradient = self.fillExtrusionVerticalGradient?.bool()
    }
}

extension FillExtrusionLayer {
    func mapTo(_ source:inout TMBFillExtrusionLayer) {
        source.id = self.id
        source.filter = self.filter?.wrap()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.fillExtrusionAmbientOcclusionIntensity = self.fillExtrusionAmbientOcclusionIntensity?.double()
        source.fillExtrusionAmbientOcclusionIntensityTransition = self.fillExtrusionAmbientOcclusionIntensityTransition?.wrap()
        source.fillExtrusionAmbientOcclusionRadius = self.fillExtrusionAmbientOcclusionRadius?.double()
        source.fillExtrusionAmbientOcclusionRadiusTransition = self.fillExtrusionAmbientOcclusionRadiusTransition?.wrap()
        source.fillExtrusionBase = self.fillExtrusionBase?.double()
        source.fillExtrusionBaseTransition = self.fillExtrusionBaseTransition?.wrap()
        source.fillExtrusionColor = self.fillExtrusionColor?.styleColor()
        source.fillExtrusionColorTransition = self.fillExtrusionColorTransition?.wrap()
        source.fillExtrusionCutoffFadeRange = self.fillExtrusionCutoffFadeRange?.double()
        source.fillExtrusionEmissiveStrength = self.fillExtrusionEmissiveStrength?.double()
        source.fillExtrusionEmissiveStrengthTransition = self.fillExtrusionEmissiveStrengthTransition?.wrap()
        source.fillExtrusionHeight = self.fillExtrusionHeight?.double()
        source.fillExtrusionHeightTransition = self.fillExtrusionHeightTransition?.wrap()
        source.fillExtrusionOpacity = self.fillExtrusionOpacity?.double()
        source.fillExtrusionOpacityTransition = self.fillExtrusionOpacityTransition?.wrap()
        source.fillExtrusionPattern = self.fillExtrusionPattern?.resolvedImage()
        source.fillExtrusionTranslate = self.fillExtrusionTranslate?.arrayOfDouble()
        source.fillExtrusionTranslateTransition = self.fillExtrusionTranslateTransition?.wrap()
        source.fillExtrusionTranslateAnchor = self.fillExtrusionTranslateAnchor?.fillExtrusionTranslateAnchor()
        source.fillExtrusionVerticalGradient = self.fillExtrusionVerticalGradient?.bool()
    }
}

extension TMBFillExtrusionLayer: SwiftValueConvertible {
    public func unwrap() -> FillExtrusionLayer {
        var result = FillExtrusionLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}

extension FillExtrusionLayer {
    func wrap() -> TMBFillExtrusionLayer {
        var result = TMBFillExtrusionLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}