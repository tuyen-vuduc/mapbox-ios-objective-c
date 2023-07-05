import MapboxMaps

@objc
extension MapView {
    @objc func location() -> TMBLocationManager {
        return TMBLocationManager(self.location)
    }
}

/// The `LocationPermissionsDelegate` protocol defines a set of optional methods that you
/// can use to receive events from an associated location manager object.
@objc public protocol TMBLocationPermissionsDelegate {
    /// Tells the delegate that an attempt to locate the user’s position failed.
    /// - Parameters:
    ///   - locationManager: The location manager that is tracking the user’s location.
    ///   - error: An error object containing the reason why location tracking failed.
    @objc optional func locationManager(_ locationManager: TMBLocationManager, didFailToLocateUserWithError error: Error)

    /// Tells the delegate that the accuracy authorization has changed.
    /// - Parameters:
    ///   - locationManager: The location manager that is tracking the user’s location.
    ///   - accuracyAuthorization: The updated accuracy authorization value.
    @objc optional func locationManager(_ locationManager: TMBLocationManager,
                                        didChangeAccuracyAuthorization accuracyAuthorization: CLAccuracyAuthorization)

    /// Asks the delegate whether the heading calibration alert should be displayed.
    /// - Parameter locationManager: The location manager object coordinating the display of the heading calibration alert.
    /// - Returns: `true` if you want to allow the heading calibration alert to be displayed; `false` if you do not.
    @objc optional func locationManagerShouldDisplayHeadingCalibration(_ locationManager: TMBLocationManager) -> Bool
}

/// An object responsible for notifying the map view about location-related events,
/// such as a change in the device’s location.
@objc open class TMBLocationManager: NSObject {
    private var _self: LocationManager
    init(_ _self: LocationManager) {
        self._self = _self
    }
    
    /// Represents the latest location received from the location provider.
    @objc public var latestLocation: Location? {
        return _self.latestLocation
    }
    
    /// The object that acts as the delegate of the location manager.
    @objc public weak var delegate: TMBLocationPermissionsDelegate? {
        didSet {
            if delegate == nil {
                _self.delegate = nil
            } else {
                _self.delegate = self
            }
        }
    }

    /// The current underlying location provider. Use `overrideLocationProvider(with:)` to substitute a different provider.
    /// Avoid manipulating the location provider directly. LocationManager assumes full responsibility for starting and stopping location
    /// and heading updates as needed.
    @objc public var locationProvider: TMBLocationProvider! {
        return TMBLocationProviderAdapter(_self.locationProvider)
    }

    /// The set of objects that are currently consuming location updates.
    /// The returned object is a copy of the underlying one, so mutating it will have no effect.
    @objc public var consumers: NSHashTable<LocationConsumer> {
        return _self.consumers
    }

    /// Configuration options for the location manager.
    @objc public var options: TMBLocationOptions {
        get {
            TMBLocationOptions(_self.options)
        }
        set {
            _self.options = newValue.rawValue
        }
    }

    @objc public func overrideLocationProvider(with customLocationProvider: TMBLocationProvider) {
        _self.overrideLocationProvider(with: LocationProviderAdapter(customLocationProvider))
    }

    /// The location manager holds weak references to consumers, client code should retain these references.
    @objc public func addLocationConsumer(_ consumer: LocationConsumer) {
        _self.addLocationConsumer(newConsumer: consumer)
    }

    /// Removes a location consumer from the location manager.
    @objc public func removeLocationConsumer(_ consumer: LocationConsumer) {
        _self.removeLocationConsumer(consumer: consumer)
    }

    /// Adds ``PuckLocationConsumer`` to the location manager.
    ///
    /// An instance of ``PuckLocationConsumer`` will get the accurate (interpolated) location of the puck as it moves,
    /// as opposed to the ``LocationConsumer`` that gets updated only when the ``LocationProvider`` has emitted a new location.
    /// - Important: The location manager holds a weak reference to the consumer, thus client should retain these references.
    @objc public func addPuckLocationConsumer(_ consumer: PuckLocationConsumer) {
        _self.addPuckLocationConsumer(consumer)
    }

