// This file is generated.
import UIKit
import MapboxMaps

/// An icon or a text label.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-symbol)
@objc open class TMBSymbolLayer: NSObject, TMBLayer {
    @objc public init(id: String, source: String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.symbol
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

    /// If true, the icon will be visible even if it collides with other previously drawn symbols.
    /// Default value: false.
    @objc public var iconAllowOverlap: TMBValue?

    /// Part of the icon placed closest to the anchor.
    /// Default value: "center".
    @objc public var iconAnchor: TMBValue?

    /// If true, other symbols can be visible even if they collide with the icon.
    /// Default value: false.
    @objc public var iconIgnorePlacement: TMBValue?

    /// Name of image in sprite to use for drawing an image background.
    @objc public var iconImage: TMBValue?

    /// If true, the icon may be flipped to prevent it from being rendered upside-down.
    /// Default value: false.
    @objc public var iconKeepUpright: TMBValue?

    /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
    /// Default value: [0,0].
    @objc public var iconOffset: TMBValue?

    /// If true, text will display without their corresponding icons when the icon collides with other symbols and the text does not.
    /// Default value: false.
    @objc public var iconOptional: TMBValue?

    /// Size of the additional area around the icon bounding box used for detecting symbol collisions.
    /// Default value: 2. Minimum value: 0.
    @objc public var iconPadding: TMBValue?

    /// Orientation of icon when map is pitched.
    /// Default value: "auto".
    @objc public var iconPitchAlignment: TMBValue?

    /// Rotates the icon clockwise.
    /// Default value: 0.
    @objc public var iconRotate: TMBValue?

    /// In combination with `symbol-placement`, determines the rotation behavior of icons.
    /// Default value: "auto".
    @objc public var iconRotationAlignment: TMBValue?

    /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
    /// Default value: 1. Minimum value: 0.
    @objc public var iconSize: TMBValue?

    /// Scales the icon to fit around the associated text.
    /// Default value: "none".
    @objc public var iconTextFit: TMBValue?

    /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
    /// Default value: [0,0,0,0].
    @objc public var iconTextFitPadding: TMBValue?

    /// If true, the symbols will not cross tile edges to avoid mutual collisions. Recommended in layers that don't have enough padding in the vector tile to prevent collisions, or if it is a point symbol layer placed after a line symbol layer. When using a client that supports global collision detection, like Mapbox GL JS version 0.42.0 or greater, enabling this property is not needed to prevent clipped labels at tile boundaries.
    /// Default value: false.
    @objc public var symbolAvoidEdges: TMBValue?

    /// Label placement relative to its geometry.
    /// Default value: "point".
    @objc public var symbolPlacement: TMBValue?

    /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first. When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
    @objc public var symbolSortKey: TMBValue?

    /// Distance between two symbol anchors.
    /// Default value: 250. Minimum value: 1.
    @objc public var symbolSpacing: TMBValue?

    /// Position symbol on buildings (both fill extrusions and models) rooftops. In order to have minimal impact on performance, this is supported only when `fill-extrusion-height` is not zoom-dependent and remains unchanged. For fading in buildings when zooming in, fill-extrusion-vertical-scale should be used and symbols would raise with building rooftops. Symbols are sorted by elevation, except in cases when `viewport-y` sorting or `symbol-sort-key` are applied.
    /// Default value: false.
    @objc public var symbolZElevate: TMBValue?

    /// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
    /// Default value: "auto".
    @objc public var symbolZOrder: TMBValue?

    /// If true, the text will be visible even if it collides with other previously drawn symbols.
    /// Default value: false.
    @objc public var textAllowOverlap: TMBValue?

    /// Part of the text placed closest to the anchor.
    /// Default value: "center".
    @objc public var textAnchor: TMBValue?

    /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
    /// Default value: "".
    @objc public var textField: TMBValue?

    /// Font stack to use for displaying text.
    @objc public var textFont: TMBValue?

    /// If true, other symbols can be visible even if they collide with the text.
    /// Default value: false.
    @objc public var textIgnorePlacement: TMBValue?

    /// Text justification options.
    /// Default value: "center".
    @objc public var textJustify: TMBValue?

    /// If true, the text may be flipped vertically to prevent it from being rendered upside-down.
    /// Default value: true.
    @objc public var textKeepUpright: TMBValue?

    /// Text tracking amount.
    /// Default value: 0.
    @objc public var textLetterSpacing: TMBValue?

    /// Text leading value for multi-line text.
    /// Default value: 1.2.
    @objc public var textLineHeight: TMBValue?

    /// Maximum angle change between adjacent characters.
    /// Default value: 45.
    @objc public var textMaxAngle: TMBValue?

    /// The maximum line width for text wrapping.
    /// Default value: 10. Minimum value: 0.
    @objc public var textMaxWidth: TMBValue?

    /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
    /// Default value: [0,0].
    @objc public var textOffset: TMBValue?

    /// If true, icons will display without their corresponding text when the text collides with other symbols and the icon does not.
    /// Default value: false.
    @objc public var textOptional: TMBValue?

    /// Size of the additional area around the text bounding box used for detecting symbol collisions.
    /// Default value: 2. Minimum value: 0.
    @objc public var textPadding: TMBValue?

    /// Orientation of text when map is pitched.
    /// Default value: "auto".
    @objc public var textPitchAlignment: TMBValue?

    /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
    /// Default value: 0.
    @objc public var textRadialOffset: TMBValue?

    /// Rotates the text clockwise.
    /// Default value: 0.
    @objc public var textRotate: TMBValue?

    /// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
    /// Default value: "auto".
    @objc public var textRotationAlignment: TMBValue?

    /// Font size.
    /// Default value: 16. Minimum value: 0.
    @objc public var textSize: TMBValue?

    /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
    /// Default value: "none".
    @objc public var textTransform: TMBValue?

    /// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
    @objc public var textVariableAnchor: TMBValue?

    /// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
    @objc public var textWritingMode: TMBValue?

    /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    /// Default value: "#000000".
    @objc public var iconColor: TMBValue?

    /// Transition options for `iconColor`.
    @objc public var iconColorTransition: TMBStyleTransition?

    /// Increase or reduce the saturation of the symbol icon.
    /// Default value: 0. Value range: [-1, 1]
    @objc public var iconColorSaturation: TMBValue?

    /// Transition options for `iconColorSaturation`.
    @objc public var iconColorSaturationTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features.
    /// Default value: 1. Minimum value: 0.
    @objc public var iconEmissiveStrength: TMBValue?

    /// Transition options for `iconEmissiveStrength`.
    @objc public var iconEmissiveStrengthTransition: TMBStyleTransition?

    /// Fade out the halo towards the outside.
    /// Default value: 0. Minimum value: 0.
    @objc public var iconHaloBlur: TMBValue?

    /// Transition options for `iconHaloBlur`.
    @objc public var iconHaloBlurTransition: TMBStyleTransition?

    /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    /// Default value: "rgba(0, 0, 0, 0)".
    @objc public var iconHaloColor: TMBValue?

    /// Transition options for `iconHaloColor`.
    @objc public var iconHaloColorTransition: TMBStyleTransition?

    /// Distance of halo to the icon outline.
    /// Default value: 0. Minimum value: 0.
    @objc public var iconHaloWidth: TMBValue?

    /// Transition options for `iconHaloWidth`.
    @objc public var iconHaloWidthTransition: TMBStyleTransition?

    /// Controls the transition progress between the image variants of icon-image. Zero means the first variant is used, one is the second, and in between they are blended together.
    /// Default value: 0. Value range: [0, 1]
    @objc public var iconImageCrossFade: TMBValue?

    /// Transition options for `iconImageCrossFade`.
    @objc public var iconImageCrossFadeTransition: TMBStyleTransition?

    /// The opacity at which the icon will be drawn in case of being depth occluded. Not supported on globe zoom levels.
    /// Default value: 1. Value range: [0, 1]
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var iconOcclusionOpacity: Value<Double>?

    /// Transition options for `iconOcclusionOpacity`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var iconOcclusionOpacityTransition: StyleTransition?

    /// The opacity at which the icon will be drawn.
    /// Default value: 1. Value range: [0, 1]
    @objc public var iconOpacity: TMBValue?

    /// Transition options for `iconOpacity`.
    @objc public var iconOpacityTransition: TMBStyleTransition?

    /// Distance that the icon's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    /// Default value: [0,0].
    @objc public var iconTranslate: TMBValue?

    /// Transition options for `iconTranslate`.
    @objc public var iconTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `icon-translate`.
    /// Default value: "map".
    @objc public var iconTranslateAnchor: TMBValue?

    /// The color with which the text will be drawn.
    /// Default value: "#000000".
    @objc public var textColor: TMBValue?

    /// Transition options for `textColor`.
    @objc public var textColorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features.
    /// Default value: 1. Minimum value: 0.
    @objc public var textEmissiveStrength: TMBValue?

    /// Transition options for `textEmissiveStrength`.
    @objc public var textEmissiveStrengthTransition: TMBStyleTransition?

    /// The halo's fadeout distance towards the outside.
    /// Default value: 0. Minimum value: 0.
    @objc public var textHaloBlur: TMBValue?

    /// Transition options for `textHaloBlur`.
    @objc public var textHaloBlurTransition: TMBStyleTransition?

    /// The color of the text's halo, which helps it stand out from backgrounds.
    /// Default value: "rgba(0, 0, 0, 0)".
    @objc public var textHaloColor: TMBValue?

    /// Transition options for `textHaloColor`.
    @objc public var textHaloColorTransition: TMBStyleTransition?

    /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
    /// Default value: 0. Minimum value: 0.
    @objc public var textHaloWidth: TMBValue?

    /// Transition options for `textHaloWidth`.
    @objc public var textHaloWidthTransition: TMBStyleTransition?

    /// The opacity at which the text will be drawn in case of being depth occluded. Not supported on globe zoom levels.
    /// Default value: 1. Value range: [0, 1]
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var textOcclusionOpacity: Value<Double>?

    /// Transition options for `textOcclusionOpacity`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var textOcclusionOpacityTransition: StyleTransition?

    /// The opacity at which the text will be drawn.
    /// Default value: 1. Value range: [0, 1]
    @objc public var textOpacity: TMBValue?

    /// Transition options for `textOpacity`.
    @objc public var textOpacityTransition: TMBStyleTransition?

    /// Distance that the text's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    /// Default value: [0,0].
    @objc public var textTranslate: TMBValue?

    /// Transition options for `textTranslate`.
    @objc public var textTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `text-translate`.
    /// Default value: "map".
    @objc public var textTranslateAnchor: TMBValue?

}

extension TMBSymbolLayer {
    func mapTo(_ source: inout SymbolLayer) {
        source.id = self.id
        source.filter = self.filter?.expression()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.iconAllowOverlap = self.iconAllowOverlap?.bool()
        source.iconAnchor = self.iconAnchor?.iconAnchor()
        source.iconIgnorePlacement = self.iconIgnorePlacement?.bool()
        source.iconImage = self.iconImage?.resolvedImage()
        source.iconKeepUpright = self.iconKeepUpright?.bool()
        source.iconOffset = self.iconOffset?.arrayOfDouble()
        source.iconOptional = self.iconOptional?.bool()
        source.iconPadding = self.iconPadding?.double()
        source.iconPitchAlignment = self.iconPitchAlignment?.iconPitchAlignment()
        source.iconRotate = self.iconRotate?.double()
        source.iconRotationAlignment = self.iconRotationAlignment?.iconRotationAlignment()
        source.iconSize = self.iconSize?.double()
        source.iconTextFit = self.iconTextFit?.iconTextFit()
        source.iconTextFitPadding = self.iconTextFitPadding?.arrayOfDouble()
        source.symbolAvoidEdges = self.symbolAvoidEdges?.bool()
        source.symbolPlacement = self.symbolPlacement?.symbolPlacement()
        source.symbolSortKey = self.symbolSortKey?.double()
        source.symbolSpacing = self.symbolSpacing?.double()
        source.symbolZElevate = self.symbolZElevate?.bool()
        source.symbolZOrder = self.symbolZOrder?.symbolZOrder()
        source.textAllowOverlap = self.textAllowOverlap?.bool()
        source.textAnchor = self.textAnchor?.textAnchor()
        source.textField = self.textField?.string()
        source.textFont = self.textFont?.arrayOfString()
        source.textIgnorePlacement = self.textIgnorePlacement?.bool()
        source.textJustify = self.textJustify?.textJustify()
        source.textKeepUpright = self.textKeepUpright?.bool()
        source.textLetterSpacing = self.textLetterSpacing?.double()
        source.textLineHeight = self.textLineHeight?.double()
        source.textMaxAngle = self.textMaxAngle?.double()
        source.textMaxWidth = self.textMaxWidth?.double()
        source.textOffset = self.textOffset?.arrayOfDouble()
        source.textOptional = self.textOptional?.bool()
        source.textPadding = self.textPadding?.double()
        source.textPitchAlignment = self.textPitchAlignment?.textPitchAlignment()
        source.textRadialOffset = self.textRadialOffset?.double()
        source.textRotate = self.textRotate?.double()
        source.textRotationAlignment = self.textRotationAlignment?.textRotationAlignment()
        source.textSize = self.textSize?.double()
        source.textTransform = self.textTransform?.textTransform()
        source.textVariableAnchor = self.textVariableAnchor?.arrayOfTextAnchor()
        source.textWritingMode = self.textWritingMode?.arrayOfTextWritingMode()
        source.iconColor = self.iconColor?.styleColor()
        source.iconColorTransition = self.iconColorTransition?.styleTransition()
        source.iconColorSaturation = self.iconColorSaturation?.double()
        source.iconColorSaturationTransition = self.iconColorSaturationTransition?.styleTransition()
        source.iconEmissiveStrength = self.iconEmissiveStrength?.double()
        source.iconEmissiveStrengthTransition = self.iconEmissiveStrengthTransition?.styleTransition()
        source.iconHaloBlur = self.iconHaloBlur?.double()
        source.iconHaloBlurTransition = self.iconHaloBlurTransition?.styleTransition()
        source.iconHaloColor = self.iconHaloColor?.styleColor()
        source.iconHaloColorTransition = self.iconHaloColorTransition?.styleTransition()
        source.iconHaloWidth = self.iconHaloWidth?.double()
        source.iconHaloWidthTransition = self.iconHaloWidthTransition?.styleTransition()
        source.iconImageCrossFade = self.iconImageCrossFade?.double()
        source.iconImageCrossFadeTransition = self.iconImageCrossFadeTransition?.styleTransition()
        source.iconOpacity = self.iconOpacity?.double()
        source.iconOpacityTransition = self.iconOpacityTransition?.styleTransition()
        source.iconTranslate = self.iconTranslate?.arrayOfDouble()
        source.iconTranslateTransition = self.iconTranslateTransition?.styleTransition()
        source.iconTranslateAnchor = self.iconTranslateAnchor?.iconTranslateAnchor()
        source.textColor = self.textColor?.styleColor()
        source.textColorTransition = self.textColorTransition?.styleTransition()
        source.textEmissiveStrength = self.textEmissiveStrength?.double()
        source.textEmissiveStrengthTransition = self.textEmissiveStrengthTransition?.styleTransition()
        source.textHaloBlur = self.textHaloBlur?.double()
        source.textHaloBlurTransition = self.textHaloBlurTransition?.styleTransition()
        source.textHaloColor = self.textHaloColor?.styleColor()
        source.textHaloColorTransition = self.textHaloColorTransition?.styleTransition()
        source.textHaloWidth = self.textHaloWidth?.double()
        source.textHaloWidthTransition = self.textHaloWidthTransition?.styleTransition()
        source.textOpacity = self.textOpacity?.double()
        source.textOpacityTransition = self.textOpacityTransition?.styleTransition()
        source.textTranslate = self.textTranslate?.arrayOfDouble()
        source.textTranslateTransition = self.textTranslateTransition?.styleTransition()
        source.textTranslateAnchor = self.textTranslateAnchor?.textTranslateAnchor()
    }
}

extension SymbolLayer {
    func mapTo(_ source:inout TMBSymbolLayer) {
        source.id = self.id
        source.filter = self.filter?.wrap()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.iconAllowOverlap = self.iconAllowOverlap?.bool()
        source.iconAnchor = self.iconAnchor?.iconAnchor()
        source.iconIgnorePlacement = self.iconIgnorePlacement?.bool()
        source.iconImage = self.iconImage?.resolvedImage()
        source.iconKeepUpright = self.iconKeepUpright?.bool()
        source.iconOffset = self.iconOffset?.arrayOfDouble()
        source.iconOptional = self.iconOptional?.bool()
        source.iconPadding = self.iconPadding?.double()
        source.iconPitchAlignment = self.iconPitchAlignment?.iconPitchAlignment()
        source.iconRotate = self.iconRotate?.double()
        source.iconRotationAlignment = self.iconRotationAlignment?.iconRotationAlignment()
        source.iconSize = self.iconSize?.double()
        source.iconTextFit = self.iconTextFit?.iconTextFit()
        source.iconTextFitPadding = self.iconTextFitPadding?.arrayOfDouble()
        source.symbolAvoidEdges = self.symbolAvoidEdges?.bool()
        source.symbolPlacement = self.symbolPlacement?.symbolPlacement()
        source.symbolSortKey = self.symbolSortKey?.double()
        source.symbolSpacing = self.symbolSpacing?.double()
        source.symbolZElevate = self.symbolZElevate?.bool()
        source.symbolZOrder = self.symbolZOrder?.symbolZOrder()
        source.textAllowOverlap = self.textAllowOverlap?.bool()
        source.textAnchor = self.textAnchor?.textAnchor()
        source.textField = self.textField?.string()
        source.textFont = self.textFont?.arrayOfString()
        source.textIgnorePlacement = self.textIgnorePlacement?.bool()
        source.textJustify = self.textJustify?.textJustify()
        source.textKeepUpright = self.textKeepUpright?.bool()
        source.textLetterSpacing = self.textLetterSpacing?.double()
        source.textLineHeight = self.textLineHeight?.double()
        source.textMaxAngle = self.textMaxAngle?.double()
        source.textMaxWidth = self.textMaxWidth?.double()
        source.textOffset = self.textOffset?.arrayOfDouble()
        source.textOptional = self.textOptional?.bool()
        source.textPadding = self.textPadding?.double()
        source.textPitchAlignment = self.textPitchAlignment?.textPitchAlignment()
        source.textRadialOffset = self.textRadialOffset?.double()
        source.textRotate = self.textRotate?.double()
        source.textRotationAlignment = self.textRotationAlignment?.textRotationAlignment()
        source.textSize = self.textSize?.double()
        source.textTransform = self.textTransform?.textTransform()
        source.textVariableAnchor = self.textVariableAnchor?.arrayOfTextAnchor()
        source.textWritingMode = self.textWritingMode?.arrayOfTextWritingMode()
        source.iconColor = self.iconColor?.styleColor()
        source.iconColorTransition = self.iconColorTransition?.wrap()
        source.iconColorSaturation = self.iconColorSaturation?.double()
        source.iconColorSaturationTransition = self.iconColorSaturationTransition?.wrap()
        source.iconEmissiveStrength = self.iconEmissiveStrength?.double()
        source.iconEmissiveStrengthTransition = self.iconEmissiveStrengthTransition?.wrap()
        source.iconHaloBlur = self.iconHaloBlur?.double()
        source.iconHaloBlurTransition = self.iconHaloBlurTransition?.wrap()
        source.iconHaloColor = self.iconHaloColor?.styleColor()
        source.iconHaloColorTransition = self.iconHaloColorTransition?.wrap()
        source.iconHaloWidth = self.iconHaloWidth?.double()
        source.iconHaloWidthTransition = self.iconHaloWidthTransition?.wrap()
        source.iconImageCrossFade = self.iconImageCrossFade?.double()
        source.iconImageCrossFadeTransition = self.iconImageCrossFadeTransition?.wrap()
        source.iconOpacity = self.iconOpacity?.double()
        source.iconOpacityTransition = self.iconOpacityTransition?.wrap()
        source.iconTranslate = self.iconTranslate?.arrayOfDouble()
        source.iconTranslateTransition = self.iconTranslateTransition?.wrap()
        source.iconTranslateAnchor = self.iconTranslateAnchor?.iconTranslateAnchor()
        source.textColor = self.textColor?.styleColor()
        source.textColorTransition = self.textColorTransition?.wrap()
        source.textEmissiveStrength = self.textEmissiveStrength?.double()
        source.textEmissiveStrengthTransition = self.textEmissiveStrengthTransition?.wrap()
        source.textHaloBlur = self.textHaloBlur?.double()
        source.textHaloBlurTransition = self.textHaloBlurTransition?.wrap()
        source.textHaloColor = self.textHaloColor?.styleColor()
        source.textHaloColorTransition = self.textHaloColorTransition?.wrap()
        source.textHaloWidth = self.textHaloWidth?.double()
        source.textHaloWidthTransition = self.textHaloWidthTransition?.wrap()
        source.textOpacity = self.textOpacity?.double()
        source.textOpacityTransition = self.textOpacityTransition?.wrap()
        source.textTranslate = self.textTranslate?.arrayOfDouble()
        source.textTranslateTransition = self.textTranslateTransition?.wrap()
        source.textTranslateAnchor = self.textTranslateAnchor?.textTranslateAnchor()
    }
}

extension TMBSymbolLayer: SwiftValueConvertible {
    public func unwrap() -> SymbolLayer {
        var result = SymbolLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}

extension SymbolLayer {
    func wrap() -> TMBSymbolLayer {
        var result = TMBSymbolLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}