import MapboxMaps


// MapView.layer

@objc
extension MapView {
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