    /// Removes a ``PuckLocationConsumer`` from the location manager.
    @objc public func removePuckLocationConsumer(_ consumer: PuckLocationConsumer) {
        _self.removePuckLocationConsumer(consumer)
    }

    /// Allows a custom case to request full accuracy
    @available(iOS 14.0, *)
    @objc public func requestTemporaryFullAccuracyPermissions(withPurposeKey purposeKey: String) {
        _self.requestTemporaryFullAccuracyPermissions(withPurposeKey: purposeKey)
    }
}

extension TMBLocationManager : LocationPermissionsDelegate {
    public func locationManagerShouldDisplayHeadingCalibration(_ locationManager: LocationManager) -> Bool {
        return delegate?.locationManagerShouldDisplayHeadingCalibration?(TMBLocationManager(locationManager)) ?? false
    }
    
    public func locationManager(_ locationManager: LocationManager, didChangeAccuracyAuthorization accuracyAuthorization: CLAccuracyAuthorization) {
        delegate?.locationManager?(TMBLocationManager(locationManager), didChangeAccuracyAuthorization: accuracyAuthorization)
    }
    
    public func locationManager(_ locationManager: LocationManager, didFailToLocateUserWithError error: Error) {
        delegate?.locationManager?(TMBLocationManager(locationManager), didFailToLocateUserWithError: error)
    }
}

class TMBLocationProviderAdapter : TMBLocationProvider {
    var locationProviderOptions: TMBLocationOptions {
        get {
            return TMBLocationOptions(_self.locationProviderOptions)
        }
        
        set {
            _self.locationProviderOptions = newValue.rawValue
        }
    }
    
    var authorizationStatus: CLAuthorizationStatus {
        get {
            return _self.authorizationStatus
        }
    }
    
    var accuracyAuthorization: CLAccuracyAuthorization {
        get {
            return _self.accuracyAuthorization
        }
    }
    
    var heading: CLHeading? {
        get {
            return _self.heading
        }
    }
    
    func setDelegate(_ delegate: TMBLocationProviderDelegate) {
        _self.setDelegate(LocationProviderDelegateAdapter(delegate))
    }
    
    func requestAlwaysAuthorization() {
        _self.requestAlwaysAuthorization()
    }
    
    func requestWhenInUseAuthorization() {
        _self.requestWhenInUseAuthorization()
    }
    
    func requestTemporaryFullAccuracyAuthorization(withPurposeKey purposeKey: String) {
        _self.requestTemporaryFullAccuracyAuthorization(withPurposeKey: purposeKey)
    }
    
    func startUpdatingLocation() {
        _self.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        _self.stopUpdatingLocation()
    }
    
    var headingOrientation: CLDeviceOrientation {
        get {
            return _self.headingOrientation
        }
        
        set {
            _self.headingOrientation = newValue
        }
    }
    
    func startUpdatingHeading() {
        _self.startUpdatingHeading()
    }
    
    func stopUpdatingHeading() {
        _self.stopUpdatingHeading()
    }
    
    func dismissHeadingCalibrationDisplay() {
        _self.dismissHeadingCalibrationDisplay()
    }
    
    private var _self: LocationProvider
    init(_ _self: LocationProvider) {
        self._self = _self
    }
    
    class LocationProviderDelegateAdapter : LocationProviderDelegate {
        private let _self: TMBLocationProviderDelegate
        init(_ _self: TMBLocationProviderDelegate) {
            self._self = _self
        }
        
        func locationProvider(_ provider: MapboxMaps.LocationProvider, didUpdateLocations locations: [CLLocation]) {
            _self.locationProvider(TMBLocationProviderAdapter(provider), didUpdateLocations: locations)
        }
        
        func locationProvider(_ provider: MapboxMaps.LocationProvider, didUpdateHeading newHeading: CLHeading) {
            _self.locationProvider(TMBLocationProviderAdapter(provider), didUpdateHeading: newHeading)
        }
        
