// This file is generated.
import Foundation
import MapboxMaps


/// An extruded (3D) polygon.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-fill-extrusion)
@objc open class TMBFillExtrusionLayer: NSObject, TMBLayer {

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

    /// Controls the intensity of shading near ground and concave angles between walls. Default value 0.0 disables ambient occlusion and values around 0.3 provide the most plausible results for buildings.
    @objc public var  fillExtrusionAmbientOcclusionIntensity: TMBValue?

    /// Transition options for `fillExtrusionAmbientOcclusionIntensity`.
    @objc public var  fillExtrusionAmbientOcclusionIntensityTransition: TMBStyleTransition?

    /// Shades area near ground and concave angles between walls where the radius defines only vertical impact. Default value 3.0 corresponds to height of one floor and brings the most plausible results for buildings. This property works only with legacy light. When 3D light is enabled `fill-extrusion-ambient-occlusion-wall-radius` and `fill-extrusion-ambient-occlusion-ground-radius` are used instead.
    @objc public var  fillExtrusionAmbientOcclusionRadius: TMBValue?

    /// Transition options for `fillExtrusionAmbientOcclusionRadius`.
    @objc public var  fillExtrusionAmbientOcclusionRadiusTransition: TMBStyleTransition?

    /// The height with which to extrude the base of this layer. Must be less than or equal to `fill-extrusion-height`.
    @objc public var  fillExtrusionBase: TMBValue?

    /// Transition options for `fillExtrusionBase`.
    @objc public var  fillExtrusionBaseTransition: TMBStyleTransition?

    /// The base color of the extruded fill. The extrusion's surfaces will be shaded differently based on this color in combination with the root `light` settings. If this color is specified as `rgba` with an alpha component, the alpha component will be ignored; use `fill-extrusion-opacity` to set layer opacity.
    @objc public var  fillExtrusionColor: TMBValue?

    /// Transition options for `fillExtrusionColor`.
    @objc public var  fillExtrusionColorTransition: TMBStyleTransition?

    /// This parameter defines the range for the fade-out effect before an automatic content cutoff on pitched map views. The automatic cutoff range is calculated according to the minimum required zoom level of the source and layer. The fade range is expressed in relation to the height of the map view. A value of 1.0 indicates that the content is faded to the same extent as the map's height in pixels, while a value close to zero represents a sharp cutoff. When the value is set to 0.0, the cutoff is completely disabled. Note: The property has no effect on the map if terrain is enabled.
    @objc public var  fillExtrusionCutoffFadeRange: TMBValue?

    /// The height with which to extrude this layer.
    @objc public var  fillExtrusionHeight: TMBValue?

    /// Transition options for `fillExtrusionHeight`.
    @objc public var  fillExtrusionHeightTransition: TMBStyleTransition?

    /// The opacity of the entire fill extrusion layer. This is rendered on a per-layer, not per-feature, basis, and data-driven styling is not available.
    @objc public var  fillExtrusionOpacity: TMBValue?

    /// Transition options for `fillExtrusionOpacity`.
    @objc public var  fillExtrusionOpacityTransition: TMBStyleTransition?

    /// Name of image in sprite to use for drawing images on extruded fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var  fillExtrusionPattern: TMBValue?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up (on the flat plane), respectively.
    @objc public var  fillExtrusionTranslate: TMBValue?

    /// Transition options for `fillExtrusionTranslate`.
    @objc public var  fillExtrusionTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `fill-extrusion-translate`.
    @objc public var  fillExtrusionTranslateAnchor: TMBValue?

