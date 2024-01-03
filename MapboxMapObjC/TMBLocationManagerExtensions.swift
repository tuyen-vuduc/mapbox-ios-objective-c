import MapboxMaps

@objc
extension MapView {
    @objc func location() -> TMBLocationManager {
        return TMBLocationManager(origin: self.location)
    }
}
