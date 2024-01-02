// This file is generated.
import Foundation
import MapboxMaps


/// A stroked line.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-line)
@objc open class TMBLineLayer: NSObject, TMBLayer {

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

    /// The display of line endings.
    @objc public var  lineCap: TMBValue?

    /// The display of lines when joining.
    @objc public var  lineJoin: TMBValue?

    /// Used to automatically convert miter joins to bevel joins for sharp angles.
    @objc public var  lineMiterLimit: TMBValue?

    /// Used to automatically convert round joins to miter joins for shallow angles.
    @objc public var  lineRoundLimit: TMBValue?

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var  lineSortKey: TMBValue?

    /// Blur applied to the line, in pixels.
    @objc public var  lineBlur: TMBValue?

    /// Transition options for `lineBlur`.
    @objc public var  lineBlurTransition: TMBStyleTransition?

    /// The color of the line border. If line-border-width is greater than zero and the alpha value of this color is 0 (default), the color for the border will be selected automatically based on the line color.
    @objc public var  lineBorderColor: TMBValue?

    /// Transition options for `lineBorderColor`.
    @objc public var  lineBorderColorTransition: TMBStyleTransition?

    /// The width of the line border. A value of zero means no border.
    @objc public var  lineBorderWidth: TMBValue?

    /// Transition options for `lineBorderWidth`.
    @objc public var  lineBorderWidthTransition: TMBStyleTransition?

    /// The color with which the line will be drawn.
    @objc public var  lineColor: TMBValue?

    /// Transition options for `lineColor`.
    @objc public var  lineColorTransition: TMBStyleTransition?

    /// Specifies the lengths of the alternating dashes and gaps that form the dash pattern. The lengths are later scaled by the line width. To convert a dash length to pixels, multiply the length by the current line width. Note that GeoJSON sources with `lineMetrics: true` specified won't render dashed lines to the expected scale. Also note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var  lineDasharray: TMBValue?

    /// Decrease line layer opacity based on occlusion from 3D objects. Value 0 disables occlusion, value 1 means fully occluded.
    @objc public var  lineDepthOcclusionFactor: TMBValue?

    /// Transition options for `lineDepthOcclusionFactor`.
    @objc public var  lineDepthOcclusionFactorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var  lineEmissiveStrength: TMBValue?

    /// Transition options for `lineEmissiveStrength`.
    @objc public var  lineEmissiveStrengthTransition: TMBStyleTransition?

    /// Draws a line casing outside of a line's actual path. Value indicates the width of the inner gap.
    @objc public var  lineGapWidth: TMBValue?

    /// Transition options for `lineGapWidth`.
    @objc public var  lineGapWidthTransition: TMBStyleTransition?

    /// A gradient used to color a line feature at various distances along its length. Defined using a `step` or `interpolate` expression which outputs a color for each corresponding `line-progress` input value. `line-progress` is a percentage of the line feature's total length as measured on the webmercator projected coordinate plane (a `number` between `0` and `1`). Can only be used with GeoJSON sources that specify `"lineMetrics": true`.
    @objc public var  lineGradient: TMBValue?

    /// The line's offset. For linear features, a positive value offsets the line to the right, relative to the direction of the line, and a negative value to the left. For polygon features, a positive value results in an inset, and a negative value results in an outset.
    @objc public var  lineOffset: TMBValue?

    /// Transition options for `lineOffset`.
    @objc public var  lineOffsetTransition: TMBStyleTransition?

    /// The opacity at which the line will be drawn.
    @objc public var  lineOpacity: TMBValue?

    /// Transition options for `lineOpacity`.
    @objc public var  lineOpacityTransition: TMBStyleTransition?

    /// Name of image in sprite to use for drawing image lines. For seamless patterns, image width must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var  linePattern: TMBValue?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var  lineTranslate: TMBValue?

    /// Transition options for `lineTranslate`.
    @objc public var  lineTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `line-translate`.
    @objc public var  lineTranslateAnchor: TMBValue?

    /// The line part between [trim-start, trim-end] will be marked as transparent to make a route vanishing effect. The line trim-off offset is based on the whole line range [0.0, 1.0].
    @objc public var  lineTrimOffset: TMBValue?

    /// Stroke thickness.
    @objc public var  lineWidth: TMBValue?

