import Foundation
import MapboxMaps
import CoreLocation

/// The ``AppleLocationProviderDelegate`` protocol defines a set of optional methods that you
/// can use to receive events from an associated location provider object.
@objc
public protocol TMBAppleLocationProviderDelegate: AnyObject {

    /// Tells the delegate that an attempt to locate the user’s position failed.
    /// - Parameters:
    ///   - locationProvider: The location provider that is tracking the user’s location.
    ///   - error: An error object containing the reason why location tracking failed.
    func appleLocationProvider(_ locationProvider: TMBAppleLocationProvider, didFailWithError error: Error)

    /// Tells the delegate that the accuracy authorization has changed.
    /// - Parameters:
    ///   - locationProvider: The location provider that is tracking the user’s location.
    ///   - accuracyAuthorization: The updated accuracy authorization value.
    func appleLocationProvider(_ locationProvider: TMBAppleLocationProvider,
                               didChangeAccuracyAuthorization accuracyAuthorization: CLAccuracyAuthorization)

    /// Asks the delegate whether the heading calibration alert should be displayed.
    /// - Parameter locationProvider: The location provider object coordinating the display of the heading calibration alert.
    /// - Returns: `true` if you want to allow the heading calibration alert to be displayed; `false` if you do not.
    func appleLocationProviderShouldDisplayHeadingCalibration(_ locationProvider: TMBAppleLocationProvider) -> Bool
}

@objc
open class TMBAppleLocationProvider: NSObject {
    /// Location manager options.
    @objc
    public var options: TMBAppleLocationProviderOptions {
        set {
            self.origin.options = newValue.unwrap()
        }
        get {
            self.origin.options.wrap()
        }
    }

    /// A delegate of location provider.
    @objc
    public weak var delegate: TMBAppleLocationProviderDelegate? {
        get {
            if let xdelegate = self.origin.delegate {
                return AppleLocationProviderDelegateWrapper(delegate: xdelegate)
            }
            return nil
        }
        set {
            if let xdelegate = newValue {
                // TODO: Instance will be immediately deallocated because property 'delegate' is 'weak'
                self.origin.delegate = TMBAppleLocationProviderDelegateWrapper(delegate: xdelegate)
            } else {
                self.origin.delegate = nil
            }
        }
    }

    /// A stream of location updates.
    ///
    /// An observer will receive a cached value (if any) upon subscription.
    ///
    /// - Note: When the first observer is added, the underlying `CLLocationManager` instance will
    /// ask for permissions (if needed) and start to produce the location updates. When the last observer is gone it will stop.
    @objc
    public func onLocationUpdate(handler: @escaping ([Location]) -> Void) -> TMBCancelable{
        origin.onLocationUpdate.observeNext(handler).wrap()
    }

    /// A stream of heading (compass) updates.
    ///
    /// An observer will receive a cached value (if any) upon subscription.
    ///
    /// - Note: When the first observer is added, the underlying `CLLocationManager` instance will
    /// start to produce the heading updates. When the last observer is gone, it will stop.
    @objc
    public func onHeadingUpdate(handler: @escaping (TMBHeading) -> Void) -> TMBCancelable {
        origin.onHeadingUpdate.observeNext { heading in
            handler(heading.wrap())
        }.wrap()
    }
    
    public var origin: AppleLocationProvider!;
    
    @objc
    public override init() {
        origin = AppleLocationProvider();
    }
    
    public init(origin: AppleLocationProvider) {
        self.origin = origin;
    }
}

extension TMBAppleLocationProvider {
    public func unwrap() -> AppleLocationProvider {
        self.origin
    }
}
extension AppleLocationProvider {
    public func wrap() -> TMBAppleLocationProvider {
        TMBAppleLocationProvider(origin: self)
    }
}

