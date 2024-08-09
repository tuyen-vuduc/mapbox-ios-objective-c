//
//  TMBViewportStatusObserver.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/19/24.
//

import Foundation
import MapboxMaps

/// `ViewportStatusObserver` must be implemented by objects that wish to register
/// themselves using ``ViewportManager/addStatusObserver(_:)`` so that they can observe
/// ``ViewportManager/status`` changes.
///
/// - SeeAlso: ``ViewportManager/addStatusObserver(_:)`` for an important note about how
///            these notifications are delivered asynchronously.
@objc public protocol TMBViewportStatusObserver {

    /// Called whenever ``ViewportManager/status`` changes.
    /// - Parameters:
    ///   - fromStatus: The value of ``ViewportManager/status`` prior to the change.
    ///   - toStatus: The value of ``ViewportManager/status`` after the change.
    ///   - reason: A ``ViewportStatusChangeReason`` that indicates what initiated the change.
    @objc func viewportStatusDidChange(from fromStatus: TMBViewportStatus,
                                 to toStatus: TMBViewportStatus,
                                 reason: TMBViewportStatusChangeReason)
}

extension TMBViewportStatusObserver {
    func unwrap() -> ViewportStatusObserver {
        TMBViewportStatusObserverWrapper(self)
    }
}

internal class TMBViewportStatusObserverWrapper : ViewportStatusObserver {
    func viewportStatusDidChange(
        from fromStatus: MapboxMaps.ViewportStatus, 
        to toStatus: MapboxMaps.ViewportStatus,
        reason: MapboxMaps.ViewportStatusChangeReason) {
            x.viewportStatusDidChange(
                from: fromStatus.wrap(),
                to: toStatus.wrap(),
                reason: reason.wrap())
    }
    
    private let x: TMBViewportStatusObserver
    init(_ x: TMBViewportStatusObserver) {
        self.x = x
    }
}

/// Constants that describe why ``ViewportManager/status`` changed.
@objc public class TMBViewportStatusChangeReason: NSObject {
    @objc public let rawValue: String
    
    private init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// ``ViewportManager/status`` changed because ``ViewportManager/idle()`` was invoked.
    @objc public static let idleRequested = TMBViewportStatusChangeReason(rawValue: "IDLE_REQUESTED")

    /// ``ViewportManager/status`` changed because ``ViewportManager/transition(to:transition:completion:)`` was invoked.
    ///
    /// An event with this reason is not delivered if the ``ViewportTransition/run(to:completion:)`` invokes its completion
    /// block synchronously.
    @objc public static let transitionStarted = TMBViewportStatusChangeReason(rawValue: "TRANSITION_STARTED")

    /// ``ViewportManager/status`` changed because ``ViewportManager/transition(to:transition:completion:)`` completed successfully.
    @objc public static let transitionSucceeded = TMBViewportStatusChangeReason(rawValue: "TRANSITION_SUCCEEDED")

    /// ``ViewportManager/status`` changed because ``ViewportManager/transition(to:transition:completion:)`` failed.
    @objc public static let transitionFailed = TMBViewportStatusChangeReason(rawValue: "TRANSITION_FAILED")

    /// ``ViewportManager/status`` changed due to user interaction.
    ///
    /// - SeeAlso: ``ViewportOptions/transitionsToIdleUponUserInteraction``
    @objc public static let userInteraction = TMBViewportStatusChangeReason(rawValue: "USER_INTERACTION")
}

extension ViewportStatusChangeReason {
    func wrap() -> TMBViewportStatusChangeReason {
        switch self {
        case .idleRequested:
            return TMBViewportStatusChangeReason.idleRequested
        case .transitionFailed:
            return TMBViewportStatusChangeReason.transitionFailed
        case .transitionStarted:
            return TMBViewportStatusChangeReason.transitionStarted
        case .transitionSucceeded:
            return TMBViewportStatusChangeReason.transitionSucceeded
        case .userInteraction:
            return TMBViewportStatusChangeReason.userInteraction
        default:
            return TMBViewportStatusChangeReason.idleRequested
        }
    }
}
