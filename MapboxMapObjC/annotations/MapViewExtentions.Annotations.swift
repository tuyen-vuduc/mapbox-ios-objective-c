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
}
