import UIKit
import MapboxMaps


/// Options used to configure the direction in which the map is allowed to move
/// during a pan gesture. Called `ScrollMode` in the Android SDK for
/// consistency with platform conventions.
@objc public enum TMBPanMode: Int {
    /// The map may only move horizontally.
    case horizontal

    /// The map may only move vertically.
    case vertical

    /// The map may move both horizontally and vertically.
    case horizontalAndVertical
}
extension PanMode {
    func wrap() -> TMBPanMode {
        switch self {
        case .horizontal:
            return .horizontal
        case .vertical:
            return .vertical
        case .horizontalAndVertical:
            return .horizontalAndVertical
        }
    }
}
extension TMBPanMode {
    func unwrap() -> PanMode {
        switch self {
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
@objc open class TMBGestureOptions: NSObject {
    private var origin: GestureOptions;

    /// Whether the single-touch pan gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc public var panEnabled: Bool {
        get {
            self.origin.panEnabled
        }
        set {
            self.origin.panEnabled = newValue
        }
    }

    /// Whether the pinch gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc public var pinchEnabled: Bool {
        get {
            self.origin.pinchEnabled
        }
        set {
            self.origin.pinchEnabled = newValue
        }
    }

    /// Whether rotation gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc public var rotateEnabled: Bool {
        get {
            self.origin.rotateEnabled
        }
        set {
            self.origin.rotateEnabled = newValue
        }
    }

    /// Whether rotation is enabled during the pinch gesture.
    ///
    /// Defaults to `true`.
    @objc public var simultaneousRotateAndPinchZoomEnabled: Bool {
        get {
            self.origin.simultaneousRotateAndPinchZoomEnabled
        }
        set {
            self.origin.simultaneousRotateAndPinchZoomEnabled = newValue
        }
    }

    /// Whether zoom is enabled for the pinch gesture.
    ///
    /// Defaults to `true`.
    @objc public var pinchZoomEnabled: Bool {
        get {
            self.origin.pinchZoomEnabled
        }
        set {
            self.origin.pinchZoomEnabled = newValue
        }
    }

    /// Whether pan is enabled for the pinch gesture.
    ///
    /// Defaults to `true`.
    @objc public var pinchPanEnabled: Bool {
        get {
            self.origin.pinchPanEnabled
        }
        set {
            self.origin.pinchPanEnabled = newValue
        }
    }

    /// Whether the pitch gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc public var pitchEnabled: Bool {
        get {
            self.origin.pitchEnabled
        }
        set {
            self.origin.pitchEnabled = newValue
        }
    }

    /// Whether double tapping the map with one touch results in a zoom-in animation.
    ///
    /// Defaults to `true`.
    @objc public var doubleTapToZoomInEnabled: Bool {
        get {
            self.origin.doubleTapToZoomInEnabled
        }
        set {
            self.origin.doubleTapToZoomInEnabled = newValue
        }
    }

    /// Whether single tapping the map with two touches results in a zoom-out animation.
    ///
    /// Defaults to `true`.
    @objc public var doubleTouchToZoomOutEnabled: Bool {
        get {
            self.origin.doubleTouchToZoomOutEnabled
        }
        set {
            self.origin.doubleTouchToZoomOutEnabled = newValue
        }
    }

    /// Whether the quick zoom gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc public var quickZoomEnabled: Bool {
        get {
            self.origin.quickZoomEnabled
        }
        set {
            self.origin.quickZoomEnabled = newValue
        }
    }

    /// Configures the directions in which the map is allowed to move during a pan gesture.
    ///
    /// Defaults to `PanMode.horizontalAndVertical`. Called `scrollMode` in
    /// the Android SDK for consistency with platform conventions.
    @objc public var panMode: TMBPanMode {
        get {
            self.origin.panMode.wrap()
        }
        set {
            self.origin.panMode = newValue.unwrap()
        }
    }

    /// A constant factor that determines how quickly pan deceleration animations happen.
    /// Multiplied with the velocity vector once per millisecond during deceleration animations.
    /// 
    /// Defaults to `UIScrollView.DecelerationRate.normal.rawValue`
    @objc public var panDecelerationFactor: CGFloat {
        get {
            self.origin.panDecelerationFactor
        }
        set {
            self.origin.panDecelerationFactor = newValue
        }
    }

    /// By default, gestures rotate and zoom around the center of the gesture. Set this property to rotate and zoom around a fixed point instead.
    ///
    /// This property will be ignored by the pinch gesture if ``GestureOptions/pinchPanEnabled`` is set to `true`.
    @objc public var focalPoint: NSValue? {
        get {
            if let focalPoint = self.origin.focalPoint {
                return NSValue(cgPoint: focalPoint)
            }
            return nil
        }
        set {
            self.origin.focalPoint = newValue?.cgPointValue
        }
    }

    public init(_ origin: GestureOptions){
        self.origin = origin
    }
}
extension TMBGestureOptions {
    func unwrap() -> GestureOptions {
        self.origin
    }
}
extension GestureOptions {
    func wrap() -> TMBGestureOptions {
        TMBGestureOptions(self)
    }
}
