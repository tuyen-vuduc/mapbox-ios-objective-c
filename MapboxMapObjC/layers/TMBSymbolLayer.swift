// This file is generated.
import Foundation
import MapboxMaps

/// An icon or a text label.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-symbol)
@objc open class TMBSymbolLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.symbol)
        
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

    /// If true, the icon will be visible even if it collides with other previously drawn symbols.
    @objc public var iconAllowOverlap : TMBValue?

    /// Part of the icon placed closest to the anchor.
    @objc public var iconAnchor : TMBValue?

    /// If true, other symbols can be visible even if they collide with the icon.
    @objc public var iconIgnorePlacement : TMBValue?

    /// Name of image in sprite to use for drawing an image background.
    @objc public var iconImage : TMBValue?

    /// If true, the icon may be flipped to prevent it from being rendered upside-down.
    @objc public var iconKeepUpright : TMBValue?

    /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
    @objc public var iconOffset : TMBValue?

    /// If true, text will display without their corresponding icons when the icon collides with other symbols and the text does not.
    @objc public var iconOptional : TMBValue?

    /// Size of the additional area around the icon bounding box used for detecting symbol collisions.
    @objc public var iconPadding : TMBValue?

    /// Orientation of icon when map is pitched.
    @objc public var iconPitchAlignment : TMBValue?

    /// Rotates the icon clockwise.
    @objc public var iconRotate : TMBValue?

    /// In combination with `symbol-placement`, determines the rotation behavior of icons.
    @objc public var iconRotationAlignment : TMBValue?

    /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
    @objc public var iconSize : TMBValue?

    /// Scales the icon to fit around the associated text.
    @objc public var iconTextFit : TMBValue?

    /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
    @objc public var iconTextFitPadding : TMBValue?

    /// If true, the symbols will not cross tile edges to avoid mutual collisions. Recommended in layers that don't have enough padding in the vector tile to prevent collisions, or if it is a point symbol layer placed after a line symbol layer. When using a client that supports global collision detection, like Mapbox GL JS version 0.42.0 or greater, enabling this property is not needed to prevent clipped labels at tile boundaries.
    @objc public var symbolAvoidEdges : TMBValue?

    /// Label placement relative to its geometry.
    @objc public var symbolPlacement : TMBValue?

    /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first.  When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
    @objc public var symbolSortKey : TMBValue?

    /// Distance between two symbol anchors.
    @objc public var symbolSpacing : TMBValue?

    /// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
    @objc public var symbolZOrder : TMBValue?

    /// If true, the text will be visible even if it collides with other previously drawn symbols.
    @objc public var textAllowOverlap : TMBValue?

    /// Part of the text placed closest to the anchor.
    @objc public var textAnchor : TMBValue?

    /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
    @objc public var textField : TMBValue?

    /// Font stack to use for displaying text.
    @objc public var textFont : TMBValue?

    /// If true, other symbols can be visible even if they collide with the text.
    @objc public var textIgnorePlacement : TMBValue?

    /// Text justification options.
    @objc public var textJustify : TMBValue?

    /// If true, the text may be flipped vertically to prevent it from being rendered upside-down.
    @objc public var textKeepUpright : TMBValue?

    /// Text tracking amount.
    @objc public var textLetterSpacing : TMBValue?

    /// Text leading value for multi-line text.
    @objc public var textLineHeight : TMBValue?

    /// Maximum angle change between adjacent characters.
    @objc public var textMaxAngle : TMBValue?

    /// The maximum line width for text wrapping.
    @objc public var textMaxWidth : TMBValue?

    /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
    @objc public var textOffset : TMBValue?

    /// If true, icons will display without their corresponding text when the text collides with other symbols and the icon does not.
    @objc public var textOptional : TMBValue?

    /// Size of the additional area around the text bounding box used for detecting symbol collisions.
    @objc public var textPadding : TMBValue?

    /// Orientation of text when map is pitched.
    @objc public var textPitchAlignment : TMBValue?

    /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
    @objc public var textRadialOffset : TMBValue?

    /// Rotates the text clockwise.
    @objc public var textRotate : TMBValue?

    /// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
    @objc public var textRotationAlignment : TMBValue?

    /// Font size.
    @objc public var textSize : TMBValue?

    /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
    @objc public var textTransform : TMBValue?

    /// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
    @objc public var textVariableAnchor : TMBValue?

    /// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
    @objc public var textWritingMode : TMBValue?

    /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc public var iconColor : TMBValue?

    /// Transition options for `iconColor`.
    @objc public var iconColorTransition : TMBStyleTransition?

    /// Fade out the halo towards the outside.
    @objc public var iconHaloBlur : TMBValue?

    /// Transition options for `iconHaloBlur`.
    @objc public var iconHaloBlurTransition : TMBStyleTransition?

    /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc public var iconHaloColor : TMBValue?

    /// Transition options for `iconHaloColor`.
    @objc public var iconHaloColorTransition : TMBStyleTransition?

    /// Distance of halo to the icon outline.
    @objc public var iconHaloWidth : TMBValue?

    /// Transition options for `iconHaloWidth`.
    @objc public var iconHaloWidthTransition : TMBStyleTransition?

    /// The opacity at which the icon will be drawn.
    @objc public var iconOpacity : TMBValue?

    /// Transition options for `iconOpacity`.
    @objc public var iconOpacityTransition : TMBStyleTransition?

    /// Distance that the icon's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc public var iconTranslate : TMBValue?

    /// Transition options for `iconTranslate`.
    @objc public var iconTranslateTransition : TMBStyleTransition?

    /// Controls the frame of reference for `icon-translate`.
    @objc public var iconTranslateAnchor : TMBValue?

    /// The color with which the text will be drawn.
    @objc public var textColor : TMBValue?

    /// Transition options for `textColor`.
    @objc public var textColorTransition : TMBStyleTransition?

    /// The halo's fadeout distance towards the outside.
    @objc public var textHaloBlur : TMBValue?

    /// Transition options for `textHaloBlur`.
    @objc public var textHaloBlurTransition : TMBStyleTransition?

    /// The color of the text's halo, which helps it stand out from backgrounds.
    @objc public var textHaloColor : TMBValue?

    /// Transition options for `textHaloColor`.
    @objc public var textHaloColorTransition : TMBStyleTransition?

    /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
    @objc public var textHaloWidth : TMBValue?

    /// Transition options for `textHaloWidth`.
    @objc public var textHaloWidthTransition : TMBStyleTransition?

    /// The opacity at which the text will be drawn.
    @objc public var textOpacity : TMBValue?

    /// Transition options for `textOpacity`.
    @objc public var textOpacityTransition : TMBStyleTransition?

    /// Distance that the text's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc public var textTranslate : TMBValue?

    /// Transition options for `textTranslate`.
    @objc public var textTranslateTransition : TMBStyleTransition?

    /// Controls the frame of reference for `text-translate`.
    @objc public var textTranslateAnchor : TMBValue?

}

