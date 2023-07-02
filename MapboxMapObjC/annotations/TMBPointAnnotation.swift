import MapboxMaps

@objc
open class TMBPointAnnotation : NSObject, TMBAnnotation {
    @objc
    public var id: String {
        return swiftValue.id
    }
    
    @objc
    public var geometryInJSON: String {
        return try! swiftValue.point.toString()
    }

    @objc
    public var userInfo: [String : Any]? {
        return swiftValue.userInfo
    }
    
    @objc
    public var isSelected: Bool {
        set {
            swiftValue.isSelected = newValue
        }
        get {
            swiftValue.isSelected
        }
    }
    
    @objc
    public var isDraggable: Bool {
        set {
            swiftValue.isDraggable = newValue
        }
        get {
            return swiftValue.isDraggable
        }
    }
    
    @objc
    public func image(_ image: UIImage, name: String) {
        swiftValue.image = PointAnnotation.Image(image: image, name: name)
    }
    
    public var swiftValue: PointAnnotation
    
    public init(swiftValue: PointAnnotation) {
        self.swiftValue = swiftValue
        super.init()
    }
    
    @objc
    public class func from(coordinate: LocationCoordinate2D) -> TMBPointAnnotation {
        let swiftValue = PointAnnotation(point: Point(coordinate))
        return TMBPointAnnotation(swiftValue: swiftValue)
    }
    
    // MARK: - Style Properties -

    /// Part of the icon placed closest to the anchor.
    @objc
    public var iconAnchor: TMBIconAnchor? {
        get {
            guard let iconAnchor = self.swiftValue.iconAnchor else {
                return nil
            }
            return TMBIconAnchor(value: iconAnchor)
        }
        set {
            self.swiftValue.iconAnchor = newValue?.swiftValue()
        }
    }

    /// Name of image in sprite to use for drawing an image background.
    @objc
    public var iconImage: String? {
        get {
            return self.swiftValue.iconImage
        }
        set {
            self.swiftValue.iconImage = newValue
        }
    }

    /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
    @objc
    public var iconOffset: [Double]? {
        get {
            return self.swiftValue.iconOffset
        }
        set {
            self.swiftValue.iconOffset = newValue
        }
    }

    /// Rotates the icon clockwise.
    @objc
    public var iconRotate: NSNumber? {
        get {
            // Double?
            guard let iconRotate = self.swiftValue.iconRotate else {
                return nil
            }
            return NSNumber(value: iconRotate)
        }
        set {
            self.swiftValue.iconRotate = newValue?.doubleValue
        }
    }

    /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
    @objc
    public var iconSize: NSNumber? {
        get {
            // Double?
            guard let iconSize = self.swiftValue.iconSize else {
                return nil
            }
            return NSNumber(value: iconSize)
        }
        set {
            self.swiftValue.iconSize = newValue?.doubleValue
        }
    }

    /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first.  When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
    @objc
    public var symbolSortKey: NSNumber? {
        get {
            // Double?
            guard let symbolSortKey = self.swiftValue.symbolSortKey else {
                return nil
            }
            return NSNumber(value: symbolSortKey)
        }
        set {
            self.swiftValue.symbolSortKey = newValue?.doubleValue
        }
    }

    /// Part of the text placed closest to the anchor.
    @objc
    public var textAnchor: TMBTextAnchor? {
        get {
            guard let textAnchor = self.swiftValue.textAnchor else {
                return nil
            }
            return TMBTextAnchor(value: textAnchor)
        }
        set {
            self.swiftValue.textAnchor = newValue?.swiftValue()
        }
    }

    /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
    @objc
    public var textField: String? {
        get {
            return self.swiftValue.textField
        }
        set {
            self.swiftValue.textField = newValue
        }
    }

    /// Text justification options.
    @objc
    public var textJustify: TMBTextJustify? {
        get {
            guard let textJustify = self.swiftValue.textJustify else {
                return nil
            }
            return TMBTextJustify(value: textJustify)
        }
        set {
            self.swiftValue.textJustify = newValue?.swiftValue()
        }
    }

