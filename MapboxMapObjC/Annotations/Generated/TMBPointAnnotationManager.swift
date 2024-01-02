import MapboxMaps


@objc
open class TMBPointAnnotationManager : NSObject, TMBAnnotationManager, AnnotationInteractionDelegate {
    
    // MARK: - TMBAnnotationManager protocol conformance
    @objc
    public var id: String {
        get {
            return _self.id
        }
    }
    @objc
    public var sourceId: String {
        get {
            return _self.sourceId
        }
    }
    @objc
    public var layerId: String {
        get {
            return _self.layerId
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
            guard let iconAllowOverlap = _self.iconAllowOverlap else {
                return nil
            }
            return NSNumber(value: iconAllowOverlap)
        }
        set {
            // Bool?
            _self.iconAllowOverlap = newValue?.boolValue
        }
    }

    /// If true, other symbols can be visible even if they collide with the icon.
    @objc
    public var iconIgnorePlacement: NSNumber? {
        get {
            // Bool?
            guard let iconIgnorePlacement = _self.iconIgnorePlacement else {
                return nil
            }
            return NSNumber(value: iconIgnorePlacement)
        }
        set {
            // Bool?
            _self.iconIgnorePlacement = newValue?.boolValue
        }
    }

    /// If true, the icon may be flipped to prevent it from being rendered upside-down.
    @objc
    public var iconKeepUpright: NSNumber? {
        get {
            // Bool?
            guard let iconKeepUpright = _self.iconKeepUpright else {
                return nil
            }
            return NSNumber(value: iconKeepUpright)
        }
        set {
            // Bool?
            _self.iconKeepUpright = newValue?.boolValue
        }
    }

    /// If true, text will display without their corresponding icons when the icon collides with other symbols and the text does not.
    @objc
    public var iconOptional: NSNumber? {
        get {
            // Bool?
            guard let iconOptional = _self.iconOptional else {
                return nil
            }
            return NSNumber(value: iconOptional)
        }
        set {
            // Bool?
            _self.iconOptional = newValue?.boolValue
        }
    }

    /// Size of the additional area around the icon bounding box used for detecting symbol collisions.
    @objc
    public var iconPadding: NSNumber? {
        get {
            // Double?
            guard let iconPadding = _self.iconPadding else {
                return nil
            }
            return NSNumber(value: iconPadding)
        }
        set {
            // Double?
            _self.iconPadding = newValue?.doubleValue
        }
    }