extension TMBSymbolLayer {
    public func mapTo(_ layer: inout SymbolLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.iconAllowOverlap = self.iconAllowOverlap?.boolean()
        layer.iconAnchor = self.iconAnchor?.iconAnchor()
        layer.iconIgnorePlacement = self.iconIgnorePlacement?.boolean()
        layer.iconImage = self.iconImage?.resolvedImage()
        layer.iconKeepUpright = self.iconKeepUpright?.boolean()
        layer.iconOffset = self.iconOffset?.arrayOfDouble()
        layer.iconOptional = self.iconOptional?.boolean()
        layer.iconPadding = self.iconPadding?.double()
        layer.iconPitchAlignment = self.iconPitchAlignment?.iconPitchAlignment()
        layer.iconRotate = self.iconRotate?.double()
        layer.iconRotationAlignment = self.iconRotationAlignment?.iconRotationAlignment()
        layer.iconSize = self.iconSize?.double()
        layer.iconTextFit = self.iconTextFit?.iconTextFit()
        layer.iconTextFitPadding = self.iconTextFitPadding?.arrayOfDouble()
        layer.symbolAvoidEdges = self.symbolAvoidEdges?.boolean()
        layer.symbolPlacement = self.symbolPlacement?.symbolPlacement()
        layer.symbolSortKey = self.symbolSortKey?.double()
        layer.symbolSpacing = self.symbolSpacing?.double()
        layer.symbolZOrder = self.symbolZOrder?.symbolZOrder()
        layer.textAllowOverlap = self.textAllowOverlap?.boolean()
        layer.textAnchor = self.textAnchor?.textAnchor()
        layer.textField = self.textField?.string()
        layer.textFont = self.textFont?.arrayOfString()
        layer.textIgnorePlacement = self.textIgnorePlacement?.boolean()
        layer.textJustify = self.textJustify?.textJustify()
        layer.textKeepUpright = self.textKeepUpright?.boolean()
        layer.textLetterSpacing = self.textLetterSpacing?.double()
        layer.textLineHeight = self.textLineHeight?.double()
        layer.textMaxAngle = self.textMaxAngle?.double()
        layer.textMaxWidth = self.textMaxWidth?.double()
        layer.textOffset = self.textOffset?.arrayOfDouble()
        layer.textOptional = self.textOptional?.boolean()
        layer.textPadding = self.textPadding?.double()
        layer.textPitchAlignment = self.textPitchAlignment?.textPitchAlignment()
        layer.textRadialOffset = self.textRadialOffset?.double()
        layer.textRotate = self.textRotate?.double()
        layer.textRotationAlignment = self.textRotationAlignment?.textRotationAlignment()
        layer.textSize = self.textSize?.double()
        layer.textTransform = self.textTransform?.textTransform()
        layer.textVariableAnchor = self.textVariableAnchor?.arrayOfTextAnchor()
        layer.textWritingMode = self.textWritingMode?.arrayOfTextWritingMode()
        layer.iconColor = self.iconColor?.styleColor()
        layer.iconColorTransition = self.iconColorTransition?.styleTransition()
        layer.iconHaloBlur = self.iconHaloBlur?.double()
        layer.iconHaloBlurTransition = self.iconHaloBlurTransition?.styleTransition()
        layer.iconHaloColor = self.iconHaloColor?.styleColor()
        layer.iconHaloColorTransition = self.iconHaloColorTransition?.styleTransition()
        layer.iconHaloWidth = self.iconHaloWidth?.double()
        layer.iconHaloWidthTransition = self.iconHaloWidthTransition?.styleTransition()
        layer.iconOpacity = self.iconOpacity?.double()
        layer.iconOpacityTransition = self.iconOpacityTransition?.styleTransition()
        layer.iconTranslate = self.iconTranslate?.arrayOfDouble()
        layer.iconTranslateTransition = self.iconTranslateTransition?.styleTransition()
        layer.iconTranslateAnchor = self.iconTranslateAnchor?.iconTranslateAnchor()
        layer.textColor = self.textColor?.styleColor()
        layer.textColorTransition = self.textColorTransition?.styleTransition()
        layer.textHaloBlur = self.textHaloBlur?.double()
        layer.textHaloBlurTransition = self.textHaloBlurTransition?.styleTransition()
        layer.textHaloColor = self.textHaloColor?.styleColor()
        layer.textHaloColorTransition = self.textHaloColorTransition?.styleTransition()
        layer.textHaloWidth = self.textHaloWidth?.double()
        layer.textHaloWidthTransition = self.textHaloWidthTransition?.styleTransition()
        layer.textOpacity = self.textOpacity?.double()
        layer.textOpacityTransition = self.textOpacityTransition?.styleTransition()
        layer.textTranslate = self.textTranslate?.arrayOfDouble()
        layer.textTranslateTransition = self.textTranslateTransition?.styleTransition()
        layer.textTranslateAnchor = self.textTranslateAnchor?.textTranslateAnchor()
    }
}

