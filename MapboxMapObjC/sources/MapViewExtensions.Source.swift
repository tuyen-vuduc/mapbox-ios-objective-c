import MapboxMaps

@objc
extension MapView {
    @objc public func addSource(_ id: String, properties: [String: Any], onError: ((Error)->Void)?) -> Void {
        do {
            try self.mapboxMap.style.addSource(withId: id, properties: properties)
        } catch {
            onError?(error)
        }
            
    }
    
    @objc public func removeSource(_ id: String, onError: ((Error)->Void)?) -> Void {
        do {
            try self.mapboxMap.style.removeSource(withId: id)
        } catch {
            onError?(error)
        }
    }
    
    @objc public func sourceExists(_ id: String) -> Bool {
        self.mapboxMap.style.sourceExists(withId: id)
    }
    
    @objc public func setSourceProperties(for id: String, properties: [String: Any], onError: ((Error)->Void)?) -> Void {
        do {
            try self.mapboxMap.style.setSourceProperties(for: id, properties: properties)
        } catch {
            onError?(error)
        }
            
    }
    
    @objc public func getSourceProperties(for id: String, onError: ((Error)->Void)?) -> [String: Any] {
        do {
            return try self.mapboxMap.style.sourceProperties(for: id)
        } catch {
            onError?(error)
        }
        return [:]
    }
    
    @objc public func addSource(id: String, geometry: TMBGeometry, onError: ((Error)->Void)?) -> Void {
        do {
            var source = GeoJSONSource()
            source.data = .geometry(geometry.swiftValue()!)
            try self.mapboxMap.style.addSource(source, id: id)
        } catch {
            onError?(error)
        }
    }
    
    @objc public func addGeoJSONSource(id: String, properties: [String: Any], geojson: String, onComplete: ((Error?)->Void)?) -> Void {
        do {
            try self.mapboxMap.style.addSource(withId: id, properties: properties)
            
            updateGeoJSONSource(id: id, geojson: geojson, onComplete: onComplete)
        } catch {
            onComplete?(error)
        }
    }
    
    @objc public func updateGeoJSONSource(id: String, geojson: String, onComplete: ((Error?)->Void)?) -> Void {
        do {
            let data =  geojson.data(using: .utf8)
            let sourceData = try JSONDecoder().decode(GeoJSONSourceData.self, from: data!)
            
            var source: GeoJSONObject?
            
            switch sourceData {
            case .feature(let feature):
                source = .feature(feature)
            case .featureCollection(let featureCollection):
                source = .featureCollection(featureCollection)
            case .geometry(let geometry):
                source = .geometry(geometry)
            default:
                source = nil
            }
            
            if let source = source {
                try self.mapboxMap.style.updateGeoJSONSource(withId: id, geoJSON: source)
            }
            
            onComplete?(nil)
        } catch {
            onComplete?(error)
        }
    }
}