    /// Transition options for `lineWidth`.
    @objc public var  lineWidthTransition: TMBStyleTransition?

    
    @objc public init(id : String, source : String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.line
        self.visibility = .visibility(.visible)
    }
}
extension TMBLineLayer {
    func unwrap() -> LineLayer {
        var result = LineLayer(id: self.id,
            source: self.source)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout LineLayer) {
        dest.filter = self.filter?.unwrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.unwrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.unwrap()
        dest.lineCap = self.lineCap?.unwrap()
        dest.lineJoin = self.lineJoin?.unwrap()
        dest.lineMiterLimit = self.lineMiterLimit?.unwrap()
        dest.lineRoundLimit = self.lineRoundLimit?.unwrap()
        dest.lineSortKey = self.lineSortKey?.unwrap()
        dest.lineBlur = self.lineBlur?.unwrap()
        dest.lineBlurTransition = self.lineBlurTransition?.unwrap()
        dest.lineBorderColor = self.lineBorderColor?.unwrap()
        dest.lineBorderColorTransition = self.lineBorderColorTransition?.unwrap()
        dest.lineBorderWidth = self.lineBorderWidth?.unwrap()
        dest.lineBorderWidthTransition = self.lineBorderWidthTransition?.unwrap()
        dest.lineColor = self.lineColor?.unwrap()
        dest.lineColorTransition = self.lineColorTransition?.unwrap()
        dest.lineDasharray = self.lineDasharray?.unwrap()
        dest.lineDepthOcclusionFactor = self.lineDepthOcclusionFactor?.unwrap()
        dest.lineDepthOcclusionFactorTransition = self.lineDepthOcclusionFactorTransition?.unwrap()
        dest.lineEmissiveStrength = self.lineEmissiveStrength?.unwrap()
        dest.lineEmissiveStrengthTransition = self.lineEmissiveStrengthTransition?.unwrap()
        dest.lineGapWidth = self.lineGapWidth?.unwrap()
        dest.lineGapWidthTransition = self.lineGapWidthTransition?.unwrap()
        dest.lineGradient = self.lineGradient?.unwrap()
        dest.lineOffset = self.lineOffset?.unwrap()
        dest.lineOffsetTransition = self.lineOffsetTransition?.unwrap()
        dest.lineOpacity = self.lineOpacity?.unwrap()
        dest.lineOpacityTransition = self.lineOpacityTransition?.unwrap()
        dest.linePattern = self.linePattern?.unwrap()
        dest.lineTranslate = self.lineTranslate?.unwrap()
        dest.lineTranslateTransition = self.lineTranslateTransition?.unwrap()
        dest.lineTranslateAnchor = self.lineTranslateAnchor?.unwrap()
        dest.lineTrimOffset = self.lineTrimOffset?.unwrap()
        dest.lineWidth = self.lineWidth?.unwrap()
        dest.lineWidthTransition = self.lineWidthTransition?.unwrap()
    }
}
extension LineLayer {
    func wrap() -> TMBLineLayer {
        var result = TMBLineLayer(id: self.id,
          source: self.source)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBLineLayer)  {
        dest.filter = self.filter?.wrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.wrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.wrap()
        dest.lineCap = self.lineCap?.wrap()
        dest.lineJoin = self.lineJoin?.wrap()
        dest.lineMiterLimit = self.lineMiterLimit?.wrap()
        dest.lineRoundLimit = self.lineRoundLimit?.wrap()
        dest.lineSortKey = self.lineSortKey?.wrap()
        dest.lineBlur = self.lineBlur?.wrap()
        dest.lineBlurTransition = self.lineBlurTransition?.wrap()
        dest.lineBorderColor = self.lineBorderColor?.wrap()
        dest.lineBorderColorTransition = self.lineBorderColorTransition?.wrap()
        dest.lineBorderWidth = self.lineBorderWidth?.wrap()
        dest.lineBorderWidthTransition = self.lineBorderWidthTransition?.wrap()
        dest.lineColor = self.lineColor?.wrap()
        dest.lineColorTransition = self.lineColorTransition?.wrap()
        dest.lineDasharray = self.lineDasharray?.wrap()
        dest.lineDepthOcclusionFactor = self.lineDepthOcclusionFactor?.wrap()
        dest.lineDepthOcclusionFactorTransition = self.lineDepthOcclusionFactorTransition?.wrap()
        dest.lineEmissiveStrength = self.lineEmissiveStrength?.wrap()
        dest.lineEmissiveStrengthTransition = self.lineEmissiveStrengthTransition?.wrap()
        dest.lineGapWidth = self.lineGapWidth?.wrap()
        dest.lineGapWidthTransition = self.lineGapWidthTransition?.wrap()
        dest.lineGradient = self.lineGradient?.wrap()
        dest.lineOffset = self.lineOffset?.wrap()
        dest.lineOffsetTransition = self.lineOffsetTransition?.wrap()
        dest.lineOpacity = self.lineOpacity?.wrap()
        dest.lineOpacityTransition = self.lineOpacityTransition?.wrap()
        dest.linePattern = self.linePattern?.wrap()
        dest.lineTranslate = self.lineTranslate?.wrap()
        dest.lineTranslateTransition = self.lineTranslateTransition?.wrap()
        dest.lineTranslateAnchor = self.lineTranslateAnchor?.wrap()
        dest.lineTrimOffset = self.lineTrimOffset?.wrap()
        dest.lineWidth = self.lineWidth?.wrap()
        dest.lineWidthTransition = self.lineWidthTransition?.wrap()
    }
}