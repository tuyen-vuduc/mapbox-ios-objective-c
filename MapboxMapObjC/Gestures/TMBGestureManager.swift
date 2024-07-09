import MapboxMaps

@objc
extension MapView {
    @objc public func gestures() -> TMBGestureManager {
        TMBGestureManager(self.gestures)
    }
}

@objc
public protocol TMBGestureManagerDelegate {

    /// Informs the delegate that a gesture has begun.
    @objc
    func gestureManager(didBegin gestureType: TMBGestureType)

    /// Informs the delegate that a gesture has ended and whether there will be additional animations after the gesture
    /// has completed. Does not indicate whether gesture-based animations have completed.
    @objc
    func gestureManager(didEnd gestureType: TMBGestureType, willAnimate: Bool)

    /// Informs the delegate that animations triggered due to a gesture have ended.
    @objc
    func gestureManager(didEndAnimatingFor gestureType: TMBGestureType)
}

@objc open class TMBGestureManager : NSObject, GestureManagerDelegate {
    @objc public weak var delegate: TMBGestureManagerDelegate?
    
    @objc public var gestureOptions: TMBGestureOptions {
        get {
            self.swiftValue.options.wrap()
        }
        set {
            self.swiftValue.options = newValue.unwrap()
        }
    }
    
    /// The gesture recognizer for the pan gesture
    @objc public var panGestureRecognizer: UIGestureRecognizer {
        return swiftValue.panGestureRecognizer
    }

    /// The gesture recognizer for the "pinch to zoom" gesture
    @objc public var pinchGestureRecognizer: UIGestureRecognizer {
        return swiftValue.pinchGestureRecognizer
    }

    /// The gesture recognizer for the rotate gesture
    @objc public var rotateGestureRecognizer: UIGestureRecognizer {
        return swiftValue.rotateGestureRecognizer
    }

    /// The gesture recognizer for the pitch gesture
    @objc public var pitchGestureRecognizer: UIGestureRecognizer {
        return swiftValue.pitchGestureRecognizer
    }

    /// The gesture recognizer for the "double tap to zoom in" gesture
    @objc public var doubleTapToZoomInGestureRecognizer: UIGestureRecognizer {
        return swiftValue.doubleTapToZoomInGestureRecognizer
    }

    /// The gesture recognizer for the "double touch to zoom out" gesture
    @objc public var doubleTouchToZoomOutGestureRecognizer: UIGestureRecognizer {
        return swiftValue.doubleTouchToZoomOutGestureRecognizer
    }

    /// The gesture recognizer for the quickZoom gesture
    @objc public var quickZoomGestureRecognizer: UIGestureRecognizer {
        return swiftValue.quickZoomGestureRecognizer
    }

    /// The gesture recognizer for the single tap gesture
    /// - NOTE: The single tap gesture recognizer is primarily used to route tap events to the
    ///         `*AnnotationManager`s. You can add a target-action pair to this gesture recognizer
    ///         to be notified when a single tap occurs on the map.
    @objc public var singleTapGestureRecognizer: UIGestureRecognizer {
        return swiftValue.singleTapGestureRecognizer
    }
    
    private var swiftValue: GestureManager;
    
    init(_ swiftValue: GestureManager) {
        self.swiftValue = swiftValue
        super.init()
        swiftValue.delegate = self
    }
    
    public func gestureManager(_ gestureManager: MapboxMaps.GestureManager, didBegin gestureType: MapboxMaps.GestureType) {
        delegate?.gestureManager(didBegin: gestureType.wrap())
    }
    
    public func gestureManager(_ gestureManager: MapboxMaps.GestureManager, didEnd gestureType: MapboxMaps.GestureType, willAnimate: Bool) {
        delegate?.gestureManager(didEnd: gestureType.wrap(), willAnimate: willAnimate)
    }
    
    public func gestureManager(_ gestureManager: MapboxMaps.GestureManager, didEndAnimatingFor gestureType: MapboxMaps.GestureType) {
        delegate?.gestureManager(didEndAnimatingFor: gestureType.wrap())
    }
}
