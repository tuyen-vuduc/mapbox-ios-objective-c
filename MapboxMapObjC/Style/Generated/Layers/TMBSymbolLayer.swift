// This file is generated.
import Foundation
import MapboxMaps


/// An icon or a text label.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-symbol)
@objc open class TMBSymbolLayer: NSObject, TMBLayer {

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

    /// If true, the icon will be visible even if it collides with other previously drawn symbols.
    @objc public var  iconAllowOverlap: TMBValue?

    /// Part of the icon placed closest to the anchor.
    @objc public var  iconAnchor: TMBValue?

    /// If true, other symbols can be visible even if they collide with the icon.
    @objc public var  iconIgnorePlacement: TMBValue?

    /// Name of image in sprite to use for drawing an image background.
    @objc public var  iconImage: TMBValue?

    /// If true, the icon may be flipped to prevent it from being rendered upside-down.
    @objc public var  iconKeepUpright: TMBValue?

    /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
    @objc public var  iconOffset: TMBValue?

    /// If true, text will display without their corresponding icons when the icon collides with other symbols and the text does not.
    @objc public var  iconOptional: TMBValue?

    /// Size of the additional area around the icon bounding box used for detecting symbol collisions.
    @objc public var  iconPadding: TMBValue?

    /// Orientation of icon when map is pitched.
    @objc public var  iconPitchAlignment: TMBValue?

    /// Rotates the icon clockwise.
    @objc public var  iconRotate: TMBValue?

    /// In combination with `symbol-placement`, determines the rotation behavior of icons.
    @objc public var  iconRotationAlignment: TMBValue?

    /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
    @objc public var  iconSize: TMBValue?

    /// Scales the icon to fit around the associated text.
    @objc public var  iconTextFit: TMBValue?

    /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
    @objc public var  iconTextFitPadding: TMBValue?

    /// If true, the symbols will not cross tile edges to avoid mutual collisions. Recommended in layers that don't have enough padding in the vector tile to prevent collisions, or if it is a point symbol layer placed after a line symbol layer. When using a client that supports global collision detection, like Mapbox GL JS version 0.42.0 or greater, enabling this property is not needed to prevent clipped labels at tile boundaries.
    @objc public var  symbolAvoidEdges: TMBValue?

    /// Label placement relative to its geometry.
    @objc public var  symbolPlacement: TMBValue?

    /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first. When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
    @objc public var  symbolSortKey: TMBValue?

    /// Distance between two symbol anchors.
    @objc public var  symbolSpacing: TMBValue?

    /// Position symbol on buildings (both fill extrusions and models) roof tops. In order to have minimal impact on performance, this is supported only when `fill-extrusion-height` is not zoom-dependent and not edited after initial bucket creation. For fading in buildings when zooming in, fill-extrusion-vertical-scale should be used and symbols would raise with building roofs. Symbols are sorted by elevation, except in case when `viewport-y` sorting or `symbol-sort-key` are applied.
    @objc public var  symbolZElevate: TMBValue?

    /// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
    @objc public var  symbolZOrder: TMBValue?

    /// If true, the text will be visible even if it collides with other previously drawn symbols.
    @objc public var  textAllowOverlap: TMBValue?

    /// Part of the text placed closest to the anchor.
    @objc public var  textAnchor: TMBValue?

    /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
    @objc public var  textField: TMBValue?

    /// Font stack to use for displaying text.
    @objc public var  textFont: TMBValue?

    /// If true, other symbols can be visible even if they collide with the text.
    @objc public var  textIgnorePlacement: TMBValue?

    /// Text justification options.
    @objc public var  textJustify: TMBValue?

    /// If true, the text may be flipped vertically to prevent it from being rendered upside-down.
    @objc public var  textKeepUpright: TMBValue?

    /// Text tracking amount.
    @objc public var  textLetterSpacing: TMBValue?

    /// Text leading value for multi-line text.
    @objc public var  textLineHeight: TMBValue?