    /// Whether to apply a vertical gradient to the sides of a fill-extrusion layer. If true, sides will be shaded slightly darker farther down.
    @objc public var  fillExtrusionVerticalGradient: TMBValue?

    
    @objc public init(id : String, source : String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.fillExtrusion
        self.visibility = .visibility(.visible)
    }
}
extension TMBFillExtrusionLayer: SwiftValueConvertible {
    public func unwrap() -> FillExtrusionLayer {
        var result = FillExtrusionLayer(id: self.id,
            source: self.source!)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout FillExtrusionLayer) {
        dest.filter = self.filter?.unwrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.unwrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.fillExtrusionAmbientOcclusionIntensity = self.fillExtrusionAmbientOcclusionIntensity?.double()
        dest.fillExtrusionAmbientOcclusionIntensityTransition = self.fillExtrusionAmbientOcclusionIntensityTransition?.unwrap()
        dest.fillExtrusionAmbientOcclusionRadius = self.fillExtrusionAmbientOcclusionRadius?.double()
        dest.fillExtrusionAmbientOcclusionRadiusTransition = self.fillExtrusionAmbientOcclusionRadiusTransition?.unwrap()
        dest.fillExtrusionBase = self.fillExtrusionBase?.double()
        dest.fillExtrusionBaseTransition = self.fillExtrusionBaseTransition?.unwrap()
        dest.fillExtrusionColor = self.fillExtrusionColor?.styleColor()
        dest.fillExtrusionColorTransition = self.fillExtrusionColorTransition?.unwrap()
        dest.fillExtrusionCutoffFadeRange = self.fillExtrusionCutoffFadeRange?.double()
        dest.fillExtrusionHeight = self.fillExtrusionHeight?.double()
        dest.fillExtrusionHeightTransition = self.fillExtrusionHeightTransition?.unwrap()
        dest.fillExtrusionOpacity = self.fillExtrusionOpacity?.double()
        dest.fillExtrusionOpacityTransition = self.fillExtrusionOpacityTransition?.unwrap()
        dest.fillExtrusionPattern = self.fillExtrusionPattern?.resolvedImage()
        dest.fillExtrusionTranslate = self.fillExtrusionTranslate?.arrayOfDouble()
        dest.fillExtrusionTranslateTransition = self.fillExtrusionTranslateTransition?.unwrap()
        dest.fillExtrusionTranslateAnchor = self.fillExtrusionTranslateAnchor?.fillExtrusionTranslateAnchor()
        dest.fillExtrusionVerticalGradient = self.fillExtrusionVerticalGradient?.bool()
    }
}
extension FillExtrusionLayer {
    func wrap() -> TMBFillExtrusionLayer {
        var result = TMBFillExtrusionLayer(id: self.id,
          source: self.source!)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBFillExtrusionLayer)  {
        dest.filter = self.filter?.wrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.wrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.fillExtrusionAmbientOcclusionIntensity = self.fillExtrusionAmbientOcclusionIntensity?.double()
        dest.fillExtrusionAmbientOcclusionIntensityTransition = self.fillExtrusionAmbientOcclusionIntensityTransition?.wrap()
        dest.fillExtrusionAmbientOcclusionRadius = self.fillExtrusionAmbientOcclusionRadius?.double()
        dest.fillExtrusionAmbientOcclusionRadiusTransition = self.fillExtrusionAmbientOcclusionRadiusTransition?.wrap()
        dest.fillExtrusionBase = self.fillExtrusionBase?.double()
        dest.fillExtrusionBaseTransition = self.fillExtrusionBaseTransition?.wrap()
        dest.fillExtrusionColor = self.fillExtrusionColor?.styleColor()
        dest.fillExtrusionColorTransition = self.fillExtrusionColorTransition?.wrap()
        dest.fillExtrusionCutoffFadeRange = self.fillExtrusionCutoffFadeRange?.double()
        dest.fillExtrusionHeight = self.fillExtrusionHeight?.double()
        dest.fillExtrusionHeightTransition = self.fillExtrusionHeightTransition?.wrap()
        dest.fillExtrusionOpacity = self.fillExtrusionOpacity?.double()
        dest.fillExtrusionOpacityTransition = self.fillExtrusionOpacityTransition?.wrap()
        dest.fillExtrusionPattern = self.fillExtrusionPattern?.resolvedImage()
        dest.fillExtrusionTranslate = self.fillExtrusionTranslate?.arrayOfDouble()
        dest.fillExtrusionTranslateTransition = self.fillExtrusionTranslateTransition?.wrap()
        dest.fillExtrusionTranslateAnchor = self.fillExtrusionTranslateAnchor?.fillExtrusionTranslateAnchor()
        dest.fillExtrusionVerticalGradient = self.fillExtrusionVerticalGradient?.bool()
    }
}
