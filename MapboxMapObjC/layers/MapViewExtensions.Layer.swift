import MapboxMaps


// MapView.layer

@objc
extension MapView {
    @objc public func addLayer(
        target: NSObject,
        selector: Selector,
        layerPosition: MBXLayerPosition = .unowned,
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
        layerPosition: MBXLayerPosition = .unowned,
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
       layerPosition: MBXLayerPosition = .unowned,
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
    
    @objc public func addLayer(
               properties: NSDictionary,
            layerPosition: MBXLayerPosition = .unowned,
       layerPositionParam: NSObject?,
                  onError: ((Error)->Void)?) {
        do {
            let swiftProperties = properties as! [String: Any]
            try self.mapboxMap.style.addLayer(
                         with: swiftProperties,
                layerPosition: layerPosition.swiftValue(layerPositionParam))
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
