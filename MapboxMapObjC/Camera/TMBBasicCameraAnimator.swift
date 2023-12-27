import UIKit
import MapboxMaps


@objc open class TMBBasicCameraAnimator: NSObject {

    /// The animator's owner.
    @objc public var owner: TMBAnimationOwner {            
        origin.owner.wrap()
    }

    /// Defines the transition that will occur to the `CameraOptions` of the renderer due to this animator
    @objc public var transition: TMBCameraTransition? {            
        origin.transition?.wrap()
    }

    /// The state from of the animator.
    @objc public var state: UIViewAnimatingState {            
        origin.state
    }

    /// Boolean that represents if the animation is running or not.
    @objc public var isRunning: Bool {            
        origin.isRunning
    }

    /// Boolean that represents if the animation is running normally or in reverse.
    @objc public var isReversed: Bool {            
        get {
            origin.isReversed
        }
        set {
            origin.isReversed = newValue
        }
    }

    /// A Boolean value that indicates whether a completed animation remains in the active state.
    @objc public var pausesOnCompletion: Bool {            
        get {
            origin.pausesOnCompletion
        }
        set {
            origin.pausesOnCompletion = newValue
        }
    }

    /// Value that represents what percentage of the animation has been completed.
    @objc public var fractionComplete: Double {            
        get {
            origin.fractionComplete
        }
        set {
            origin.fractionComplete = newValue
        }
    }

    /// Starts the animation if this animator is in `inactive` state. Also used to resume a "paused"
    /// animation. Calling this method on an animator that has already completed or been canceled has
    /// no effect.
    @objc public func startAnimation() {
        origin.startAnimation()
    }

    /// Starts the animation after a delay. This cannot be called on a paused animation.
    /// If animations are cancelled before the end of the delay, it will also be cancelled. Calling this method
    /// on an animator that has already completed or been canceled has no effect.
    /// - Parameter delay: Delay (in seconds) after which the animation should start
    @objc public func startAnimation(afterDelay  delay: TimeInterval) {
        origin.startAnimation(afterDelay: delay)
    }

    /// Pauses the animation. Calling this method on an animator that has already completed or been
    /// canceled has no effect.
    @objc public func pauseAnimation() {
        origin.pauseAnimation()
    }

    /// Stops the animation.
    @objc public func stopAnimation() {
        origin.stopAnimation()
    }

    /// Add a completion block to the animator.
    @objc public func addCompletion(_  completion: @escaping AnimationCompletion) {
        origin.addCompletion(completion)
    }

    /// Continue the animation with a timing parameter (`UITimingCurveProvider`) and duration factor (`CGFloat`).
    @objc public func continueAnimation(withTimingParameters  timingParameters: UITimingCurveProvider?, 
                                  durationFactor : Double) {
        origin.continueAnimation(withTimingParameters: timingParameters, durationFactor: durationFactor)
    }

    @objc public func cancel() {
        origin.cancel()
    }    
    private let origin:BasicCameraAnimator
    init(origin: BasicCameraAnimator) {
        self.origin = origin
    }
}
extension TMBBasicCameraAnimator {
    func unwrap() -> BasicCameraAnimator {
        self.origin
    }
}
extension BasicCameraAnimator {
    func wrap() -> TMBBasicCameraAnimator {
        TMBBasicCameraAnimator(origin: self)
    }
}