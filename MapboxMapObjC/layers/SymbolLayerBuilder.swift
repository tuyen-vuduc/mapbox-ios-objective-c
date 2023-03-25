import MapboxMaps

@objc
extension MapView {
    @objc public func updateSymbolLayer(_ id: String, configure: (SymbolLayerBuilder)->Void, onError: ((Error)->Void)?) {
        let layerBuilder = SymbolLayerBuilder(id: id)
        configure(layerBuilder)
        
        do {
            try self.mapboxMap.style.updateLayer(
                withId: id,
                type: SymbolLayer.self,
                update: { layer in
                layerBuilder.update(&layer)
            })
        } catch {
            onError?(error)
        }
    }
}

@objc
open class SymbolLayerBuilder : NSObject, LayerBuilder {
    public typealias T = SymbolLayer
    
    public let id: String
    
    init(id: String) {
        self.id = id
        super.init()
    }
    
    public func create() -> SymbolLayer {
        SymbolLayer(id: id)
    }
    
    public func update(_ layer: inout SymbolLayer) -> Void {        
        if let filter = filter {
           layer.filter = filter.swiftOnly()
        }
        if let source = source {
           layer.source = source
        }
        if let sourceLayer = sourceLayer {
           layer.sourceLayer = sourceLayer
        }
        if let minZoom = minZoom {
           layer.minZoom = minZoom.doubleValue
        }
        if let maxZoom = maxZoom {
           layer.maxZoom = maxZoom.doubleValue
        }
        /// Whether this layer is displayed.
        if let visibility = visibility {
            layer.visibility = visibility.visibility()
        }

        /// If true, the icon will be visible even if it collides with other previously drawn symbols.
        if let iconAllowOverlap = iconAllowOverlap {
            layer.iconAllowOverlap = iconAllowOverlap.boolean()
        }

        /// Part of the icon placed closest to the anchor.
        if let iconAnchor = iconAnchor {
            layer.iconAnchor = iconAnchor.anchor()
        }

        /// If true, other symbols can be visible even if they collide with the icon.
        if let iconIgnorePlacement = iconIgnorePlacement {
            layer.iconIgnorePlacement = iconIgnorePlacement.boolean()
        }

        /// Name of image in sprite to use for drawing an image background.
        if let iconImage = iconImage {
            layer.iconImage = iconImage.resolvedImage()
        }

        /// If true, the icon may be flipped to prevent it from being rendered upside-down.
        if let iconKeepUpright = iconKeepUpright {
            layer.iconKeepUpright = iconKeepUpright.boolean()
        }

        /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
        if let iconOffset = iconOffset {
            layer.iconOffset = iconOffset.arrayOfDouble()
        }

        /// If true, text will display without their corresponding icons when the icon collides with other symbols and the text does not.
        if let iconOptional = iconOptional {
            layer.iconOptional = iconOptional.boolean()
        }

        /// Size of the additional area around the icon bounding box used for detecting symbol collisions.
        if let iconPadding = iconPadding {
            layer.iconPadding = iconPadding.double()
        }

        /// Orientation of icon when map is pitched.
        if let iconPitchAlignment = iconPitchAlignment {
            layer.iconPitchAlignment = iconPitchAlignment.iconPitchAlignment()
        }

        /// Rotates the icon clockwise.
        if let iconRotate = iconRotate {
            layer.iconRotate = iconRotate.double()
        }

        /// In combination with `symbol-placement`, determines the rotation behavior of icons.
        if let iconRotationAlignment = iconRotationAlignment {
            layer.iconRotationAlignment = iconRotationAlignment.iconRotationAlignment()
        }

        /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
        if let iconSize = iconSize {
            layer.iconSize = iconSize.double()
        }

        /// Scales the icon to fit around the associated text.
        if let iconTextFit = iconTextFit {
            layer.iconTextFit = iconTextFit.iconTextFit()
        }

        /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
        if let iconTextFitPadding = iconTextFitPadding {
            layer.iconTextFitPadding = iconTextFitPadding.arrayOfDouble()
        }

        /// If true, the symbols will not cross tile edges to avoid mutual collisions. Recommended in layers that don't have enough padding in the vector tile to prevent collisions, or if it is a point symbol layer placed after a line symbol layer. When using a client that supports global collision detection, like Mapbox GL JS version 0.42.0 or greater, enabling this property is not needed to prevent clipped labels at tile boundaries.
        if let symbolAvoidEdges = symbolAvoidEdges {
            layer.symbolAvoidEdges = symbolAvoidEdges.boolean()
        }

        /// Label placement relative to its geometry.
        if let symbolPlacement = symbolPlacement {
            layer.symbolPlacement = symbolPlacement.symbolPlacement()
        }

        /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first.  When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
        if let symbolSortKey = symbolSortKey {
            layer.symbolSortKey = symbolSortKey.double()
        }

        /// Distance between two symbol anchors.
        if let symbolSpacing = symbolSpacing {
            layer.symbolSpacing = symbolSpacing.double()
        }

        /// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
        if let symbolZOrder = symbolZOrder {
            layer.symbolZOrder = symbolZOrder.symbolZOrder()
        }

        /// If true, the text will be visible even if it collides with other previously drawn symbols.
        if let textAllowOverlap = textAllowOverlap {
            layer.textAllowOverlap = textAllowOverlap.boolean()
        }

        /// Part of the text placed closest to the anchor.
        if let textAnchor = textAnchor {
            layer.textAnchor = textAnchor.textAnchor()
        }

        /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
        if let textField = textField {
            layer.textField = textField.string()
        }

        /// Font stack to use for displaying text.
        if let textFont = textFont {
            layer.textFont = textFont.arrayOfString()
        }

        /// If true, other symbols can be visible even if they collide with the text.
        if let textIgnorePlacement = textIgnorePlacement {
            layer.textIgnorePlacement = textIgnorePlacement.boolean()
        }

        /// Text justification options.
        if let textJustify = textJustify {
            layer.textJustify = textJustify.textJustify()
        }

        /// If true, the text may be flipped vertically to prevent it from being rendered upside-down.
        if let textKeepUpright = textKeepUpright {
            layer.textKeepUpright = textKeepUpright.boolean()
        }

        /// Text tracking amount.
        if let textLetterSpacing = textLetterSpacing {
            layer.textLetterSpacing = textLetterSpacing.double()
        }

        /// Text leading value for multi-line text.
        if let textLineHeight = textLineHeight {
            layer.textLineHeight = textLineHeight.double()
        }

        /// Maximum angle change between adjacent characters.
        if let textMaxAngle = textMaxAngle {
            layer.textMaxAngle = textMaxAngle.double()
        }

        /// The maximum line width for text wrapping.
        if let textMaxWidth = textMaxWidth {
            layer.textMaxWidth = textMaxWidth.double()
        }

        /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
        if let textOffset = textOffset {
            layer.textOffset = textOffset.arrayOfDouble()
        }

        /// If true, icons will display without their corresponding text when the text collides with other symbols and the icon does not.
        if let textOptional = textOptional {
            layer.textOptional = textOptional.boolean()
        }

        /// Size of the additional area around the text bounding box used for detecting symbol collisions.
        if let textPadding = textPadding {
            layer.textPadding = textPadding.double()
        }

        /// Orientation of text when map is pitched.
        if let textPitchAlignment = textPitchAlignment {
            layer.textPitchAlignment = textPitchAlignment.textPitchAlignment()
        }

        /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
        if let textRadialOffset = textRadialOffset {
            layer.textRadialOffset = textRadialOffset.double()
        }

        /// Rotates the text clockwise.
        if let textRotate = textRotate {
            layer.textRotate = textRotate.double()
        }

        /// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
        if let textRotationAlignment = textRotationAlignment {
            layer.textRotationAlignment = textRotationAlignment.textRotationAlignment()
        }

        /// Font size.
        if let textSize = textSize {
            layer.textSize = textSize.double()
        }

        /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
        if let textTransform = textTransform {
            layer.textTransform = textTransform.textTransform()
        }

        /// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
        if let textVariableAnchor = textVariableAnchor {
            layer.textVariableAnchor = textVariableAnchor.arrayOfTextAnchor()
        }

        /// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
        if let textWritingMode = textWritingMode {
            layer.textWritingMode = textWritingMode.textWritingMode()
        }

        /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
        if let iconColor = iconColor {
            layer.iconColor = iconColor.styleColor()
        }

        /// Transition options for `iconColor`.
        if let iconColorTransition = iconColorTransition {
            layer.iconColorTransition = iconColorTransition.swiftOnly()
        }

        /// Fade out the halo towards the outside.
        if let iconHaloBlur = iconHaloBlur {
            layer.iconHaloBlur = iconHaloBlur.double()
        }

        /// Transition options for `iconHaloBlur`.
        if let iconHaloBlurTransition = iconHaloBlurTransition {
            layer.iconHaloBlurTransition = iconHaloBlurTransition.swiftOnly()
        }

        /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
        if let iconHaloColor = iconHaloColor {
            layer.iconHaloColor = iconHaloColor.styleColor()
        }

        /// Transition options for `iconHaloColor`.
        if let iconHaloColorTransition = iconHaloColorTransition {
           layer.iconHaloColorTransition = iconHaloColorTransition.swiftOnly()
        }

        /// Distance of halo to the icon outline.
        if let iconHaloWidth = iconHaloWidth {
            layer.iconHaloWidth = iconHaloWidth.double()
        }

        /// Transition options for `iconHaloWidth`.
        if let iconHaloWidthTransition = iconHaloWidthTransition {
            layer.iconHaloWidthTransition = iconHaloWidthTransition.swiftOnly()
        }

        /// The opacity at which the icon will be drawn.
        if let iconOpacity = iconOpacity {
            layer.iconOpacity = iconOpacity.double()
        }

        /// Transition options for `iconOpacity`.
        if let iconOpacityTransition = iconOpacityTransition {
            layer.iconOpacityTransition = iconOpacityTransition.swiftOnly()
        }

        /// Distance that the icon's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
        if let iconTranslate = iconTranslate {
            layer.iconTranslate = iconTranslate.arrayOfDouble()
        }

        /// Transition options for `iconTranslate`.
        if let iconTranslateTransition = iconTranslateTransition {
            layer.iconTranslateTransition = iconTranslateTransition.swiftOnly()
        }

        /// Controls the frame of reference for `icon-translate`.
        if let iconTranslateAnchor = iconTranslateAnchor {
            layer.iconTranslateAnchor = iconTranslateAnchor.iconTranslateAnchor()
        }

        /// The color with which the text will be drawn.
        if let textColor = textColor {
            layer.textColor = textColor.styleColor()
        }

        /// Transition options for `textColor`.
        if let textColorTransition = textColorTransition {
            layer.textColorTransition = textColorTransition.swiftOnly()
        }

        /// The halo's fadeout distance towards the outside.
        if let textHaloBlur = textHaloBlur {
            layer.textHaloBlur = textHaloBlur.double()
        }

        /// Transition options for `textHaloBlur`.
        if let textHaloBlurTransition = textHaloBlurTransition {
            layer.textHaloBlurTransition = textHaloBlurTransition.swiftOnly()
        }

        /// The color of the text's halo, which helps it stand out from backgrounds.
        if let textHaloColor = textHaloColor {
            layer.textHaloColor = textHaloColor.styleColor()
        }

        /// Transition options for `textHaloColor`.
        if let textHaloColorTransition = textHaloColorTransition {
            layer.textHaloColorTransition = textHaloColorTransition.swiftOnly()
        }

        /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
        if let textHaloWidth = textHaloWidth {
            layer.textHaloWidth = textHaloWidth.double()
        }

        /// Transition options for `textHaloWidth`.
        if let textHaloWidthTransition = textHaloWidthTransition {
            layer.textHaloWidthTransition = textHaloWidthTransition.swiftOnly()
        }

        /// The opacity at which the text will be drawn.
        if let textOpacity = textOpacity {
            layer.textOpacity = textOpacity.double()
        }

        /// Transition options for `textOpacity`.
        if let textOpacityTransition = textOpacityTransition {
            layer.textOpacityTransition = textOpacityTransition.swiftOnly()
        }

        /// Distance that the text's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
        if let textTranslate = textTranslate {
            layer.textTranslate = textTranslate.arrayOfDouble()
        }

        /// Transition options for `textTranslate`.
        if let textTranslateTransition = textTranslateTransition {
            layer.textTranslateTransition = textTranslateTransition.swiftOnly()
        }

        /// Controls the frame of reference for `text-translate`.
        if let textTranslateAnchor = textTranslateAnchor {
                layer.textTranslateAnchor = textTranslateAnchor.textTranslateAnchor()
        }
    }
    
