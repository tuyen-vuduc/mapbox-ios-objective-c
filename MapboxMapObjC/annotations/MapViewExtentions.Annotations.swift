import MapboxMaps

// MapView.annotations

@objc
extension MapView {
    @objc
    public func polygonAnnotationManager(
        id: String?,
        layerPosition: TMBLayerPosition = TMBLayerPosition.unowned,
        layerPositionParam: AnyObject?
    ) -> TMBPolygonAnnotationManager {
        let swiftValue = self.annotations.makePolygonAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition.swiftValue(layerPositionParam)
        )
        return TMBPolygonAnnotationManager(swiftValue)
    }
    
    @objc
    public func circleAnnotationManager(
        id: String?,
        layerPosition: TMBLayerPosition = TMBLayerPosition.unowned,
        layerPositionParam: AnyObject?
    ) -> TMBCircleAnnotationManager {
        let swiftValue = self.annotations.makeCircleAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition.swiftValue(layerPositionParam)
        )
        return TMBCircleAnnotationManager(swiftValue)
    }
    
    @objc
    public func pointAnnotationManager(
        id: String?,
        layerPosition: TMBLayerPosition = TMBLayerPosition.unowned,
        layerPositionParam: AnyObject?,
        clusterOptions: TMBClusterOptions?
    ) -> TMBPointAnnotationManager {
        let swiftValue = self.annotations.makePointAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition.swiftValue(layerPositionParam),
            clusterOptions: clusterOptions?.swiftValue()
        )
        return TMBPointAnnotationManager(swiftValue)
    }
    
    @objc
    public func polylineAnnotationManager(
        id: String?,
        layerPosition: TMBLayerPosition = TMBLayerPosition.unowned,
        layerPositionParam: AnyObject?
    ) -> TMBPolylineAnnotationManager {
        let swiftValue = self.annotations.makePolylineAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition.swiftValue(layerPositionParam)
        )
        return TMBPolylineAnnotationManager(swiftValue)
    }
}
