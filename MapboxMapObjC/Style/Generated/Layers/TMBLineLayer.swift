// This file is generated.
import UIKit
import MapboxMaps

/// A stroked line.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-line)
@objc open class TMBLineLayer: NSObject, TMBLayer {
    @objc public init(id: String, source: String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.line
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

    /// The display of line endings.
    /// Default value: "butt".
    @objc public var lineCap: TMBValue?

    /// The display of lines when joining.
    /// Default value: "miter".
    @objc public var lineJoin: TMBValue?

    /// Used to automatically convert miter joins to bevel joins for sharp angles.
    /// Default value: 2.
    @objc public var lineMiterLimit: TMBValue?

    /// Used to automatically convert round joins to miter joins for shallow angles.
    /// Default value: 1.05.
    @objc public var lineRoundLimit: TMBValue?

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var lineSortKey: TMBValue?

    /// Vertical offset from ground, in meters. Defaults to 0. Not supported for globe projection at the moment.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var lineZOffset: Value<Double>?

    /// Blur applied to the line, in pixels.
    /// Default value: 0. Minimum value: 0.
    @objc public var lineBlur: TMBValue?

    /// Transition options for `lineBlur`.
    @objc public var lineBlurTransition: TMBStyleTransition?

    /// The color of the line border. If line-border-width is greater than zero and the alpha value of this color is 0 (default), the color for the border will be selected automatically based on the line color.
    /// Default value: "rgba(0, 0, 0, 0)".
    @objc public var lineBorderColor: TMBValue?

    /// Transition options for `lineBorderColor`.
    @objc public var lineBorderColorTransition: TMBStyleTransition?

    /// The width of the line border. A value of zero means no border.
    /// Default value: 0. Minimum value: 0.
    @objc public var lineBorderWidth: TMBValue?

    /// Transition options for `lineBorderWidth`.
    @objc public var lineBorderWidthTransition: TMBStyleTransition?

    /// The color with which the line will be drawn.
    /// Default value: "#000000".
    @objc public var lineColor: TMBValue?

    /// Transition options for `lineColor`.
    @objc public var lineColorTransition: TMBStyleTransition?

    /// Specifies the lengths of the alternating dashes and gaps that form the dash pattern. The lengths are later scaled by the line width. To convert a dash length to pixels, multiply the length by the current line width. Note that GeoJSON sources with `lineMetrics: true` specified won't render dashed lines to the expected scale. Also note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    /// Minimum value: 0.
    @objc public var lineDasharray: TMBValue?

    /// Decrease line layer opacity based on occlusion from 3D objects. Value 0 disables occlusion, value 1 means fully occluded.
    /// Default value: 1. Value range: [0, 1]
    @objc public var lineDepthOcclusionFactor: TMBValue?

    /// Transition options for `lineDepthOcclusionFactor`.
    @objc public var lineDepthOcclusionFactorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features.
    /// Default value: 0. Minimum value: 0.
    @objc public var lineEmissiveStrength: TMBValue?

    /// Transition options for `lineEmissiveStrength`.
    @objc public var lineEmissiveStrengthTransition: TMBStyleTransition?

    /// Draws a line casing outside of a line's actual path. Value indicates the width of the inner gap.
    /// Default value: 0. Minimum value: 0.
    @objc public var lineGapWidth: TMBValue?

    /// Transition options for `lineGapWidth`.
    @objc public var lineGapWidthTransition: TMBStyleTransition?

    /// A gradient used to color a line feature at various distances along its length. Defined using a `step` or `interpolate` expression which outputs a color for each corresponding `line-progress` input value. `line-progress` is a percentage of the line feature's total length as measured on the webmercator projected coordinate plane (a `number` between `0` and `1`). Can only be used with GeoJSON sources that specify `"lineMetrics": true`.
    @objc public var lineGradient: TMBValue?

    /// Opacity multiplier (multiplies line-opacity value) of the line part that is occluded by 3D objects. Value 0 hides occluded part, value 1 means the same opacity as non-occluded part. The property is not supported when `line-opacity` has data-driven styling.
    /// Default value: 0. Value range: [0, 1]
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var lineOcclusionOpacity: Value<Double>?

    /// Transition options for `lineOcclusionOpacity`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var lineOcclusionOpacityTransition: StyleTransition?

    /// The line's offset. For linear features, a positive value offsets the line to the right, relative to the direction of the line, and a negative value to the left. For polygon features, a positive value results in an inset, and a negative value results in an outset.
    /// Default value: 0.
    @objc public var lineOffset: TMBValue?

    /// Transition options for `lineOffset`.
    @objc public var lineOffsetTransition: TMBStyleTransition?

    /// The opacity at which the line will be drawn.
    /// Default value: 1. Value range: [0, 1]
    @objc public var lineOpacity: TMBValue?

    /// Transition options for `lineOpacity`.
    @objc public var lineOpacityTransition: TMBStyleTransition?

    /// Name of image in sprite to use for drawing image lines. For seamless patterns, image width must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var linePattern: TMBValue?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    /// Default value: [0,0].
    @objc public var lineTranslate: TMBValue?

    /// Transition options for `lineTranslate`.
    @objc public var lineTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `line-translate`.
    /// Default value: "map".
    @objc public var lineTranslateAnchor: TMBValue?

    /// The line part between [trim-start, trim-end] will be marked as transparent to make a route vanishing effect. The line trim-off offset is based on the whole line range [0.0, 1.0].
    /// Default value: [0,0]. Minimum value: [0,0]. Maximum value: [1,1].
    @objc public var lineTrimOffset: TMBValue?

    /// Stroke thickness.
    /// Default value: 1. Minimum value: 0.
    @objc public var lineWidth: TMBValue?

    /// Transition options for `lineWidth`.
    @objc public var lineWidthTransition: TMBStyleTransition?

}

extension TMBLineLayer {
    func mapTo(_ source: inout LineLayer) {
        source.id = self.id
        source.filter = self.filter?.expression()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.lineCap = self.lineCap?.lineCap()
        source.lineJoin = self.lineJoin?.lineJoin()
        source.lineMiterLimit = self.lineMiterLimit?.double()
        source.lineRoundLimit = self.lineRoundLimit?.double()
        source.lineSortKey = self.lineSortKey?.double()
        source.lineBlur = self.lineBlur?.double()
        source.lineBlurTransition = self.lineBlurTransition?.styleTransition()
        source.lineBorderColor = self.lineBorderColor?.styleColor()
        source.lineBorderColorTransition = self.lineBorderColorTransition?.styleTransition()
        source.lineBorderWidth = self.lineBorderWidth?.double()
        source.lineBorderWidthTransition = self.lineBorderWidthTransition?.styleTransition()
        source.lineColor = self.lineColor?.styleColor()
        source.lineColorTransition = self.lineColorTransition?.styleTransition()
        source.lineDasharray = self.lineDasharray?.arrayOfDouble()
        source.lineDepthOcclusionFactor = self.lineDepthOcclusionFactor?.double()
        source.lineDepthOcclusionFactorTransition = self.lineDepthOcclusionFactorTransition?.styleTransition()
        source.lineEmissiveStrength = self.lineEmissiveStrength?.double()
        source.lineEmissiveStrengthTransition = self.lineEmissiveStrengthTransition?.styleTransition()
        source.lineGapWidth = self.lineGapWidth?.double()
        source.lineGapWidthTransition = self.lineGapWidthTransition?.styleTransition()
        source.lineGradient = self.lineGradient?.styleColor()
        source.lineOffset = self.lineOffset?.double()
        source.lineOffsetTransition = self.lineOffsetTransition?.styleTransition()
        source.lineOpacity = self.lineOpacity?.double()
        source.lineOpacityTransition = self.lineOpacityTransition?.styleTransition()
        source.linePattern = self.linePattern?.resolvedImage()
        source.lineTranslate = self.lineTranslate?.arrayOfDouble()
        source.lineTranslateTransition = self.lineTranslateTransition?.styleTransition()
        source.lineTranslateAnchor = self.lineTranslateAnchor?.lineTranslateAnchor()
        source.lineTrimOffset = self.lineTrimOffset?.arrayOfDouble()
        source.lineWidth = self.lineWidth?.double()
        source.lineWidthTransition = self.lineWidthTransition?.styleTransition()
    }
}

extension LineLayer {
    func mapTo(_ source:inout TMBLineLayer) {
        source.id = self.id
        source.filter = self.filter?.wrap()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.lineCap = self.lineCap?.lineCap()
        source.lineJoin = self.lineJoin?.lineJoin()
        source.lineMiterLimit = self.lineMiterLimit?.double()
        source.lineRoundLimit = self.lineRoundLimit?.double()
        source.lineSortKey = self.lineSortKey?.double()
        source.lineBlur = self.lineBlur?.double()
        source.lineBlurTransition = self.lineBlurTransition?.wrap()
        source.lineBorderColor = self.lineBorderColor?.styleColor()
        source.lineBorderColorTransition = self.lineBorderColorTransition?.wrap()
        source.lineBorderWidth = self.lineBorderWidth?.double()
        source.lineBorderWidthTransition = self.lineBorderWidthTransition?.wrap()
        source.lineColor = self.lineColor?.styleColor()
        source.lineColorTransition = self.lineColorTransition?.wrap()
        source.lineDasharray = self.lineDasharray?.arrayOfDouble()
        source.lineDepthOcclusionFactor = self.lineDepthOcclusionFactor?.double()
        source.lineDepthOcclusionFactorTransition = self.lineDepthOcclusionFactorTransition?.wrap()
        source.lineEmissiveStrength = self.lineEmissiveStrength?.double()
        source.lineEmissiveStrengthTransition = self.lineEmissiveStrengthTransition?.wrap()
        source.lineGapWidth = self.lineGapWidth?.double()
        source.lineGapWidthTransition = self.lineGapWidthTransition?.wrap()
        source.lineGradient = self.lineGradient?.styleColor()
        source.lineOffset = self.lineOffset?.double()
        source.lineOffsetTransition = self.lineOffsetTransition?.wrap()
        source.lineOpacity = self.lineOpacity?.double()
        source.lineOpacityTransition = self.lineOpacityTransition?.wrap()
        source.linePattern = self.linePattern?.resolvedImage()
        source.lineTranslate = self.lineTranslate?.arrayOfDouble()
        source.lineTranslateTransition = self.lineTranslateTransition?.wrap()
        source.lineTranslateAnchor = self.lineTranslateAnchor?.lineTranslateAnchor()
        source.lineTrimOffset = self.lineTrimOffset?.arrayOfDouble()
        source.lineWidth = self.lineWidth?.double()
        source.lineWidthTransition = self.lineWidthTransition?.wrap()
    }
}

extension TMBLineLayer: SwiftValueConvertible {
    public func unwrap() -> LineLayer {
        var result = LineLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}

extension LineLayer {
    func wrap() -> TMBLineLayer {
        var result = TMBLineLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}