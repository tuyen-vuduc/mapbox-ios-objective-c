import Foundation
import MapboxMaps

@objc public class TMBCameraAnimator: TMBCancelable {
    /// The animation's owner.
    var owner: TMBAnimationOwner {
        origin.owner.wrap()
    }

    /// Stops the animation and calls any provided completion. Does nothing if the animator has already
    /// completed.
    func stopAnimation() {
        origin.stopAnimation()
    }

    /// The current state of the animation.
    var state: UIViewAnimatingState {
        origin.state
    }
    
    private let origin: CameraAnimator
    init(origin: CameraAnimator) {
        self.origin = origin
        super.init(cancelable: origin)
    }
}
extension CameraAnimator {
    func wrap() -> TMBCameraAnimator {
        TMBCameraAnimator(origin: self)
    }
}
extension TMBCameraAnimator {
    func unwrap() -> CameraAnimator {
        self.origin
    }
}
