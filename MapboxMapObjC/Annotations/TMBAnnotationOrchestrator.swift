import MapboxMaps

@objc
extension MapView {
    @objc public func annotations() -> TMBAnnotationOrchestrator {
        return TMBAnnotationOrchestrator(self.annotations)
    }
}

/// `AnnotationOrchestrator` provides a way to create annotation managers of different types.
@objc
open class TMBAnnotationOrchestrator : NSObject {
    private let _self: AnnotationOrchestrator

    init(_ _self: AnnotationOrchestrator) {
        self._self = _self
    }

    /// Dictionary of annotation managers keyed by their identifiers.
    @objc public var annotationManagersById: [String: TMBAnnotationManager] {
        return _self.annotationManagersById.mapValues { annotationManager in
            switch(annotationManager) {
            case let pointAnnotationManager as PointAnnotationManager:
                return TMBPointAnnotationManager(origin: pointAnnotationManager)
            case let polylineAnnotationManager as PolylineAnnotationManager:
                return TMBPolylineAnnotationManager(origin: polylineAnnotationManager)
            case let polygonAnnotationManager as PolygonAnnotationManager:
                return TMBPolygonAnnotationManager(origin: polygonAnnotationManager)
            default:
                return TMBCircleAnnotationManager(origin: annotationManager as! CircleAnnotationManager)
            }
        }
    }

    /// Creates a `PointAnnotationManager` which is used to manage a collection of
    /// `PointAnnotation`s. Annotations persist across style changes. If an annotation manager with
    /// the same `id` has already been created, the old one will be removed as if
    /// `removeAnnotationManager(withId:)` had been called. `AnnotationOrchestrator`
    ///  keeps a strong reference to any `PointAnnotationManager` until it is removed.
    /// - Parameters:
    ///   - id: Optional string identifier for this manager.
    ///   - layerPosition: Optionally set the `LayerPosition` of the layer managed.
    ///   - clusterOptions: Optionally set the `ClusterOptions` to cluster the Point Annotations
    /// - Returns: An instance of `PointAnnotationManager`
    @objc public func makePointAnnotationManager(
        id: String?,
        layerPosition: TMBLayerPosition?,
        clusterOptions: TMBClusterOptions?
    ) -> TMBPointAnnotationManager {
        let swiftValue = _self.makePointAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition?.unwrap() ?? .default,
            clusterOptions: clusterOptions?.unwrap()
        )
        return TMBPointAnnotationManager(origin: swiftValue)
    }

    /// Creates a `PolygonAnnotationManager` which is used to manage a collection of
    /// `PolygonAnnotation`s. Annotations persist across style changes. If an annotation manager with
    /// the same `id` has already been created, the old one will be removed as if
    /// `removeAnnotationManager(withId:)` had been called. `AnnotationOrchestrator`
    ///  keeps a strong reference to any `PolygonAnnotationManager` until it is removed.
    /// - Parameters:
    ///   - id: Optional string identifier for this manager..
    ///   - layerPosition: Optionally set the `LayerPosition` of the layer managed.
    /// - Returns: An instance of `PolygonAnnotationManager`
    @objc public func makePolygonAnnotationManager(
        id: String?,
        layerPosition: TMBLayerPosition?
    ) -> TMBPolygonAnnotationManager {
        let swiftValue = _self.makePolygonAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition?.unwrap() ?? .default
        )
        return TMBPolygonAnnotationManager(origin: swiftValue)
    }

    /// Creates a `PolylineAnnotationManager` which is used to manage a collection of
    /// `PolylineAnnotation`s. Annotations persist across style changes. If an annotation manager with
    /// the same `id` has already been created, the old one will be removed as if
    /// `removeAnnotationManager(withId:)` had been called. `AnnotationOrchestrator`
    ///  keeps a strong reference to any `PolylineAnnotationManager` until it is removed.
    /// - Parameters:
    ///   - id: Optional string identifier for this manager.
    ///   - layerPosition: Optionally set the `LayerPosition` of the layer managed.
    /// - Returns: An instance of `PolylineAnnotationManager`
    @objc public func makePolylineAnnotationManager(
        id: String?,
        layerPosition: TMBLayerPosition?
    ) -> TMBPolylineAnnotationManager {
        let swiftValue = _self.makePolylineAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition?.unwrap() ?? .default
        )
        return TMBPolylineAnnotationManager(origin: swiftValue)
    }

    /// Creates a `CircleAnnotationManager` which is used to manage a collection of
    /// `CircleAnnotation`s. Annotations persist across style changes. If an annotation manager with
    /// the same `id` has already been created, the old one will be removed as if
    /// `removeAnnotationManager(withId:)` had been called. `AnnotationOrchestrator`
    ///  keeps a strong reference to any `CircleAnnotationManager` until it is removed.
    /// - Parameters:
    ///   - id: Optional string identifier for this manager.
    ///   - layerPosition: Optionally set the `LayerPosition` of the layer managed.
    /// - Returns: An instance of `CircleAnnotationManager`
    @objc public func makeCircleAnnotationManager(
        id: String?,
        layerPosition: TMBLayerPosition?
    ) -> TMBCircleAnnotationManager {
        let swiftValue = _self.makeCircleAnnotationManager(
            id:  id ?? String(UUID().uuidString.prefix(5)),
            layerPosition: layerPosition?.unwrap() ?? .default
        )
        return TMBCircleAnnotationManager(origin: swiftValue)
    }

    /// Removes an annotation manager, this will remove the underlying layer and source from the style.
    /// A removed annotation manager will not be able to reuse anymore, you will need to create new annotation manger to add annotations.
    /// - Parameter id: Identifer of annotation manager to remove
    @objc public func removeAnnotationManager(withId id: String) {
        _self.removeAnnotationManager(withId: id)
    }
}