        func locationProvider(_ provider: MapboxMaps.LocationProvider, didFailWithError error: Error) {
            _self.locationProvider(TMBLocationProviderAdapter(provider), didFailWithError: error)
        }
        
        func locationProviderDidChangeAuthorization(_ provider: MapboxMaps.LocationProvider) {
            _self.locationProviderDidChangeAuthorization(TMBLocationProviderAdapter(provider))
        }
    }
    
}
class LocationProviderAdapter : LocationProvider {
    var locationProviderOptions: LocationOptions {
        get {
            _self.locationProviderOptions.rawValue
        }
        
        set {
            _self.locationProviderOptions = TMBLocationOptions(newValue)
        }
    }
    
    var authorizationStatus: CLAuthorizationStatus {
        get {
            return _self.authorizationStatus
        }
    }
    
    var accuracyAuthorization: CLAccuracyAuthorization {
        get {
            return _self.accuracyAuthorization
        }
    }
    
    var heading: CLHeading? {
        get {
            return _self.heading
        }
    }
    
    func setDelegate(_ delegate: LocationProviderDelegate) {
        _self.setDelegate(TMBLocationProviderDelegateAdapter(delegate))
    }
    
    func requestAlwaysAuthorization() {
        _self.requestAlwaysAuthorization()
    }
    
    func requestWhenInUseAuthorization() {
        _self.requestWhenInUseAuthorization()
    }
    
    func requestTemporaryFullAccuracyAuthorization(withPurposeKey purposeKey: String) {
        _self.requestTemporaryFullAccuracyAuthorization(withPurposeKey: purposeKey)
    }
    
    func startUpdatingLocation() {
        _self.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        _self.stopUpdatingLocation()
    }
    
    var headingOrientation: CLDeviceOrientation {
        get {
            return _self.headingOrientation
        }
        
        set {
            _self.headingOrientation = newValue
        }
    }
    
    func startUpdatingHeading() {
        _self.startUpdatingHeading()
    }
    
    func stopUpdatingHeading() {
        _self.stopUpdatingHeading()
    }
    
    func dismissHeadingCalibrationDisplay() {
        _self.dismissHeadingCalibrationDisplay()
    }
    
    private var _self: TMBLocationProvider
    init(_ _self: TMBLocationProvider) {
        self._self = _self
    }
    
    class TMBLocationProviderDelegateAdapter : TMBLocationProviderDelegate {
        private let _self: LocationProviderDelegate
        init(_ _self: LocationProviderDelegate) {
            self._self = _self
        }
        
        func locationProvider(_ provider: TMBLocationProvider, didUpdateLocations locations: [CLLocation]) {
            _self.locationProvider(LocationProviderAdapter(provider), didUpdateLocations: locations)
        }
        
        func locationProvider(_ provider: TMBLocationProvider, didUpdateHeading newHeading: CLHeading) {
            _self.locationProvider(LocationProviderAdapter(provider), didUpdateHeading: newHeading)
        }
        
        func locationProvider(_ provider: TMBLocationProvider, didFailWithError error: Error) {
            _self.locationProvider(LocationProviderAdapter(provider), didFailWithError: error)
        }
        
        func locationProviderDidChangeAuthorization(_ provider: TMBLocationProvider) {
            _self.locationProviderDidChangeAuthorization(LocationProviderAdapter(provider))
        }
    }
}

/// The `LocationProvider` protocol defines a set of methods that a class must
/// implement in order to serve as the location events provider.
@objc public protocol TMBLocationProvider {

    /// Configures the location provider.
    var locationProviderOptions: TMBLocationOptions { get set }

    /// Returns the current localization authorization status.
    var authorizationStatus: CLAuthorizationStatus { get }

    /// Returns the current accuracy authorization that the user has granted.
    /// The default value is `CLAccuracyAuthorization.fullAccuracy` on iOS versions prior to iOS 14.
    var accuracyAuthorization: CLAccuracyAuthorization { get }

    /// Returns the latest heading update received, or `nil` if none is available.
    var heading: CLHeading? { get }

