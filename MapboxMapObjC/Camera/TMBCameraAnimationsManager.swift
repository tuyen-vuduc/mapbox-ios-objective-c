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
        return _self.cameraAnimators.map { $0.wrap() }
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
    @objc public func fly(to: TMBCameraOptions,
                    duration: NSNumber?,
                    completion: AnimationCompletion? = nil) -> TMBCancelable {
        let cancelable = _self.fly(
            to: to.unwrap(),
            duration: duration?.doubleValue,
            completion: completion)
        
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
    @objc public func ease(to: TMBCameraOptions,
                     duration: TimeInterval,
                     curve: UIView.AnimationCurve = .easeOut,
                     completion: AnimationCompletion? = nil) -> TMBCancelable {
        let cancelable = _self.ease(
            to: to.unwrap(),
            duration: duration,
            curve: curve,
            completion: completion)
        
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
                             animations: @escaping (TMBCameraTransition) -> Void) -> TMBBasicCameraAnimator {
        let animator = _self.makeAnimator(
            duration: duration,
            timingParameters: timingParameters,
            animationOwner: animationOwner?.unwrap() ?? .unspecified,
            animations: { cameraTransition in
                animations(TMBCameraTransition(cameraTransition))
            })
        return animator.wrap()
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
                             animations: @escaping (TMBCameraTransition) -> Void) -> TMBBasicCameraAnimator {
        let animator = _self.makeAnimator(
            duration: duration,
            curve: curve,
            animationOwner: animationOwner?.unwrap() ?? .unspecified,
            animations: { cameraTransition in
                animations(TMBCameraTransition(cameraTransition))
            })
        return animator.wrap()
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
                             animations: @escaping (TMBCameraTransition) -> Void) -> TMBBasicCameraAnimator {
        let animator = _self.makeAnimator(
            duration: duration,
            controlPoint1: controlPoint1,
            controlPoint2: controlPoint2,
            animationOwner: animationOwner?.unwrap() ?? .unspecified,
            animations: { cameraTransition in
                animations(TMBCameraTransition(cameraTransition))
            })
        return animator.wrap()
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
                             animations: @escaping (TMBCameraTransition) -> Void) -> TMBBasicCameraAnimator {
        let animator = _self.makeAnimator(
            duration: duration,
            dampingRatio: dampingRatio,
            animationOwner: animationOwner?.unwrap() ?? .unspecified,
            animations: { cameraTransition in
                animations(TMBCameraTransition(cameraTransition))
            })
        return animator.wrap()
    }
}