    /// Text tracking amount.
    @objc
    public var textLetterSpacing: NSNumber? {
        get {
            // Double?
            guard let textLetterSpacing = self.swiftValue.textLetterSpacing else {
                return nil
            }
            return NSNumber(value: textLetterSpacing)
        }
        set {
            self.swiftValue.textLetterSpacing = newValue?.doubleValue
        }
    }

    /// Text leading value for multi-line text.
    @objc
    public var textLineHeight: NSNumber? {
        get {
            // Double?
            guard let textLineHeight = self.swiftValue.textLineHeight else {
                return nil
            }
            return NSNumber(value: textLineHeight)
        }
        set {
            self.swiftValue.textLineHeight = newValue?.doubleValue
        }
    }

    /// The maximum line width for text wrapping.
    @objc
    public var textMaxWidth: NSNumber? {
        get {
            // Double?
            guard let textMaxWidth = self.swiftValue.textMaxWidth else {
                return nil
            }
            return NSNumber(value: textMaxWidth)
        }
        set {
            self.swiftValue.textMaxWidth = newValue?.doubleValue
        }
    }

    /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
    @objc
    public var textOffset: [Double]? {
        get {
            return self.swiftValue.textOffset
        }
        set {
            self.swiftValue.textOffset = newValue
        }
    }

    /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
    @objc
    public var textRadialOffset: NSNumber? {
        get {
            // Double?
            guard let textRadialOffset = self.swiftValue.textRadialOffset else {
                return nil
            }
            return NSNumber(value: textRadialOffset)
        }
        set {
            self.swiftValue.textRadialOffset = newValue?.doubleValue
        }
    }

    /// Rotates the text clockwise.
    @objc
    public var textRotate: NSNumber? {
        get {
            // Double?
            guard let textRotate = self.swiftValue.textRotate else {
                return nil
            }
            return NSNumber(value: textRotate)
        }
        set {
            self.swiftValue.textRotate = newValue?.doubleValue
        }
    }

    /// Font size.
    @objc
    public var textSize: NSNumber? {
        get {
            // Double?
            guard let textSize = self.swiftValue.textSize else {
                return nil
            }
            return NSNumber(value: textSize)
        }
        set {
            self.swiftValue.textSize = newValue?.doubleValue
        }
    }

    /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
    @objc
    public var textTransform: TMBTextTransform? {
        get {
            guard let textTransform = self.swiftValue.textTransform else {
                return nil
            }
            return TMBTextTransform(value: textTransform)
        }
        set {
            self.swiftValue.textTransform = newValue?.swiftValue()
        }
    }

    /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc
    public var iconColor: UIColor? {
        get {
            guard let iconColor = self.swiftValue.iconColor else {
                return nil
            }
            return UIColor(
                red: iconColor.red,
                green: iconColor.green,
                blue: iconColor.blue,
                alpha: iconColor.alpha)
        }
        set {
            guard let iconColor = newValue else {
                self.swiftValue.iconColor = nil
                return
            }
            
            self.swiftValue.iconColor = StyleColor(iconColor)
        }
    }

    /// Fade out the halo towards the outside.
    @objc
    public var iconHaloBlur: NSNumber? {
        get {
            // Double?
            guard let iconHaloBlur = self.swiftValue.iconHaloBlur else {
                return nil
            }
            return NSNumber(value: iconHaloBlur)
        }
        set {
            self.swiftValue.iconHaloBlur = newValue?.doubleValue
        }
    }

    /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc
    public var iconHaloColor: UIColor? {
        get {
            guard let iconHaloColor = self.swiftValue.iconHaloColor else {
                return nil
            }
            return UIColor(
                red: iconHaloColor.red,
                green: iconHaloColor.green,
                blue: iconHaloColor.blue,
                alpha: iconHaloColor.alpha)
        }
        set {
            guard let iconHaloColor = newValue else {
                self.swiftValue.iconHaloColor = nil
                return
            }
            
            self.swiftValue.iconHaloColor = StyleColor(iconHaloColor)
        }
    }

