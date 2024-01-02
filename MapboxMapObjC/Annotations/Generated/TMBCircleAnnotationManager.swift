

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