    /// Maximum angle change between adjacent characters.
    @objc public var  textMaxAngle: TMBValue?

    /// The maximum line width for text wrapping.
    @objc public var  textMaxWidth: TMBValue?

    /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
    @objc public var  textOffset: TMBValue?

    /// If true, icons will display without their corresponding text when the text collides with other symbols and the icon does not.
    @objc public var  textOptional: TMBValue?

    /// Size of the additional area around the text bounding box used for detecting symbol collisions.
    @objc public var  textPadding: TMBValue?

    /// Orientation of text when map is pitched.
    @objc public var  textPitchAlignment: TMBValue?

    /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
    @objc public var  textRadialOffset: TMBValue?

    /// Rotates the text clockwise.
    @objc public var  textRotate: TMBValue?

    /// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
    @objc public var  textRotationAlignment: TMBValue?

    /// Font size.
    @objc public var  textSize: TMBValue?

    /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
    @objc public var  textTransform: TMBValue?

    /// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
    @objc public var  textVariableAnchor: TMBValue?

    /// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
    @objc public var  textWritingMode: TMBValue?

    /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc public var  iconColor: TMBValue?

    /// Transition options for `iconColor`.
    @objc public var  iconColorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var  iconEmissiveStrength: TMBValue?

    /// Transition options for `iconEmissiveStrength`.
    @objc public var  iconEmissiveStrengthTransition: TMBStyleTransition?

    /// Fade out the halo towards the outside.
    @objc public var  iconHaloBlur: TMBValue?

    /// Transition options for `iconHaloBlur`.
    @objc public var  iconHaloBlurTransition: TMBStyleTransition?

    /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc public var  iconHaloColor: TMBValue?

    /// Transition options for `iconHaloColor`.
    @objc public var  iconHaloColorTransition: TMBStyleTransition?

    /// Distance of halo to the icon outline.
    @objc public var  iconHaloWidth: TMBValue?

    /// Transition options for `iconHaloWidth`.
    @objc public var  iconHaloWidthTransition: TMBStyleTransition?

    /// Controls the transition progress between the image variants of icon-image. Zero means the first variant is used, one is the second, and in between they are blended together.
    @objc public var  iconImageCrossFade: TMBValue?

    /// Transition options for `iconImageCrossFade`.
    @objc public var  iconImageCrossFadeTransition: TMBStyleTransition?

    /// The opacity at which the icon will be drawn.
    @objc public var  iconOpacity: TMBValue?

    /// Transition options for `iconOpacity`.
    @objc public var  iconOpacityTransition: TMBStyleTransition?

    /// Distance that the icon's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc public var  iconTranslate: TMBValue?

    /// Transition options for `iconTranslate`.
    @objc public var  iconTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `icon-translate`.
    @objc public var  iconTranslateAnchor: TMBValue?

    /// The color with which the text will be drawn.
    @objc public var  textColor: TMBValue?

    /// Transition options for `textColor`.
    @objc public var  textColorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var  textEmissiveStrength: TMBValue?

    /// Transition options for `textEmissiveStrength`.
    @objc public var  textEmissiveStrengthTransition: TMBStyleTransition?

    /// The halo's fadeout distance towards the outside.
    @objc public var  textHaloBlur: TMBValue?

    /// Transition options for `textHaloBlur`.
    @objc public var  textHaloBlurTransition: TMBStyleTransition?

    /// The color of the text's halo, which helps it stand out from backgrounds.
    @objc public var  textHaloColor: TMBValue?

    /// Transition options for `textHaloColor`.
    @objc public var  textHaloColorTransition: TMBStyleTransition?

    /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
    @objc public var  textHaloWidth: TMBValue?

    /// Transition options for `textHaloWidth`.
    @objc public var  textHaloWidthTransition: TMBStyleTransition?

    /// The opacity at which the text will be drawn.
    @objc public var  textOpacity: TMBValue?