    /// Distance of halo to the icon outline.
    @objc
    public var iconHaloWidth: NSNumber? {
        get {
            // Double?
            guard let iconHaloWidth = self.swiftValue.iconHaloWidth else {
                return nil
            }
            return NSNumber(value: iconHaloWidth)
        }
        set {
            self.swiftValue.iconHaloWidth = newValue?.doubleValue
        }
    }

    /// The opacity at which the icon will be drawn.
    @objc
    public var iconOpacity: NSNumber? {
        get {
            // Double?
            guard let iconOpacity = self.swiftValue.iconOpacity else {
                return nil
            }
            return NSNumber(value: iconOpacity)
        }
        set {
            self.swiftValue.iconOpacity = newValue?.doubleValue
        }
    }

    /// The color with which the text will be drawn.
    @objc
    public var textColor: UIColor? {
        get {
            guard let textColor = self.swiftValue.textColor else {
                return nil
            }
            return UIColor(
                red: textColor.red,
                green: textColor.green,
                blue: textColor.blue,
                alpha: textColor.alpha)
        }
        set {
            guard let textColor = newValue else {
                self.swiftValue.textColor = nil
                return
            }
            
            self.swiftValue.textColor = StyleColor(textColor)
        }
    }

    /// The halo's fadeout distance towards the outside.
    @objc
    public var textHaloBlur: NSNumber? {
        get {
            // Double?
            guard let textHaloBlur = self.swiftValue.textHaloBlur else {
                return nil
            }
            return NSNumber(value: textHaloBlur)
        }
        set {
            self.swiftValue.textHaloBlur = newValue?.doubleValue
        }
    }

    /// The color of the text's halo, which helps it stand out from backgrounds.
    @objc
    public var textHaloColor: UIColor? {
        get {
            guard let textHaloColor = self.swiftValue.textHaloColor else {
                return nil
            }
            return UIColor(
                red: textHaloColor.red,
                green: textHaloColor.green,
                blue: textHaloColor.blue,
                alpha: textHaloColor.alpha)
        }
        set {
            guard let textHaloColor = newValue else {
                self.swiftValue.textHaloColor = nil
                return
            }
            
            self.swiftValue.textHaloColor = StyleColor(textHaloColor)
        }
    }

    /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
    @objc
    public var textHaloWidth: NSNumber? {
        get {
            // Double?
            guard let textHaloWidth = self.swiftValue.textHaloWidth else {
                return nil
            }
            return NSNumber(value: textHaloWidth)
        }
        set {
            self.swiftValue.textHaloWidth = newValue?.doubleValue
        }
    }

    /// The opacity at which the text will be drawn.
    @objc
    public var textOpacity: NSNumber? {
        get {
            // Double?
            guard let textOpacity = self.swiftValue.textOpacity else {
                return nil
            }
            return NSNumber(value: textOpacity)
        }
        set {
            self.swiftValue.textOpacity = newValue?.doubleValue
        }
    }
}

@objc
open class TMBPointAnnotationManager : NSObject, TMBAnnotationManager, AnnotationInteractionDelegate {
    
    // MARK: - TMBAnnotationManager protocol conformance
    @objc
    public var id: String {
        get {
            return self._self.id
        }
    }
    @objc
    public var sourceId: String {
        get {
            return self._self.sourceId
        }
    }
    @objc
    public var layerId: String {
        get {
            return self._self.layerId
        }
    }
    
    public func annotationManager(
        _ manager: MapboxMaps.AnnotationManager,
        didDetectTappedAnnotations annotations: [MapboxMaps.Annotation]) {
        if let delegate = self.delegate {
            let items = annotations.map { annotation in
                return TMBPointAnnotation(swiftValue: annotation as! PointAnnotation)
            }
            delegate.annotationManager(self, didDetectTappedAnnotations: items)
        }
    }
    
