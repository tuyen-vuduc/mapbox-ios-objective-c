import CoreLocation
import MapboxMaps

import UIKit
import MapboxMaps

import MapboxCommon
import MapboxMaps


/// An object responsible for managing user location Puck.
@objc open class TMBLocationManager: NSObject {
    /// A stream of location change events that drive the puck.
    @objc public func onLocationChange(handler: @escaping ([Location]) -> Void) -> TMBCancelable  {
        origin.onLocationChange.observeNext(handler).wrap()
    }

    /// A stream of heading update events that drive the puck.
    ///
    /// Heading is used when puck uses ``PuckBearing/heading`` as a bearing type.
    @objc public func onHeadingChange(handler: @escaping (TMBHeading) -> Void) -> TMBCancelable {
        origin.onHeadingChange.observeNext { heading in
            handler(heading.wrap())
        }.wrap()
    }

    /// A stream of puck render events.
    ///
    /// A subscriber will get the accurate (interpolated) data used to render puck,
    /// as opposed to the ``onLocationChange`` and ``onHeadingChange`` that emit non-interpolated source data.
    ///
    /// Observe this stream to adjust any elements that connected the actual puck position, such as route line, annotations, camera position,
    /// or you can render a custom puck.
    @objc public func onPuckRender(handler: @escaping (TMBPuckRenderingData) -> Void) -> TMBCancelable {
        origin.onPuckRender.observeNext({ data in
            handler(data.wrap())
        }).wrap()
    }

    /// Sets the custom providers that supply puck with the location data.
    ///
    /// - Parameters:
    ///   - locationProvider: Signal that drives puck location.
    ///   - headingProvider: Signal that drives the puck's bearing when it's configured as ``PuckBearing/heading``.
    @objc public func override(
        locationHandler : @escaping ([Location])->Void,
        headingHandler : ((TMBHeading) -> Void)?) {
        let locationProvider = Signal<[Location]>(observeImpl: { handler in
            return AnyCancelable {}
        })
        let headingProvider = Signal<Heading>(observeImpl: { handler in
          return AnyCancelable {}
        })
        
        _ = locationProvider.observeNext { locations in
            locationHandler(locations)
        }
        _ = headingProvider.observeNext { heading in
            headingHandler?(heading.wrap())
        }
            
        origin.override(locationProvider: locationProvider, headingProvider: headingProvider)
    }

    /// Sets the custom providers that supply puck with the location data.
    ///
    /// - Parameters:
    ///   - locationProvider: Provider that drives puck location.
    ///   - headingProvider: Provider that drives the puck's bearing when it's configured as ``PuckBearing/heading``.
    @objc public func override(
        locationProvider : LocationProvider, 
        headingProvider : TMBHeadingProvider?) {
        origin.override(locationProvider: (locationProvider), headingProvider: (headingProvider)?.unwrap())
    }

    /// Sets the custom provider that supply puck with the location and heading data.
    ///
    /// - Parameters:
    ///  - provider: An object that provides both location and heading data, such as ``AppleLocationProvider``.
    @objc public func override(provider : LocationProvider & TMBHeadingProvider) {
        origin.override(provider: LocationHeadingProviderAdapter(origin: provider))
    }

    /// Represents the latest location received from the location provider.
    ///
    /// - Note: The value is lazy and gets updated only when there is at least one consumer of location data,
    /// such as visible location puck or ``LocationManager/onLocationChange`` observer.
    ///
    /// In general, if you need to know the user location it's recommended to observe
    /// the ``LocationManager/onLocationChange`` instead.
    @objc public var latestLocation: Location? {
        origin.latestLocation
    }
    
    private let origin:LocationManager
    init(origin: LocationManager) {
        self.origin = origin
    }
}
extension TMBLocationManager {
    func unwrap() -> LocationManager {
        self.origin
    }
}
extension LocationManager {
    func wrap() -> TMBLocationManager {
        TMBLocationManager(origin: self)
    }
}
