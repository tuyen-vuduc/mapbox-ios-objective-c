// This file is generated.
import Foundation
import MapboxMaps

/// A filled circle.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-circle)
@objc open class TMBCircleLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.circle)
        
        self.visibility = TMBValue.visibility(.visible)
    }
    
    private init(_ id: String = UUID().uuidString, type: TMBLayerType) {
        self.id = id
        self.type = type
    }

    // MARK: - Conformance to `Layer` protocol
    @objc public var id: String
    @objc public let type: TMBLayerType
    @objc public var filter: TMBExpression?
    @objc public var source: String?
    @objc public var sourceLayer: String?
    @objc public var minZoom: NSNumber?
    @objc public var maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var visibility: TMBValue?

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var circleSortKey: TMBValue?

    /// Amount to blur the circle. 1 blurs the circle such that only the centerpoint is full opacity.
    @objc public var circleBlur: TMBValue?

    /// Transition options for `circleBlur`.
    @objc public var circleBlurTransition: TMBStyleTransition?

    /// The fill color of the circle.
    @objc public var circleColor: TMBValue?

    /// Transition options for `circleColor`.
    @objc public var circleColorTransition: TMBStyleTransition?

    /// The opacity at which the circle will be drawn.
    @objc public var circleOpacity: TMBValue?

    /// Transition options for `circleOpacity`.
    @objc public var circleOpacityTransition: TMBStyleTransition?

    /// Orientation of circle when map is pitched.
    @objc public var circlePitchAlignment: TMBValue?

    /// Controls the scaling behavior of the circle when the map is pitched.
    @objc public var circlePitchScale: TMBValue?

    /// Circle radius.
    @objc public var circleRadius: TMBValue?

    /// Transition options for `circleRadius`.
    @objc public var circleRadiusTransition: TMBStyleTransition?

    /// The stroke color of the circle.
    @objc public var circleStrokeColor: TMBValue?

    /// Transition options for `circleStrokeColor`.
    @objc public var circleStrokeColorTransition: TMBStyleTransition?

    /// The opacity of the circle's stroke.
    @objc public var circleStrokeOpacity: TMBValue?

    /// Transition options for `circleStrokeOpacity`.
    @objc public var circleStrokeOpacityTransition: TMBStyleTransition?

    /// The width of the circle's stroke. Strokes are placed outside of the `circle-radius`.
    @objc public var circleStrokeWidth: TMBValue?

    /// Transition options for `circleStrokeWidth`.
    @objc public var circleStrokeWidthTransition: TMBStyleTransition?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var circleTranslate: TMBValue?

    /// Transition options for `circleTranslate`.
    @objc public var circleTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `circle-translate`.
    @objc public var circleTranslateAnchor: TMBValue?

}

extension TMBCircleLayer {
    public func mapTo(_ layer: inout CircleLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.circleSortKey = self.circleSortKey?.double()
        layer.circleBlur = self.circleBlur?.double()
        layer.circleBlurTransition = self.circleBlurTransition?.styleTransition()
        layer.circleColor = self.circleColor?.styleColor()
        layer.circleColorTransition = self.circleColorTransition?.styleTransition()
        layer.circleOpacity = self.circleOpacity?.double()
        layer.circleOpacityTransition = self.circleOpacityTransition?.styleTransition()
        layer.circlePitchAlignment = self.circlePitchAlignment?.circlePitchAlignment()
        layer.circlePitchScale = self.circlePitchScale?.circlePitchScale()
        layer.circleRadius = self.circleRadius?.double()
        layer.circleRadiusTransition = self.circleRadiusTransition?.styleTransition()
        layer.circleStrokeColor = self.circleStrokeColor?.styleColor()
        layer.circleStrokeColorTransition = self.circleStrokeColorTransition?.styleTransition()
        layer.circleStrokeOpacity = self.circleStrokeOpacity?.double()
        layer.circleStrokeOpacityTransition = self.circleStrokeOpacityTransition?.styleTransition()
        layer.circleStrokeWidth = self.circleStrokeWidth?.double()
        layer.circleStrokeWidthTransition = self.circleStrokeWidthTransition?.styleTransition()
        layer.circleTranslate = self.circleTranslate?.arrayOfDouble()
        layer.circleTranslateTransition = self.circleTranslateTransition?.styleTransition()
        layer.circleTranslateAnchor = self.circleTranslateAnchor?.circleTranslateAnchor()
    }
}

extension CircleLayer {
    public func mapTo(_ layer:inout TMBCircleLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = TMBValue.fromSwiftValue(self.visibility)
        layer.circleSortKey = TMBValue.fromSwiftValue(self.circleSortKey)
        layer.circleBlur = TMBValue.fromSwiftValue(self.circleBlur)
        layer.circleBlurTransition = self.circleBlurTransition?.objcValue()
        layer.circleColor = TMBValue.fromSwiftValue(self.circleColor)
        layer.circleColorTransition = self.circleColorTransition?.objcValue()
        layer.circleOpacity = TMBValue.fromSwiftValue(self.circleOpacity)
        layer.circleOpacityTransition = self.circleOpacityTransition?.objcValue()
        layer.circlePitchAlignment = TMBValue.fromSwiftValue(self.circlePitchAlignment)
        layer.circlePitchScale = TMBValue.fromSwiftValue(self.circlePitchScale)
        layer.circleRadius = TMBValue.fromSwiftValue(self.circleRadius)
        layer.circleRadiusTransition = self.circleRadiusTransition?.objcValue()
        layer.circleStrokeColor = TMBValue.fromSwiftValue(self.circleStrokeColor)
        layer.circleStrokeColorTransition = self.circleStrokeColorTransition?.objcValue()
        layer.circleStrokeOpacity = TMBValue.fromSwiftValue(self.circleStrokeOpacity)
        layer.circleStrokeOpacityTransition = self.circleStrokeOpacityTransition?.objcValue()
        layer.circleStrokeWidth = TMBValue.fromSwiftValue(self.circleStrokeWidth)
        layer.circleStrokeWidthTransition = self.circleStrokeWidthTransition?.objcValue()
        layer.circleTranslate = TMBValue.fromSwiftValue(self.circleTranslate)
        layer.circleTranslateTransition = self.circleTranslateTransition?.objcValue()
        layer.circleTranslateAnchor = TMBValue.fromSwiftValue(self.circleTranslateAnchor)
    }
}

extension TMBCircleLayer: SwiftValueConvertible {
    public func swiftValue() -> CircleLayer {
        var layer = CircleLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension CircleLayer: ObjcConvertible {
    public func objcValue() ->  TMBCircleLayer {
        var layer = TMBCircleLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}