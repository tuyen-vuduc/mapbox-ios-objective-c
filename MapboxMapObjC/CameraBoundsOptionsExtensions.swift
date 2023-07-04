import MapboxMaps

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
