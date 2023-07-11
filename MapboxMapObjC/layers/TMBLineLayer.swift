// This file is generated.
import Foundation
import MapboxMaps

/// A stroked line.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-line)
@objc open class TMBLineLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.line)
        
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

    /// The display of line endings.
    @objc public var lineCap : TMBValue?

    /// The display of lines when joining.
    @objc public var lineJoin : TMBValue?

    /// Used to automatically convert miter joins to bevel joins for sharp angles.
    @objc public var lineMiterLimit : TMBValue?

    /// Used to automatically convert round joins to miter joins for shallow angles.
    @objc public var lineRoundLimit : TMBValue?

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var lineSortKey : TMBValue?

    /// Blur applied to the line, in pixels.
    @objc public var lineBlur : TMBValue?

    /// Transition options for `lineBlur`.
    @objc public var lineBlurTransition : TMBStyleTransition?

    /// The color with which the line will be drawn.
    @objc public var lineColor : TMBValue?

    /// Transition options for `lineColor`.
    @objc public var lineColorTransition : TMBStyleTransition?

    /// Specifies the lengths of the alternating dashes and gaps that form the dash pattern. The lengths are later scaled by the line width. To convert a dash length to pixels, multiply the length by the current line width. Note that GeoJSON sources with `lineMetrics: true` specified won't render dashed lines to the expected scale. Also note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var lineDasharray : TMBValue?

    /// Transition options for `lineDasharray`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    @objc public var lineDasharrayTransition : TMBStyleTransition?

    /// Draws a line casing outside of a line's actual path. Value indicates the width of the inner gap.
    @objc public var lineGapWidth : TMBValue?

    /// Transition options for `lineGapWidth`.
    @objc public var lineGapWidthTransition : TMBStyleTransition?

    /// Defines a gradient with which to color a line feature. Can only be used with GeoJSON sources that specify `"lineMetrics": true`.
    @objc public var lineGradient : TMBValue?

    /// The line's offset. For linear features, a positive value offsets the line to the right, relative to the direction of the line, and a negative value to the left. For polygon features, a positive value results in an inset, and a negative value results in an outset.
    @objc public var lineOffset : TMBValue?

    /// Transition options for `lineOffset`.
    @objc public var lineOffsetTransition : TMBStyleTransition?

    /// The opacity at which the line will be drawn.
    @objc public var lineOpacity : TMBValue?

    /// Transition options for `lineOpacity`.
    @objc public var lineOpacityTransition : TMBStyleTransition?

    /// Name of image in sprite to use for drawing image lines. For seamless patterns, image width must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var linePattern : TMBValue?

    /// Transition options for `linePattern`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    @objc public var linePatternTransition : TMBStyleTransition?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var lineTranslate : TMBValue?

    /// Transition options for `lineTranslate`.
    @objc public var lineTranslateTransition : TMBStyleTransition?

    /// Controls the frame of reference for `line-translate`.
    @objc public var lineTranslateAnchor : TMBValue?

    /// The line part between [trim-start, trim-end] will be marked as transparent to make a route vanishing effect. The line trim-off offset is based on the whole line range [0.0, 1.0].
    @objc public var lineTrimOffset : TMBValue?

    /// Stroke thickness.
    @objc public var lineWidth : TMBValue?

    /// Transition options for `lineWidth`.
    @objc public var lineWidthTransition : TMBStyleTransition?

}

