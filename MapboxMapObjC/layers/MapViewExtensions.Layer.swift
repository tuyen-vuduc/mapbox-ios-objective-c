import MapboxMaps


// MapView.layer

@objc
extension MapView {
    @objc public func addLayer(
        properties: [String: Any],
        layerPosition: TMBLayerPosition = .unowned,
   layerPositionParam: NSObject?,
        onError: ((Error)->Void)?
    ) {
        do {
            try self.mapboxMap.style.addLayer(
                with: properties,
                layerPosition: layerPosition.swiftValue(layerPositionParam)
            )
        } catch {
            onError?(error)
        }
    }
    
    @objc public func removeLayer(
        id: String,
        onError: ((Error)->Void)?
    ) {
        do {
            try self.mapboxMap.style.removeLayer(withId: id)
        } catch {
            onError?(error)
        }
    }
    
    @objc public func isPersistentLayer(
        id: String,
        onError: ((Error)->Void)?
    ) -> Bool {
        do {
            return try self.mapboxMap.style.isPersistentLayer(id: id)
        } catch {
            onError?(error)
        }
        return false
    }
    
    @objc public func layerExists(
        id: String,
        onError: ((Error)->Void)?
    ) -> Bool {
        self.mapboxMap.style.layerExists(withId: id)
    }
    
    @objc public func setLayerProperties(
        for id: String,
        properties: [String: Any],
        onError: ((Error)->Void)?
    ) {
        do {
            try self.mapboxMap.style.setLayerProperties(
                for: id,
                properties: properties)
        } catch {
            onError?(error)
        }
    }
    
    @objc public func updateLayerProperties(
        for id: String,
        properties: [String: Any],
        onError: ((Error)->Void)?
    ) {
        do {
            let oldLayerProperties = try self.mapboxMap.style.layerProperties(for: id)
            let layer = try self.mapboxMap.style.layer(withId: id)
                        
            let reduceStrategy: (inout [String: Any], Dictionary<String, Any>.Element) -> Void = { result, element in
                let (key, value) = element
                switch value {
                case Optional<Any>.none where result.keys.contains(key):
                    result[key] = Style.layerPropertyDefaultValue(for: layer.type, property: key).value
                // swiftlint:disable syntactic_sugar
                case Optional<Any>.some:
                    result[key] = value
                default: break
                }
            }
            let layerProperties: [String: Any] = properties
                .reduce(into: oldLayerProperties, { result, element in
                    if let dictionary = element.value as? [String: Any] {
                        result[element.key] = dictionary.reduce(
                            into: oldLayerProperties[element.key] as? [String: Any] ?? [:],
                            reduceStrategy
                        )
                    } else {
                        reduceStrategy(&result, element)
                    }
                })

            // Apply the changes to the layer properties to the style
            try self.mapboxMap.style.setLayerProperties(for: id, properties: layerProperties)
        } catch {
            onError?(error)
        }
    }
    
    @objc public func getLayerProperties(
        for id: String,
        onError: ((Error)->Void)?
    ) -> [String: Any] {
        do {
            return try self.mapboxMap.style.layerProperties(for: id)
        } catch {
            onError?(error)
        }
        
        return [:]
    }
    
    @objc public func addPersistentLayer(
        properties: [String: Any],
        layerPosition: TMBLayerPosition = .unowned,
   layerPositionParam: NSObject?,
        onError: ((Error)->Void)?
    ) {
        do {
            try self.mapboxMap.style.addPersistentLayer(
                with: properties,
                layerPosition: layerPosition.swiftValue(layerPositionParam)
            )
        } catch {
            onError?(error)
        }
    }
    
    @objc public func addLayer(
        target: NSObject,
        selector: Selector,
        layerPosition: TMBLayerPosition = .unowned,
   layerPositionParam: NSObject?,
        onError: ((Error)->Void)?
    ) {
        let value: Unmanaged<AnyObject> = target.perform(selector)
        guard let layerBuilder = value.takeUnretainedValue()  as? (any LayerBuilder) else {
            return
        }
        
        do {
            
            try self.mapboxMap.style.addLayer(
                layerBuilder.build(),
                layerPosition: layerPosition.swiftValue(layerPositionParam)
            )
        } catch {
            onError?(error)
        }
    }
    @objc public func addLayer(
        builder: ()->AnyObject,
        layerPosition: TMBLayerPosition = .unowned,
   layerPositionParam: NSObject?,
        onError: ((Error)->Void)?
    ) {
        guard let layerBuilder = builder() as? (any LayerBuilder) else {
            return
        }
        
        do {
            try self.mapboxMap.style.addLayer(
                layerBuilder.build(),
                layerPosition: layerPosition.swiftValue(layerPositionParam)
            )
        } catch {
            onError?(error)
        }
    }
    
    @objc public func addCustomLayer(
                _ id: String,
           layerHost: CustomLayerHost,
       layerPosition: TMBLayerPosition = .unowned,
  layerPositionParam: NSObject?,
             onError: ((Error)->Void)?) -> Void {
        do {
            try self.mapboxMap.style.addCustomLayer(
                withId: id,
                layerHost: layerHost,
                layerPosition: layerPosition.swiftValue(layerPositionParam)
            )
        } catch {
            onError?(error)
        }
    }
}

public protocol LayerBuilder {
    associatedtype T: Layer
    
    var id: String { get }
    func create() -> T
    func update(_ layer: inout T) -> Void
}

extension LayerBuilder {
    func build() -> T {
        var result = create()
        
        update(&result)
        
        return result
    }
}