    /// Transition options for `textOpacity`.
    @objc public var  textOpacityTransition: TMBStyleTransition?

    /// Distance that the text's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc public var  textTranslate: TMBValue?

    /// Transition options for `textTranslate`.
    @objc public var  textTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `text-translate`.
    @objc public var  textTranslateAnchor: TMBValue?

    
    @objc public init(id : String, source : String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.symbol
        self.visibility = .visibility(.visible)
    }
}
extension TMBSymbolLayer {
    func unwrap() -> SymbolLayer {
        var result = SymbolLayer(id: self.id,
            source: self.source!)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout SymbolLayer) {
        dest.filter = self.filter?.unwrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.unwrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.iconAllowOverlap = self.iconAllowOverlap?.bool()
        dest.iconAnchor = self.iconAnchor?.iconAnchor()
        dest.iconIgnorePlacement = self.iconIgnorePlacement?.bool()
        dest.iconImage = self.iconImage?.resolvedImage()
        dest.iconKeepUpright = self.iconKeepUpright?.bool()
        dest.iconOffset = self.iconOffset?.arrayOfDouble()
        dest.iconOptional = self.iconOptional?.bool()
        dest.iconPadding = self.iconPadding?.double()
        dest.iconPitchAlignment = self.iconPitchAlignment?.iconPitchAlignment()
        dest.iconRotate = self.iconRotate?.double()
        dest.iconRotationAlignment = self.iconRotationAlignment?.iconRotationAlignment()
        dest.iconSize = self.iconSize?.double()
        dest.iconTextFit = self.iconTextFit?.iconTextFit()
        dest.iconTextFitPadding = self.iconTextFitPadding?.arrayOfDouble()
        dest.symbolAvoidEdges = self.symbolAvoidEdges?.bool()
        dest.symbolPlacement = self.symbolPlacement?.symbolPlacement()
        dest.symbolSortKey = self.symbolSortKey?.double()
        dest.symbolSpacing = self.symbolSpacing?.double()
        dest.symbolZElevate = self.symbolZElevate?.bool()
        dest.symbolZOrder = self.symbolZOrder?.symbolZOrder()
        dest.textAllowOverlap = self.textAllowOverlap?.bool()
        dest.textAnchor = self.textAnchor?.textAnchor()
        dest.textField = self.textField?.string()
        dest.textFont = self.textFont?.arrayOfString()
        dest.textIgnorePlacement = self.textIgnorePlacement?.bool()
        dest.textJustify = self.textJustify?.textJustify()
        dest.textKeepUpright = self.textKeepUpright?.bool()
        dest.textLetterSpacing = self.textLetterSpacing?.double()
        dest.textLineHeight = self.textLineHeight?.double()
        dest.textMaxAngle = self.textMaxAngle?.double()
        dest.textMaxWidth = self.textMaxWidth?.double()
        dest.textOffset = self.textOffset?.arrayOfDouble()
        dest.textOptional = self.textOptional?.bool()
        dest.textPadding = self.textPadding?.double()
        dest.textPitchAlignment = self.textPitchAlignment?.textPitchAlignment()
        dest.textRadialOffset = self.textRadialOffset?.double()
        dest.textRotate = self.textRotate?.double()
        dest.textRotationAlignment = self.textRotationAlignment?.textRotationAlignment()
        dest.textSize = self.textSize?.double()
        dest.textTransform = self.textTransform?.textTransform()
        dest.textVariableAnchor = self.textVariableAnchor?.arrayOfTextAnchor()
        dest.textWritingMode = self.textWritingMode?.arrayOfTextWritingMode()
        dest.iconColor = self.iconColor?.styleColor()
        dest.iconColorTransition = self.iconColorTransition?.unwrap()
        dest.iconEmissiveStrength = self.iconEmissiveStrength?.double()
        dest.iconEmissiveStrengthTransition = self.iconEmissiveStrengthTransition?.unwrap()
        dest.iconHaloBlur = self.iconHaloBlur?.double()
        dest.iconHaloBlurTransition = self.iconHaloBlurTransition?.unwrap()
        dest.iconHaloColor = self.iconHaloColor?.styleColor()
        dest.iconHaloColorTransition = self.iconHaloColorTransition?.unwrap()
        dest.iconHaloWidth = self.iconHaloWidth?.double()
        dest.iconHaloWidthTransition = self.iconHaloWidthTransition?.unwrap()
        dest.iconImageCrossFade = self.iconImageCrossFade?.double()
        dest.iconImageCrossFadeTransition = self.iconImageCrossFadeTransition?.unwrap()
        dest.iconOpacity = self.iconOpacity?.double()
        dest.iconOpacityTransition = self.iconOpacityTransition?.unwrap()
        dest.iconTranslate = self.iconTranslate?.arrayOfDouble()
        dest.iconTranslateTransition = self.iconTranslateTransition?.unwrap()
        dest.iconTranslateAnchor = self.iconTranslateAnchor?.iconTranslateAnchor()
        dest.textColor = self.textColor?.styleColor()
        dest.textColorTransition = self.textColorTransition?.unwrap()
        dest.textEmissiveStrength = self.textEmissiveStrength?.double()
        dest.textEmissiveStrengthTransition = self.textEmissiveStrengthTransition?.unwrap()
        dest.textHaloBlur = self.textHaloBlur?.double()
        dest.textHaloBlurTransition = self.textHaloBlurTransition?.unwrap()
        dest.textHaloColor = self.textHaloColor?.styleColor()
        dest.textHaloColorTransition = self.textHaloColorTransition?.unwrap()
        dest.textHaloWidth = self.textHaloWidth?.double()
        dest.textHaloWidthTransition = self.textHaloWidthTransition?.unwrap()
        dest.textOpacity = self.textOpacity?.double()
        dest.textOpacityTransition = self.textOpacityTransition?.unwrap()
        dest.textTranslate = self.textTranslate?.arrayOfDouble()
        dest.textTranslateTransition = self.textTranslateTransition?.unwrap()
        dest.textTranslateAnchor = self.textTranslateAnchor?.textTranslateAnchor()
    }
}
extension SymbolLayer {
    func wrap() -> TMBSymbolLayer {
        var result = TMBSymbolLayer(id: self.id,
          source: self.source!)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBSymbolLayer)  {
        dest.filter = self.filter?.wrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.wrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.iconAllowOverlap = self.iconAllowOverlap?.bool()
        dest.iconAnchor = self.iconAnchor?.iconAnchor()
        dest.iconIgnorePlacement = self.iconIgnorePlacement?.bool()
        dest.iconImage = self.iconImage?.resolvedImage()
        dest.iconKeepUpright = self.iconKeepUpright?.bool()
        dest.iconOffset = self.iconOffset?.arrayOfDouble()
        dest.iconOptional = self.iconOptional?.bool()
        dest.iconPadding = self.iconPadding?.double()
        dest.iconPitchAlignment = self.iconPitchAlignment?.iconPitchAlignment()
        dest.iconRotate = self.iconRotate?.double()
        dest.iconRotationAlignment = self.iconRotationAlignment?.iconRotationAlignment()
        dest.iconSize = self.iconSize?.double()
        dest.iconTextFit = self.iconTextFit?.iconTextFit()
        dest.iconTextFitPadding = self.iconTextFitPadding?.arrayOfDouble()
        dest.symbolAvoidEdges = self.symbolAvoidEdges?.bool()
        dest.symbolPlacement = self.symbolPlacement?.symbolPlacement()
        dest.symbolSortKey = self.symbolSortKey?.double()
        dest.symbolSpacing = self.symbolSpacing?.double()
        dest.symbolZElevate = self.symbolZElevate?.bool()
        dest.symbolZOrder = self.symbolZOrder?.symbolZOrder()
        dest.textAllowOverlap = self.textAllowOverlap?.bool()
        dest.textAnchor = self.textAnchor?.textAnchor()
        dest.textField = self.textField?.string()
        dest.textFont = self.textFont?.arrayOfString()
        dest.textIgnorePlacement = self.textIgnorePlacement?.bool()
        dest.textJustify = self.textJustify?.textJustify()
        dest.textKeepUpright = self.textKeepUpright?.bool()
        dest.textLetterSpacing = self.textLetterSpacing?.double()
        dest.textLineHeight = self.textLineHeight?.double()
        dest.textMaxAngle = self.textMaxAngle?.double()
        dest.textMaxWidth = self.textMaxWidth?.double()
        dest.textOffset = self.textOffset?.arrayOfDouble()
        dest.textOptional = self.textOptional?.bool()
        dest.textPadding = self.textPadding?.double()
        dest.textPitchAlignment = self.textPitchAlignment?.textPitchAlignment()
        dest.textRadialOffset = self.textRadialOffset?.double()
        dest.textRotate = self.textRotate?.double()
        dest.textRotationAlignment = self.textRotationAlignment?.textRotationAlignment()
        dest.textSize = self.textSize?.double()
        dest.textTransform = self.textTransform?.textTransform()
        dest.textVariableAnchor = self.textVariableAnchor?.arrayOfTextAnchor()
        dest.textWritingMode = self.textWritingMode?.arrayOfTextWritingMode()
        dest.iconColor = self.iconColor?.styleColor()
        dest.iconColorTransition = self.iconColorTransition?.wrap()
        dest.iconEmissiveStrength = self.iconEmissiveStrength?.double()
        dest.iconEmissiveStrengthTransition = self.iconEmissiveStrengthTransition?.wrap()
        dest.iconHaloBlur = self.iconHaloBlur?.double()
        dest.iconHaloBlurTransition = self.iconHaloBlurTransition?.wrap()
        dest.iconHaloColor = self.iconHaloColor?.styleColor()
        dest.iconHaloColorTransition = self.iconHaloColorTransition?.wrap()
        dest.iconHaloWidth = self.iconHaloWidth?.double()
        dest.iconHaloWidthTransition = self.iconHaloWidthTransition?.wrap()
        dest.iconImageCrossFade = self.iconImageCrossFade?.double()
        dest.iconImageCrossFadeTransition = self.iconImageCrossFadeTransition?.wrap()
        dest.iconOpacity = self.iconOpacity?.double()
        dest.iconOpacityTransition = self.iconOpacityTransition?.wrap()
        dest.iconTranslate = self.iconTranslate?.arrayOfDouble()
        dest.iconTranslateTransition = self.iconTranslateTransition?.wrap()
        dest.iconTranslateAnchor = self.iconTranslateAnchor?.iconTranslateAnchor()
        dest.textColor = self.textColor?.styleColor()
        dest.textColorTransition = self.textColorTransition?.wrap()
        dest.textEmissiveStrength = self.textEmissiveStrength?.double()
        dest.textEmissiveStrengthTransition = self.textEmissiveStrengthTransition?.wrap()
        dest.textHaloBlur = self.textHaloBlur?.double()
        dest.textHaloBlurTransition = self.textHaloBlurTransition?.wrap()
        dest.textHaloColor = self.textHaloColor?.styleColor()
        dest.textHaloColorTransition = self.textHaloColorTransition?.wrap()
        dest.textHaloWidth = self.textHaloWidth?.double()
        dest.textHaloWidthTransition = self.textHaloWidthTransition?.wrap()
        dest.textOpacity = self.textOpacity?.double()
        dest.textOpacityTransition = self.textOpacityTransition?.wrap()
        dest.textTranslate = self.textTranslate?.arrayOfDouble()
        dest.textTranslateTransition = self.textTranslateTransition?.wrap()
        dest.textTranslateAnchor = self.textTranslateAnchor?.textTranslateAnchor()
    }
}
