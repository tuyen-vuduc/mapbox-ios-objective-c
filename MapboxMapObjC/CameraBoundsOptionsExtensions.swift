import MapboxMaps

@objc
extension MapView {
    @objc public func setCameraBounds(_ bounds: MapboxCoreMaps.CameraBoundsOptions, completion: ((Error?)->Void)?) {
        do {
            try self.mapboxMap.setCameraBounds(with: bounds.swiftValue())
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }
}

extension MapboxCoreMaps.CameraBoundsOptions {
    func swiftValue() -> CameraBoundsOptions {
        CameraBoundsOptions(
            bounds: self.bounds,
            maxZoom: self.__maxZoom.flatMap { CGFloat($0.doubleValue) },
            minZoom: self.__minZoom.flatMap { CGFloat($0.doubleValue) },
            maxPitch: self.__maxPitch.flatMap { CGFloat($0.doubleValue) },
            minPitch: self.__minPitch.flatMap { CGFloat($0.doubleValue) })
    }
}
