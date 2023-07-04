import MapboxMaps

@objc
extension MapView {
    @objc public func viewport() -> TMBViewport {
        return TMBViewport(self.viewport)
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
@objc open class TMBViewport : NSObject {
    private var _self: Viewport
    private var statusObservers = [ObjectIdentifier: ViewportStatusObserver]()
    
    init(_ _self: Viewport) {
        self._self = _self
    }

    /// Configuration options for adjusting the viewport's behavior.
    @objc public var options: TMBViewportOptions {
        get { TMBViewportOptions(_self.options) }
        set {
            _self.options = newValue.rawValue
        }
    }

    /// The current ``ViewportStatus``.
    ///
    /// `status` cannot be set directly. Use
    /// ``Viewport/transition(to:transition:completion:)`` and ``Viewport/idle()`` to
    /// transition to a state or to idle.
    ///
    /// Defaults to ``ViewportStatus/idle``.
    ///
    /// - SeeAlso:
    ///   - ``Viewport/addStatusObserver(_:)``
    ///   - ``Viewport/removeStatusObserver(_:)``
    @objc public var status: TMBViewportStatus {
        return TMBViewportStatus(_self.status)
    }

    /// Subscribes a ``ViewportStatusObserver`` to ``Viewport/status`` changes.
    ///
    /// Viewport keeps a strong reference to registered observers. Adding the same observer again while it is already subscribed has no effect.
    ///
    /// - Note: Observers are notified of status changes asynchronously on the main queue. This means that by
    /// the time the notification is delivered, the status may have already changed again. This behavior is necessary to allow
    /// observers to trigger further transitions while avoiding out-of-order delivery of status changed notifications.
    /// - Parameter observer: An object that will be notified when the ``Viewport/status`` changes.
    /// - SeeAlso: ``Viewport/removeStatusObserver(_:)``
    @objc public func addStatusObserver(_ observer: TMBViewportStatusObserver) {
        let observerAdapter = TMBViewportStatusObserverAdapter(observer)
        statusObservers[ObjectIdentifier(observer)] = observerAdapter
        _self.addStatusObserver(observerAdapter)
    }

    /// Unsubscribes a ``ViewportStatusObserver`` from ``Viewport/status`` changes. This causes viewport
    /// to release its strong reference to the observer. Removing an observer that is not subscribed has no effect.
    ///
    /// - Parameter observer: An object that should no longer be notified when the ``Viewport/status`` changes.
    /// - SeeAlso: ``Viewport/addStatusObserver(_:)``
    @objc public func removeStatusObserver(_ observer: TMBViewportStatusObserver) {
        guard let observerAdapter = statusObservers[ObjectIdentifier(observer)] else {
            return
        }
        
        _self.removeStatusObserver(observerAdapter)
    }

    /// Sets ``Viewport/status`` to ``ViewportStatus/idle`` synchronously.
    ///
    /// This cancels any active ``ViewportState`` or ``ViewportTransition``.
    @objc public func idle() {
        _self.idle()
    }

    /// Executes a transition to the requested state.
    ///
    /// If the transition fails, ``Viewport/status`` is set to ``ViewportStatus/idle``.
    ///
    /// Transitioning to state `x` when the status is `.state(x)` invokes `completion`
    /// synchronously with `true` and does not modify ``Viewport/status``.
    ///
    /// Transitioning to state `x` when the status is `.transition(_, x)` invokes `completion`
    /// synchronously with `false` and does not modify ``Viewport/status``.
    ///
    /// `Viewport` keeps a strong reference to active transitions and states. To reuse states and transitions,
    /// keep strong references to them in the consuming project.
    ///
    /// - Parameters:
    ///   - toState: The target ``ViewportState`` to transition to.
    ///   - transition: The ``ViewportTransition`` that is used to transition to the target state.
    ///                 If `nil`, ``Viewport/defaultTransition`` is used. Defaults to `nil`.
    ///   - completion: A closure that is invoked when the transition ends. Defaults to `nil`.
    ///   - success: Whether the transition ran to completion. Transitions may end early if they fail or
    ///              are interrupted (e.g. by another call to
    ///              `transition(to:transition:completion:)` or ``Viewport/idle()``)
    @objc public func transition(to toState: TMBViewportState,
                           transition: TMBViewportTransition? = nil,
                           completion: ((_ success: Bool) -> Void)? = nil) {
        _self.transition(
            to: TMBViewportStateAdapter(toState),
            transition: transition != nil ? TMBViewportTransitionAdapter(transition!) : nil,
            completion: completion)
    }

    /// ``Viewport/transition(to:transition:completion:)`` uses this transition unless
    /// some non-nil value is passed to its `transition` argument.
    ///
    /// Defaults to ``DefaultViewportTransition`` with default options.
    @objc public var defaultTransition: TMBViewportTransition {
        get {
            if let transition = _self.defaultTransition as? TMBViewportTransition {
                return transition
            }
            return ViewportTransitionAdapter(_self: _self.defaultTransition)
        }
        set {
            if let value = newValue as? ViewportTransition {
                _self.defaultTransition = value
                return
            }
            _self.defaultTransition = TMBViewportTransitionAdapter(newValue)
        }
    }

    /// Creates a new instance of ``FollowPuckViewportState`` with the specified options.
    /// - Parameter options: configuration options used when creating ``FollowPuckViewportState``. Defaults to
    ///                      ``FollowPuckViewportStateOptions/init(padding:zoom:bearing:pitch:animationDuration:)``
    ///                      with the default value specified for all parameters.
    /// - Returns: The newly-created ``FollowPuckViewportState``.
    @objc public func makeFollowPuckViewportState(options: TMBFollowPuckViewportStateOptions? = nil) -> TMBFollowPuckViewportState {
        let xoptions = options?.rawValue ?? FollowPuckViewportStateOptions()
        return TMBFollowPuckViewportState(_self.makeFollowPuckViewportState(options: xoptions))
    }

    /// Creates a new instance of ``OverviewViewportState`` with the specified options.
    /// - Parameter options: configuration options used when creating ``OverviewViewportState``.
    /// - Returns: The newly-created ``OverviewViewportState``.
    @objc public func makeOverviewViewportState(options: TMBOverviewViewportStateOptions) -> TMBOverviewViewportState {
        return TMBOverviewViewportState(
            _self.makeOverviewViewportState(options: options.rawValue)
        )
    }

    /// Creates a new instance of ``DefaultViewportTransition``.
    /// - Parameter options: configuration options used when creating ``DefaultViewportTransition``. Defaults to
    ///                      ``DefaultViewportTransitionOptions/init(maxDuration:)`` with the default value specified for all parameters
    /// - Returns: The newly-created ``DefaultViewportTransition``.
    @objc public func makeDefaultViewportTransition(options: TMBDefaultViewportTransitionOptions? = nil) -> TMBDefaultViewportTransition {
        let xoptions = options?.rawValue ?? DefaultViewportTransitionOptions()
        return TMBDefaultViewportTransition(
            _self.makeDefaultViewportTransition(options: xoptions)
        )
    }

    /// Creates a new instance of ``ImmediateViewportTransition``.
    /// - Returns: The newly-created ``ImmediateViewportTransition``.
    @objc public func makeImmediateViewportTransition() -> TMBImmediateViewportTransition {
        return TMBImmediateViewportTransition(_self.makeImmediateViewportTransition())
    }
}

/// `ViewportStatus` contains 3 cases that express what the ``Viewport`` is doing at any given time.
///
/// The ``ViewportStatus/state(_:)`` and ``ViewportStatus/transition(_:toState:)``
/// cases have associated values that are reference types, so equality and hash are implemented in terms of
/// the identities of those objects.
@objc open class TMBViewportStatus: NSObject {
    private var _self: ViewportStatus
    init(_ _self: ViewportStatus) {
        self._self = _self
    }
    
    public var rawValue: ViewportStatus {
        return _self
    }
    
    private static let _idle = TMBViewportStatus(.idle)
    /// The `idle` status indicates that ``Viewport`` is inactive.
    @objc public static var idle: TMBViewportStatus {
        return _idle
    }

    /// The `state(_:)` status indicates that ``Viewport`` is running the associated value `state`.
    @objc public static func state(_ state: TMBViewportState) -> TMBViewportStatus {
        let stateAdapter = TMBViewportStateAdapter(state)
        return TMBViewportStatus(.state(stateAdapter))
    }

    /// The `transition(_:toState:)` status indicates that ``Viewport`` is running `transition`
    /// and will start running `toState` upon success.
    @objc public static func transition(_ transition: TMBViewportTransition, toState: TMBViewportState) -> TMBViewportStatus {
        let stateAdapter = TMBViewportStateAdapter(toState)
        let transitionAdapter = TMBViewportTransitionAdapter(transition)
        let viewport: ViewportStatus = .transition(transitionAdapter, toState: stateAdapter)
        return TMBViewportStatus(viewport)
    }
}

// `ViewportTransition` is a protocol that ``Viewport`` depends on as it orchestrates transitions
/// to and from different ``ViewportState``s.
///
/// MapboxMaps provides implementations of ``ViewportTransition`` that can be created and
/// configured via methods on ``Viewport``. Applications may also define their own implementations to
/// handle advanced use cases not covered by the provided implementations.
///
/// - SeeAlso:
///   - ``DefaultViewportTransition``
///   - ``ImmediateViewportTransition``
@objc public protocol TMBViewportTransition: AnyObject {
    /// Runs the transition to `toState`.
    ///
    /// The completion block must be invoked with `true` if the transition completes successfully. If the
    /// transition fails, invoke the completion block with `false`.
    ///
    /// If the returned ``Cancelable`` is canceled, it not necessary to invoke the completion block (but
    /// is safe to do so — it will just be ignored).
    ///
    /// Transitions should handle the possibility that the "to" state might fail to provide a target camera in a
    /// timely manner or might update the target camera multiple times during the transition (a "moving
    /// target").
    ///
    /// - Parameters:
    ///   - toState: The target state for the transition.
    ///   - completion:A block that must be invoked when the transition is complete. Must be invoked
    ///                on the main queue.
    ///   - success: A flag to indicate whether the transition was successful.
    /// - Returns: a ``Cancelable`` that can be used to terminate the transition. If
    ///            ``Cancelable/cancel()`` is invoked, the transition must immediately stop
    ///            updating the camera and cancel any animations that it started.
    func run(to toState: TMBViewportState,
             completion: @escaping (_ success: Bool) -> Void) -> TMBCancelable
}
class ViewportTransitionAdapter:  TMBViewportTransition {
    func run(to toState: TMBViewportState, completion: @escaping (Bool) -> Void) -> TMBCancelable {
        let cancelable = _self.run(to: TMBViewportStateAdapter(toState), completion: completion)
        return TMBCancelable(cancelable: cancelable)
    }
    
    private let _self: ViewportTransition
    init(_self: ViewportTransition) {
        self._self = _self
    }
}
class TMBViewportTransitionAdapter:  ViewportTransition {
    func run(to toState: MapboxMaps.ViewportState, completion: @escaping (Bool) -> Void) -> MapboxMaps.Cancelable {
        let cancelable = _self.run(to: ViewportStateAdapter(toState), completion: completion)
        return cancelable.cancelable
    }
    
    private let _self: TMBViewportTransition
    init(_ _self: TMBViewportTransition) {
        self._self = _self
    }
}

/// Configuraton options for ``Viewport``.
@objc open class TMBViewportOptions: NSObject {
    private var _self: ViewportOptions
    init(_ _self: ViewportOptions) {
        self._self = _self
    }
    
    public var rawValue: ViewportOptions {
        return _self
    }
    
    /// Indicates whether the ``Viewport`` should idle when the ``MapView``
    /// receives touch input.
    ///
    /// Set this property to `false` to enable building custom ``ViewportState``s that
    /// can work simultaneously with certain types of gestures.
    ///
    /// Defaults to `true`.
    @objc public var transitionsToIdleUponUserInteraction: Bool {
        get {
            _self.transitionsToIdleUponUserInteraction
        }
        set {
            _self.transitionsToIdleUponUserInteraction = newValue
        }
    }

    /// Initializes ``ViewportOptions``.
    /// - Parameter transitionsToIdleUponUserInteraction: Defaults to `true`.
    @objc public init(transitionsToIdleUponUserInteraction: Bool = true) {
        self._self = ViewportOptions(transitionsToIdleUponUserInteraction: transitionsToIdleUponUserInteraction)
    }
}

/// `ViewportState` is a protocol that ``Viewport`` depends on as it orchestrates transitions to and
/// from different states.
///
/// A `ViewportState` is a reference type and must not be shared among multiple ``Viewport``
/// instances simultaneously.
///
/// The ``ViewportState/observeDataSource(with:)`` method allows
/// ``ViewportTransition``s to consume a stream of camera updates from a target state while
/// executing a transition. ``ViewportState/startUpdatingCamera()`` and
/// ``ViewportState/stopUpdatingCamera()`` are invoked to tell the state that it should assume or
/// relinquish control of the map's camera. These are typically used by ``Viewport`` itself after a
/// successful transition into a state and when exiting a state, respectively.
///
/// MapboxMaps provides implementations of ``ViewportState`` that can be created and configured
/// via methods on ``Viewport``. Applications may also define their own implementations to handle
/// advanced use cases not covered by the provided implementations.
///
/// States should generally pre-warm their data sources as soon as they are created to minimize delays when
/// they become current. For this reason, only states that are currently (or soon-to-be) needed should be kept
/// alive so that unneeded resources (e.g. location services) can be released.
///
/// - SeeAlso:
///   - ``FollowPuckViewportState``
///   - ``OverviewViewportState``
@objc public protocol TMBViewportState: AnyObject {
    /// Registers a `handler` to receive the cameras being generated by this `ViewportState`.
    ///
    /// This method is commonly used by ``ViewportTransition`` implementations to obtain the
    /// target camera for transition animations. Transitions typically cannot start their animations until after
    /// `handler` is invoked for the first time, so it's a good idea for states to invoke `handler` with
    /// the current camera if it's not too stale rather than waiting for the next camera change to occur. To
    /// increase the likelihood that a valid camera exists when a handler is registered, design
    /// `ViewportState` implementations so that they start updating their internal state prior to when
    /// they are passed to ``Viewport/transition(to:transition:completion:)``.
    ///
    /// The caller may either cancel the returned ``Cancelable`` *or* return `false` from
    /// `handler` to indicate that it wishes to stop receiving updates. Following either of these events,
    /// implemenations must no longer invoke `handler` and must release all strong references to it.
    ///
    /// - Parameters:
    ///   - handler: A closure that is invoked by the state whenever its camera changes. Returns
    ///              `true` to stay subscribed and `false` to unsubscribe. `handler` must be
    ///              invoked on the main queue.
    ///   - camera: The `ViewportState`'s most recent camera.
    /// - Returns: A ``Cancelable`` that the caller can use to unsubscribe.
    func observeDataSource(with handler: @escaping (_ camera: MapboxCoreMaps.CameraOptions) -> Bool) -> TMBCancelable

    /// Tells this state that it is now responsible for updating the camera.
    ///
    /// ``Viewport`` calls this method at the end of a successful transition into this state.
    ///
    /// Implementations typically have a dependency on either ``MapboxMap`` so that they can use its
    /// ``MapboxMap/setCamera(to:)`` method to change the camea or on
    /// ``CameraAnimationsManager`` so that they can run camera animations.
    func startUpdatingCamera()

    /// Tells this state that it is no longer responsible for updating the camera.
    ///
    /// ``Viewport`` calls this method at the beginning of the transition out of this state.
    ///
    /// Implementations must stop updating the camera immediately and should typically cancel any
    /// ongoing animations that they started when this method is invoked.
    func stopUpdatingCamera()
}
class TMBViewportStateAdapter: ViewportState {
    private let _self: TMBViewportState
    init(_ _self: TMBViewportState) {
        self._self = _self
    }
    public var rawValue: TMBViewportState {
        return _self
    }
    
    func observeDataSource(with handler: @escaping (CameraOptions) -> Bool) -> Cancelable {
        let cancelable = _self.observeDataSource(with: { cameraOptions in
            handler(CameraOptions(cameraOptions))
        })
        return cancelable.cancelable
    }
    
    func startUpdatingCamera() {
        _self.startUpdatingCamera()
    }
    
    func stopUpdatingCamera() {
        _self.stopUpdatingCamera()
    }
}
class ViewportStateAdapter: TMBViewportState {
    private let _self: ViewportState
    init(_ _self: ViewportState) {
        self._self = _self
    }
    public var rawValue: ViewportState {
        return _self
    }
    
    func observeDataSource(with handler: @escaping (MapboxCoreMaps.CameraOptions) -> Bool) -> TMBCancelable {
        let cancelable = _self.observeDataSource(with: { cameraOptions in
            handler(MapboxCoreMaps.CameraOptions(cameraOptions))
        })
        return TMBCancelable(cancelable: cancelable)
    }
    
    func startUpdatingCamera() {
        _self.startUpdatingCamera()
    }
    
    func stopUpdatingCamera() {
        _self.stopUpdatingCamera()
    }
}

/// `ViewportStatusObserver` must be implemented by objects that wish to register
/// themselves using ``Viewport/addStatusObserver(_:)`` so that they can observe
/// ``Viewport/status`` changes.
///
/// - SeeAlso: ``Viewport/addStatusObserver(_:)`` for an important note about how
///            these notifications are delivered asynchronously.
@objc public protocol TMBViewportStatusObserver: AnyObject {

    /// Called whenever ``Viewport/status`` changes.
    /// - Parameters:
    ///   - fromStatus: The value of ``Viewport/status`` prior to the change.
    ///   - toStatus: The value of ``Viewport/status`` after the change.
    ///   - reason: A ``ViewportStatusChangeReason`` that indicates what initiated the change.
    func viewportStatusDidChange(from fromStatus: TMBViewportStatus,
                                 to toStatus: TMBViewportStatus,
                                 reason: TMBViewportStatusChangeReason)
}

class ViewportStatusObserverAdapter : TMBViewportStatusObserver {
    func viewportStatusDidChange(from fromStatus: TMBViewportStatus, to toStatus: TMBViewportStatus, reason: TMBViewportStatusChangeReason) {
        _self.viewportStatusDidChange(from: fromStatus.rawValue, to: toStatus.rawValue, reason: reason.swiftValue())
    }
    
    private let _self: ViewportStatusObserver
    init(_self: ViewportStatusObserver) {
        self._self = _self
    }
}
class TMBViewportStatusObserverAdapter : ViewportStatusObserver {
    func viewportStatusDidChange(from fromStatus: ViewportStatus, to toStatus: ViewportStatus, reason: ViewportStatusChangeReason) {
        _self.viewportStatusDidChange(from: TMBViewportStatus(fromStatus), to: TMBViewportStatus(toStatus), reason: reason.objcValue())
    }
    
    private let _self: TMBViewportStatusObserver
    init(_ _self: TMBViewportStatusObserver) {
        self._self = _self
    }
}

/// Constants that describe why ``Viewport/status`` changed.
@objc open class TMBViewportStatusChangeReason: NSObject, NamedString {
    public func stringValue() -> String {
        return rawValue
    }
    
    private var rawValue: String

    private init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// ``Viewport/status`` changed because ``Viewport/idle()`` was invoked.
    public static let idleRequested = TMBViewportStatusChangeReason(rawValue: "IDLE_REQUESTED")

    /// ``Viewport/status`` changed because ``Viewport/transition(to:transition:completion:)`` was invoked.
    ///
    /// An event with this reason is not delivered if the ``ViewportTransition/run(to:completion:)`` invokes its completion
    /// block synchronously.
    public static let transitionStarted = TMBViewportStatusChangeReason(rawValue: "TRANSITION_STARTED")

    /// ``Viewport/status`` changed because ``Viewport/transition(to:transition:completion:)`` completed successfully.
    public static let transitionSucceeded = TMBViewportStatusChangeReason(rawValue: "TRANSITION_SUCCEEDED")

    /// ``Viewport/status`` changed because ``Viewport/transition(to:transition:completion:)`` failed.
    public static let transitionFailed = TMBViewportStatusChangeReason(rawValue: "TRANSITION_FAILED")

    /// ``Viewport/status`` changed due to user interaction.
    ///
    /// - SeeAlso: ``ViewportOptions/transitionsToIdleUponUserInteraction``
    public static let userInteraction = TMBViewportStatusChangeReason(rawValue: "USER_INTERACTION")
}
extension TMBViewportStatusChangeReason {
    func swiftValue() -> ViewportStatusChangeReason {
        if self == TMBViewportStatusChangeReason.idleRequested {
            return ViewportStatusChangeReason.idleRequested
        }
        if self == TMBViewportStatusChangeReason.transitionStarted {
            return ViewportStatusChangeReason.transitionStarted
        }
        if self == TMBViewportStatusChangeReason.transitionSucceeded {
            return ViewportStatusChangeReason.transitionSucceeded
        }
        if self == TMBViewportStatusChangeReason.transitionFailed {
            return ViewportStatusChangeReason.transitionFailed
        }
        if self == TMBViewportStatusChangeReason.userInteraction {
            return ViewportStatusChangeReason.userInteraction
        }
        // TODO Should throw exception
        return ViewportStatusChangeReason.userInteraction
    }
}
extension ViewportStatusChangeReason {
    func objcValue() -> TMBViewportStatusChangeReason {
        if self == ViewportStatusChangeReason.idleRequested {
            return TMBViewportStatusChangeReason.idleRequested
        }
        if self == ViewportStatusChangeReason.transitionStarted {
            return TMBViewportStatusChangeReason.transitionStarted
        }
        if self == ViewportStatusChangeReason.transitionSucceeded {
            return TMBViewportStatusChangeReason.transitionSucceeded
        }
        if self == ViewportStatusChangeReason.transitionFailed {
            return TMBViewportStatusChangeReason.transitionFailed
        }
        if self == ViewportStatusChangeReason.userInteraction {
            return TMBViewportStatusChangeReason.userInteraction
        }
        // TODO Should throw exception
        return TMBViewportStatusChangeReason.userInteraction
    }
}

/// Configuration options for ``FollowPuckViewportState``.
///
/// Each of the ``CameraOptions``-related properties is optional, so that the state can be configured to
/// only modify certain aspects of the camera if desired. This can be used, to achieve effects like allowing
/// zoom gestures to work simultaneously with ``FollowPuckViewportState``.
///
/// - SeeAlso: ``ViewportOptions/transitionsToIdleUponUserInteraction``
@objc open class TMBFollowPuckViewportStateOptions: NSObject {
    private var _self: FollowPuckViewportStateOptions
    init(_ _self: FollowPuckViewportStateOptions) {
        self._self = _self
    }
    public var rawValue: FollowPuckViewportStateOptions {
        return _self
    }

    /// The value to use for ``CameraOptions/padding`` when setting the camera. If `nil`, padding
    /// will not be modified.
    @objc public var padding: NSValue? {
        get {
            guard let padding = _self.padding else {
                return nil
            }
            
            return NSValue(uiEdgeInsets: padding)
        }
        set {
            _self.padding = newValue?.uiEdgeInsetsValue
        }
    }

    /// The value to use for ``CameraOptions/zoom`` when setting the camera. If `nil`, zoom will
    /// not be modified.
    @objc public var zoom: NSNumber? {
        get {
            guard let zoom = _self.zoom else {
                return nil
            }
            
            return NSNumber(value: zoom)
        }
        set {
            _self.zoom = newValue?.CGFloat
        }
    }

    /// Indicates how to obtain the value to use for ``CameraOptions/bearing`` when setting the
    /// camera. If `nil`, bearing will not be modified.
    @objc public var bearing: TMBFollowPuckViewportStateBearing? {
        get {
            guard let bearing = _self.bearing else {
                return nil
            }
            
            return bearing.objcValue()
        }
        set {
            _self.bearing = newValue?.swiftValue()
        }
    }

    /// The value to use for ``CameraOptions/pitch`` when setting the camera. If `nil`, pitch will
    /// not be modified.
    @objc public var pitch: NSNumber? {
        get {
            guard let pitch = _self.pitch else {
                return nil
            }
            
            return NSNumber(value: pitch)
        }
        set {
            _self.pitch = newValue?.CGFloat
        }
    }

    /// Memberwise initializer for `FollowPuckViewportStateOptions`.
    ///
    /// All parameters have default values.
    ///
    /// - Parameters:
    ///   - padding: Defaults to `UIEdgeInsets.zero`.
    ///   - zoom: Defaults to 16.35.
    ///   - bearing: Defaults to ``FollowPuckViewportStateBearing/heading``.
    ///   - pitch: Defaults to 45.
    @objc public init(
        padding: NSValue?,
        zoom: NSNumber? = 16.35,
        bearing: TMBFollowPuckViewportStateBearing? = nil,
        pitch: NSNumber? = 45) {
        _self = FollowPuckViewportStateOptions(
            padding: padding?.uiEdgeInsetsValue,
            zoom: zoom?.CGFloat,
            bearing: bearing?.swiftValue(),
            pitch: pitch?.CGFloat
        )
    }
}
/// Expresses the different ways that ``FollowPuckViewportState`` can obtain values to use when
/// setting ``CameraOptions/bearing``.
///
/// - SeeAlso: ``LocationOptions/puckBearingSource``
@objc open class TMBFollowPuckViewportStateBearing: NSObject {
    private var _bearing: CLLocationDirection?
    init(_ bearing: CLLocationDirection? = nil) {
        self._bearing = bearing
    }
    @objc public var bearing: NSNumber? {
        return _bearing?.NSNumber
    }
    
    /// ``FollowPuckViewportState`` sets ``CameraOptions/bearing`` to a constant value.
    ///
    /// - Parameter bearing: the constant value that should be used to set the camera bearing.
    @objc public static func constant(_ bearing: CLLocationDirection) -> TMBFollowPuckViewportStateBearing {
        return TMBFollowPuckViewportStateBearing(bearing)
    }

    /// ``FollowPuckViewportState`` sets ``CameraOptions/bearing`` based on the current
    /// heading.
    ///
    /// - SeeAlso:
    ///   - ``LocationManager``
    ///   - ``Location/heading``
    @objc public static let heading = TMBFollowPuckViewportStateBearing()

    /// ``FollowPuckViewportState`` sets ``CameraOptions/bearing`` based on the current
    /// course.
    ///
    /// - SeeAlso:
    ///   - ``LocationManager``
    ///   - ``Location/course``
    @objc public static let course = TMBFollowPuckViewportStateBearing()
}

extension TMBFollowPuckViewportStateBearing {
    func swiftValue() -> FollowPuckViewportStateBearing {
        if let bearing = self.bearing {
            return .constant(bearing.doubleValue)
        }
        
        if self == TMBFollowPuckViewportStateBearing.heading {
            return .heading
        }
        
        return .course
    }
}
extension FollowPuckViewportStateBearing {
    func objcValue() -> TMBFollowPuckViewportStateBearing {
        switch(self) {
        case .constant(let bearing):
            return TMBFollowPuckViewportStateBearing.constant(bearing)
        case .heading:
            return TMBFollowPuckViewportStateBearing.heading
        case .course:
            return TMBFollowPuckViewportStateBearing.course
        }
    }
}

/// A ``ViewportState`` implementation that tracks the location puck (to show a puck, use
/// ``LocationOptions/puckType``)
///
/// Use ``Viewport/makeFollowPuckViewportState(options:)`` to create instances of this
/// class.
@objc open class TMBFollowPuckViewportState : NSObject {
    private var _self: FollowPuckViewportState
    init(_ _self: FollowPuckViewportState) {
        self._self = _self
    }
    
    /// Configuration options for this state.
    @objc public var options: TMBFollowPuckViewportStateOptions {
        get {
            TMBFollowPuckViewportStateOptions(_self.options)
        }
        set {
            _self.options = newValue.rawValue
        }
    }
}

extension TMBFollowPuckViewportState: TMBViewportState {
    @objc public func observeDataSource(with handler: @escaping (MapboxCoreMaps.CameraOptions) -> Bool) -> TMBCancelable {
        let cancellable = _self.observeDataSource(with: { cameraOptions in
            handler(MapboxCoreMaps.CameraOptions(cameraOptions))
        })
        
        return TMBCancelable(cancelable: cancellable)
    }
    
    @objc public func startUpdatingCamera() {
        _self.startUpdatingCamera()
    }
    
    @objc public func stopUpdatingCamera() {
        _self.stopUpdatingCamera()
    }
}

/// Configuration options for ``OverviewViewportState``.
@objc open class TMBOverviewViewportStateOptions: NSObject {
    private var _self: OverviewViewportStateOptions
    init(_ _self: OverviewViewportStateOptions) {
        self._self = _self
    }
    public var rawValue: OverviewViewportStateOptions {
        return _self
    }

    /// The geometry that the ``OverviewViewportState`` should use when calculating its camera.
    @objc public var geometry: MapboxCommon.Geometry {
        get {
            return MapboxCommon.Geometry(_self.geometry)
        }
        set {
            guard let geometry = Geometry(newValue) else {
                return
            }
            _self.geometry = geometry
        }
    }

    /// The padding that ``OverviewViewportState`` should use when calculating its camera.
    @objc public var padding: UIEdgeInsets {
        get {
            return _self.padding
        }
        set {
            _self.padding = newValue
        }
    }

    /// The bearing that ``OverviewViewportState`` should use when calcualting its camera.
    @objc public var bearing: NSNumber? {
        get {
            guard let bearing = _self.bearing else {
                return nil
            }
            return NSNumber(value: bearing)
        }
        set {
            _self.bearing = newValue?.doubleValue
        }
    }

    /// The pitch that ``OverviewViewportState`` should use when calculating its camera.
    @objc public var pitch: NSNumber? {
        get {
            guard let pitch = _self.pitch else {
                return nil
            }
            return NSNumber(value: pitch)
        }
        set {
            _self.pitch = newValue?.CGFloat
        }
    }

    /// The length of the animation performed by ``OverviewViewportState`` when it starts updating
    /// the camera and any time ``OverviewViewportState/options`` is set. See
    /// ``OverviewViewportState/options`` for details.
    @objc public var animationDuration: TimeInterval{
        get {
            return _self.animationDuration
        }
        set {
            _self.animationDuration = newValue
        }
    }

    /// Memberwise initializer for `OverviewViewportStateOptions`.
    ///
    /// `geometry` is required, but all other parameters have default values.
    ///
    /// - Parameters:
    ///   - geometry: the geometry for which an overview should be shown.
    ///   - padding: Defaults to `UIEdgeInsets.zero`.
    ///   - bearing: Defaults to 0.
    ///   - pitch: Defaults to 0.
    ///   - animationDuration: Defaults to 1.
    @objc public init(
        geometry: MapboxCommon.Geometry,
        padding: UIEdgeInsets = .zero,
        bearing: NSNumber? = 0,
        pitch: NSNumber? = 0,
        animationDuration: TimeInterval = 1) {
        _self = OverviewViewportStateOptions(
            geometry: Geometry(geometry)!,
            padding: padding,
            bearing: bearing?.doubleValue,
            pitch: pitch?.CGFloat,
            animationDuration: animationDuration)
    }
}

/// A ``ViewportState`` implementation that shows an overview of the geometry specified by its
/// ``OverviewViewportStateOptions/geometry``.
///
/// Use ``Viewport/makeOverviewViewportState(options:)`` to create instances of this
/// class.
@objc open class TMBOverviewViewportState: NSObject {
    private var _self: OverviewViewportState
    init(_ _self: OverviewViewportState){
        self._self = _self
    }
    public var rawValue: OverviewViewportState {
        return _self
    }

    /// Configuration options.
    ///
    /// When set, the viewport reframes the geometry using the new options and updates its camera with
    /// an ``CameraAnimationsManager/ease(to:duration:curve:completion:)``
    /// animation with a linear timing curve and duration specified by the new value's
    /// ``OverviewViewportStateOptions/animationDuration``.
    @objc public var options: TMBOverviewViewportStateOptions {
        get {
            return TMBOverviewViewportStateOptions(_self.options)
        }
        set {
            _self.options = newValue.rawValue
        }
    }
}

extension TMBOverviewViewportState: TMBViewportState {
    @objc public func observeDataSource(with handler: @escaping (MapboxCoreMaps.CameraOptions) -> Bool) -> TMBCancelable {
        let cancelable = _self.observeDataSource(with: { cameraOptions in
            handler(MapboxCoreMaps.CameraOptions(cameraOptions))
        })
        return TMBCancelable(cancelable: cancelable)
    }
    
    @objc public func startUpdatingCamera() {
        _self.startUpdatingCamera()
    }
    
    @objc public func stopUpdatingCamera() {
        _self.stopUpdatingCamera()
    }
}

/// Configuration options for ``DefaultViewportTransition``.
@objc open class TMBDefaultViewportTransitionOptions: NSObject {
    private var _self: DefaultViewportTransitionOptions
    init(_ _self: DefaultViewportTransitionOptions) {
        self._self = _self
    }
    public var rawValue: DefaultViewportTransitionOptions {
        return _self
    }
    
    /// The maximum duration of the transition.
    @objc public var maxDuration: TimeInterval {
        get {
            _self.maxDuration
        }
        set {
            _self.maxDuration = newValue
        }
    }

    /// Memberwise initializer for `DefaultViewportTransitionOptions`.
    /// - Parameter maxDuration: Defaults to 3.5.
    @objc public init(maxDuration: TimeInterval = 3.5) {
        self._self = DefaultViewportTransitionOptions(maxDuration: maxDuration)
    }
}
/// A default ``ViewportTransition`` implementation.
///
/// Use ``Viewport/makeDefaultViewportTransition(options:)`` to create instances of this
/// class.
@objc open class TMBDefaultViewportTransition: NSObject {
    private var _self: DefaultViewportTransition
    init(_ _self: DefaultViewportTransition) {
        self._self = _self
    }
    public var rawValue: DefaultViewportTransition {
        return _self
    }

    /// Configuration options.
    ///
    /// New values will take effect the next time ``ViewportTransition/run(to:completion:)``
    /// is invoked
    @objc public var options: TMBDefaultViewportTransitionOptions {
        get {
            return TMBDefaultViewportTransitionOptions(_self.options)
        }
        set {
            _self.options = newValue.rawValue
        }
    }
}

@objc
extension TMBDefaultViewportTransition: TMBViewportTransition {
    @objc public func run(to toState: TMBViewportState, completion: @escaping (Bool) -> Void) -> TMBCancelable {
        let cancelable = _self.run(to: TMBViewportStateAdapter(toState), completion: completion)
        return TMBCancelable(cancelable: cancelable)
    }
    
}

/// A ``ViewportTransition`` implementation that transitions immediately without any animation.
///
/// Use ``Viewport/makeImmediateViewportTransition()`` to create instances of this class.
@objc open class TMBImmediateViewportTransition: NSObject, TMBViewportTransition {
    @objc public func run(to toState: TMBViewportState, completion: @escaping (Bool) -> Void) -> TMBCancelable {
        let cancelable = _self.run(to: TMBViewportStateAdapter(toState), completion: completion)
        return TMBCancelable(cancelable: cancelable)
    }
    
    private let _self: ImmediateViewportTransition

    init(_ _self: ImmediateViewportTransition) {
        self._self = _self
    }
}