    @objc
    public var annotations: [TMBPointAnnotation] {
        get {
            return _self.annotations.map({
                TMBPointAnnotation(swiftValue: $0)
                
            })
        }
        set {
            _self.annotations = newValue.map({
                $0.swiftValue
            })
        }
    }
    
    public let _self: PointAnnotationManager
    
    /// Set this delegate in order to be called back if a tap occurs on an annotation being managed by this manager.
    /// - NOTE: This annotation manager listens to tap events via the `GestureManager.singleTapGestureRecognizer`.
    @objc
    public weak var delegate: TMBAnnotationInteractionDelegate? {
        didSet {
            guard delegate != nil else {
                _self.delegate = nil
                return
            }
            
            _self.delegate = self
        }
    }
    
    public init(_ swiftValue: PointAnnotationManager) {
        self._self = swiftValue
    }
    
    // MARK: - Common layer properties

    /// If true, the icon will be visible even if it collides with other previously drawn symbols.
    @objc
    public var iconAllowOverlap: NSNumber? {
        get {
            // Bool?
            guard let iconAllowOverlap = self._self.iconAllowOverlap else {
                return nil
            }
            return NSNumber(value: iconAllowOverlap)
        }
        set {
            // Bool?
            self._self.iconAllowOverlap = newValue?.boolValue
        }
    }

    /// If true, other symbols can be visible even if they collide with the icon.
    @objc
    public var iconIgnorePlacement: NSNumber? {
        get {
            // Bool?
            guard let iconIgnorePlacement = self._self.iconIgnorePlacement else {
                return nil
            }
            return NSNumber(value: iconIgnorePlacement)
        }
        set {
            // Bool?
            self._self.iconIgnorePlacement = newValue?.boolValue
        }
    }

    /// If true, the icon may be flipped to prevent it from being rendered upside-down.
    @objc
    public var iconKeepUpright: NSNumber? {
        get {
            // Bool?
            guard let iconKeepUpright = self._self.iconKeepUpright else {
                return nil
            }
            return NSNumber(value: iconKeepUpright)
        }
        set {
            // Bool?
            self._self.iconKeepUpright = newValue?.boolValue
        }
    }

    /// If true, text will display without their corresponding icons when the icon collides with other symbols and the text does not.
    @objc
    public var iconOptional: NSNumber? {
        get {
            // Bool?
            guard let iconOptional = self._self.iconOptional else {
                return nil
            }
            return NSNumber(value: iconOptional)
        }
        set {
            // Bool?
            self._self.iconOptional = newValue?.boolValue
        }
    }

    /// Size of the additional area around the icon bounding box used for detecting symbol collisions.
    @objc
    public var iconPadding: NSNumber? {
        get {
            // Double?
            guard let iconPadding = self._self.iconPadding else {
                return nil
            }
            return NSNumber(value: iconPadding)
        }
        set {
            // Double?
            self._self.iconPadding = newValue?.doubleValue
        }
    }

