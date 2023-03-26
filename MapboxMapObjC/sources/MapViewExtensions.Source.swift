import MapboxMaps

@objc
extension MapView {
    @objc public func addSource(id: String, geometry: MBCGeometry, onError: ((Error)->Void)?) -> Void {
        do {
            var source = GeoJSONSource()
            source.data = .geometry(geometry.swiftValue()!)
            try self.mapboxMap.style.addSource(source, id: id)
        } catch {
            onError?(error)
        }
            
    }
}

