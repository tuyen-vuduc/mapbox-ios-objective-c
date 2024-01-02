// This file is generated.
import Foundation
import MapboxMaps


/// A filled circle.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-circle)
@objc open class TMBCircleLayer: NSObject, TMBLayer {

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

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var  circleSortKey: TMBValue?

    /// Amount to blur the circle. 1 blurs the circle such that only the centerpoint is full opacity.
    @objc public var  circleBlur: TMBValue?

    /// Transition options for `circleBlur`.
    @objc public var  circleBlurTransition: TMBStyleTransition?

    /// The fill color of the circle.
    @objc public var  circleColor: TMBValue?

    /// Transition options for `circleColor`.
    @objc public var  circleColorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var  circleEmissiveStrength: TMBValue?

    /// Transition options for `circleEmissiveStrength`.
    @objc public var  circleEmissiveStrengthTransition: TMBStyleTransition?

    /// The opacity at which the circle will be drawn.
    @objc public var  circleOpacity: TMBValue?

    /// Transition options for `circleOpacity`.
    @objc public var  circleOpacityTransition: TMBStyleTransition?

    /// Orientation of circle when map is pitched.
    @objc public var  circlePitchAlignment: TMBValue?

    /// Controls the scaling behavior of the circle when the map is pitched.
    @objc public var  circlePitchScale: TMBValue?

    /// Circle radius.
    @objc public var  circleRadius: TMBValue?

    /// Transition options for `circleRadius`.
    @objc public var  circleRadiusTransition: TMBStyleTransition?

    /// The stroke color of the circle.
    @objc public var  circleStrokeColor: TMBValue?

    /// Transition options for `circleStrokeColor`.
    @objc public var  circleStrokeColorTransition: TMBStyleTransition?

    /// The opacity of the circle's stroke.
    @objc public var  circleStrokeOpacity: TMBValue?

    /// Transition options for `circleStrokeOpacity`.
    @objc public var  circleStrokeOpacityTransition: TMBStyleTransition?

    /// The width of the circle's stroke. Strokes are placed outside of the `circle-radius`.
    @objc public var  circleStrokeWidth: TMBValue?

    /// Transition options for `circleStrokeWidth`.
    @objc public var  circleStrokeWidthTransition: TMBStyleTransition?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var  circleTranslate: TMBValue?

    /// Transition options for `circleTranslate`.
    @objc public var  circleTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `circle-translate`.
    @objc public var  circleTranslateAnchor: TMBValue?

    
    @objc public init(id : String, source : String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.circle
        self.visibility = .visibility(.visible)
    }
}
extension TMBCircleLayer {
    func unwrap() -> CircleLayer {
        var result = CircleLayer(id: self.id,
            source: self.source)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout CircleLayer) {
        dest.filter = self.filter?.unwrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.unwrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.unwrap()
        dest.circleSortKey = self.circleSortKey?.unwrap()
        dest.circleBlur = self.circleBlur?.unwrap()
        dest.circleBlurTransition = self.circleBlurTransition?.unwrap()
        dest.circleColor = self.circleColor?.unwrap()
        dest.circleColorTransition = self.circleColorTransition?.unwrap()
        dest.circleEmissiveStrength = self.circleEmissiveStrength?.unwrap()
        dest.circleEmissiveStrengthTransition = self.circleEmissiveStrengthTransition?.unwrap()
        dest.circleOpacity = self.circleOpacity?.unwrap()
        dest.circleOpacityTransition = self.circleOpacityTransition?.unwrap()
        dest.circlePitchAlignment = self.circlePitchAlignment?.unwrap()
        dest.circlePitchScale = self.circlePitchScale?.unwrap()
        dest.circleRadius = self.circleRadius?.unwrap()
        dest.circleRadiusTransition = self.circleRadiusTransition?.unwrap()
        dest.circleStrokeColor = self.circleStrokeColor?.unwrap()
        dest.circleStrokeColorTransition = self.circleStrokeColorTransition?.unwrap()
        dest.circleStrokeOpacity = self.circleStrokeOpacity?.unwrap()
        dest.circleStrokeOpacityTransition = self.circleStrokeOpacityTransition?.unwrap()
        dest.circleStrokeWidth = self.circleStrokeWidth?.unwrap()
        dest.circleStrokeWidthTransition = self.circleStrokeWidthTransition?.unwrap()
        dest.circleTranslate = self.circleTranslate?.unwrap()
        dest.circleTranslateTransition = self.circleTranslateTransition?.unwrap()
        dest.circleTranslateAnchor = self.circleTranslateAnchor?.unwrap()
    }
}
extension CircleLayer {
    func wrap() -> TMBCircleLayer {
        var result = TMBCircleLayer(id: self.id,
          source: self.source)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBCircleLayer)  {
        dest.filter = self.filter?.wrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.wrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.wrap()
        dest.circleSortKey = self.circleSortKey?.wrap()
        dest.circleBlur = self.circleBlur?.wrap()
        dest.circleBlurTransition = self.circleBlurTransition?.wrap()
        dest.circleColor = self.circleColor?.wrap()
        dest.circleColorTransition = self.circleColorTransition?.wrap()
        dest.circleEmissiveStrength = self.circleEmissiveStrength?.wrap()
        dest.circleEmissiveStrengthTransition = self.circleEmissiveStrengthTransition?.wrap()
        dest.circleOpacity = self.circleOpacity?.wrap()
        dest.circleOpacityTransition = self.circleOpacityTransition?.wrap()
        dest.circlePitchAlignment = self.circlePitchAlignment?.wrap()
        dest.circlePitchScale = self.circlePitchScale?.wrap()
        dest.circleRadius = self.circleRadius?.wrap()
        dest.circleRadiusTransition = self.circleRadiusTransition?.wrap()
        dest.circleStrokeColor = self.circleStrokeColor?.wrap()
        dest.circleStrokeColorTransition = self.circleStrokeColorTransition?.wrap()
        dest.circleStrokeOpacity = self.circleStrokeOpacity?.wrap()
        dest.circleStrokeOpacityTransition = self.circleStrokeOpacityTransition?.wrap()
        dest.circleStrokeWidth = self.circleStrokeWidth?.wrap()
        dest.circleStrokeWidthTransition = self.circleStrokeWidthTransition?.wrap()
        dest.circleTranslate = self.circleTranslate?.wrap()
        dest.circleTranslateTransition = self.circleTranslateTransition?.wrap()
        dest.circleTranslateAnchor = self.circleTranslateAnchor?.wrap()
    }
}