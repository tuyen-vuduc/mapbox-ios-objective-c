// This file is generated.
import UIKit
import MapboxMaps

/// A filled circle.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-circle)
@objc open class TMBCircleLayer: NSObject, TMBLayer {
    @objc public init(id: String, source: String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.circle
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

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var circleSortKey: TMBValue?

    /// Amount to blur the circle. 1 blurs the circle such that only the centerpoint is full opacity.
    /// Default value: 0.
    @objc public var circleBlur: TMBValue?

    /// Transition options for `circleBlur`.
    @objc public var circleBlurTransition: TMBStyleTransition?

    /// The fill color of the circle.
    /// Default value: "#000000".
    @objc public var circleColor: TMBValue?

    /// Transition options for `circleColor`.
    @objc public var circleColorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features.
    /// Default value: 0. Minimum value: 0.
    @objc public var circleEmissiveStrength: TMBValue?

    /// Transition options for `circleEmissiveStrength`.
    @objc public var circleEmissiveStrengthTransition: TMBStyleTransition?

    /// The opacity at which the circle will be drawn.
    /// Default value: 1. Value range: [0, 1]
    @objc public var circleOpacity: TMBValue?

    /// Transition options for `circleOpacity`.
    @objc public var circleOpacityTransition: TMBStyleTransition?

    /// Orientation of circle when map is pitched.
    /// Default value: "viewport".
    @objc public var circlePitchAlignment: TMBValue?

    /// Controls the scaling behavior of the circle when the map is pitched.
    /// Default value: "map".
    @objc public var circlePitchScale: TMBValue?

    /// Circle radius.
    /// Default value: 5. Minimum value: 0.
    @objc public var circleRadius: TMBValue?

    /// Transition options for `circleRadius`.
    @objc public var circleRadiusTransition: TMBStyleTransition?

    /// The stroke color of the circle.
    /// Default value: "#000000".
    @objc public var circleStrokeColor: TMBValue?

    /// Transition options for `circleStrokeColor`.
    @objc public var circleStrokeColorTransition: TMBStyleTransition?

    /// The opacity of the circle's stroke.
    /// Default value: 1. Value range: [0, 1]
    @objc public var circleStrokeOpacity: TMBValue?

    /// Transition options for `circleStrokeOpacity`.
    @objc public var circleStrokeOpacityTransition: TMBStyleTransition?

    /// The width of the circle's stroke. Strokes are placed outside of the `circle-radius`.
    /// Default value: 0. Minimum value: 0.
    @objc public var circleStrokeWidth: TMBValue?

    /// Transition options for `circleStrokeWidth`.
    @objc public var circleStrokeWidthTransition: TMBStyleTransition?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    /// Default value: [0,0].
    @objc public var circleTranslate: TMBValue?

    /// Transition options for `circleTranslate`.
    @objc public var circleTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `circle-translate`.
    /// Default value: "map".
    @objc public var circleTranslateAnchor: TMBValue?

}

extension TMBCircleLayer {
    func mapTo(_ source: inout CircleLayer) {
        source.id = self.id
        source.filter = self.filter?.expression()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.circleSortKey = self.circleSortKey?.double()
        source.circleBlur = self.circleBlur?.double()
        source.circleBlurTransition = self.circleBlurTransition?.styleTransition()
        source.circleColor = self.circleColor?.styleColor()
        source.circleColorTransition = self.circleColorTransition?.styleTransition()
        source.circleEmissiveStrength = self.circleEmissiveStrength?.double()
        source.circleEmissiveStrengthTransition = self.circleEmissiveStrengthTransition?.styleTransition()
        source.circleOpacity = self.circleOpacity?.double()
        source.circleOpacityTransition = self.circleOpacityTransition?.styleTransition()
        source.circlePitchAlignment = self.circlePitchAlignment?.circlePitchAlignment()
        source.circlePitchScale = self.circlePitchScale?.circlePitchScale()
        source.circleRadius = self.circleRadius?.double()
        source.circleRadiusTransition = self.circleRadiusTransition?.styleTransition()
        source.circleStrokeColor = self.circleStrokeColor?.styleColor()
        source.circleStrokeColorTransition = self.circleStrokeColorTransition?.styleTransition()
        source.circleStrokeOpacity = self.circleStrokeOpacity?.double()
        source.circleStrokeOpacityTransition = self.circleStrokeOpacityTransition?.styleTransition()
        source.circleStrokeWidth = self.circleStrokeWidth?.double()
        source.circleStrokeWidthTransition = self.circleStrokeWidthTransition?.styleTransition()
        source.circleTranslate = self.circleTranslate?.arrayOfDouble()
        source.circleTranslateTransition = self.circleTranslateTransition?.styleTransition()
        source.circleTranslateAnchor = self.circleTranslateAnchor?.circleTranslateAnchor()
    }
}

extension CircleLayer {
    func mapTo(_ source:inout TMBCircleLayer) {
        source.id = self.id
        source.filter = self.filter?.wrap()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.circleSortKey = self.circleSortKey?.double()
        source.circleBlur = self.circleBlur?.double()
        source.circleBlurTransition = self.circleBlurTransition?.wrap()
        source.circleColor = self.circleColor?.styleColor()
        source.circleColorTransition = self.circleColorTransition?.wrap()
        source.circleEmissiveStrength = self.circleEmissiveStrength?.double()
        source.circleEmissiveStrengthTransition = self.circleEmissiveStrengthTransition?.wrap()
        source.circleOpacity = self.circleOpacity?.double()
        source.circleOpacityTransition = self.circleOpacityTransition?.wrap()
        source.circlePitchAlignment = self.circlePitchAlignment?.circlePitchAlignment()
        source.circlePitchScale = self.circlePitchScale?.circlePitchScale()
        source.circleRadius = self.circleRadius?.double()
        source.circleRadiusTransition = self.circleRadiusTransition?.wrap()
        source.circleStrokeColor = self.circleStrokeColor?.styleColor()
        source.circleStrokeColorTransition = self.circleStrokeColorTransition?.wrap()
        source.circleStrokeOpacity = self.circleStrokeOpacity?.double()
        source.circleStrokeOpacityTransition = self.circleStrokeOpacityTransition?.wrap()
        source.circleStrokeWidth = self.circleStrokeWidth?.double()
        source.circleStrokeWidthTransition = self.circleStrokeWidthTransition?.wrap()
        source.circleTranslate = self.circleTranslate?.arrayOfDouble()
        source.circleTranslateTransition = self.circleTranslateTransition?.wrap()
        source.circleTranslateAnchor = self.circleTranslateAnchor?.circleTranslateAnchor()
    }
}

extension TMBCircleLayer: SwiftValueConvertible {
    public func unwrap() -> CircleLayer {
        var result = CircleLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}

extension CircleLayer {
    func wrap() -> TMBCircleLayer {
        var result = TMBCircleLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}