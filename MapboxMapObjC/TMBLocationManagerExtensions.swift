import MapboxMaps

@objc
extension MapView {
    @objc public func location() -> TMBLocationManager {
        return TMBLocationManager(origin: self.location)
    }
}