extension SymbolLayer {
    public func mapTo(_ layer:inout TMBSymbolLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = TMBValue.fromSwiftValue(self.visibility)
        layer.iconAllowOverlap = TMBValue.fromSwiftValue(self.iconAllowOverlap)
        layer.iconAnchor = TMBValue.fromSwiftValue(self.iconAnchor)
        layer.iconIgnorePlacement = TMBValue.fromSwiftValue(self.iconIgnorePlacement)
        layer.iconImage = TMBValue.fromSwiftValue(self.iconImage)
        layer.iconKeepUpright = TMBValue.fromSwiftValue(self.iconKeepUpright)
        layer.iconOffset = TMBValue.fromSwiftValue(self.iconOffset)
        layer.iconOptional = TMBValue.fromSwiftValue(self.iconOptional)
        layer.iconPadding = TMBValue.fromSwiftValue(self.iconPadding)
        layer.iconPitchAlignment = TMBValue.fromSwiftValue(self.iconPitchAlignment)
        layer.iconRotate = TMBValue.fromSwiftValue(self.iconRotate)
        layer.iconRotationAlignment = TMBValue.fromSwiftValue(self.iconRotationAlignment)
        layer.iconSize = TMBValue.fromSwiftValue(self.iconSize)
        layer.iconTextFit = TMBValue.fromSwiftValue(self.iconTextFit)
        layer.iconTextFitPadding = TMBValue.fromSwiftValue(self.iconTextFitPadding)
        layer.symbolAvoidEdges = TMBValue.fromSwiftValue(self.symbolAvoidEdges)
        layer.symbolPlacement = TMBValue.fromSwiftValue(self.symbolPlacement)
        layer.symbolSortKey = TMBValue.fromSwiftValue(self.symbolSortKey)
        layer.symbolSpacing = TMBValue.fromSwiftValue(self.symbolSpacing)
        layer.symbolZOrder = TMBValue.fromSwiftValue(self.symbolZOrder)
        layer.textAllowOverlap = TMBValue.fromSwiftValue(self.textAllowOverlap)
        layer.textAnchor = TMBValue.fromSwiftValue(self.textAnchor)
        layer.textField = TMBValue.fromSwiftValue(self.textField)
        layer.textFont = TMBValue.fromSwiftValue(self.textFont)
        layer.textIgnorePlacement = TMBValue.fromSwiftValue(self.textIgnorePlacement)
        layer.textJustify = TMBValue.fromSwiftValue(self.textJustify)
        layer.textKeepUpright = TMBValue.fromSwiftValue(self.textKeepUpright)
        layer.textLetterSpacing = TMBValue.fromSwiftValue(self.textLetterSpacing)
        layer.textLineHeight = TMBValue.fromSwiftValue(self.textLineHeight)
        layer.textMaxAngle = TMBValue.fromSwiftValue(self.textMaxAngle)
        layer.textMaxWidth = TMBValue.fromSwiftValue(self.textMaxWidth)
        layer.textOffset = TMBValue.fromSwiftValue(self.textOffset)
        layer.textOptional = TMBValue.fromSwiftValue(self.textOptional)
        layer.textPadding = TMBValue.fromSwiftValue(self.textPadding)
        layer.textPitchAlignment = TMBValue.fromSwiftValue(self.textPitchAlignment)
        layer.textRadialOffset = TMBValue.fromSwiftValue(self.textRadialOffset)
        layer.textRotate = TMBValue.fromSwiftValue(self.textRotate)
        layer.textRotationAlignment = TMBValue.fromSwiftValue(self.textRotationAlignment)
        layer.textSize = TMBValue.fromSwiftValue(self.textSize)
        layer.textTransform = TMBValue.fromSwiftValue(self.textTransform)
        layer.textVariableAnchor = TMBValue.fromSwiftValue(self.textVariableAnchor)
        layer.textWritingMode = TMBValue.fromSwiftValue(self.textWritingMode)
        layer.iconColor = TMBValue.fromSwiftValue(self.iconColor)
        layer.iconColorTransition = self.iconColorTransition?.objcValue()
        layer.iconHaloBlur = TMBValue.fromSwiftValue(self.iconHaloBlur)
        layer.iconHaloBlurTransition = self.iconHaloBlurTransition?.objcValue()
        layer.iconHaloColor = TMBValue.fromSwiftValue(self.iconHaloColor)
        layer.iconHaloColorTransition = self.iconHaloColorTransition?.objcValue()
        layer.iconHaloWidth = TMBValue.fromSwiftValue(self.iconHaloWidth)
        layer.iconHaloWidthTransition = self.iconHaloWidthTransition?.objcValue()
        layer.iconOpacity = TMBValue.fromSwiftValue(self.iconOpacity)
        layer.iconOpacityTransition = self.iconOpacityTransition?.objcValue()
        layer.iconTranslate = TMBValue.fromSwiftValue(self.iconTranslate)
        layer.iconTranslateTransition = self.iconTranslateTransition?.objcValue()
        layer.iconTranslateAnchor = TMBValue.fromSwiftValue(self.iconTranslateAnchor)
        layer.textColor = TMBValue.fromSwiftValue(self.textColor)
        layer.textColorTransition = self.textColorTransition?.objcValue()
        layer.textHaloBlur = TMBValue.fromSwiftValue(self.textHaloBlur)
        layer.textHaloBlurTransition = self.textHaloBlurTransition?.objcValue()
        layer.textHaloColor = TMBValue.fromSwiftValue(self.textHaloColor)
        layer.textHaloColorTransition = self.textHaloColorTransition?.objcValue()
        layer.textHaloWidth = TMBValue.fromSwiftValue(self.textHaloWidth)
        layer.textHaloWidthTransition = self.textHaloWidthTransition?.objcValue()
        layer.textOpacity = TMBValue.fromSwiftValue(self.textOpacity)
        layer.textOpacityTransition = self.textOpacityTransition?.objcValue()
        layer.textTranslate = TMBValue.fromSwiftValue(self.textTranslate)
        layer.textTranslateTransition = self.textTranslateTransition?.objcValue()
        layer.textTranslateAnchor = TMBValue.fromSwiftValue(self.textTranslateAnchor)
    }
}

extension TMBSymbolLayer: SwiftValueConvertible {
    public func swiftValue() -> SymbolLayer {
        var layer = SymbolLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension SymbolLayer: ObjcConvertible {
    public func objcValue() ->  TMBSymbolLayer {
        var layer = TMBSymbolLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}