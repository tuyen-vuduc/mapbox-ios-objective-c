import MapboxMaps

@objc
open class TMBPolylineAnnotation : NSObject, TMBAnnotation {
    @objc
    public var id: String {
        return swiftValue.id
    }
    
    @objc
    public var geometryInJSON: String {
        return try! swiftValue.lineString.toString()
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
    
    public var swiftValue: PolylineAnnotation
    
    public init(swiftValue: PolylineAnnotation) {
        self.swiftValue = swiftValue
        super.init()
    }
    
    @objc
    public class func from(
        id: String = UUID().uuidString,
        coordinates: [LocationCoordinate2D],
        isSelected: Bool = false,
        isDraggable: Bool = false) -> TMBPolylineAnnotation {
        let swiftValue = PolylineAnnotation(
            id: id,
            lineCoordinates: coordinates,
            isSelected: isSelected,
            isDraggable: isDraggable)
        return TMBPolylineAnnotation(swiftValue: swiftValue)
    }
    
    // MARK: - Style Properties -

    /// The display of lines when joining.
    @objc
    public var lineJoin: TMBLineJoin? {
        get {
            guard let lineJoin = self.swiftValue.lineJoin else {
                return nil
            }
            return TMBLineJoin(value: lineJoin)
        }
        set {
            self.swiftValue.lineJoin = newValue?.swiftValue()
        }
    }

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc
    public var lineSortKey: NSNumber? {
        get {
            guard let lineSortKey = self.swiftValue.lineSortKey else {
                return nil
            }
            return NSNumber(value: lineSortKey)
        }
        set {
            // Double?
            self.swiftValue.lineSortKey = newValue?.doubleValue
        }
    }

    /// Blur applied to the line, in pixels.
    @objc
    public var lineBlur: NSNumber? {
        get {
            guard let lineBlur = self.swiftValue.lineBlur else {
                return nil
            }
            return NSNumber(value: lineBlur)
        }
        set {
            // Double?
            self.swiftValue.lineBlur = newValue?.doubleValue
        }
    }

    /// The color with which the line will be drawn.
    @objc
    public var lineColor: UIColor? {
        get {
            guard let lineColor = self.swiftValue.lineColor else {
                return nil
            }
            return UIColor(
                red: lineColor.red,
                green: lineColor.green,
                blue: lineColor.blue,
                alpha: lineColor.alpha)
        }
        set {
            guard let lineColor = newValue else {
                self.swiftValue.lineColor = nil
                return;
            }
            
            self.swiftValue.lineColor = StyleColor(lineColor)
        }
    }

    /// Draws a line casing outside of a line's actual path. Value indicates the width of the inner gap.
    @objc
    public var lineGapWidth: NSNumber? {
        get {
            guard let lineGapWidth = self.swiftValue.lineGapWidth else {
                return nil
            }
            return NSNumber(value: lineGapWidth)
        }
        set {
            // Double?
            self.swiftValue.lineGapWidth = newValue?.doubleValue
        }
    }

    /// The line's offset. For linear features, a positive value offsets the line to the right, relative to the direction of the line, and a negative value to the left. For polygon features, a positive value results in an inset, and a negative value results in an outset.
    @objc
    public var lineOffset: NSNumber? {
        get {
            guard let lineOffset = self.swiftValue.lineOffset else {
                return nil
            }
            return NSNumber(value: lineOffset)
        }
        set {
            // Double?
            self.swiftValue.lineOffset = newValue?.doubleValue
        }
    }

    /// The opacity at which the line will be drawn.
    @objc
    public var lineOpacity: NSNumber? {
        get {
            guard let lineOpacity = self.swiftValue.lineOpacity else {
                return nil
            }
            return NSNumber(value: lineOpacity)
        }
        set {
            // Double?
            self.swiftValue.lineOpacity = newValue?.doubleValue
        }
    }

    /// Name of image in sprite to use for drawing image lines. For seamless patterns, image width must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc
    public var linePattern: String? {
        get {
            return self.swiftValue.linePattern
        }
        set {
            self.swiftValue.linePattern = newValue
        }
    }

    /// Stroke thickness.
    @objc
    public var lineWidth: NSNumber? {
        get {
            guard let lineWidth = self.swiftValue.lineWidth else {
                return nil
            }
            return NSNumber(value: lineWidth)
        }
        set {
            // Double?
            self.swiftValue.lineWidth = newValue?.doubleValue
        }
    }
}

@objc
open class TMBPolylineAnnotationManager : NSObject, TMBAnnotationManager, AnnotationInteractionDelegate {
    
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
                return TMBPolylineAnnotation(swiftValue: annotation as! PolylineAnnotation)
            }
            delegate.annotationManager(self, didDetectTappedAnnotations: items)
        }
    }
    
    @objc
    public var annotations: [TMBPolylineAnnotation] {
        get {
            return swiftValue.annotations.map({
                TMBPolylineAnnotation(swiftValue: $0)
                
            })
        }
        set {
            swiftValue.annotations = newValue.map({
                $0.swiftValue
            })
        }
    }
    
    public let swiftValue: PolylineAnnotationManager
    
    /// Set this delegate in order to be called back if a tap occurs on an annotation being managed by this manager.
    /// - NOTE: This annotation manager listens to tap events via the `GestureManager.singleTapGestureRecognizer`.
    @objc
    public weak var delegate: TMBAnnotationInteractionDelegate?
    
    public init(_ swiftValue: PolylineAnnotationManager) {
        self.swiftValue = swiftValue
        super.init()
        swiftValue.delegate = self
    }
    
    // MARK: - Common layer properties

    /// The display of line endings.
    @objc
    public var lineCap: TMBLineCap? {
        get {
            guard let lineCap = self.swiftValue.lineCap else {
                return nil
            }
            return TMBLineCap(value: lineCap)
        }
        set {
            self.swiftValue.lineCap = newValue?.swiftValue()
        }
    }

    /// Used to automatically convert miter joins to bevel joins for sharp angles.
    @objc
    public var lineMiterLimit: NSNumber? {
        get {
            guard let lineMiterLimit = self.swiftValue.lineMiterLimit else {
                return nil
            }
            return NSNumber(value: lineMiterLimit)
        }
        set {
            // Double?
            self.swiftValue.lineMiterLimit = newValue?.doubleValue
        }
    }

    /// Used to automatically convert round joins to miter joins for shallow angles.
    @objc
    public var lineRoundLimit: NSNumber? {
        get {
            guard let lineRoundLimit = self.swiftValue.lineRoundLimit else {
                return nil
            }
            return NSNumber(value: lineRoundLimit)
        }
        set {
            // Double?
            self.swiftValue.lineRoundLimit = newValue?.doubleValue
        }
    }

    /// Specifies the lengths of the alternating dashes and gaps that form the dash pattern. The lengths are later scaled by the line width. To convert a dash length to pixels, multiply the length by the current line width. Note that GeoJSON sources with `lineMetrics: true` specified won't render dashed lines to the expected scale. Also note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc
    public var lineDasharray: [Double]? {
        get {
            return self.swiftValue.lineDasharray
        }
        set {
            self.swiftValue.lineDasharray = newValue
        }
    }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc
    public var lineTranslate: [Double]? {
        get {
            return self.swiftValue.lineTranslate
        }
        set {
            self.swiftValue.lineTranslate = newValue
        }
    }

    /// Controls the frame of reference for `line-translate`.
    @objc
    public var lineTranslateAnchor: TMBLineTranslateAnchor? {
        get {
            guard let lineTranslateAnchor = self.swiftValue.lineTranslateAnchor else {
                return nil
            }
            return TMBLineTranslateAnchor(value: lineTranslateAnchor)
        }
        set {
            self.swiftValue.lineTranslateAnchor = newValue?.swiftValue()
        }
    }

    /// The line part between [trim-start, trim-end] will be marked as transparent to make a route vanishing effect. The line trim-off offset is based on the whole line range [0.0, 1.0].
    @objc
    public var lineTrimOffset: [Double]? {
        get {
            return self.swiftValue.lineTrimOffset
        }
        set {
            self.swiftValue.lineTrimOffset = newValue
        }
    }
}
