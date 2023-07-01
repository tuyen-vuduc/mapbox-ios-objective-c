import MapboxMaps
import UIKit

@objc
extension MapView {
    @objc public func camera() -> TMBCameraAnimationsManager {
        TMBCameraAnimationsManager(self.camera)
    }
}

/// APIs for animating the camera.
@objc open class TMBCameraAnimationsManager : NSObject {
    let _self: CameraAnimationsManager
    
    init(_ _self: CameraAnimationsManager) {
        self._self = _self
    }

    /// List of animators currently alive
    @objc public var cameraAnimators: [TMBCameraAnimator] {
        return _self.cameraAnimators.map { TMBCameraAnimator(_swiftValue: $0) }
    }

    /// Interrupts all `active` animation.
    /// The camera remains at the last point before the cancel request was invoked, i.e.,
    /// the camera is not reset or fast-forwarded to the end of the transition.
    /// Canceled animations cannot be restarted / resumed. The animator must be recreated.
    @objc public func cancelAnimations() {
        _self.cancelAnimations()
    }

    // MARK: High-Level Animation APIs

    /// Moves the viewpoint to a different location using a transition animation that
    /// evokes powered flight and an optional transition duration and timing function.
    /// It seamlessly incorporates zooming and panning to help
    /// the user find his or her bearings even after traversing a great distance.
    ///
    /// - Parameters:
    ///   - to: The camera options at the end of the animation. Any camera parameters that are nil will
    ///         not be animated.
    ///   - duration: Duration of the animation, measured in seconds. If nil, a suitable calculated
    ///               duration is used.
    ///   - completion: Completion handler called when the animation stops
    /// - Returns: An instance of `Cancelable` which can be canceled if necessary
    @discardableResult
    @objc public func fly(to: MapboxCoreMaps.CameraOptions,
                    duration: NSNumber?,
                    completion: AnimationCompletion? = nil) -> TMBCancelable? {
        guard let cancelable = _self.fly(
            to: to.swiftValue(),
            duration: duration?.doubleValue,
            completion: completion) else {
            return nil
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// Ease the camera to a destination
    /// - Parameters:
    ///   - to: the target camera after animation; if `camera.anchor` is non-nil, it is use for both
    ///         the `fromValue` and the `toValue` of the underlying animation such that the
    ///         value specified will not be interpolated, but will be passed as-is to each camera update
    ///         during the animation. To animate `anchor` itself, use the `makeAnimator` APIs.
    ///   - duration: duration of the animation
    ///   - curve: the easing curve for the animation
    ///   - completion: completion to be called after animation
    /// - Returns: An instance of `Cancelable` which can be canceled if necessary
    @discardableResult
    @objc public func ease(to: MapboxCoreMaps.CameraOptions,
                     duration: TimeInterval,
                     curve: UIView.AnimationCurve = .easeOut,
                     completion: AnimationCompletion? = nil) -> TMBCancelable? {
        guard let cancelable = _self.ease(
            to: to.swiftValue(),
            duration: duration,
            curve: curve,
            completion: completion) else {
            return nil
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    // MARK: Low-Level Animation APIs

    /// Creates a ``BasicCameraAnimator``.
    ///
    /// - Note: `CameraAnimationsManager` only keeps animators alive while their
    ///         ``CameraAnimator/state`` is `.active`.
    ///
    /// - Parameters:
    ///   - duration: The duration of the animation.
    ///   - timingParameters: The object providing the timing information. This object must adopt
    ///                       the `UITimingCurveProvider` protocol.
    ///   - animationOwner: An `AnimationOwner` that can be used to identify what component
    ///                     initiated an animation.
    ///   - animations: a closure that configures the animation's to and from values via a
    ///                 ``CameraTransition``.
    /// - Returns: A new ``BasicCameraAnimator``.
    @objc public func makeAnimator(duration: TimeInterval,
                             timingParameters: UITimingCurveProvider,
                             animationOwner: TMBAnimationOwner?,
                             animations: @escaping (TMBCameraTransition) -> Void) -> BasicCameraAnimator {
        return _self.makeAnimator(
            duration: duration,
            timingParameters: timingParameters,
            animationOwner: animationOwner?.swiftValue() ?? .unspecified,
            animations: { cameraTransition in
                animations(TMBCameraTransition(cameraTransition))
            })
    }

    /// Creates a ``BasicCameraAnimator``.
    ///
    /// - Note: `CameraAnimationsManager` only keeps animators alive while their
    ///         ``CameraAnimator/state`` is `.active`.
    ///
    /// - Parameters:
    ///   - duration: The duration of the animation.
    ///   - curve: One of UIKit's predefined timing curves to apply to the animation.
    ///   - animationOwner: An `AnimationOwner` that can be used to identify what component
    ///                     initiated an animation.
    ///   - animations: a closure that configures the animation's to and from values via a
    ///                 ``CameraTransition``.
    /// - Returns: A new ``BasicCameraAnimator``.
    @objc public func makeAnimator(duration: TimeInterval,
                             curve: UIView.AnimationCurve,
                             animationOwner: TMBAnimationOwner?,
                             animations: @escaping (TMBCameraTransition) -> Void) -> BasicCameraAnimator {
        return _self.makeAnimator(
            duration: duration,
            curve: curve,
            animationOwner: animationOwner?.swiftValue() ?? .unspecified,
            animations: { cameraTransition in
                animations(TMBCameraTransition(cameraTransition))
            })
    }

    /// Creates a ``BasicCameraAnimator``.
    ///
    /// - Note: `CameraAnimationsManager` only keeps animators alive while their
    ///         ``CameraAnimator/state`` is `.active`.
    ///
    /// - Parameters:
    ///   - duration: The duration of the animation.
    ///   - controlPoint1: The first control point for the cubic Bézier timing curve.
    ///   - controlPoint2: The second control point for the cubic Bézier timing curve.
    ///   - animationOwner: An `AnimationOwner` that can be used to identify what component
    ///                     initiated an animation.
    ///   - animations: a closure that configures the animation's to and from values via a
    ///                 ``CameraTransition``.
    /// - Returns: A new ``BasicCameraAnimator``.
    @objc public func makeAnimator(duration: TimeInterval,
                             controlPoint1: CGPoint,
                             controlPoint2: CGPoint,
                             animationOwner: TMBAnimationOwner?,
                             animations: @escaping (TMBCameraTransition) -> Void) -> BasicCameraAnimator {
        return _self.makeAnimator(
            duration: duration,
            controlPoint1: controlPoint1,
            controlPoint2: controlPoint2,
            animationOwner: animationOwner?.swiftValue() ?? .unspecified,
            animations: { cameraTransition in
                animations(TMBCameraTransition(cameraTransition))
            })
    }

    /// Creates a ``BasicCameraAnimator``.
    ///
    /// - Note: `CameraAnimationsManager` only keeps animators alive while their
    ///         ``CameraAnimator/state`` is `.active`.
    ///
    /// - Parameters:
    ///   - duration: The duration of the animation.
    ///   - dampingRatio: The damping ratio to apply to the initial acceleration and oscillation. To
    ///                   smoothly decelerate the animation without oscillation, specify a value of 1.
    ///                   Specify values closer to 0 to create less damping and more oscillation.
    ///   - animationOwner: An `AnimationOwner` that can be used to identify what component
    ///                     initiated an animation.
    ///   - animations: a closure that configures the animation's to and from values via a
    ///                 ``CameraTransition``.
    /// - Returns: A new ``BasicCameraAnimator``.
    @objc public func makeAnimator(duration: TimeInterval,
                             dampingRatio: CGFloat,
                             animationOwner: TMBAnimationOwner?,
                             animations: @escaping (TMBCameraTransition) -> Void) -> BasicCameraAnimator {
        return _self.makeAnimator(
            duration: duration,
            dampingRatio: dampingRatio,
            animationOwner: animationOwner?.swiftValue() ?? .unspecified,
            animations: { cameraTransition in
                animations(TMBCameraTransition(cameraTransition))
            })
    }
}

@objc
open class TMBCameraAnimator : NSObject {
    @objc
    func stopAnimation() {
        _swiftValue.stopAnimation()
    }
    
    @objc
    var state: UIViewAnimatingState {
        get {
            _swiftValue.state
        }
    }
    
    @objc
    func cancel() {
        _swiftValue.cancel()
    }
    
    private let _swiftValue: CameraAnimator
    
    init(_swiftValue: CameraAnimator) {
        self._swiftValue = _swiftValue
    }
}

@objc open class TMBAnimationOwner: NSObject, NamedString {
    @objc public func stringValue() -> String {
        rawValue
    }
    
    func swiftValue() -> AnimationOwner {
        AnimationOwner(rawValue: rawValue)
    }
    
    private let rawValue: String

    @objc public init(rawValue: String) {
        self.rawValue = rawValue
    }

    @objc public static let gestures = TMBAnimationOwner(rawValue: "com.mapbox.maps.gestures")

    @objc public static let unspecified = TMBAnimationOwner(rawValue: "com.mapbox.maps.unspecified")

    internal static let cameraAnimationsManager = TMBAnimationOwner(rawValue: "com.mapbox.maps.cameraAnimationsManager")

    internal static let defaultViewportTransition = TMBAnimationOwner(rawValue: "com.mapbox.maps.viewport.defaultTransition")
}


/// Structure used to represent a desired change to the map's camera
@objc open class TMBCameraTransition: NSObject {
    private var rawValue: CameraTransition
    init(_ rawValue: CameraTransition) {
        self.rawValue = rawValue
    }
    
    /// Represents a change to the center coordinate of the map.
    /// NOTE: Setting the `toValue` of `center` overrides any `anchor` animations
    public var center: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(rawValue.center)
    }
    
    /// Represents a change to the zoom of the map.
    public var zoom: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(rawValue.center)
    }
    
    /// Represents a change to the padding of the map.
    public var padding: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(rawValue.center)
    }
    
    /// Represents a change to the anchor of the map
    /// NOTE: Incompatible with concurrent center animations
    public var anchor: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(rawValue.center)
    }
    