    /**
     Sets the delegate for `LocationProvider`. The implementation should hold a weak reference to the
     provided delegate to avoid creating a strong reference cycle with `LocationManager`.

     - Note: This method should only be called by `LocationManager`. To allow other objects to
             participate in location updates, add a `LocationConsumer` to the `LocationManager`
             instead.
     */
    func setDelegate(_ delegate: TMBLocationProviderDelegate)

    /// Requests permission to use the location services whenever the app is running.
    func requestAlwaysAuthorization()

    /// Requests permission to use the location services while the app is in
    /// the foreground.
    func requestWhenInUseAuthorization()

    /// Requests temporary permission for full accuracy
    @available(iOS 14.0, *)
    func requestTemporaryFullAccuracyAuthorization(withPurposeKey purposeKey: String)

    /// Starts the generation of location updates that reports the device's current location.
    func startUpdatingLocation()

    /// Stops the generation of location updates.
    func stopUpdatingLocation()

    /// Specifies a physical device orientation.
    var headingOrientation: CLDeviceOrientation { get set }

    /// Starts the generation of heading updates that reports the devices's current heading.
    func startUpdatingHeading()

    /// Stops the generation of heading updates.
    func stopUpdatingHeading()

    /// Dismisses immediately the heading calibration view from screen.
    func dismissHeadingCalibrationDisplay()
}


/// The `LocationProviderDelegate` protocol defines a set of methods that respond
/// to location updates from an `LocationProvider`.
@objc public protocol TMBLocationProviderDelegate {

    /// Notifies the delegate with the new location data.
    /// - Parameters:
    ///   - provider: The location provider reporting the update.
    ///   - locations: An array of `CLLocation` objects in chronological order,
    ///                with the last object representing the most recent location.
    func locationProvider(_ provider: TMBLocationProvider, didUpdateLocations locations: [CLLocation])

    /// Notifies the delegate with the new heading data.
    /// - Parameters:
    ///   - provider: The location provider reporting the update.
    ///   - newHeading: The new heading update.
    func locationProvider(_ provider: TMBLocationProvider, didUpdateHeading newHeading: CLHeading)

    /// Notifies the delegate that the location provider was unable to retrieve
    /// location updates.
    /// - Parameters:
    ///   - provider: The location provider reporting the error.
    ///   - error: An error object containing the error code that indicates
    ///            why the location provider failed.
    func locationProvider(_ provider: TMBLocationProvider, didFailWithError error: Error)

    /// Notifies the delegate that the location provider changed accuracy authorization
    /// - Parameters:
    ///   - provider: The location provider reporting the error.
    ///   - manager: The location manager that is reporting the change
    func locationProviderDidChangeAuthorization(_ provider: TMBLocationProvider)
}

/// A struct to configure a `LocationManager`
@objc open class TMBLocationOptions: NSObject {
    private var _self: LocationOptions
    
    init(_ _self: LocationOptions) {
        self._self = _self
    }
    
    public var rawValue: LocationOptions {
        return _self
    }
    
    /// Specifies the minimum distance (measured in meters) a device must move horizontally
    /// before a location update is generated.
    ///
    /// The default value of this property is `kCLDistanceFilterNone`.
    @objc public var distanceFilter: CLLocationDistance {
        get {
            return _self.distanceFilter
        }
        set {
            _self.distanceFilter = newValue
        }
    }

    /// Specifies the accuracy of the location data.
    ///
    /// The default value is `kCLLocationAccuracyBest`.
    @objc public var desiredAccuracy: CLLocationAccuracy {
        get {
            return _self.desiredAccuracy
        }
        set {
            _self.desiredAccuracy = newValue
        }
    }

    /// Sets the type of user activity associated with the location updates.
    ///
    /// The default value is `CLActivityType.other`.
    @objc public var activityType: CLActivityType {
        get {
            return _self.activityType
        }
        set {
            _self.activityType = newValue
        }
    }
    
    @objc public var puckType: TMBPuckType {
        get {
            if let puck2DConfiguration = puck2DConfiguration {
                return .puck2D
            }
            
            return .puck3D
        }
    }

