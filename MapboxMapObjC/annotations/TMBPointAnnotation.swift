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
}

@objc
open class TMBPointAnnotationManager : NSObject, TMBAnnotationManager, AnnotationInteractionDelegate {
    
    // MARK: - TMBAnnotationManager protocol conformance
    @objc
    public var id: String {
        get {
            return self.swiftValue.id
        }
    }
    @objc
    public var sourceId: String {
        get {
            return self.swiftValue.sourceId
        }
    }
    @objc
    public var layerId: String {
        get {
            return self.swiftValue.layerId
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
            return swiftValue.annotations.map({
                TMBPointAnnotation(swiftValue: $0)
                
            })
        }
        set {
            swiftValue.annotations = newValue.map({
                $0.swiftValue
            })
        }
    }
    
    public let swiftValue: PointAnnotationManager
    
    /// Set this delegate in order to be called back if a tap occurs on an annotation being managed by this manager.
    /// - NOTE: This annotation manager listens to tap events via the `GestureManager.singleTapGestureRecognizer`.
    @objc
    public weak var delegate: TMBAnnotationInteractionDelegate?
    
    public init(_ swiftValue: PointAnnotationManager) {
        self.swiftValue = swiftValue
        super.init()
        swiftValue.delegate = self
    }
    
    // MARK: - Common layer properties

    /// If true, the icon will be visible even if it collides with other previously drawn symbols.
    public var iconAllowOverlap: NSNumber? {
        get {
            // Bool?
            guard let iconAllowOverlap = self.swiftValue.iconAllowOverlap else {
                return nil
            }
            return NSNumber(value: iconAllowOverlap)
        }
        set {
            // Bool?
            self.swiftValue.iconAllowOverlap = newValue?.boolValue
        }
    }

    /// If true, other symbols can be visible even if they collide with the icon.
    public var iconIgnorePlacement: NSNumber? {
        get {
            // Bool?
            guard let iconIgnorePlacement = self.swiftValue.iconIgnorePlacement else {
                return nil
            }
            return NSNumber(value: iconIgnorePlacement)
        }
        set {
            // Bool?
            self.swiftValue.iconIgnorePlacement = newValue?.boolValue
        }
    }

    /// If true, the icon may be flipped to prevent it from being rendered upside-down.
    public var iconKeepUpright: NSNumber? {
        get {
            // Bool?
            guard let iconKeepUpright = self.swiftValue.iconKeepUpright else {
                return nil
            }
            return NSNumber(value: iconKeepUpright)
        }
        set {
            // Bool?
            self.swiftValue.iconKeepUpright = newValue?.boolValue
        }
    }

    /// If true, text will display without their corresponding icons when the icon collides with other symbols and the text does not.
    public var iconOptional: NSNumber? {
        get {
            // Bool?
            guard let iconOptional = self.swiftValue.iconOptional else {
                return nil
            }
            return NSNumber(value: iconOptional)
        }
        set {
            // Bool?
            self.swiftValue.iconOptional = newValue?.boolValue
        }
    }

    /// Size of the additional area around the icon bounding box used for detecting symbol collisions.
    public var iconPadding: NSNumber? {
        get {
            // Double?
            guard let iconPadding = self.swiftValue.iconPadding else {
                return nil
            }
            return NSNumber(value: iconPadding)
        }
        set {
            // Double?
            self.swiftValue.iconPadding = newValue?.doubleValue
        }
    }

