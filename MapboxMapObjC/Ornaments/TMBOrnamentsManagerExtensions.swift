import MapboxMaps

@objc
extension MapView {
    @objc public func ornaments() -> TMBOrnamentsManager {
        TMBOrnamentsManager(origin: self.ornaments)
    }
}