    /// Sets the type of puck that should be used
    @objc public var puck2DConfiguration: TMBPuck2DConfiguration? {
        get {
            switch(_self.puckType) {
            case .puck2D(let config):
                return TMBPuck2DConfiguration(config)
            default:
                return nil
            }
        }
        set {
            if (newValue == nil) {
                if (puck3DConfiguration == nil) {
                    _self.puckType = nil
                }
                return
            }
            
            _self.puckType = .puck2D(newValue!.rawValue)
        }
    }
    @objc public var puck3DConfiguration: TMBPuck3DConfiguration? {
        get {
            switch(_self.puckType) {
            case .puck3D(let config):
                return TMBPuck3DConfiguration(config)
            default:
                return nil
            }
        }
        set {
            if (newValue == nil) {
                if (puck2DConfiguration == nil) {
                    _self.puckType = nil
                }
                return
            }
            
            _self.puckType = .puck3D(newValue!.rawValue)
        }
    }

    /// Specifies if a `Puck` should use `Heading` or `Course` for the bearing.
    ///
    /// The default value is `PuckBearingSource.heading`.
    @objc public var puckBearingSource: TMBPuckBearingSource {
        get {
            return _self.puckBearingSource.objcValue()
        }
        set {
            _self.puckBearingSource = newValue.swiftValue()
        }
    }

    /// Whether the puck rotates to track the bearing source.
    ///
    /// The default value is `true`.
    @objc public var puckBearingEnabled: Bool {
        get {
            return _self.puckBearingEnabled
        }
        set {
            _self.puckBearingEnabled = newValue
        }
    }
    
    /// Initializes a `LocationOptions`.
    /// - Parameters:
    ///   - distanceFilter: Specifies the minimum distance (measured in meters) a device must move horizontally
    /// before a location update is generated.
    ///   - desiredAccuracy: Specifies the accuracy of the location data.
    ///   - activityType: Sets the type of user activity associated with the location.
    ///   - puckType: Sets the type of puck that should be used.
    ///   - puckBearingSource: Specifies if a `Puck` should use `Heading` or `Course` for the bearing.
    ///   - puckBearingEnabled: Whether the puck rotates to track the bearing source.
    @objc public init(
        distanceFilter: CLLocationDistance = kCLDistanceFilterNone,
        desiredAccuracy: CLLocationAccuracy = kCLLocationAccuracyBest,
        activityType: CLActivityType = .other,
        puck2DConfiguration: TMBPuck2DConfiguration? = nil,
        puck3DConfiguration: TMBPuck3DConfiguration? = nil,
        puckBearingSource: TMBPuckBearingSource = .heading,
        puckBearingEnabled: Bool = true
    ) {
        self._self = LocationOptions()
        super.init()
        
        self.distanceFilter = distanceFilter
        self.desiredAccuracy = desiredAccuracy
        self.activityType = activityType
        self.puck2DConfiguration = puck2DConfiguration
        self.puck3DConfiguration = puck3DConfiguration
        self.puckBearingSource = puckBearingSource
        self.puckBearingEnabled = puckBearingEnabled
    }
}

/// Controls how the puck is oriented
@objc public enum TMBPuckBearingSource: Int {
    /// The puck should set its bearing using `heading: CLHeading`. Bearing will mimic user's
    /// spatial orientation.
    case heading

    /// The puck should set its bearing using `course: CLLocationDirection`. Bearing will mimic
    /// the general direction of travel.
    case course
}
extension TMBPuckBearingSource {
    func swiftValue() -> PuckBearingSource {
        switch(self) {
        case .heading: return .heading
        case .course: return .course
        }
    }
}
extension PuckBearingSource: ObjcConvertible {
    public func objcValue() -> TMBPuckBearingSource {
        switch(self) {
        case .heading: return .heading
        case .course: return .course
        }
    }
}

/// Represents the different types of pucks
@objc public enum TMBPuckType: Int {
    /// A 2-dimensional puck. Optionally provide `Puck2DConfiguration` to configure the puck's appearance.
    case puck2D

