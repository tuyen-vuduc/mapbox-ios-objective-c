import UIKit
import MapboxMaps


/// An animator that evokes powered flight and an optional transition duration and timing function.
/// It seamlessly incorporates zooming and panning to help the user find their bearings even after
/// traversing a great distance.
///
/// - SeeAlso: ``CameraAnimationsManager/fly(to:duration:completion:)``
@objc open class TMBFlyToCameraAnimator: NSObject {
    private enum InternalState: Equatable {
        case initial
        case running(startDate: Date)
        case final(UIViewAnimatingPosition)
    }

    /// The animator's owner
    @objc public var owner: TMBAnimationOwner {            
        origin.owner.wrap()
    }

    /// The animator's duration
    @objc public var duration: TimeInterval {            
        origin.duration
    }

    /// The animator's state
    @objc public var state: UIViewAnimatingState {            
        origin.state
    }

    @objc public func stopAnimation() {
        origin.stopAnimation()
    }

    @objc public func cancel() {
        origin.cancel()
    }    
    private let origin:FlyToCameraAnimator
    init(origin: FlyToCameraAnimator) {
        self.origin = origin
    }
}
extension TMBFlyToCameraAnimator {
    func unwrap() -> FlyToCameraAnimator {
        self.origin
    }
}
extension FlyToCameraAnimator {
    func wrap() -> TMBFlyToCameraAnimator {
        TMBFlyToCameraAnimator(origin: self)
    }
}