    /// Orientation of icon when map is pitched.
    @objc
    public var iconPitchAlignment: TMBIconPitchAlignment? {
        get {
            guard let iconPitchAlignment = self._self.iconPitchAlignment else {
                return nil
            }
            return TMBIconPitchAlignment(value: iconPitchAlignment)
        }
        set {
            self._self.iconPitchAlignment = newValue?.swiftValue()
        }
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of icons.
    @objc
    public var iconRotationAlignment: TMBIconRotationAlignment? {
        get {
            guard let iconRotationAlignment = self._self.iconRotationAlignment else {
                return nil
            }
            return TMBIconRotationAlignment(value: iconRotationAlignment)
        }
        set {
            self._self.iconRotationAlignment = newValue?.swiftValue()
        }
    }

    /// Scales the icon to fit around the associated text.
    @objc
    public var iconTextFit: TMBIconTextFit? {
        get {
            guard let iconTextFit = self._self.iconTextFit else {
                return nil
            }
            return TMBIconTextFit(value: iconTextFit)
        }
        set {
            self._self.iconTextFit = newValue?.swiftValue()
        }
    }

    /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
    @objc
    public var iconTextFitPadding: [Double]? {
        get {
            return self._self.iconTextFitPadding
        }
        set {
            self._self.iconTextFitPadding = newValue
        }
    }

    /// If true, the symbols will not cross tile edges to avoid mutual collisions. Recommended in layers that don't have enough padding in the vector tile to prevent collisions, or if it is a point symbol layer placed after a line symbol layer. When using a client that supports global collision detection, like Mapbox GL JS version 0.42.0 or greater, enabling this property is not needed to prevent clipped labels at tile boundaries.
    @objc
    public var symbolAvoidEdges: NSNumber? {
        get {
            // Bool?
            guard let symbolAvoidEdges = self._self.symbolAvoidEdges else {
                return nil
            }
            return NSNumber(value: symbolAvoidEdges)
        }
        set {
            // Bool?
            self._self.symbolAvoidEdges = newValue?.boolValue
        }
    }

    /// Label placement relative to its geometry.
    @objc
    public var symbolPlacement: TMBSymbolPlacement? {
        get {
            guard let symbolPlacement = self._self.symbolPlacement else {
                return nil
            }
            return TMBSymbolPlacement(value: symbolPlacement)
        }
        set {
            self._self.symbolPlacement = newValue?.swiftValue()
        }
    }

    /// Distance between two symbol anchors.
    @objc
    public var symbolSpacing: NSNumber? {
        get {
            // Double?
            guard let symbolSpacing = self._self.symbolSpacing else {
                return nil
            }
            return NSNumber(value: symbolSpacing)
        }
        set {
            // Double?
            self._self.symbolSpacing = newValue?.doubleValue
        }
    }

    /// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
    @objc
    public var symbolZOrder: TMBSymbolZOrder? {
        get {
            guard let symbolZOrder = self._self.symbolZOrder else {
                return nil
            }
            return TMBSymbolZOrder(value: symbolZOrder)
        }
        set {
            self._self.symbolZOrder = newValue?.swiftValue()
        }
    }

    /// If true, the text will be visible even if it collides with other previously drawn symbols.
    @objc
    public var textAllowOverlap: NSNumber? {
        get {
            // Bool?
            guard let textAllowOverlap = self._self.textAllowOverlap else {
                return nil
            }
            return NSNumber(value: textAllowOverlap)
        }
        set {
            // Bool?
            self._self.textAllowOverlap = newValue?.boolValue
        }
    }

    /// Font stack to use for displaying text.
    @objc
    public var textFont: [String]? {
        get {
            return self._self.textFont
        }
        set {
            self._self.textFont = newValue
        }
    }

    /// If true, other symbols can be visible even if they collide with the text.
    @objc
    public var textIgnorePlacement: NSNumber? {
        get {
            // Bool?
            guard let textIgnorePlacement = self._self.textIgnorePlacement else {
                return nil
            }
            return NSNumber(value: textIgnorePlacement)
        }
        set {
            // Bool?
            self._self.textIgnorePlacement = newValue?.boolValue
        }
    }

    /// If true, the text may be flipped vertically to prevent it from being rendered upside-down.
    @objc
    public var textKeepUpright: NSNumber? {
        get {
            // Bool?
            guard let textKeepUpright = self._self.textKeepUpright else {
                return nil
            }
            return NSNumber(value: textKeepUpright)
        }
        set {
            // Bool?
            self._self.textKeepUpright = newValue?.boolValue
        }
    }

    /// Maximum angle change between adjacent characters.
    @objc
    public var textMaxAngle: NSNumber? {
        get {
            // Double?
            guard let textMaxAngle = self._self.textMaxAngle else {
                return nil
            }
            return NSNumber(value: textMaxAngle)
        }
        set {
            // Double?
            self._self.textMaxAngle = newValue?.doubleValue
        }
    }

    /// If true, icons will display without their corresponding text when the text collides with other symbols and the icon does not.
    @objc
    public var textOptional: NSNumber? {
        get {
            // Bool?
            guard let textOptional = self._self.textOptional else {
                return nil
            }
            return NSNumber(value: textOptional)
        }
        set {
            // Bool?
            self._self.textOptional = newValue?.boolValue
        }
    }

    /// Size of the additional area around the text bounding box used for detecting symbol collisions.
    @objc
    public var textPadding: NSNumber? {
        get {
            // Double?
            guard let textPadding = self._self.textPadding else {
                return nil
            }
            return NSNumber(value: textPadding)
        }
        set {
            // Double?
            self._self.textPadding = newValue?.doubleValue
        }
    }

    /// Orientation of text when map is pitched.
    @objc
    public var textPitchAlignment: TMBTextPitchAlignment? {
        get {
            guard let textPitchAlignment = self._self.textPitchAlignment else {
                return nil
            }
            return TMBTextPitchAlignment(value: textPitchAlignment)
        }
        set {
            self._self.textPitchAlignment = newValue?.swiftValue()
        }
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
    @objc
    public var textRotationAlignment: TMBTextRotationAlignment? {
        get {
            guard let textRotationAlignment = self._self.textRotationAlignment else {
                return nil
            }
            return TMBTextRotationAlignment(value: textRotationAlignment)
        }
        set {
            self._self.textRotationAlignment = newValue?.swiftValue()
        }
    }

    /// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
    @objc
    public var textVariableAnchor: [TMBTextAnchor]? {
        get {
            return self._self.textVariableAnchor?.map { TMBTextAnchor(value: $0) }
        }
        set {
            self._self.textVariableAnchor = newValue?.map { $0.swiftValue() }
        }
    }

    /// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
    @objc
    public var textWritingMode: [TMBTextWritingMode]? {
        get {
            return self._self.textWritingMode?.map { TMBTextWritingMode(value: $0) }
        }
        set {
            self._self.textWritingMode = newValue?.map { $0.swiftValue() }
        }
    }

    /// Distance that the icon's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc
    public var iconTranslate: [Double]? {
        get {
            return self._self.iconTranslate
        }
        set {
            self._self.iconTranslate = newValue
        }
    }

    /// Controls the frame of reference for `icon-translate`.
    @objc
    public var iconTranslateAnchor: TMBIconTranslateAnchor? {
        get {
            guard let iconTranslateAnchor = self._self.iconTranslateAnchor else {
                return nil
            }
            return TMBIconTranslateAnchor(value: iconTranslateAnchor)
        }
        set {
            self._self.iconTranslateAnchor = newValue?.swiftValue()
        }
    }

    /// Distance that the text's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc
    public var textTranslate: [Double]? {
        get {
            return self._self.textTranslate
        }
        set {
            self._self.textTranslate = newValue
        }
    }

    /// Controls the frame of reference for `text-translate`.
    @objc
    public var textTranslateAnchor: TMBTextTranslateAnchor? {
        get {
            guard let textTranslateAnchor = self._self.textTranslateAnchor else {
                return nil
            }
            return TMBTextTranslateAnchor(value: textTranslateAnchor)
        }
        set {
            self._self.textTranslateAnchor = newValue?.swiftValue()
        }
    }

    /// Text leading value for multi-line text.
    @available(*, deprecated, message: "text-line-height property is now data driven, use `PointAnnotation.textLineHeight` instead.")
    @objc
    public var textLineHeight: NSNumber? {
        get {
            // Double?
            guard let textLineHeight = self._self.textLineHeight else {
                return nil
            }
            return NSNumber(value: textLineHeight)
        }
        set {
            // Double?
            self._self.textLineHeight = newValue?.doubleValue
        }
    }

}