    /// A 3-dimensional puck. Provide a `Puck3DConfiguration` to configure the puck's appearance.
    case puck3D
}

@objc open class TMBPuck2DConfiguration: NSObject {
    /// The opacity of the entire location indicator.
    @objc public var opacity: Double {
        get {
            _self.opacity
        }
        set {
            _self.opacity = newValue
        }
    }

    /// Image to use as the top of the location indicator.
    @objc public var topImage: UIImage? {
        get {
            _self.topImage
        }
        set {
            _self.topImage = newValue
        }
    }

    /// Image to use as the middle of the location indicator.
    @objc public var bearingImage: UIImage? {
        get {
            _self.bearingImage
        }
        set {
            _self.bearingImage = newValue
        }
    }

    /// Image to use as the background of the location indicator.
    @objc public var shadowImage: UIImage? {
        get {
            _self.shadowImage
        }
        set {
            _self.shadowImage = newValue
        }
    }

    /// The size of the images, as a scale factor applied to the size of the specified image.
    @objc public var scale: TMBValue? {
        get {
            if _self.scale == nil {
                return nil
            }

            switch(_self.scale!)
            {
            case .constant(let value):
                return TMBValue.doubleValue(value)
            case .expression(let expression):
                // TODO convert Expression to TMBExpression and vice versa
                // return TMBValue(expression: TMBExpression(expression: expression))
                return nil
            }
        }
        set {
            if newValue == nil {
                _self.scale = nil
            }
            _self.scale = newValue!.double()
        }
    }

    // Location puck pulsing configuration is pulsing on the map.
    @objc public var pulsing: TMBPuck2DConfigurationPulsing? {
        get {
            if _self.pulsing == nil {
                return nil
            }
            
            return TMBPuck2DConfigurationPulsing(_self.pulsing!)
        }
        
        set {
            _self.pulsing = newValue?.rawValue
        }
    }

    /// Flag determining if the horizontal accuracy ring should be shown arround the `Puck`. default value is false
    @objc public var showsAccuracyRing: Bool {
        get {
            _self.showsAccuracyRing
        }
        set {
            _self.showsAccuracyRing = newValue
        }
    }

    /// The color of the accuracy ring.
    @objc public var accuracyRingColor: UIColor {
        get {
            _self.accuracyRingColor
        }
        set {
            _self.accuracyRingColor = newValue
        }
    }

    /// The color of the accuracy ring border.
    @objc public var accuracyRingBorderColor: UIColor {
        get {
            _self.accuracyRingBorderColor
        }
        set {
            _self.accuracyRingBorderColor = newValue
        }
    }
    
    private var _self: Puck2DConfiguration
    
    init(_ _self: Puck2DConfiguration) {
        self._self = _self
    }
    
    public var rawValue: Puck2DConfiguration {
        return _self
    }

    /// Initialize a `Puck2D` object with a top image, bearing image, shadow image, scale, opacity and accuracy ring visibility.
    /// - Parameters:
    ///   - topImage: The image to use as the top layer for the location indicator.
    ///   - bearingImage: The image used as the middle of the location indicator.
    ///   - shadowImage: The image that acts as a background of the location indicator.
    ///   - scale: The size of the images, as a scale factor applied to the size of the specified image..
    ///   - showsAccuracyRing: Indicates whether the location accurary ring should be shown.
    ///   - accuracyRingColor:The color of the accuracy ring.
    ///   - accuracyRingBorderColor: The color of the accuracy ring border.
    ///   - opacity: The opacity of the entire location indicator.
    @objc public init(topImage: UIImage? = nil,
                bearingImage: UIImage? = nil,
                shadowImage: UIImage? = nil,
                scale: TMBValue? = nil,
                showsAccuracyRing: Bool = false,
                accuracyRingColor: UIColor = UIColor(red: 0.537, green: 0.812, blue: 0.941, alpha: 0.3),
                accuracyRingBorderColor: UIColor = UIColor(red: 0.537, green: 0.812, blue: 0.941, alpha: 0.3),
                opacity: Double = 1) {
        self._self = Puck2DConfiguration()
        super.init()
        self.topImage = topImage
        self.bearingImage = bearingImage
        self.shadowImage = shadowImage
        self.scale = scale
        self.showsAccuracyRing = showsAccuracyRing
        self.accuracyRingColor = accuracyRingColor
        self.accuracyRingBorderColor = accuracyRingBorderColor
        self.opacity = opacity
    }
    
