import MapboxMaps

// MapView.annotations

@objc
extension MapView {
    public func polygonAnnotationManager() -> MBXPolygonAnnotationManager {
        let swiftValue = self.annotations.makePolygonAnnotationManager()
        return MBXPolygonAnnotationManager(swiftValue)
    }
    
    @objc
    public func polygonAnnotationManager(
        id: String?,
        layerPosition: MBXLayerPosition = MBXLayerPosition.unowned,
        layerPositionParam: AnyObject?
    ) -> MBXPolygonAnnotationManager {
        let swiftValue = self.annotations.makePolygonAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition.swiftValue(layerPositionParam)
        )
        return MBXPolygonAnnotationManager(swiftValue)
    }
    
    public func circleAnnotationManager() -> MBXCircleAnnotationManager {
        let swiftValue = self.annotations.makeCircleAnnotationManager()
        return MBXCircleAnnotationManager(swiftValue)
    }
    
    @objc
    public func circleAnnotationManager(
        id: String?,
        layerPosition: MBXLayerPosition = MBXLayerPosition.unowned,
        layerPositionParam: AnyObject?
    ) -> MBXCircleAnnotationManager {
        let swiftValue = self.annotations.makeCircleAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition.swiftValue(layerPositionParam)
        )
        return MBXCircleAnnotationManager(swiftValue)
    }
    
    public func pointAnnotationManager() -> MBXPointAnnotationManager {
        let swiftValue = self.annotations.makePointAnnotationManager()
        return MBXPointAnnotationManager(swiftValue)
    }
    
    @objc
    public func pointAnnotationManager(
        id: String?,
        layerPosition: MBXLayerPosition = MBXLayerPosition.unowned,
        layerPositionParam: AnyObject?
    ) -> MBXPointAnnotationManager {
        let swiftValue = self.annotations.makePointAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition.swiftValue(layerPositionParam)
        )
        return MBXPointAnnotationManager(swiftValue)
    }
}
