import MapboxMaps


@objc
open class TMBPolygonAnnotationManager : NSObject, TMBAnnotationManager, AnnotationInteractionDelegate {
    
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
                return TMBPolygonAnnotation(swiftValue: annotation as! PolygonAnnotation)
            }
            delegate.annotationManager(self, didDetectTappedAnnotations: items)
        }
    }
    
    @objc
    public var annotations: [TMBPolygonAnnotation] {
        get {
            return _self.annotations.map({
                TMBPolygonAnnotation(swiftValue: $0)
                
            })
        }
        set {
            _self.annotations = newValue.map({
                $0.swiftValue
            })
        }
    }

    // MARK: - Common layer properties

    /// Whether or not the fill should be antialiased.
    @objc
    public var fillAntialias: NSNumber? {
        get {
            // Bool?
            guard let fillAntialias = _self.fillAntialias else {
                return nil
            }
            return NSNumber(value: fillAntialias)
        }
        set {
            // Bool?
            _self.fillAntialias = newValue?.boolValue
        }
    }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc
    public var fillTranslate: [Double]? {
        get {
            return _self.fillTranslate
        }
        set {
            _self.fillTranslate = newValue
        }
    }

    /// Controls the frame of reference for `fill-translate`.
    @objc
    public var fillTranslateAnchor: NSNumber? {
        get {
            return _self.fillTranslateAnchor?.asNumber()
        }
        set {
            _self.fillTranslateAnchor = newValue?.FillTranslateAnchor
        }
    }
    
    public let _self: PolygonAnnotationManager
    
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
    
    public init(_ swiftValue: PolygonAnnotationManager) {
        self._self = swiftValue
    }
}