    /// Represents a change to the bearing of the map.
    public var bearing: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(rawValue.center)
    }
    
    /// Ensures that bearing transitions are optimized to take the shortest path. Defaults to `true`.
    public var shouldOptimizeBearingPath: Bool  {
        get {
            rawValue.shouldOptimizeBearingPath
        }
        set {
            rawValue.shouldOptimizeBearingPath = newValue
        }
    }
    
    /// Represents a change to the pitch of the map.
    public var pitch: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(rawValue.center)
    }
}

/// Generic struct used to represent a change in a value from a starting point (i.e. `fromValue`) to an end point (i.e. `toValue`).
@objc open class TMBCameraTransitionChange : NSObject {
    public var fromValue: NSValue
    public var toValue: NSValue?
    
    init(fromValue: NSValue, toValue: NSValue? = nil) {
        self.fromValue = fromValue
        self.toValue = toValue
    }
    
    public static func fromChange(_ change: CameraTransition.Change<CLLocationCoordinate2D>)
        -> TMBCameraTransitionChange {
            TMBCameraTransitionChange(
                fromValue: NSValue(mkCoordinate: change.fromValue),
                toValue: change.toValue != nil
                    ? NSValue(mkCoordinate: change.toValue!)
                    : nil)
    }
    
    public static func fromCoordinate(_ change: CameraTransition.Change<CLLocationCoordinate2D>)
        -> TMBCameraTransitionChange {
            TMBCameraTransitionChange(
                fromValue: NSValue(mkCoordinate: change.fromValue),
                toValue: change.toValue != nil
                    ? NSValue(mkCoordinate: change.toValue!)
                    : nil)
    }
    
