import MapboxMaps

/// Options used to configure the direction in which the map is allowed to move
/// during a pan gesture. Called `ScrollMode` in the Android SDK for
/// consistency with platform conventions.
@objc
public enum TMBPanMode : Int {
    /// The map may only move horizontally.
    case horizontal

    /// The map may only move vertically.
    case vertical

    /// The map may move both horizontally and vertically.
    case horizontalAndVertical
}

extension TMBPanMode {
    func swiftValue() -> PanMode {
        switch(self) {
        case .horizontal:
            return .horizontal
        case .vertical:
            return .vertical
        case .horizontalAndVertical:
            return .horizontalAndVertical
        }
    }
}

extension PanMode {
    func objcValue() -> TMBPanMode {
        switch(self) {
        case .horizontal:
            return .horizontal
        case .vertical:
            return .vertical
        case .horizontalAndVertical:
            return .horizontalAndVertical
        }
    }
}

/// Configuration options for the built-in gestures
@objc
open class TMBGestureOptions: NSObject {
    /// Whether the single-touch pan gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc
    public var panEnabled: Bool {
        get { swiftValue.panEnabled }
        set  { swiftValue.panEnabled = newValue }
    }

    /// Whether the pinch gesture is enabled. Allows panning, rotating, and zooming.
    ///
    /// Defaults to `true`.
    @objc
    public var pinchEnabled: Bool {
        get { swiftValue.pinchEnabled }
        set  { swiftValue.pinchEnabled = newValue }
    }

    /// Whether rotation gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc
    public var rotateEnabled: Bool {
        get { swiftValue.rotateEnabled }
        set  { swiftValue.rotateEnabled = newValue }
    }

    /// Whether rotation is enabled for the pinch to zoom gesture.
    ///
    /// Defaults to `true`.
    @objc
    public var simultaneousRotateAndPinchZoomEnabled: Bool {
        get { swiftValue.simultaneousRotateAndPinchZoomEnabled }
        set  { swiftValue.simultaneousRotateAndPinchZoomEnabled = newValue }
    }

    /// Whether zoom is enabled for the pinch gesture.
    ///
    /// Defaults to `true`.
    @objc
    public var pinchZoomEnabled: Bool {
        get { swiftValue.pinchZoomEnabled }
        set  { swiftValue.pinchZoomEnabled = newValue }
    }

    /// Whether pan is enabled for the pinch gesture.
    ///
    /// Defaults to `true`.
    @objc
    public var pinchPanEnabled: Bool {
        get { swiftValue.pinchPanEnabled }
        set  { swiftValue.pinchPanEnabled = newValue }
    }

    /// Whether the pitch gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc
    public var pitchEnabled: Bool {
        get { swiftValue.pitchEnabled }
        set  { swiftValue.pitchEnabled = newValue }
    }

    /// Whether double tapping the map with one touch results in a zoom-in animation.
    ///
    /// Defaults to `true`.
    @objc
    public var doubleTapToZoomInEnabled: Bool {
        get { swiftValue.doubleTapToZoomInEnabled }
        set  { swiftValue.doubleTapToZoomInEnabled = newValue }
    }

    /// Whether single tapping the map with two touches results in a zoom-out animation.
    ///
    /// Defaults to `true`.
    @objc
    public var doubleTouchToZoomOutEnabled: Bool {
        get { swiftValue.doubleTouchToZoomOutEnabled }
        set  { swiftValue.doubleTouchToZoomOutEnabled = newValue }
    }

    /// Whether the quick zoom gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc
    public var quickZoomEnabled: Bool {
        get { swiftValue.quickZoomEnabled }
        set  { swiftValue.quickZoomEnabled = newValue }
    }

    /// Configures the directions in which the map is allowed to move during a pan gesture.
    ///
    /// Defaults to `PanMode.horizontalAndVertical`. Called `scrollMode` in
    /// the Android SDK for consistency with platform conventions.
    @objc
    public var panMode: TMBPanMode {
        get { swiftValue.panMode.objcValue() }
        set  { swiftValue.panMode = newValue.swiftValue() }
    }

