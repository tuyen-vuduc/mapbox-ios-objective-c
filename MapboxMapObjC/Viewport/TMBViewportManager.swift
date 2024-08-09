//
//  TMBViewportManager.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/18/24.
//

import Foundation
import UIKit
import MapboxMaps


@objc
extension MapView {
    @objc public func viewport() -> TMBViewportManager {
        TMBViewportManager(origin: self.viewport)
    }
}

/// `Viewport` provides a structured approach to organizing camera management logic into states and
/// transitions between them.
///
/// At any given time, the viewport is either:
///
///  - idle (not updating the camera)
///  - in a state (camera is being managed by a ``ViewportState``)
///  - transitioning (camera is being managed by a ``ViewportTransition``)
@objc public class TMBViewportManager: NSObject {
    private var origin: ViewportManager
    private var viewportStatusObserverCache: [ViewportStatusObserver] = []
    private var xviewportStatusObserverCache: [TMBViewportStatusObserver] = []
    init(origin: ViewportManager) {
        self.origin = origin
    }

    /// Configuration options for adjusting the viewport's behavior.
    @objc public var options: TMBViewportOptions {
        get { self.origin.options.wrap() }
        set {  self.origin.options = newValue.unwrap() }
    }

    /// The current ``ViewportStatus``.
    ///
    /// `status` cannot be set directly. Use
    /// ``ViewportManager/transition(to:transition:completion:)`` and ``ViewportManager/idle()`` to
    /// transition to a state or to idle.
    ///
    /// Defaults to ``ViewportStatus/idle``.
    ///
    /// - SeeAlso:
    ///   - ``ViewportManager/addStatusObserver(_:)``
    ///   - ``ViewportManager/removeStatusObserver(_:)``
    @objc public var status: TMBViewportStatus {
        self.origin.status.wrap()
    }

    /// Subscribes a ``ViewportStatusObserver`` to ``ViewportManager/status`` changes.
    ///
    /// Viewport keeps a strong reference to registered observers. Adding the same observer again while it is already subscribed has no effect.
    ///
    /// - Note: Observers are notified of status changes asynchronously on the main queue. This means that by
    /// the time the notification is delivered, the status may have already changed again. This behavior is necessary to allow
    /// observers to trigger further transitions while avoiding out-of-order delivery of status changed notifications.
    /// - Parameter observer: An object that will be notified when the ``ViewportManager/status`` changes.
    /// - SeeAlso: ``ViewportManager/removeStatusObserver(_:)``
    @objc public func addStatusObserver(_ observer: TMBViewportStatusObserver) {
        if xviewportStatusObserverCache.contains(where: { $0 === observer }) {
            return
        }
        
        let xobserver = observer.unwrap()
        xviewportStatusObserverCache.append(observer)
        viewportStatusObserverCache.append(xobserver)
        self.origin.addStatusObserver(xobserver)
    }

    /// Unsubscribes a ``ViewportStatusObserver`` from ``ViewportManager/status`` changes. This causes viewport
    /// to release its strong reference to the observer. Removing an observer that is not subscribed has no effect.
    ///
    /// - Parameter observer: An object that should no longer be notified when the ``ViewportManager/status`` changes.
    /// - SeeAlso: ``ViewportManager/addStatusObserver(_:)``
    @objc public func removeStatusObserver(_ observer: TMBViewportStatusObserver) {
        let index = xviewportStatusObserverCache.firstIndex(where: { $0 === observer })
        if let index {
            xviewportStatusObserverCache.remove(at: index)
            let xobserver = viewportStatusObserverCache[index]
            viewportStatusObserverCache.remove(at: index)
            self.origin.removeStatusObserver(xobserver)
        }
    }

    /// Sets ``ViewportManager/status`` to ``ViewportStatus/idle`` synchronously.
    ///
    /// This cancels any active ``ViewportState`` or ``ViewportTransition``.
    @objc public func idle() {
        self.origin.idle()
    }

    /// Executes a transition to the requested state.
    ///
    /// If the transition fails, ``ViewportManager/status`` is set to ``ViewportStatus/idle``.
    ///
    /// Transitioning to state `x` when the status is `.state(x)` invokes `completion`
    /// synchronously with `true` and does not modify ``ViewportManager/status``.
    ///
    /// Transitioning to state `x` when the status is `.transition(_, x)` invokes `completion`
    /// synchronously with `false` and does not modify ``ViewportManager/status``.
    ///
    /// `Viewport` keeps a strong reference to active transitions and states. To reuse states and transitions,
    /// keep strong references to them in the consuming project.
    ///
    /// - Parameters:
    ///   - toState: The target ``ViewportState`` to transition to.
    ///   - transition: The ``ViewportTransition`` that is used to transition to the target state.
    ///                 If `nil`, ``ViewportManager/defaultTransition`` is used. Defaults to `nil`.
    ///   - completion: A closure that is invoked when the transition ends. Defaults to `nil`.
    @objc public func transition(to toState: TMBViewportState,
                           transition: TMBViewportTransition? = nil,
                           completion: ((_ success: Bool) -> Void)? = nil) {
        self.origin.transition(to: toState.unwrap(), transition: transition?.unwrap(), completion: completion)
    }

    /// ``ViewportManager/transition(to:transition:completion:)`` uses this transition unless
    /// some non-nil value is passed to its `transition` argument.
    ///
    /// Defaults to ``DefaultViewportTransition`` with default options.
    @objc public var defaultTransition: TMBViewportTransition {
        get { self.origin.defaultTransition.wrap() }
        set { self.origin.defaultTransition = newValue.unwrap() }
    }

    /// Creates a new instance of ``FollowPuckViewportState`` with the specified options.
    /// - Parameter options: configuration options used when creating ``FollowPuckViewportState``. Defaults to
    ///                      ``FollowPuckViewportStateOptions/init(padding:zoom:bearing:pitch:)``
    ///                      with the default value specified for all parameters.
    /// - Returns: The newly-created ``FollowPuckViewportState``.
    @objc public func makeFollowPuckViewportState(options: TMBFollowPuckViewportStateOptions?) -> TMBFollowPuckViewportState {
        self.origin.makeFollowPuckViewportState(options: options?.unwrap() ?? FollowPuckViewportStateOptions())
            .wrap()
    }

    /// Creates a new instance of ``OverviewViewportState`` with the specified options.
    /// - Parameter options: configuration options used when creating ``OverviewViewportState``.
    /// - Returns: The newly-created ``OverviewViewportState``.
    @objc public func makeOverviewViewportState(options: TMBOverviewViewportStateOptions) -> TMBOverviewViewportState {
        self.origin.makeOverviewViewportState(options: options.unwrap()).wrap()
    }

    /// Creates a new instance of ``DefaultViewportTransition``.
    /// - Parameter options: configuration options used when creating ``DefaultViewportTransition``. Defaults to
    ///                      ``DefaultViewportTransitionOptions/init(maxDuration:)`` with the default value specified for all parameters
    /// - Returns: The newly-created ``DefaultViewportTransition``.
    @objc public func makeDefaultViewportTransition(options: TMBDefaultViewportTransitionOptions?) -> TMBDefaultViewportTransition {
        self.origin.makeDefaultViewportTransition(options: options?.unwrap() ?? DefaultViewportTransitionOptions())
            .wrap()
    }

    /// Creates a new instance of ``ImmediateViewportTransition``.
    /// - Returns: The newly-created ``ImmediateViewportTransition``.
    @objc public func makeImmediateViewportTransition() -> TMBViewportTransition {
        self.origin.makeImmediateViewportTransition().wrap()
    }
}
