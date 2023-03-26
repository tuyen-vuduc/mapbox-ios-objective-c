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
    public var circleColor: UIColor? {
        set {
            if let color = newValue {
                swiftValue.circleColor = StyleColor(color)
            } else {
                swiftValue.circleColor = nil
            }
        }
        get {
            if let color = swiftValue.circleColor {
                return UIColor(
                    red: color.red,
                    green: color.green,
                    blue: color.blue,
                    alpha: color.alpha)
            }
            return nil
        }
    }
    
    @objc
    public var circleRadius: Double {
        set {
            swiftValue.circleRadius = newValue
        }
        get {
            return swiftValue.circleRadius!
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
}

@objc
open class TMBCircleAnnotationManager : NSObject, TMBAnnotationManager, AnnotationInteractionDelegate {
    
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
                return TMBCircleAnnotation(swiftValue: annotation as! CircleAnnotation)
            }
            delegate.annotationManager(self, didDetectTappedAnnotations: items)
        }
    }
    
    @objc
    public var annotations: [TMBCircleAnnotation] {
        get {
            return swiftValue.annotations.map({
                TMBCircleAnnotation(swiftValue: $0)                
            })
        }
        set {
            swiftValue.annotations = newValue.map({
                $0.swiftValue
            })
        }
    }
    
    public let swiftValue: CircleAnnotationManager
    
    /// Set this delegate in order to be called back if a tap occurs on an annotation being managed by this manager.
    /// - NOTE: This annotation manager listens to tap events via the `GestureManager.singleTapGestureRecognizer`.
    @objc
    public weak var delegate: TMBAnnotationInteractionDelegate?
    
    public init(_ swiftValue: CircleAnnotationManager) {
        self.swiftValue = swiftValue
        super.init()
        swiftValue.delegate = self
    }
}