    public static func fromEdgeInsets(_ change: CameraTransition.Change<UIEdgeInsets>)
        -> TMBCameraTransitionChange {
            TMBCameraTransitionChange(
                fromValue: NSValue(uiEdgeInsets: change.fromValue),
                toValue: change.toValue != nil
                    ? NSValue(uiEdgeInsets: change.toValue!)
                    : nil)
    }
    
    public static func fromCGFloat(_ change: CameraTransition.Change<CGFloat>)
        -> TMBCameraTransitionChange {
            TMBCameraTransitionChange(
                fromValue: NSNumber(value: change.fromValue),
                toValue: change.toValue != nil
                ? NSNumber(value: change.toValue!)
                    : nil)
    }
    
    public func change(_ change: inout CameraTransition.Change<CLLocationCoordinate2D>) {
        change.fromValue = fromValue.coordinateValue()
        change.toValue = toValue?.coordinateValue()
    }
    
    public func change(_ change: inout CameraTransition.Change<UIEdgeInsets>) {
        change.fromValue = fromValue.uiEdgeInsetsValue
        change.toValue = toValue?.uiEdgeInsetsValue
    }
    
    public func change(_ change: inout CameraTransition.Change<CGFloat>) {
        if let fromValue = fromValue as? NSNumber {
            change.fromValue = fromValue.CGFloat
        }
        
        if toValue == nil {
            change.toValue = nil
        }
        else if let toValue = toValue as? NSNumber {
            change.toValue = toValue.CGFloat
        }
    }
}