    /// Initialize a `Puck2D` object with a top image, bearing image, shadow image, scale, opacity and accuracy ring visibility.
    /// - Parameters:
    ///   - topImage: The image to use as the top layer for the location indicator.
    ///   - bearingImage: The image used as the middle of the location indicator.
    ///   - shadowImage: The image that acts as a background of the location indicator.
    ///   - scale: The size of the images, as a scale factor applied to the size of the specified image.
    ///   - showsAccuracyRing: Indicates whether the location accurary ring should be shown.
    ///   - opacity: The opacity of the entire location indicator.
    @objc public init(topImage: UIImage? = nil,
                bearingImage: UIImage? = nil,
                shadowImage: UIImage? = nil,
                scale: TMBValue? = nil,
                pulsing: TMBPuck2DConfigurationPulsing? = nil,
                showsAccuracyRing: Bool = false,
                opacity: Double = 1) {
        self._self = Puck2DConfiguration()
        super.init()
        self.topImage = topImage
        self.bearingImage = bearingImage
        self.shadowImage = shadowImage
        self.scale = scale
        self.pulsing = pulsing
        self.showsAccuracyRing = showsAccuracyRing
        self.opacity = opacity
        self.accuracyRingColor = UIColor(red: 0.537, green: 0.812, blue: 0.941, alpha: 0.3)
        self.accuracyRingBorderColor = UIColor(red: 0.537, green: 0.812, blue: 0.941, alpha: 0.3)
    }
    
    /// Create a Puck2DConfiguration instance with or without an arrow bearing image. Default without the arrow bearing image.
    @objc public static func makeDefault(showBearing: Bool = false) -> TMBPuck2DConfiguration {
        return TMBPuck2DConfiguration(Puck2DConfiguration.makeDefault(showBearing: showBearing))
    }
}

// swiftlint:disable nesting
/// Circle radius configuration for the pulsing circle animation.
@objc public enum TMBPuck2DConfigurationPulsingRadius: Int {
    /// Pulsing circle should animate with the constant radius.
    case constant
    /// Pulsing circle animates with the `horizontalAccuracy` form the latest puck location.
    case accuracy
}
/// The configration parameters for sonar-like pulsing circle animation shown around the 2D puck.
@objc open class TMBPuck2DConfigurationPulsing: NSObject {
    public static var `default`: TMBPuck2DConfigurationPulsing {
        return TMBPuck2DConfigurationPulsing(Puck2DConfiguration.Pulsing.default)
    }

    // swiftlint:enable nesting

    /// Flag determining whether the pulsing circle animation. `true` by default.
    @objc public var isEnabled: Bool {
        get {
            _self.isEnabled
        }
        set {
            _self.isEnabled = newValue
        }
    }

    /// The color of the pulsing circle.
    @objc public var color: UIColor {
        get {
            _self.color
        }
        set {
            _self.color = newValue
        }
    }

    /// The radius of the pulsing circle.
    @objc public var radius: TMBPuck2DConfigurationPulsingRadius {
        get {
            switch(_self.radius) {
            case .constant(_):
                return .constant
            case .accuracy:
                return .accuracy
            }
        }
        
        set {
            switch(newValue) {
            case .accuracy:
                _self.radius = .accuracy
            default:
                return
            }
        }
    }
    @objc public var radiusValue: Double {
        get {
            switch(_self.radius) {
            case .constant(let value):
                return value
            case .accuracy:
                return Double.infinity
            }
        }
        
        set {
            _self.radius = .constant(newValue)
            self.radius = .constant
        }
    }

