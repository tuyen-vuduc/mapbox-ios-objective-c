import MapboxMaps

@objc
open class TMBPolygonAnnotation : NSObject, TMBAnnotation {
    @objc
    public var id: String {
        return swiftValue.id
    }
    
    @objc
    public var geometryInJSON: String {
        return try! swiftValue.polygon.toString()
    }

    @objc
    public var userInfo: [String : Any]? {
        return swiftValue.userInfo
    }
    
    @objc
    public var fillColor: UIColor? {
        set {
            if let color = newValue {
                swiftValue.fillColor = StyleColor(color)
            } else {
                swiftValue.fillColor = nil
            }
        }
        get {
            if let color = swiftValue.fillColor {
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
    public var fillOpacity: Double {
        set {
            swiftValue.fillOpacity = newValue
        }
        get {
            return swiftValue.fillOpacity!
        }
    }
    
    public var swiftValue: PolygonAnnotation
    
    public init(swiftValue: PolygonAnnotation) {
        self.swiftValue = swiftValue
        super.init()
    }
    
    @objc
    public class func polygon(_ polygon: TMBPolygon) -> TMBPolygonAnnotation {
        let swiftValue = PolygonAnnotation(polygon: polygon.swiftValue)
        return TMBPolygonAnnotation(swiftValue: swiftValue)
    }
}

@objc
open class TMBPolygon : NSObject {
    public let swiftValue: Polygon
    
    @objc
    public init(
        outerRingCoordinates: [CLLocationCoordinate2D],
        innerRingCoordinates: [[CLLocationCoordinate2D]]
    ) {
        swiftValue = Polygon(
            outerRing: Ring(coordinates: outerRingCoordinates),
            innerRings: innerRingCoordinates.map({
                Ring(coordinates: $0)
            })
        )
        super.init()
    }
    
    @objc
    public init(
        _ coordinates: [[LocationCoordinate2D]]
    ) {
        swiftValue = Polygon(coordinates)
        super.init()
    }
    
    @objc
    public class func create(
        outerRingCoordinates: [CLLocationCoordinate2D],
        innerRingCoordinates: [[CLLocationCoordinate2D]]
    ) -> TMBPolygon {
        return TMBPolygon(
            outerRingCoordinates: outerRingCoordinates,
            innerRingCoordinates: innerRingCoordinates
        )
    }
    
    @objc
    public class func from(
        coordinates: [[LocationCoordinate2D]]
    ) -> TMBPolygon {
        return TMBPolygon(coordinates)
    }
}

@objc
open class TMBPolygonAnnotationManager : NSObject, TMBAnnotationManager, AnnotationInteractionDelegate {
    
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
                return TMBPolygonAnnotation(swiftValue: annotation as! PolygonAnnotation)
            }
            delegate.annotationManager(self, didDetectTappedAnnotations: items)
        }
    }
    
    @objc
    public var annotations: [TMBPolygonAnnotation] {
        get {
            return swiftValue.annotations.map({
                TMBPolygonAnnotation(swiftValue: $0)
                
            })
        }
        set {
            swiftValue.annotations = newValue.map({
                $0.swiftValue
            })
        }
    }
    
    public let swiftValue: PolygonAnnotationManager
    
    /// Set this delegate in order to be called back if a tap occurs on an annotation being managed by this manager.
    /// - NOTE: This annotation manager listens to tap events via the `GestureManager.singleTapGestureRecognizer`.
    @objc
    public weak var delegate: TMBAnnotationInteractionDelegate?
    
    public init(_ swiftValue: PolygonAnnotationManager) {
        self.swiftValue = swiftValue
        super.init()
        swiftValue.delegate = self
    }
}