    private var filter: MBXExpression?;
    @objc public func filter(_ value: MBXExpression?) {
        filter = value
    }
    private var source: String?;
    @objc public func source(_ value: String?) {
        source = value
    }
    private var sourceLayer: String?;
    @objc public func sourceLayer(_ value: String?) {
        sourceLayer = value
    }
    private var minZoom: NSNumber?;
    @objc public func minZoom(_ value: NSNumber?) {
        minZoom = value
    }
    private var maxZoom: NSNumber?;
    @objc public func maxZoom(_ value: NSNumber?) {
        maxZoom = value
    }
    /// Whether this layer is displayed.
    private var visibility: MBXValue?;
    @objc public func visibility(_ value: MBXValue?) {
        visibility = value
    }

    /// If true, the icon will be visible even if it collides with other previously drawn symbols.
    private var iconAllowOverlap: MBXValue?;
    @objc public func iconAllowOverlap(_ value: MBXValue?) {
        iconAllowOverlap = value
    }

    /// Part of the icon placed closest to the anchor.
    private var iconAnchor: MBXValue?;
    @objc public func iconAnchor(_ value: MBXValue?) {
        iconAnchor = value
    }

    /// If true, other symbols can be visible even if they collide with the icon.
    private var iconIgnorePlacement: MBXValue?;
    @objc public func iconIgnorePlacement(_ value: MBXValue?) {
        iconIgnorePlacement = value
    }