    /// Orientation of icon when map is pitched.
    @objc
    public var iconPitchAlignment: TMBIconPitchAlignment? {
        get {
            guard let iconPitchAlignment = self.swiftValue.iconPitchAlignment else {
                return nil
            }
            return TMBIconPitchAlignment(value: iconPitchAlignment)
        }
        set {
            self.swiftValue.iconPitchAlignment = newValue?.swiftValue()
        }
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of icons.
    @objc
    public var iconRotationAlignment: TMBIconRotationAlignment? {
        get {
            guard let iconRotationAlignment = self.swiftValue.iconRotationAlignment else {
                return nil
            }
            return TMBIconRotationAlignment(value: iconRotationAlignment)
        }
        set {
            self.swiftValue.iconRotationAlignment = newValue?.swiftValue()
        }
    }

    /// Scales the icon to fit around the associated text.
    @objc
    public var iconTextFit: TMBIconTextFit? {
        get {
            guard let iconTextFit = self.swiftValue.iconTextFit else {
                return nil
            }
            return TMBIconTextFit(value: iconTextFit)
        }
        set {
            self.swiftValue.iconTextFit = newValue?.swiftValue()
        }
    }

    /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
    @objc
    public var iconTextFitPadding: [Double]? {
        get {
            return self.swiftValue.iconTextFitPadding
        }
        set {
            self.swiftValue.iconTextFitPadding = newValue
        }
    }

    /// If true, the symbols will not cross tile edges to avoid mutual collisions. Recommended in layers that don't have enough padding in the vector tile to prevent collisions, or if it is a point symbol layer placed after a line symbol layer. When using a client that supports global collision detection, like Mapbox GL JS version 0.42.0 or greater, enabling this property is not needed to prevent clipped labels at tile boundaries.
    public var symbolAvoidEdges: NSNumber? {
        get {
            // Bool?
            guard let symbolAvoidEdges = self.swiftValue.symbolAvoidEdges else {
                return nil
            }
            return NSNumber(value: symbolAvoidEdges)
        }
        set {
            // Bool?
            self.swiftValue.symbolAvoidEdges = newValue?.boolValue
        }
    }

    /// Label placement relative to its geometry.
    @objc
    public var symbolPlacement: TMBSymbolPlacement? {
        get {
            guard let symbolPlacement = self.swiftValue.symbolPlacement else {
                return nil
            }
            return TMBSymbolPlacement(value: symbolPlacement)
        }
        set {
            self.swiftValue.symbolPlacement = newValue?.swiftValue()
        }
    }

    /// Distance between two symbol anchors.
    public var symbolSpacing: NSNumber? {
        get {
            // Double?
            guard let symbolSpacing = self.swiftValue.symbolSpacing else {
                return nil
            }
            return NSNumber(value: symbolSpacing)
        }
        set {
            // Double?
            self.swiftValue.symbolSpacing = newValue?.doubleValue
        }
    }

    /// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
    @objc
    public var symbolZOrder: TMBSymbolZOrder? {
        get {
            guard let symbolZOrder = self.swiftValue.symbolZOrder else {
                return nil
            }
            return TMBSymbolZOrder(value: symbolZOrder)
        }
        set {
            self.swiftValue.symbolZOrder = newValue?.swiftValue()
        }
    }

    /// If true, the text will be visible even if it collides with other previously drawn symbols.
    public var textAllowOverlap: NSNumber? {
        get {
            // Bool?
            guard let textAllowOverlap = self.swiftValue.textAllowOverlap else {
                return nil
            }
            return NSNumber(value: textAllowOverlap)
        }
        set {
            // Bool?
            self.swiftValue.textAllowOverlap = newValue?.boolValue
        }
    }

    /// Font stack to use for displaying text.
    @objc
    public var textFont: [String]? {
        get {
            return self.swiftValue.textFont
        }
        set {
            self.swiftValue.textFont = newValue
        }
    }

    /// If true, other symbols can be visible even if they collide with the text.
    public var textIgnorePlacement: NSNumber? {
        get {
            // Bool?
            guard let textIgnorePlacement = self.swiftValue.textIgnorePlacement else {
                return nil
            }
            return NSNumber(value: textIgnorePlacement)
        }
        set {
            // Bool?
            self.swiftValue.textIgnorePlacement = newValue?.boolValue
        }
    }

    /// If true, the text may be flipped vertically to prevent it from being rendered upside-down.
    public var textKeepUpright: NSNumber? {
        get {
            // Bool?
            guard let textKeepUpright = self.swiftValue.textKeepUpright else {
                return nil
            }
            return NSNumber(value: textKeepUpright)
        }
        set {
            // Bool?
            self.swiftValue.textKeepUpright = newValue?.boolValue
        }
    }

    /// Maximum angle change between adjacent characters.
    public var textMaxAngle: NSNumber? {
        get {
            // Double?
            guard let textMaxAngle = self.swiftValue.textMaxAngle else {
                return nil
            }
            return NSNumber(value: textMaxAngle)
        }
        set {
            // Double?
            self.swiftValue.textMaxAngle = newValue?.doubleValue
        }
    }

    /// If true, icons will display without their corresponding text when the text collides with other symbols and the icon does not.
    public var textOptional: NSNumber? {
        get {
            // Bool?
            guard let textOptional = self.swiftValue.textOptional else {
                return nil
            }
            return NSNumber(value: textOptional)
        }
        set {
            // Bool?
            self.swiftValue.textOptional = newValue?.boolValue
        }
    }

    /// Size of the additional area around the text bounding box used for detecting symbol collisions.
    public var textPadding: NSNumber? {
        get {
            // Double?
            guard let textPadding = self.swiftValue.textPadding else {
                return nil
            }
            return NSNumber(value: textPadding)
        }
        set {
            // Double?
            self.swiftValue.textPadding = newValue?.doubleValue
        }
    }

    /// Orientation of text when map is pitched.
    @objc
    public var textPitchAlignment: TMBTextPitchAlignment? {
        get {
            guard let textPitchAlignment = self.swiftValue.textPitchAlignment else {
                return nil
            }
            return TMBTextPitchAlignment(value: textPitchAlignment)
        }
        set {
            self.swiftValue.textPitchAlignment = newValue?.swiftValue()
        }
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
    @objc
    public var textRotationAlignment: TMBTextRotationAlignment? {
        get {
            guard let textRotationAlignment = self.swiftValue.textRotationAlignment else {
                return nil
            }
            return TMBTextRotationAlignment(value: textRotationAlignment)
        }
        set {
            self.swiftValue.textRotationAlignment = newValue?.swiftValue()
        }
    }

    /// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
    @objc
    public var textVariableAnchor: [TMBTextAnchor]? {
        get {
            return self.swiftValue.textVariableAnchor?.map { TMBTextAnchor(value: $0) }
        }
        set {
            self.swiftValue.textVariableAnchor = newValue?.map { $0.swiftValue() }
        }
    }

    /// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
    @objc
    public var textWritingMode: [TMBTextWritingMode]? {
        get {
            return self.swiftValue.textWritingMode?.map { TMBTextWritingMode(value: $0) }
        }
        set {
            self.swiftValue.textWritingMode = newValue?.map { $0.swiftValue() }
        }
    }

    /// Distance that the icon's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc
    public var iconTranslate: [Double]? {
        get {
            return self.swiftValue.iconTranslate
        }
        set {
            self.swiftValue.iconTranslate = newValue
        }
    }

    /// Controls the frame of reference for `icon-translate`.
    @objc
    public var iconTranslateAnchor: TMBIconTranslateAnchor? {
        get {
            guard let iconTranslateAnchor = self.swiftValue.iconTranslateAnchor else {
                return nil
            }
            return TMBIconTranslateAnchor(value: iconTranslateAnchor)
        }
        set {
            self.swiftValue.iconTranslateAnchor = newValue?.swiftValue()
        }
    }

    /// Distance that the text's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc
    public var textTranslate: [Double]? {
        get {
            return self.swiftValue.textTranslate
        }
        set {
            self.swiftValue.textTranslate = newValue
        }
    }

    /// Controls the frame of reference for `text-translate`.
    @objc
    public var textTranslateAnchor: TMBTextTranslateAnchor? {
        get {
            guard let textTranslateAnchor = self.swiftValue.textTranslateAnchor else {
                return nil
            }
            return TMBTextTranslateAnchor(value: textTranslateAnchor)
        }
        set {
            self.swiftValue.textTranslateAnchor = newValue?.swiftValue()
        }
    }

    /// Text leading value for multi-line text.
    @available(*, deprecated, message: "text-line-height property is now data driven, use `PointAnnotation.textLineHeight` instead.")
    public var textLineHeight: NSNumber? {
        get {
            // Double?
            guard let textLineHeight = self.swiftValue.textLineHeight else {
                return nil
            }
            return NSNumber(value: textLineHeight)
        }
        set {
            // Double?
            self.swiftValue.textLineHeight = newValue?.doubleValue
        }
    }

}
