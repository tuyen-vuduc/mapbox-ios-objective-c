import MapboxMaps

@objc
open class MBXPointAnnotation : NSObject, MBXAnnotation {
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
    public class func from(coordinate: LocationCoordinate2D) -> MBXPointAnnotation {
        let swiftValue = PointAnnotation(point: Point(coordinate))
        return MBXPointAnnotation(swiftValue: swiftValue)
    }
}

@objc
open class MBXPointAnnotationManager : NSObject, MBXAnnotationManager, AnnotationInteractionDelegate {
    
    // MARK: - MBXAnnotationManager protocol conformance
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
                return MBXPointAnnotation(swiftValue: annotation as! PointAnnotation)
            }
            delegate.annotationManager(self, didDetectTappedAnnotations: items)
        }
    }
    
    @objc
    public var annotations: [MBXPointAnnotation] {
        get {
            return swiftValue.annotations.map({
                MBXPointAnnotation(swiftValue: $0)
                
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
    public weak var delegate: MBXAnnotationInteractionDelegate?
    
    public init(_ swiftValue: PointAnnotationManager) {
        self.swiftValue = swiftValue
        super.init()
        swiftValue.delegate = self
    }
}