    /// Name of image in sprite to use for drawing an image background.
    private var iconImage: MBXValue?;
    @objc public func iconImage(_ value: MBXValue?) {
        iconImage = value
    }

    /// If true, the icon may be flipped to prevent it from being rendered upside-down.
    private var iconKeepUpright: MBXValue?;
    @objc public func iconKeepUpright(_ value: MBXValue?) {
        iconKeepUpright = value
    }

    /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
    private var iconOffset: MBXValue?;
    @objc public func iconOffset(_ value: MBXValue?) {
        iconOffset = value
    }

    /// If true, text will display without their corresponding icons when the icon collides with other symbols and the text does not.
    private var iconOptional: MBXValue?;
    @objc public func iconOptional(_ value: MBXValue?) {
        iconOptional = value
    }

    /// Size of the additional area around the icon bounding box used for detecting symbol collisions.
    private var iconPadding: MBXValue?;
    @objc public func iconPadding(_ value: MBXValue?) {
        iconPadding = value
    }

    /// Orientation of icon when map is pitched.
    private var iconPitchAlignment: MBXValue?;
    @objc public func iconPitchAlignment(_ value: MBXValue?) {
        iconPitchAlignment = value
    }

    /// Rotates the icon clockwise.
    private var iconRotate: MBXValue?;
    @objc public func iconRotate(_ value: MBXValue?) {
        iconRotate = value
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of icons.
    private var iconRotationAlignment: MBXValue?;
    @objc public func iconRotationAlignment(_ value: MBXValue?) {
        iconRotationAlignment = value
    }

    /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
    private var iconSize: MBXValue?;
    @objc public func iconSize(_ value: MBXValue?) {
        iconSize = value
    }

    /// Scales the icon to fit around the associated text.
    private var iconTextFit: MBXValue?;
    @objc public func iconTextFit(_ value: MBXValue?) {
        iconTextFit = value
    }

    /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
    private var iconTextFitPadding: MBXValue?;
    @objc public func iconTextFitPadding(_ value: MBXValue?) {
        iconTextFitPadding = value
    }

    /// If true, the symbols will not cross tile edges to avoid mutual collisions. Recommended in layers that don't have enough padding in the vector tile to prevent collisions, or if it is a point symbol layer placed after a line symbol layer. When using a client that supports global collision detection, like Mapbox GL JS version 0.42.0 or greater, enabling this property is not needed to prevent clipped labels at tile boundaries.
    private var symbolAvoidEdges: MBXValue?;
    @objc public func symbolAvoidEdges(_ value: MBXValue?) {
        symbolAvoidEdges = value
    }

    /// Label placement relative to its geometry.
    private var symbolPlacement: MBXValue?;
    @objc public func symbolPlacement(_ value: MBXValue?) {
        symbolPlacement = value
    }

    /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first.  When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
    private var symbolSortKey: MBXValue?;
    @objc public func symbolSortKey(_ value: MBXValue?) {
        symbolSortKey = value
    }

    /// Distance between two symbol anchors.
    private var symbolSpacing: MBXValue?;
    @objc public func symbolSpacing(_ value: MBXValue?) {
        symbolSpacing = value
    }

    /// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
    private var symbolZOrder: MBXValue?;
    @objc public func symbolZOrder(_ value: MBXValue?) {
        symbolZOrder = value
    }

    /// If true, the text will be visible even if it collides with other previously drawn symbols.
    private var textAllowOverlap: MBXValue?;
    @objc public func textAllowOverlap(_ value: MBXValue?) {
        textAllowOverlap = value
    }

    /// Part of the text placed closest to the anchor.
    private var textAnchor: MBXValue?;
    @objc public func textAnchor(_ value: MBXValue?) {
        textAnchor = value
    }

    /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
    private var textField: MBXValue?;
    @objc public func textField(_ value: MBXValue?) {
        textField = value
    }

    /// Font stack to use for displaying text.
    private var textFont: MBXValue?;
    @objc public func textFont(_ value: MBXValue?) {
        textFont = value
    }

    /// If true, other symbols can be visible even if they collide with the text.
    private var textIgnorePlacement: MBXValue?;
    @objc public func textIgnorePlacement(_ value: MBXValue?) {
        textIgnorePlacement = value
    }

    /// Text justification options.
    private var textJustify: MBXValue?;
    @objc public func textJustify(_ value: MBXValue?) {
        textJustify = value
    }

    /// If true, the text may be flipped vertically to prevent it from being rendered upside-down.
    private var textKeepUpright: MBXValue?;
    @objc public func textKeepUpright(_ value: MBXValue?) {
        textKeepUpright = value
    }

    /// Text tracking amount.
    private var textLetterSpacing: MBXValue?;
    @objc public func textLetterSpacing(_ value: MBXValue?) {
        textLetterSpacing = value
    }

    /// Text leading value for multi-line text.
    private var textLineHeight: MBXValue?;
    @objc public func textLineHeight(_ value: MBXValue?) {
        textLineHeight = value
    }

    /// Maximum angle change between adjacent characters.
    private var textMaxAngle: MBXValue?;
    @objc public func textMaxAngle(_ value: MBXValue?) {
        textMaxAngle = value
    }

    /// The maximum line width for text wrapping.
    private var textMaxWidth: MBXValue?;
    @objc public func textMaxWidth(_ value: MBXValue?) {
        textMaxWidth = value
    }

    /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
    private var textOffset: MBXValue?;
    @objc public func textOffset(_ value: MBXValue?) {
        textOffset = value
    }

    /// If true, icons will display without their corresponding text when the text collides with other symbols and the icon does not.
    private var textOptional: MBXValue?;
    @objc public func textOptional(_ value: MBXValue?) {
        textOptional = value
    }

    /// Size of the additional area around the text bounding box used for detecting symbol collisions.
    private var textPadding: MBXValue?;
    @objc public func textPadding(_ value: MBXValue?) {
        textPadding = value
    }

    /// Orientation of text when map is pitched.
    private var textPitchAlignment: MBXValue?;
    @objc public func textPitchAlignment(_ value: MBXValue?) {
        textPitchAlignment = value
    }

    /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
    private var textRadialOffset: MBXValue?;
    @objc public func textRadialOffset(_ value: MBXValue?) {
        textRadialOffset = value
    }

    /// Rotates the text clockwise.
    private var textRotate: MBXValue?;
    @objc public func textRotate(_ value: MBXValue?) {
        textRotate = value
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
    private var textRotationAlignment: MBXValue?;
    @objc public func textRotationAlignment(_ value: MBXValue?) {
        textRotationAlignment = value
    }

    /// Font size.
    private var textSize: MBXValue?;
    @objc public func textSize(_ value: MBXValue?) {
        textSize = value
    }

    /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
    private var textTransform: MBXValue?;
    @objc public func textTransform(_ value: MBXValue?) {
        textTransform = value
    }

    /// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
    private var textVariableAnchor: MBXValue?;
    @objc public func textVariableAnchor(_ value: MBXValue?) {
        textVariableAnchor = value
    }

    /// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
    private var textWritingMode: MBXValue?;
    @objc public func textWritingMode(_ value: MBXValue?) {
        textWritingMode = value
    }

    /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    private var iconColor: MBXValue?;
    @objc public func iconColor(_ value: MBXValue?) {
        iconColor = value
    }

    /// Transition options for `iconColor`.
    private var iconColorTransition: MBXStyleTransition?;
    @objc public func iconColorTransition(_ value: MBXStyleTransition?) {
        iconColorTransition = value
    }

    /// Fade out the halo towards the outside.
    private var iconHaloBlur: MBXValue?;
    @objc public func iconHaloBlur(_ value: MBXValue?) {
        iconHaloBlur = value
    }

    /// Transition options for `iconHaloBlur`.
    private var iconHaloBlurTransition: MBXStyleTransition?;
    @objc public func iconHaloBlurTransition(_ value: MBXStyleTransition?) {
        iconHaloBlurTransition = value
    }

    /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    private var iconHaloColor: MBXValue?;
    @objc public func iconHaloColor(_ value: MBXValue?) {
        iconHaloColor = value
    }

    /// Transition options for `iconHaloColor`.
    private var iconHaloColorTransition: MBXStyleTransition?;
    @objc public func iconHaloColorTransition(_ value: MBXStyleTransition?) {
        iconHaloColorTransition = value
    }

    /// Distance of halo to the icon outline.
    private var iconHaloWidth: MBXValue?;
    @objc public func iconHaloWidth(_ value: MBXValue?) {
        iconHaloWidth = value
    }

    /// Transition options for `iconHaloWidth`.
    private var iconHaloWidthTransition: MBXStyleTransition?;
    @objc public func iconHaloWidthTransition(_ value: MBXStyleTransition?) {
        iconHaloWidthTransition = value
    }

    /// The opacity at which the icon will be drawn.
    private var iconOpacity: MBXValue?;
    @objc public func iconOpacity(_ value: MBXValue?) {
        iconOpacity = value
    }

    /// Transition options for `iconOpacity`.
    private var iconOpacityTransition: MBXStyleTransition?;
    @objc public func iconOpacityTransition(_ value: MBXStyleTransition?) {
        iconOpacityTransition = value
    }

    /// Distance that the icon's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    private var iconTranslate: MBXValue?;
    @objc public func iconTranslate(_ value: MBXValue?) {
        iconTranslate = value
    }

    /// Transition options for `iconTranslate`.
    private var iconTranslateTransition: MBXStyleTransition?;
    @objc public func iconTranslateTransition(_ value: MBXStyleTransition?) {
        iconTranslateTransition = value
    }

    /// Controls the frame of reference for `icon-translate`.
    private var iconTranslateAnchor: MBXValue?;
    @objc public func iconTranslateAnchor(_ value: MBXValue?) {
        iconTranslateAnchor = value
    }

    /// The color with which the text will be drawn.
    private var textColor: MBXValue?;
    @objc public func textColor(_ value: MBXValue?) {
        textColor = value
    }

    /// Transition options for `textColor`.
    private var textColorTransition: MBXStyleTransition?;
    @objc public func textColorTransition(_ value: MBXStyleTransition?) {
        textColorTransition = value
    }

    /// The halo's fadeout distance towards the outside.
    private var textHaloBlur: MBXValue?;
    @objc public func textHaloBlur(_ value: MBXValue?) {
        textHaloBlur = value
    }

    /// Transition options for `textHaloBlur`.
    private var textHaloBlurTransition: MBXStyleTransition?;
    @objc public func textHaloBlurTransition(_ value: MBXStyleTransition?) {
        textHaloBlurTransition = value
    }

    /// The color of the text's halo, which helps it stand out from backgrounds.
    private var textHaloColor: MBXValue?;
    @objc public func textHaloColor(_ value: MBXValue?) {
        textHaloColor = value
    }

    /// Transition options for `textHaloColor`.
    private var textHaloColorTransition: MBXStyleTransition?;
    @objc public func textHaloColorTransition(_ value: MBXStyleTransition?) {
        iconColorTransition = value
    }

    /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
    private var textHaloWidth: MBXValue?;
    @objc public func textHaloWidth(_ value: MBXValue?) {
        textHaloWidth = value
    }

    /// Transition options for `textHaloWidth`.
    private var textHaloWidthTransition: MBXStyleTransition?;
    @objc public func textHaloWidthTransition(_ value: MBXStyleTransition?) {
        textHaloWidthTransition = value
    }

    /// The opacity at which the text will be drawn.
    private var textOpacity: MBXValue?;
    @objc public func textOpacity(_ value: MBXValue?) {
        textOpacity = value
    }

    /// Transition options for `textOpacity`.
    private var textOpacityTransition: MBXStyleTransition?;
    @objc public func textOpacityTransition(_ value: MBXStyleTransition?) {
        textOpacityTransition = value
    }

    /// Distance that the text's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    private var textTranslate: MBXValue?;
    @objc public func textTranslate(_ value: MBXValue?) {
        textTranslate = value
    }

    /// Transition options for `textTranslate`.
    private var textTranslateTransition: MBXStyleTransition?;
    @objc public func textTranslateTransition(_ value: MBXStyleTransition?) {
        textTranslateTransition = value
    }

    /// Controls the frame of reference for `text-translate`.
    private var textTranslateAnchor: MBXValue?;
    @objc public func textTranslateAnchor(_ value: MBXValue?) {
        textTranslateAnchor = value
    }
}
