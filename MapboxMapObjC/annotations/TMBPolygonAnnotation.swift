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
    
    // MARK: - Style Properties -

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc
    public var fillSortKey: NSNumber? {
        get {
            // Double?
            guard let fillSortKey = self.swiftValue.fillSortKey else {
                return nil
            }
            return NSNumber(value: fillSortKey)
        }
        set {
            self.swiftValue.fillSortKey = newValue?.doubleValue
        }
    }

    /// The color of the filled part of this layer. This color can be specified as `rgba` with an alpha component and the color's opacity will not affect the opacity of the 1px stroke, if it is used.
    @objc
    public var fillColor: UIColor? {
        get {
            guard let fillColor = self.swiftValue.fillColor else {
                return nil
            }
            return UIColor(
                red: fillColor.red,
                green: fillColor.green,
                blue: fillColor.blue,
                alpha: fillColor.alpha)
        }
        set {
            guard let fillColor = newValue else {
                self.swiftValue.fillColor = nil
                return
            }
            
            self.swiftValue.fillColor = StyleColor(fillColor)
        }
    }

    /// The opacity of the entire fill layer. In contrast to the `fill-color`, this value will also affect the 1px stroke around the fill, if the stroke is used.
    @objc
    public var fillOpacity: NSNumber? {
        get {
            // Double?
            guard let fillOpacity = self.swiftValue.fillOpacity else {
                return nil
            }
            return NSNumber(value: fillOpacity)
        }
        set {
            self.swiftValue.fillOpacity = newValue?.doubleValue
        }
    }

    /// The outline color of the fill. Matches the value of `fill-color` if unspecified.
    @objc
    public var fillOutlineColor: UIColor? {
        get {
            guard let fillOutlineColor = self.swiftValue.fillOutlineColor else {
                return nil
            }
            return UIColor(
                red: fillOutlineColor.red,
                green: fillOutlineColor.green,
                blue: fillOutlineColor.blue,
                alpha: fillOutlineColor.alpha)
        }
        set {
            guard let fillOutlineColor = newValue else {
                self.swiftValue.fillOutlineColor = nil
                return
            }
            
            self.swiftValue.fillOutlineColor = StyleColor(fillOutlineColor)
        }
    }

    /// Name of image in sprite to use for drawing image fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc
    public var fillPattern: String? {
        get {
            return self.swiftValue.fillPattern
        }
        set {
            self.swiftValue.fillPattern = newValue
        }
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
            return self._self.id
        }
    }
    @objc
    public var sourceId: String {
        get {
            return self._self.sourceId
        }
    }
    @objc
    public var layerId: String {
        get {
            return self._self.layerId
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
            guard let fillAntialias = self._self.fillAntialias else {
                return nil
            }
            return NSNumber(value: fillAntialias)
        }
        set {
            // Bool?
            self._self.fillAntialias = newValue?.boolValue
        }
    }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc
    public var fillTranslate: [Double]? {
        get {
            return self._self.fillTranslate
        }
        set {
            self._self.fillTranslate = newValue
        }
    }

    /// Controls the frame of reference for `fill-translate`.
    @objc
    public var fillTranslateAnchor: TMBFillTranslateAnchor? {
        get {
            guard let fillTranslateAnchor = self._self.fillTranslateAnchor else {
                return nil
            }
            return TMBFillTranslateAnchor(value: fillTranslateAnchor)
        }
        set {
            self._self.fillTranslateAnchor = newValue?.swiftValue()
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