    /// A constant factor that determines how quickly pan deceleration animations happen.
    /// Multiplied with the velocity vector once per millisecond during deceleration animations.
    ///
    /// Defaults to `UIScrollView.DecelerationRate.normal.rawValue`
    @objc
    public var panDecelerationFactor: CGFloat {
        get { swiftValue.panDecelerationFactor }
        set  { swiftValue.panDecelerationFactor = newValue }
    }

    /// By default, gestures rotate and zoom around the center of the gesture. Set this property to rotate and zoom around a fixed point instead.
    ///
    /// This property will be ignored by the pinch gesture if ``GestureOptions/pinchPanEnabled`` is set to `true`.
    @objc
    public var focalPoint: NSValue? {
        get {
            if let focalPoint = swiftValue.focalPoint {
                return NSValue(cgPoint: focalPoint)
            }
            
            return nil
        }
        set  { swiftValue.focalPoint = newValue?.cgPointValue }
    }
    
    private var swiftValue: GestureOptions;
    
    /// Initializes a `GestureOptions`.
    /// - Parameters:
    ///   - panEnabled: Whether the single-touch pan gesture is enabled.
    ///   - pinchEnabled: Whether the pinch gesture is enabled.
    ///   - rotateEnabled: Whether rotation gesture is enabled.
    ///   - simultaneousRotateAndPinchZoomEnabled: Whether rotation is enabled for the pinch to zoom gesture.
    ///   - pinchZoomEnabled: Whether zoom is enabled for the pinch gesture.
    ///   - pinchPanEnabled: Whether pan is enabled for the pinch gesture.
    ///   - pitchEnabled: Whether the pitch gesture is enabled.
    ///   - doubleTapToZoomInEnabled: Whether double tapping the map with one touch results in a zoom-in animation.
    ///   - doubleTouchToZoomOutEnabled: Whether single tapping the map with two touches results in a zoom-out animation.
    ///   - quickZoomEnabled: Whether the quick zoom gesture is enabled.
    ///   - panMode: The directions in which the map is allowed to move during a pan gesture.
    ///   - panDecelerationFactor: The constant factor that determines how quickly pan deceleration animations happen.
    ///   - focalPoint: The centerpoint for rotating and zooming the map.
    public init(
        _ swiftValue: GestureOptions
    ) {
        self.swiftValue = swiftValue
    }
}

@objc
public enum TMBGestureType: Int {
    /// The pan gesture
    case pan

    /// The pinch gesture
    case pinch

    /// The pitch gesture
    case pitch

    /// The double tap to zoom in gesture
    case doubleTapToZoomIn

    /// The double touch to zoom out gesture
    case doubleTouchToZoomOut

    /// The quick zoom gesture
    case quickZoom

    /// The single tap gesture
    case singleTap
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
    
    @objc public func gestureOptions() -> TMBGestureOptions {
        TMBGestureOptions(self.swiftValue.options)
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
    
    init(swiftValue: GestureManager) {
        self.swiftValue = swiftValue
        super.init()
        swiftValue.delegate = self
    }
    
    public func gestureManager(_ gestureManager: MapboxMaps.GestureManager, didBegin gestureType: MapboxMaps.GestureType) {
        delegate?.gestureManager(didBegin: gestureType.objcValue())
    }
    
    public func gestureManager(_ gestureManager: MapboxMaps.GestureManager, didEnd gestureType: MapboxMaps.GestureType, willAnimate: Bool) {
        delegate?.gestureManager(didEnd: gestureType.objcValue(), willAnimate: willAnimate)
    }
    
    public func gestureManager(_ gestureManager: MapboxMaps.GestureManager, didEndAnimatingFor gestureType: MapboxMaps.GestureType) {
        delegate?.gestureManager(didEndAnimatingFor: gestureType.objcValue())
    }
}

extension MapboxMaps.GestureType {
    func objcValue() -> TMBGestureType {
        switch(self) {
        case .doubleTapToZoomIn:
            return .doubleTapToZoomIn
        case .pan:
            return .pan
        case .pinch:
            return .pinch
        case .pitch:
            return .pitch
        case .doubleTouchToZoomOut:
            return .doubleTouchToZoomOut
        case .quickZoom:
            return .quickZoom
        case .singleTap:
            return .singleTap
        }
    }
}

@objc
extension MapView {
    @objc public func gestureManager() -> TMBGestureManager {
        TMBGestureManager(swiftValue: self.gestures)
    }
}
