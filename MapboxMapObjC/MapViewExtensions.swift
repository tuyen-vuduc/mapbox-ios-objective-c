import MapboxMaps
import MapboxMobileEvents
import Turf

@objc
extension MapView {
    @available(iOSApplicationExtension, unavailable)
    @objc public convenience init(
        frame: CGRect,
        mapInitOptions: MapInitOptions = MapInitOptions()
    ) {
        self.init(frame: frame, mapInitOptions: mapInitOptions)
    }
    
    @available(iOSApplicationExtension, unavailable)
    @objc public convenience init(
        frame: CGRect,
        mapInitOptions: MapInitOptions = MapInitOptions(),
        urlOpener: TMBAttributionURLOpener
    ) {
        self.init(
            frame: frame,
            mapInitOptions: mapInitOptions,
            urlOpener: TMBAttributionURLOpenerAdapter(urlOpener))
    }
}

@objc
extension MapView {
    @objc public func preferredFrameRateRange(_ value: CAFrameRateRange) {
        self.preferredFrameRateRange = value
    }
    @objc public func mapboxMapDebugOptions() -> [NSNumber] {
        return self.mapboxMap.debugOptions.map{
            return NSNumber(value: $0.rawValue)
        }
    }
    @objc public func mapboxMapDebugOptions(_ value: [NSNumber]) {
        let debugOptions = value.map {
            return MapDebugOptions(rawValue: $0.intValue)!
        }
        
        self.mapboxMap.debugOptions = debugOptions;
    }
    
    @objc public func getPresentsWithTransaction() -> Bool {
        return self.presentsWithTransaction
    }
    @objc public func setPresentsWithTransaction(_ value: Bool) {
        self.presentsWithTransaction = value
    }
    
    @objc public func getPreferredFramesPerSecond() -> Int {
        return self.preferredFramesPerSecond
    }
    @objc public func setPreferredFramesPerSecond(_ value: Int) {
        self.preferredFramesPerSecond = value
    }
    
    @available(iOS 15.0, *)
    @objc public func getPreferredFrameRateRange() -> CAFrameRateRange {
        return self.preferredFrameRateRange
    }
    @available(iOS 15.0, *)
    @objc public func setPreferredFrameRateRange(_ value: CAFrameRateRange) {
        self.preferredFrameRateRange = value
    }
    
    @objc public func getCameraState() -> MapboxCoreMaps.CameraState {
        return MapboxCoreMaps.CameraState(self.cameraState)
    }
    
    @objc public func getAnchor() -> CGPoint {
        return self.anchor
    }
}

/// A protocol to open attribution URLs.
///
/// Use this protocol when the map view is used in non-application target(e.g. application extension target).
@objc public protocol TMBAttributionURLOpener {

    /// Asks the opener to open the provided URL.
    /// - Parameters:
    ///   - url: The URL to be opened.
    func openAttributionURL(_ url: URL)
}
class TMBAttributionURLOpenerAdapter : AttributionURLOpener {
    private let _self: TMBAttributionURLOpener
    init (_ _self: TMBAttributionURLOpener) {
        self._self = _self
    }
    
    func openAttributionURL(_ url: URL) {
        _self.openAttributionURL(url)
    }
}
