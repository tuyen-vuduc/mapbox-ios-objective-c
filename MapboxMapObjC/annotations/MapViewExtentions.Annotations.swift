import MapboxMaps

// MapView.annotations

@objc
extension MapView {
    public func polygonAnnotationManager() -> TMBPolygonAnnotationManager {
        let swiftValue = self.annotations.makePolygonAnnotationManager()
        return TMBPolygonAnnotationManager(swiftValue)
    }
    
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
    
    public func circleAnnotationManager() -> TMBCircleAnnotationManager {
        let swiftValue = self.annotations.makeCircleAnnotationManager()
        return TMBCircleAnnotationManager(swiftValue)
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
    
    public func pointAnnotationManager() -> TMBPointAnnotationManager {
        let swiftValue = self.annotations.makePointAnnotationManager()
        return TMBPointAnnotationManager(swiftValue)
    }
    
    @objc
    public func pointAnnotationManager(
        id: String?,
        layerPosition: TMBLayerPosition = TMBLayerPosition.unowned,
        layerPositionParam: AnyObject?
    ) -> TMBPointAnnotationManager {
        let swiftValue = self.annotations.makePointAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition.swiftValue(layerPositionParam)
        )
        return TMBPointAnnotationManager(swiftValue)
    }
}