    private var _self: Puck2DConfiguration.Pulsing
    init(_ _self: Puck2DConfiguration.Pulsing) {
        self._self = _self
    }
    
    public var rawValue: Puck2DConfiguration.Pulsing {
        return _self
    }
}

@objc open class TMBPuck3DConfiguration: NSObject {
    private var _self: Puck3DConfiguration
    init(_ _self: Puck3DConfiguration) {
        self._self = _self
    }
    
    public var rawValue: Puck3DConfiguration {
        return _self
    }
    
    /// The model to use as the locaiton puck
    @objc public var model: TMBModel {
        get {
            TMBModel(_self.model)
        }
        set {
            _self.model = newValue.rawValue
        }
    }

    /// The scale of the model.
    @objc public var modelScale: TMBValue? {
        get {
            if _self.modelScale == nil {
                return nil
            }

            switch(_self.modelScale!)
            {
            case .constant(let value):
                return TMBValue.constant(value as NSObject)
            case .expression(let expression):
                // TODO convert Expression to TMBExpression and vice versa
                // return TMBValue(expression: TMBExpression(expression: expression))
                return nil
            }
        }
        set {
            _self.modelScale = newValue?.arrayOfDouble()
        }
    }

    /// The rotation of the model in euler angles [lon, lat, z].
    @objc public var modelRotation: TMBValue? {
        get {
            if _self.modelRotation == nil {
                return nil
            }

            switch(_self.modelRotation!)
            {
            case .constant(let value):
                return TMBValue.constant(value as NSObject)
            case .expression(let expression):
                // TODO convert Expression to TMBExpression and vice versa
                // return TMBValue(expression: TMBExpression(expression: expression))
                return nil
            }
        }
        set {
            _self.modelRotation = newValue?.arrayOfDouble()
        }
    }

    /// The opacity of the model used as the location puck
    @objc public var modelOpacity: TMBValue? {
        get {
            if _self.modelOpacity == nil {
                return nil
            }

            switch(_self.modelOpacity!)
            {
            case .constant(let value):
                return TMBValue.doubleValue(value)
            case .expression(let expression):
                // TODO convert Expression to TMBExpression and vice versa
                // return TMBValue(expression: TMBExpression(expression: expression))
                return nil
            }
        }
        set {
            _self.modelOpacity = newValue?.double()
        }
    }
    
    /// Initialize a `Puck3DConfiguration` with a model, scale and rotation.
    /// - Parameters:
    ///   - model: The `gltf` model to use for the puck.
    ///   - modelScale: The amount to scale the model by.
    ///   - modelRotation: The rotation of the model in euler angles `[lon, lat, z]`.
    ///   - modelOpacity: The opacity of the model used as the location puck
    @objc public init(model: TMBModel, modelScale: TMBValue? = nil, modelRotation: TMBValue? = nil, modelOpacity: TMBValue? = nil) {
        self._self = Puck3DConfiguration(
            model: model.rawValue,
            modelScale: modelScale?.arrayOfDouble(),
            modelRotation: modelRotation?.arrayOfDouble(),
            modelOpacity: modelOpacity?.double())
    }
}

/// A structure represeting a Model
@objc open class TMBModel: NSObject {
    private var _self: Model
    
    init(_ _self: Model) {
        self._self = _self
    }
    
    public var rawValue: Model {
        return _self
    }

    /// URL to a `gltf` 3D asset in the application bundle
    @objc public var uri: URL? {
        get {
            _self.uri
        }
        set {
            _self.uri = newValue
        }
    }

    /// Coordinates of the model in `[longitude, latitude]`format
    @objc public var position: [Double]? {
        get {
            _self.position
        }
        set {
            _self.position = newValue
        }
    }

    /// Orientation of the model
    @objc public var orientation: [Double]? {
        get {
            _self.orientation
        }
        set {
            _self.orientation = newValue
        }
    }

    @objc public init(uri: URL? = nil, position: [Double]? = nil, orientation: [Double]? = nil) {
        self._self = Model(uri: uri, position: position, orientation: orientation)
    }
}