@objc
open class TMBAppleLocationProviderOptions: NSObject {
    /// Specifies the minimum distance (measured in meters) a device must move horizontally
    /// before a location update is generated.
    ///
    /// The default value of this property is `kCLDistanceFilterNone`.
    @objc
    public var distanceFilter: CLLocationDistance

    /// Specifies the accuracy of the location data.
    ///
    /// The default value is `kCLLocationAccuracyBest`.
    @objc
    public var desiredAccuracy: CLLocationAccuracy

    /// Sets the type of user activity associated with the location updates.
    ///
    /// The default value is `CLActivityType.other`.
    @objc
    public var activityType: CLActivityType

    /// Initializes provider options.
    /// - Parameters:
    ///   - distanceFilter: Specifies the minimum distance (measured in meters) a device must move horizontally
    /// before a location update is generated.
    ///   - desiredAccuracy: Specifies the accuracy of the location data.
    ///   - activityType: Sets the type of user activity associated with the location.
    @objc
    public init(
        distanceFilter: CLLocationDistance = kCLDistanceFilterNone,
        desiredAccuracy: CLLocationAccuracy = kCLLocationAccuracyBest,
        activityType: CLActivityType = .other
    ) {
        self.distanceFilter = distanceFilter
        self.desiredAccuracy = desiredAccuracy
        self.activityType = activityType
    }
}
extension TMBAppleLocationProviderOptions {
    func unwrap() -> AppleLocationProvider.Options {
        AppleLocationProvider.Options(
            distanceFilter: self.distanceFilter,
            desiredAccuracy: self.desiredAccuracy,
            activityType: self.activityType)
    }
}
extension AppleLocationProvider.Options {
    func wrap() -> TMBAppleLocationProviderOptions {
        TMBAppleLocationProviderOptions(
            distanceFilter: self.distanceFilter,
            desiredAccuracy: self.desiredAccuracy,
            activityType: self.activityType)
    }
}

class TMBAppleLocationProviderDelegateWrapper : AppleLocationProviderDelegate {
    let delegate: TMBAppleLocationProviderDelegate
    init(delegate: TMBAppleLocationProviderDelegate) {
        self.delegate = delegate
    }
    
    func appleLocationProvider(_ locationProvider: MapboxMaps.AppleLocationProvider, didFailWithError error: Error) {
        delegate.appleLocationProvider(locationProvider.wrap(), didFailWithError: error)
    }
    
    func appleLocationProvider(_ locationProvider: MapboxMaps.AppleLocationProvider, didChangeAccuracyAuthorization accuracyAuthorization: CLAccuracyAuthorization) {
        delegate.appleLocationProvider(locationProvider.wrap(), didChangeAccuracyAuthorization: accuracyAuthorization)
    }
    
    func appleLocationProviderShouldDisplayHeadingCalibration(_ locationProvider: MapboxMaps.AppleLocationProvider) -> Bool {
        delegate.appleLocationProviderShouldDisplayHeadingCalibration(locationProvider.wrap())
    }
}

class AppleLocationProviderDelegateWrapper : TMBAppleLocationProviderDelegate {
    let delegate: AppleLocationProviderDelegate
    init(delegate: AppleLocationProviderDelegate) {
        self.delegate = delegate
    }
    
    func appleLocationProvider(_ locationProvider: TMBAppleLocationProvider, didFailWithError error: Error) {
        delegate.appleLocationProvider(locationProvider.unwrap(), didFailWithError: error)
    }
    
    func appleLocationProvider(_ locationProvider: TMBAppleLocationProvider, didChangeAccuracyAuthorization accuracyAuthorization: CLAccuracyAuthorization) {
        delegate.appleLocationProvider(locationProvider.unwrap(), didChangeAccuracyAuthorization: accuracyAuthorization)
    }
    
    func appleLocationProviderShouldDisplayHeadingCalibration(_ locationProvider: TMBAppleLocationProvider) -> Bool {
        delegate.appleLocationProviderShouldDisplayHeadingCalibration(locationProvider.unwrap())
    }
}
