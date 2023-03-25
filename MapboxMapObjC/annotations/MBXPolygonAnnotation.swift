import MapboxMaps

@objc
open class MBXPolygonAnnotation : NSObject, MBXAnnotation {
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
    public class func polygon(_ polygon: MBXPolygon) -> MBXPolygonAnnotation {
        let swiftValue = PolygonAnnotation(polygon: polygon.swiftValue)
        return MBXPolygonAnnotation(swiftValue: swiftValue)
    }
}

@objc
open class MBXPolygon : NSObject {
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
    public class func create(
        outerRingCoordinates: [CLLocationCoordinate2D],
        innerRingCoordinates: [[CLLocationCoordinate2D]]
    ) -> MBXPolygon {
        return MBXPolygon(
            outerRingCoordinates: outerRingCoordinates,
            innerRingCoordinates: innerRingCoordinates
        )
    }
}

@objc
open class MBXPolygonAnnotationManager : NSObject, MBXAnnotationManager, AnnotationInteractionDelegate {
    
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
                return MBXPolygonAnnotation(swiftValue: annotation as! PolygonAnnotation)
            }
            delegate.annotationManager(self, didDetectTappedAnnotations: items)
        }
    }
    
    @objc
    public var annotations: [MBXPolygonAnnotation] {
        get {
            return swiftValue.annotations.map({
                MBXPolygonAnnotation(swiftValue: $0)
                
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
    public weak var delegate: MBXAnnotationInteractionDelegate?
    
    public init(_ swiftValue: PolygonAnnotationManager) {
        self.swiftValue = swiftValue
        super.init()
        swiftValue.delegate = self
    }
}