    /// Orientation of icon when map is pitched.
    @objc
    public var iconPitchAlignment: NSNumber? {
        get {
            return _self.iconPitchAlignment?.asNumber()
        }
        set {
            _self.iconPitchAlignment = newValue?.IconPitchAlignment
        }
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of icons.
    @objc
    public var iconRotationAlignment: NSNumber? {
        get {
            return _self.iconRotationAlignment?.asNumber()
        }
        set {
            _self.iconRotationAlignment = newValue?.IconRotationAlignment
        }
    }

    /// Scales the icon to fit around the associated text.
    @objc
    public var iconTextFit: NSNumber? {
        get {
            return _self.iconTextFit?.asNumber()
        }
        set {
            _self.iconTextFit = newValue?.IconTextFit
        }
    }

    /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
    @objc
    public var iconTextFitPadding: [Double]? {
        get {
            return _self.iconTextFitPadding
        }
        set {
            _self.iconTextFitPadding = newValue
        }
    }

    /// If true, the symbols will not cross tile edges to avoid mutual collisions. Recommended in layers that don't have enough padding in the vector tile to prevent collisions, or if it is a point symbol layer placed after a line symbol layer. When using a client that supports global collision detection, like Mapbox GL JS version 0.42.0 or greater, enabling this property is not needed to prevent clipped labels at tile boundaries.
    @objc
    public var symbolAvoidEdges: NSNumber? {
        get {
            // Bool?
            guard let symbolAvoidEdges = _self.symbolAvoidEdges else {
                return nil
            }
            return NSNumber(value: symbolAvoidEdges)
        }
        set {
            // Bool?
            _self.symbolAvoidEdges = newValue?.boolValue
        }
    }

    /// Label placement relative to its geometry.
    @objc
    public var symbolPlacement: NSNumber? {
        get {
            return _self.symbolPlacement?.asNumber()
        }
        set {
            _self.symbolPlacement = newValue?.SymbolPlacement
        }
    }

    /// Distance between two symbol anchors.
    @objc
    public var symbolSpacing: NSNumber? {
        get {
            // Double?
            guard let symbolSpacing = _self.symbolSpacing else {
                return nil
            }
            return NSNumber(value: symbolSpacing)
        }
        set {
            // Double?
            _self.symbolSpacing = newValue?.doubleValue
        }
    }

    /// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
    @objc
    public var symbolZOrder: NSNumber? {
        get {
            return _self.symbolZOrder?.asNumber()
        }
        set {
            _self.symbolZOrder = newValue?.SymbolZOrder
        }
    }

    /// If true, the text will be visible even if it collides with other previously drawn symbols.
    @objc
    public var textAllowOverlap: NSNumber? {
        get {
            // Bool?
            guard let textAllowOverlap = _self.textAllowOverlap else {
                return nil
            }
            return NSNumber(value: textAllowOverlap)
        }
        set {
            // Bool?
            _self.textAllowOverlap = newValue?.boolValue
        }
    }

    /// Font stack to use for displaying text.
    @objc
    public var textFont: [String]? {
        get {
            return _self.textFont
        }
        set {
            _self.textFont = newValue
        }
    }

    /// If true, other symbols can be visible even if they collide with the text.
    @objc
    public var textIgnorePlacement: NSNumber? {
        get {
            // Bool?
            guard let textIgnorePlacement = _self.textIgnorePlacement else {
                return nil
            }
            return NSNumber(value: textIgnorePlacement)
        }
        set {
            // Bool?
            _self.textIgnorePlacement = newValue?.boolValue
        }
    }

    /// If true, the text may be flipped vertically to prevent it from being rendered upside-down.
    @objc
    public var textKeepUpright: NSNumber? {
        get {
            // Bool?
            guard let textKeepUpright = _self.textKeepUpright else {
                return nil
            }
            return NSNumber(value: textKeepUpright)
        }
        set {
            // Bool?
            _self.textKeepUpright = newValue?.boolValue
        }
    }

    /// Maximum angle change between adjacent characters.
    @objc
    public var textMaxAngle: NSNumber? {
        get {
            // Double?
            guard let textMaxAngle = _self.textMaxAngle else {
                return nil
            }
            return NSNumber(value: textMaxAngle)
        }
        set {
            // Double?
            _self.textMaxAngle = newValue?.doubleValue
        }
    }

    /// If true, icons will display without their corresponding text when the text collides with other symbols and the icon does not.
    @objc
    public var textOptional: NSNumber? {
        get {
            // Bool?
            guard let textOptional = _self.textOptional else {
                return nil
            }
            return NSNumber(value: textOptional)
        }
        set {
            // Bool?
            _self.textOptional = newValue?.boolValue
        }
    }

    /// Size of the additional area around the text bounding box used for detecting symbol collisions.
    @objc
    public var textPadding: NSNumber? {
        get {
            // Double?
            guard let textPadding = _self.textPadding else {
                return nil
            }
            return NSNumber(value: textPadding)
        }
        set {
            // Double?
            _self.textPadding = newValue?.doubleValue
        }
    }

    /// Orientation of text when map is pitched.
    @objc
    public var textPitchAlignment: NSNumber? {
        get {
            return _self.textPitchAlignment?.asNumber()
        }
        set {
            _self.textPitchAlignment = newValue?.TextPitchAlignment
        }
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
    @objc
    public var textRotationAlignment: NSNumber? {
        get {
            return _self.textRotationAlignment?.asNumber()
        }
        set {
            _self.textRotationAlignment = newValue?.TextRotationAlignment
        }
    }

    /// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
    @objc
    public var textVariableAnchor: [NSNumber]? {
        get {
            return _self.textVariableAnchor?.map { $0.asNumber() }
        }
        set {
            _self.textVariableAnchor = newValue?.map { $0.TextAnchor }
        }
    }

    /// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
    @objc
    public var textWritingMode: [NSNumber]? {
        get {
            return _self.textVariableAnchor?.map { $0.objcValue().asNumber() }
        }
        set {
            _self.textWritingMode = newValue?.map { $0.textWritingMode().swiftValue() }
        }
    }

    /// Distance that the icon's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc
    public var iconTranslate: [Double]? {
        get {
            return _self.iconTranslate
        }
        set {
            _self.iconTranslate = newValue
        }
    }

    /// Controls the frame of reference for `icon-translate`.
    @objc
    public var iconTranslateAnchor: NSNumber? {
        get {
            return _self.iconTranslateAnchor?.asNumber()
        }
        set {
            _self.iconTranslateAnchor = newValue?.IconTranslateAnchor
        }
    }

    /// Distance that the text's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc
    public var textTranslate: [Double]? {
        get {
            return _self.textTranslate
        }
        set {
            _self.textTranslate = newValue
        }
    }

    /// Controls the frame of reference for `text-translate`.
    @objc
    public var textTranslateAnchor: NSNumber? {
        get {
            return _self.textTranslateAnchor?.asNumber()
        }
        set {
            _self.textTranslateAnchor = newValue?.TextTranslateAnchor
        }
    }

    /// Text leading value for multi-line text.
    @available(*, deprecated, message: "text-line-height property is now data driven, use `PointAnnotation.textLineHeight` instead.")
    @objc
    public var textLineHeight: NSNumber? {
        get {
            // Double?
            guard let textLineHeight = _self.textLineHeight else {
                return nil
            }
            return NSNumber(value: textLineHeight)
        }
        set {
            // Double?
            _self.textLineHeight = newValue?.doubleValue
        }
    }

}