extension TMBLineLayer {
    public func mapTo(_ layer: inout LineLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.lineCap = self.lineCap?.lineCap()
        layer.lineJoin = self.lineJoin?.lineJoin()
        layer.lineMiterLimit = self.lineMiterLimit?.double()
        layer.lineRoundLimit = self.lineRoundLimit?.double()
        layer.lineSortKey = self.lineSortKey?.double()
        layer.lineBlur = self.lineBlur?.double()
        layer.lineBlurTransition = self.lineBlurTransition?.styleTransition()
        layer.lineColor = self.lineColor?.styleColor()
        layer.lineColorTransition = self.lineColorTransition?.styleTransition()
        layer.lineDasharray = self.lineDasharray?.arrayOfDouble()
        layer.lineDasharrayTransition = self.lineDasharrayTransition?.styleTransition()
        layer.lineGapWidth = self.lineGapWidth?.double()
        layer.lineGapWidthTransition = self.lineGapWidthTransition?.styleTransition()
        layer.lineGradient = self.lineGradient?.styleColor()
        layer.lineOffset = self.lineOffset?.double()
        layer.lineOffsetTransition = self.lineOffsetTransition?.styleTransition()
        layer.lineOpacity = self.lineOpacity?.double()
        layer.lineOpacityTransition = self.lineOpacityTransition?.styleTransition()
        layer.linePattern = self.linePattern?.resolvedImage()
        layer.linePatternTransition = self.linePatternTransition?.styleTransition()
        layer.lineTranslate = self.lineTranslate?.arrayOfDouble()
        layer.lineTranslateTransition = self.lineTranslateTransition?.styleTransition()
        layer.lineTranslateAnchor = self.lineTranslateAnchor?.lineTranslateAnchor()
        layer.lineTrimOffset = self.lineTrimOffset?.arrayOfDouble()
        layer.lineWidth = self.lineWidth?.double()
        layer.lineWidthTransition = self.lineWidthTransition?.styleTransition()
    }
}

extension LineLayer {
    public func mapTo(_ layer:inout TMBLineLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = TMBValue.fromSwiftValue(self.visibility)
        layer.lineCap = TMBValue.fromSwiftValue(self.lineCap)
        layer.lineJoin = TMBValue.fromSwiftValue(self.lineJoin)
        layer.lineMiterLimit = TMBValue.fromSwiftValue(self.lineMiterLimit)
        layer.lineRoundLimit = TMBValue.fromSwiftValue(self.lineRoundLimit)
        layer.lineSortKey = TMBValue.fromSwiftValue(self.lineSortKey)
        layer.lineBlur = TMBValue.fromSwiftValue(self.lineBlur)
        layer.lineBlurTransition = self.lineBlurTransition?.objcValue()
        layer.lineColor = TMBValue.fromSwiftValue(self.lineColor)
        layer.lineColorTransition = self.lineColorTransition?.objcValue()
        layer.lineDasharray = TMBValue.fromSwiftValue(self.lineDasharray)
        layer.lineDasharrayTransition = self.lineDasharrayTransition?.objcValue()
        layer.lineGapWidth = TMBValue.fromSwiftValue(self.lineGapWidth)
        layer.lineGapWidthTransition = self.lineGapWidthTransition?.objcValue()
        layer.lineGradient = TMBValue.fromSwiftValue(self.lineGradient)
        layer.lineOffset = TMBValue.fromSwiftValue(self.lineOffset)
        layer.lineOffsetTransition = self.lineOffsetTransition?.objcValue()
        layer.lineOpacity = TMBValue.fromSwiftValue(self.lineOpacity)
        layer.lineOpacityTransition = self.lineOpacityTransition?.objcValue()
        layer.linePattern = TMBValue.fromSwiftValue(self.linePattern)
        layer.linePatternTransition = self.linePatternTransition?.objcValue()
        layer.lineTranslate = TMBValue.fromSwiftValue(self.lineTranslate)
        layer.lineTranslateTransition = self.lineTranslateTransition?.objcValue()
        layer.lineTranslateAnchor = TMBValue.fromSwiftValue(self.lineTranslateAnchor)
        layer.lineTrimOffset = TMBValue.fromSwiftValue(self.lineTrimOffset)
        layer.lineWidth = TMBValue.fromSwiftValue(self.lineWidth)
        layer.lineWidthTransition = self.lineWidthTransition?.objcValue()
    }
}

extension TMBLineLayer: SwiftValueConvertible {
    public func swiftValue() -> LineLayer {
        var layer = LineLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension LineLayer: ObjcConvertible {
    public func objcValue() ->  TMBLineLayer {
        var layer = TMBLineLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}