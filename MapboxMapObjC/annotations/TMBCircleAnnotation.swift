import MapboxMaps

@objc
open class TMBCircleAnnotation : NSObject, TMBAnnotation {
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
            return swiftValue.isSelected
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
    
    public var swiftValue: CircleAnnotation
    
    public init(swiftValue: CircleAnnotation) {
        self.swiftValue = swiftValue
        super.init()
    }
    
    @objc
    public class func from(center coordinate: LocationCoordinate2D) -> TMBCircleAnnotation {
        let swiftValue = CircleAnnotation(centerCoordinate: coordinate)
        return TMBCircleAnnotation(swiftValue: swiftValue)
    }

    // MARK: - Style Properties -

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc
    public var circleSortKey: NSNumber? {
        get {
            // Double?
            guard let circleSortKey = self.swiftValue.circleSortKey else {
                return nil
            }
            return NSNumber(value: circleSortKey)
        }
        set {
            self.swiftValue.circleSortKey = newValue?.doubleValue
        }
    }

    /// Amount to blur the circle. 1 blurs the circle such that only the centerpoint is full opacity.
    @objc
    public var circleBlur: NSNumber? {
        get {
            // Double?
            guard let circleBlur = self.swiftValue.circleBlur else {
                return nil
            }
            return NSNumber(value: circleBlur)
        }
        set {
            self.swiftValue.circleBlur = newValue?.doubleValue
        }
    }

    /// The fill color of the circle.
    @objc
    public var circleColor: UIColor? {
        get {
            guard let circleColor = self.swiftValue.circleColor else {
                return nil
            }
            return UIColor(
                red: circleColor.red,
                green: circleColor.green,
                blue: circleColor.blue,
                alpha: circleColor.alpha)
        }
        set {
            guard let circleColor = newValue else {
                self.swiftValue.circleColor = nil
                return
            }
            
            self.swiftValue.circleColor = StyleColor(circleColor)
        }
    }

    /// The opacity at which the circle will be drawn.
    @objc
    public var circleOpacity: NSNumber? {
        get {
            // Double?
            guard let circleOpacity = self.swiftValue.circleOpacity else {
                return nil
            }
            return NSNumber(value: circleOpacity)
        }
        set {
            self.swiftValue.circleOpacity = newValue?.doubleValue
        }
    }

    /// Circle radius.
    @objc
    public var circleRadius: NSNumber? {
        get {
            // Double?
            guard let circleRadius = self.swiftValue.circleRadius else {
                return nil
            }
            return NSNumber(value: circleRadius)
        }
        set {
            self.swiftValue.circleRadius = newValue?.doubleValue
        }
    }

    /// The stroke color of the circle.
    @objc
    public var circleStrokeColor: UIColor? {
        get {
            guard let circleStrokeColor = self.swiftValue.circleStrokeColor else {
                return nil
            }
            return UIColor(
                red: circleStrokeColor.red,
                green: circleStrokeColor.green,
                blue: circleStrokeColor.blue,
                alpha: circleStrokeColor.alpha)
        }
        set {
            guard let circleStrokeColor = newValue else {
                self.swiftValue.circleStrokeColor = nil
                return
            }
            
            self.swiftValue.circleStrokeColor = StyleColor(circleStrokeColor)
        }
    }

    /// The opacity of the circle's stroke.
    @objc
    public var circleStrokeOpacity: NSNumber? {
        get {
            // Double?
            guard let circleStrokeOpacity = self.swiftValue.circleStrokeOpacity else {
                return nil
            }
            return NSNumber(value: circleStrokeOpacity)
        }
        set {
            self.swiftValue.circleStrokeOpacity = newValue?.doubleValue
        }
    }

    /// The width of the circle's stroke. Strokes are placed outside of the `circle-radius`.
    @objc
    public var circleStrokeWidth: NSNumber? {
        get {
            // Double?
            guard let circleStrokeWidth = self.swiftValue.circleStrokeWidth else {
                return nil
            }
            return NSNumber(value: circleStrokeWidth)
        }
        set {
            self.swiftValue.circleStrokeWidth = newValue?.doubleValue
        }
    }
}

@objc
open class TMBCircleAnnotationManager : NSObject, TMBAnnotationManager, AnnotationInteractionDelegate {
    
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
                return TMBCircleAnnotation(swiftValue: annotation as! CircleAnnotation)
            }
            delegate.annotationManager(self, didDetectTappedAnnotations: items)
        }
    }
    
    @objc
    public var annotations: [TMBCircleAnnotation] {
        get {
            return _self.annotations.map({
                TMBCircleAnnotation(swiftValue: $0)                
            })
        }
        set {
            _self.annotations = newValue.map({
                $0.swiftValue
            })
        }
    }
    
    public let _self: CircleAnnotationManager
    
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
    
    public init(_ swiftValue: CircleAnnotationManager) {
        self._self = swiftValue
    }
    
    // MARK: - Common layer properties

    /// Orientation of circle when map is pitched.
    @objc
    public var circlePitchAlignment: NSNumber? {
        get {
            return _self.circlePitchAlignment?.asNumber()
        }
        set {
            _self.circlePitchAlignment = newValue?.CirclePitchAlignment
        }
    }

    /// Controls the scaling behavior of the circle when the map is pitched.
    @objc
    public var circlePitchScale: NSNumber? {
        get {
            return _self.circlePitchScale?.asNumber()
        }
        set {
            _self.circlePitchScale = newValue?.CirclePitchScale
        }
    }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc
    public var circleTranslate: [Double]? {
        get {
            return _self.circleTranslate
        }
        set {
            _self.circleTranslate = newValue
        }
    }

    /// Controls the frame of reference for `circle-translate`.
    @objc
    public var circleTranslateAnchor: NSNumber? {
        get {
            return _self.circleTranslateAnchor?.asNumber()
        }
        set {
            _self.circleTranslateAnchor = newValue?.CircleTranslateAnchor
        }
    }
}
