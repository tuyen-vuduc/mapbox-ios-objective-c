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
