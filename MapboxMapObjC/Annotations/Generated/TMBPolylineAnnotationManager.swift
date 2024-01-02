import MapboxMaps

@objc
open class TMBPolylineAnnotationManager : NSObject, TMBAnnotationManager, AnnotationInteractionDelegate {
    
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
                return TMBPolylineAnnotation(swiftValue: annotation as! PolylineAnnotation)
            }
            delegate.annotationManager(self, didDetectTappedAnnotations: items)
        }
    }
    
    @objc
    public var annotations: [TMBPolylineAnnotation] {
        get {
            return _self.annotations.map({
                TMBPolylineAnnotation(swiftValue: $0)
                
            })
        }
        set {
            _self.annotations = newValue.map({
                $0.swiftValue
            })
        }
    }
    
    public let _self: PolylineAnnotationManager
    
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
    
    public init(_ swiftValue: PolylineAnnotationManager) {
        self._self = swiftValue
    }
    
    // MARK: - Common layer properties

    /// The display of line endings.
    @objc
    public var lineCap: NSNumber? {
        get {
            return _self.lineCap?.asNumber()
        }
        set {
            _self.lineCap = newValue?.LineCap
        }
    }

    /// Used to automatically convert miter joins to bevel joins for sharp angles.
    @objc
    public var lineMiterLimit: NSNumber? {
        get {
            guard let lineMiterLimit = _self.lineMiterLimit else {
                return nil
            }
            return NSNumber(value: lineMiterLimit)
        }
        set {
            // Double?
            _self.lineMiterLimit = newValue?.doubleValue
        }
    }

    /// Used to automatically convert round joins to miter joins for shallow angles.
    @objc
    public var lineRoundLimit: NSNumber? {
        get {
            guard let lineRoundLimit = _self.lineRoundLimit else {
                return nil
            }
            return NSNumber(value: lineRoundLimit)
        }
        set {
            // Double?
            _self.lineRoundLimit = newValue?.doubleValue
        }
    }

    /// Specifies the lengths of the alternating dashes and gaps that form the dash pattern. The lengths are later scaled by the line width. To convert a dash length to pixels, multiply the length by the current line width. Note that GeoJSON sources with `lineMetrics: true` specified won't render dashed lines to the expected scale. Also note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc
    public var lineDasharray: [Double]? {
        get {
            return _self.lineDasharray
        }
        set {
            _self.lineDasharray = newValue
        }
    }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc
    public var lineTranslate: [Double]? {
        get {
            return _self.lineTranslate
        }
        set {
            _self.lineTranslate = newValue
        }
    }

    /// Controls the frame of reference for `line-translate`.
    @objc
    public var lineTranslateAnchor: NSNumber? {
        get {
            return _self.lineTranslateAnchor?.asNumber()
        }
        set {
            _self.lineTranslateAnchor = newValue?.LineTranslateAnchor
        }
    }

    /// The line part between [trim-start, trim-end] will be marked as transparent to make a route vanishing effect. The line trim-off offset is based on the whole line range [0.0, 1.0].
    @objc
    public var lineTrimOffset: [Double]? {
        get {
            return _self.lineTrimOffset
        }
        set {
            _self.lineTrimOffset = newValue
        }
    }
}
