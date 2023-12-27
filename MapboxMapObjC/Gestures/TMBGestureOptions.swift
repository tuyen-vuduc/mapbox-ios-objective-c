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

    /// Whether the single-touch pan gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc public var panEnabled: Bool

    /// Whether the pinch gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc public var pinchEnabled: Bool

    /// Whether rotation gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc public var rotateEnabled: Bool

    /// Whether rotation is enabled during the pinch gesture.
    ///
    /// Defaults to `true`.
    @objc public var simultaneousRotateAndPinchZoomEnabled: Bool

    /// Whether zoom is enabled for the pinch gesture.
    ///
    /// Defaults to `true`.
    @objc public var pinchZoomEnabled: Bool

    /// Whether pan is enabled for the pinch gesture.
    ///
    /// Defaults to `true`.
    @objc public var pinchPanEnabled: Bool

    /// Whether the pitch gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc public var pitchEnabled: Bool

    /// Whether double tapping the map with one touch results in a zoom-in animation.
    ///
    /// Defaults to `true`.
    @objc public var doubleTapToZoomInEnabled: Bool

    /// Whether single tapping the map with two touches results in a zoom-out animation.
    ///
    /// Defaults to `true`.
    @objc public var doubleTouchToZoomOutEnabled: Bool

    /// Whether the quick zoom gesture is enabled.
    ///
    /// Defaults to `true`.
    @objc public var quickZoomEnabled: Bool

    /// Configures the directions in which the map is allowed to move during a pan gesture.
    ///
    /// Defaults to `PanMode.horizontalAndVertical`. Called `scrollMode` in
    /// the Android SDK for consistency with platform conventions.
    @objc public var panMode: TMBPanMode

    /// A constant factor that determines how quickly pan deceleration animations happen.
    /// Multiplied with the velocity vector once per millisecond during deceleration animations.
    /// 
    /// Defaults to `UIScrollView.DecelerationRate.normal.rawValue`
    @objc public var panDecelerationFactor: CGFloat

    /// By default, gestures rotate and zoom around the center of the gesture. Set this property to rotate and zoom around a fixed point instead.
    ///
    /// This property will be ignored by the pinch gesture if ``GestureOptions/pinchPanEnabled`` is set to `true`.
    @objc public var focalPoint: CGPoint

    /// Initializes a `GestureOptions`.
    /// - Parameters:
    ///   - panEnabled: Whether the single-touch pan gesture is enabled.
    ///   - pinchEnabled: Whether the pinch gesture is enabled.
    ///   - rotateEnabled: Whether rotation gesture is enabled.
    ///   - simultaneousRotateAndPinchZoomEnabled: Whether rotation is enabled during the pinch gesture.
    ///   - pinchZoomEnabled: Whether zoom is enabled for the pinch gesture.
    ///   - pinchPanEnabled: Whether pan is enabled during the pinch gesture.
    ///   - pitchEnabled: Whether the pitch gesture is enabled.
    ///   - doubleTapToZoomInEnabled: Whether double tapping the map with one touch results in a zoom-in animation.
    ///   - doubleTouchToZoomOutEnabled: Whether single tapping the map with two touches results in a zoom-out animation.
    ///   - quickZoomEnabled: Whether the quick zoom gesture is enabled.
    ///   - panMode: The directions in which the map is allowed to move during a pan gesture.
    ///   - panDecelerationFactor: The constant factor that determines how quickly pan deceleration animations happen.
    ///   - focalPoint: The centerpoint for rotating and zooming the map.
    @objc public init(
        panEnabled : Bool, 
        pinchEnabled : Bool, 
        rotateEnabled : Bool, 
        simultaneousRotateAndPinchZoomEnabled : Bool, 
        pinchZoomEnabled : Bool, 
        pinchPanEnabled : Bool, 
        pitchEnabled : Bool, 
        doubleTapToZoomInEnabled : Bool, 
        doubleTouchToZoomOutEnabled : Bool, 
        quickZoomEnabled : Bool, 
        panMode : TMBPanMode, 
        panDecelerationFactor : CGFloat, 
        focalPoint : CGPoint){
        self.panEnabled = panEnabled
        self.pinchEnabled = pinchEnabled
        self.rotateEnabled = rotateEnabled
        self.simultaneousRotateAndPinchZoomEnabled = simultaneousRotateAndPinchZoomEnabled
        self.pinchZoomEnabled = pinchZoomEnabled
        self.pinchPanEnabled = pinchPanEnabled
        self.pitchEnabled = pitchEnabled
        self.doubleTapToZoomInEnabled = doubleTapToZoomInEnabled
        self.doubleTouchToZoomOutEnabled = doubleTouchToZoomOutEnabled
        self.quickZoomEnabled = quickZoomEnabled
        self.panMode = panMode
        self.panDecelerationFactor = panDecelerationFactor
        self.focalPoint = focalPoint
    }
}
extension TMBGestureOptions {
    func unwrap() -> GestureOptions {
        GestureOptions(panEnabled: self.panEnabled,
            pinchEnabled: self.pinchEnabled,
            rotateEnabled: self.rotateEnabled,
            simultaneousRotateAndPinchZoomEnabled: self.simultaneousRotateAndPinchZoomEnabled,
            pinchZoomEnabled: self.pinchZoomEnabled,
            pinchPanEnabled: self.pinchPanEnabled,
            pitchEnabled: self.pitchEnabled,
            doubleTapToZoomInEnabled: self.doubleTapToZoomInEnabled,
            doubleTouchToZoomOutEnabled: self.doubleTouchToZoomOutEnabled,
            quickZoomEnabled: self.quickZoomEnabled,
            panMode: (self.panMode).unwrap(),
            panDecelerationFactor: self.panDecelerationFactor,
            focalPoint: self.focalPoint)
    }
}
extension GestureOptions {
    func wrap() -> TMBGestureOptions {
        TMBGestureOptions(panEnabled: self.panEnabled,
          pinchEnabled: self.pinchEnabled,
          rotateEnabled: self.rotateEnabled,
          simultaneousRotateAndPinchZoomEnabled: self.simultaneousRotateAndPinchZoomEnabled,
          pinchZoomEnabled: self.pinchZoomEnabled,
          pinchPanEnabled: self.pinchPanEnabled,
          pitchEnabled: self.pitchEnabled,
          doubleTapToZoomInEnabled: self.doubleTapToZoomInEnabled,
          doubleTouchToZoomOutEnabled: self.doubleTouchToZoomOutEnabled,
          quickZoomEnabled: self.quickZoomEnabled,
          panMode: (self.panMode).wrap(),
          panDecelerationFactor: self.panDecelerationFactor,
          focalPoint: self.focalPoint ?? CGPoint())
    }
}
