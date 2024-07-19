// swiftlint:disable file_length
import MapboxCoreMaps
import MapboxMaps
import UIKit
import Turf

@objc extension MapView {
    @objc public func mapboxMap() -> TMBMapboxMap {
        return TMBMapboxMap(self.mapboxMap)
    }
}

// swiftlint:disable type_body_length

/// MapboxMap provides access to the map model, including the camera, style, observable map events,
/// and querying rendered features. Obtain the MapboxMap instance for a `MapView` via MapView.mapboxMap.
///
/// - Important: MapboxMap should only be used from the main thread.
@objc open class TMBMapboxMap: TMBStyleManager {
    private var origin: MapboxMap
    init(_ origin: MapboxMap) {
        self.origin = origin
        super.init(origin: origin)
    }
    
    // MARK: - Render loop

    /// Triggers a repaint of the map. Calling this method is typically unnecessary but
    /// may be needed if using a custom layer that needs to be redrawn independently
    /// of other map changes.
    @objc public func triggerRepaint() {
        origin.triggerRepaint()
    }

    // MARK: - Style loading

    /// Loads a `style` from a StyleURI, calling a completion closure when the
    /// style is fully loaded or there has been an error during load.
    ///
    /// - Parameters:
    ///   - styleURI: StyleURI to load
    ///   - completion: Closure called when the style has been fully loaded. The
    ///     `Result` type encapsulates the `Style` or error that occurred. See
    ///     `MapLoadingError`
    @objc public func loadStyle(uri: String, transition: MapboxCoreMaps.TransitionOptions?, completion: ((Error?) -> Void)?) {
        let uri = StyleURI(url: URL(string: uri)!)!
        let xtransition = transition != nil
            ? TransitionOptions(transition!)
            : nil
        origin.loadStyle(uri, transition: xtransition, completion: completion)
    }

    /// Loads a `style` from a JSON string, calling a completion closure when the
    /// style is fully loaded or there has been an error during load.
    ///
    /// - Parameters:
    ///   - styleURI: Style JSON string
    ///   - completion: Closure called when the style has been fully loaded. The
    ///     `Result` type encapsulates the `Style` or error that occurred. See
    ///     `MapLoadingError`
    @objc public func loadStyle(json: String, transition: MapboxCoreMaps.TransitionOptions?, completion: ((Error?) -> Void)?) {
        let xtransition = transition != nil
            ? TransitionOptions(transition!)
            : nil
        origin.loadStyle(json, transition: xtransition, completion: completion)
    }

    // MARK: - Prefetching

    /// When loading a map, if `prefetchZoomDelta` is set to any number greater
    /// than 0, the map will first request a tile for `zoom - prefetchZoomDelta`
    /// in an attempt to display a full map at lower resolution as quick as
    /// possible.
    ///
    /// It will get clamped at the tile source minimum zoom. The default delta
    /// is 4.
    @objc public var prefetchZoomDelta: UInt8 {
        get {
            return origin.prefetchZoomDelta
        }
        set {
            origin.prefetchZoomDelta = newValue
        }
    }
    
    /// The tile cache budget hint to be used by the map.
    ///
    /// The budget can be given in tile units or in megabytes. A Map will do the best effort to keep memory
    /// allocations for a non essential resources within the budget.
    ///
    /// If tile cache budget in megabytes is set, the engine will try to use ETC1 texture compression
    /// for raster layers, therefore, raster images with alpha channel will be rendered incorrectly.
    ///
    /// If null is set, the tile cache budget in tile units will be dynamically calculated based on
    /// the current viewport size.
    /// - Parameter tileCacheBudget: The tile cache budget hint to be used by the Map.
    @objc public func setTileCacheBudget(_ tileCacheBudget: TileCacheBudget?) {
        var tileCacheBudgetSize: TileCacheBudgetSize? = nil
        if let tileCacheBudget {
            tileCacheBudgetSize = tileCacheBudget.isTileCacheBudgetInMegabytes()
            ? TileCacheBudgetSize.megabytes(Int(tileCacheBudget.getInMegabytes().size))
            : TileCacheBudgetSize.tiles(Int(tileCacheBudget.getInTiles().size))
        }
        origin.setTileCacheBudget(size: tileCacheBudgetSize)
    }

    /// Defines whether multiple copies of the world will be rendered side by side beyond -180 and 180 degrees longitude.
    ///
    /// If disabled, when the map is zoomed out far enough that a single representation of the world does not fill the map's entire container,
    /// there will be blank space beyond 180 and -180 degrees longitude.
    /// In this case, features that cross 180 and -180 degrees longitude will be cut in two (with one portion on the right edge of the map
    /// and the other on the left edge of the map) at every zoom level.
    ///
    /// By default, `shouldRenderWorldCopies` is set to `true`.
    @objc public var shouldRenderWorldCopies: Bool {
        get {
            return origin.shouldRenderWorldCopies
        }
        set {
            origin.shouldRenderWorldCopies = newValue
        }
    }
    
    /// Gets elevation for the given coordinate.
    ///
    /// - Note: Elevation is only available for the visible region on the screen.
    ///
    /// - Parameter coordinate: Coordinate for which to return the elevation.
    /// - Returns: Elevation (in meters) multiplied by current terrain
    ///     exaggeration, or empty if elevation for the coordinate is not available.
    @objc public func elevation(at coordinate: CLLocationCoordinate2D) -> NSNumber? {
        origin.elevation(at: coordinate)?.NSNumber
    }

    // MARK: - Camera Fitting

    /// Transforms a view's frame into a set of coordinate bounds
    /// - Parameter rect: The `rect` whose bounds will be transformed into a set of map coordinate bounds.
    /// - Returns: A `CoordinateBounds` object that represents the southwest and northeast corners of the view's bounds.
    @objc public func coordinateBounds(for rect: CGRect) -> CoordinateBounds {
        return origin.coordinateBounds(for: rect)
    }

    /// Transforms a set of map coordinate bounds to a `CGRect` relative to the `MapView`.
    /// - Parameter coordinateBounds: The `coordinateBounds` that will be converted into a rect relative to the `MapView`
    /// - Returns: A `CGRect` whose corners represent the vertices of a set of `CoordinateBounds`.
    @objc public func rect(for coordinateBounds: CoordinateBounds) -> CGRect {
        return origin.rect(for: coordinateBounds)
    }

    /// Returns the map's options
    @objc public var options: MapOptions {
        return origin.options
    }


    /// Calculates a `CameraOptions` to fit a list of coordinates into a sub-rect of the map.
    ///
    /// Adjusts the zoom of `camera` to fit `coordinates` into `rect`.
    ///
    /// Returns the provided camera with zoom adjusted to fit coordinates into
    /// `rect`, so that the coordinates on the left, top and right of the effective
    /// camera center at the principal point of the projection (defined by padding)
    /// fit into the rect.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Note:
    ///     This method may fail if the principal point of the projection is not
    ///     inside `rect` or if there is insufficient screen space, defined by
    ///     principal point and rect, to fit the geometry.
    ///
    /// - Parameters:
    ///   - coordinates: The coordinates to frame within `rect`.
    ///   - camera: The camera for which the zoom should be adjusted to fit `coordinates`. `camera.center` must be non-nil.
    ///   - rect: The rectangle inside of the map that should be used to frame `coordinates`.
    /// - Returns: A `CameraOptions` that fits the provided constraints, or `cameraOptions` if an error occurs.
    @objc public func camera(for coordinates: [NSValue],
                             camera: TMBCameraOptions,
                             rect: CGRect) -> TMBCameraOptions {
        origin.camera(
            for: coordinates.map { $0.coordinateValue() },
            camera: camera.unwrap(),
            rect: rect).wrap()
    }
    
    /// Convenience method that returns the `camera options` object for given parameters.
    ///
    /// - Parameters:
    ///   - coordinates: The `coordinates` representing the bounds of the camera.
    ///   - camera: The `camera options` which will be applied before calculating the camera for the coordinates.
    ///   If any of the fields in camera options is not provided then the current value from the map for that field will be used.
    ///   - coordinatesPadding: The amount of padding in screen points to add to the given `coordinates`.
    ///   This padding is not applied to the map but to the coordinates provided. If you want to apply padding to the map use `camera` parameter.
    ///   - maxZoom: The maximum zoom level allowed in the returned camera options.
    ///   - offset: The center of the given bounds relative to map center in screen points.
    /// - Returns: A `CameraOptions` object representing the provided parameters.
    @objc public func camera(for coordinates: [NSValue],
                       camera: TMBCameraOptions,
                       coordinatesPadding: NSNumber?,
                       maxZoom: NSNumber?,
                       offset: NSNumber?,
                       completion: (TMBCameraOptions?, Error?)->Void) {
        do {
            let result = try origin.camera(for: coordinates.map({ $0.mkCoordinateValue }), camera: camera.unwrap(), coordinatesPadding: coordinatesPadding?.uiEdgeInsetsValue, maxZoom: maxZoom?.doubleValue, offset: offset?.cgPointValue)
            
            completion(result.wrap(), nil)
        } catch {
            completion(nil, error)
        }
    }

    // MARK: - CameraOptions to CoordinateBounds

    /// Returns the coordinate bounds corresponding to a given `CameraOptions`
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter camera: The camera for which the coordinate bounds will be returned.
    /// - Returns: `CoordinateBounds` for the given `CameraOptions`
    @objc public func coordinateBounds(forCameraBounds camera: TMBCameraOptions) -> CoordinateBounds {
        origin.coordinateBounds(for: camera.unwrap())
    }

    /// Returns the unwrapped coordinate bounds to a given ``CameraOptions``.
    ///
    /// This function is particularly useful, if the camera shows the antimeridian.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter camera: The camera for which the coordinate bounds will be returned.
    /// - Returns: `CoordinateBounds` for the given ``CameraOptions``.
    @objc public func coordinateBoundsUnwrapped(for camera: TMBCameraOptions) -> CoordinateBounds {
        origin.coordinateBoundsUnwrapped(for: camera.unwrap())
    }

    /// Returns the coordinate bounds and zoom for a given `CameraOptions`.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter camera: The camera for which the `CoordinateBoundsZoom` will be returned.
    /// - Returns: `CoordinateBoundsZoom` for the given `CameraOptions`
    @objc public func coordinateBoundsZoom(for camera: TMBCameraOptions) -> CoordinateBoundsZoom {
        origin.coordinateBoundsZoom(for: camera.unwrap())
    }

    /// Returns the unwrapped coordinate bounds and zoom for a given `CameraOptions`.
    ///
    /// This function is particularly useful, if the camera shows the antimeridian.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter camera: The camera for which the `CoordinateBoundsZoom` will
    ///     be returned.
    /// - Returns: `CoordinateBoundsZoom` for the given `CameraOptions`
    @objc public func coordinateBoundsZoomUnwrapped(for camera: TMBCameraOptions) -> CoordinateBoundsZoom {
        origin.coordinateBoundsZoomUnwrapped(for: camera.unwrap())
    }

    // MARK: - Screen coordinate conversion

    /// Converts a point in the mapView's coordinate system to a geographic coordinate.
    /// The point must exist in the coordinate space of the `MapView`
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter point: The point to convert. Must exist in the coordinate space
    ///     of the `MapView`
    /// - Returns: A `CLLocationCoordinate` that represents the geographic location
    ///     of the point.
    @objc public func coordinate(for point: CGPoint) -> CLLocationCoordinate2D {
        origin.coordinate(for: point)
    }

    /// Converts a map coordinate to a `CGPoint`, relative to the `MapView`.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter coordinate: The coordinate to convert.
    /// - Returns: A `CGPoint` relative to the `UIView`. If the point is outside of the bounds
    ///     of `MapView` the returned point contains `-1.0` for both coordinates.
    @objc public func point(for coordinate: CLLocationCoordinate2D) -> CGPoint {
        return origin.point(for: coordinate)
    }

    /// Converts map coordinates to an array of `CGPoint`, relative to the `MapView`.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter coordinates: The coordinate to convert.
    /// - Returns: An array of `CGPoint` relative to the `UIView.
    /// If a coordinate's point is outside of map view's bounds, it will be `(-1, -1)`
    @objc public func points(for coordinates: [CLLocationCoordinate2D]) -> [NSValue] {
        return origin.points(for: coordinates).map { NSValue(cgPoint: $0) }
    }

    /// Converts points in the mapView's coordinate system to geographic coordinates.
    /// The points must exist in the coordinate space of the `MapView`.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter point: The point to convert. Must exist in the coordinate space
    ///     of the `MapView`
    /// - Returns: A `CLLocationCoordinate` that represents the geographic location
    ///     of the point.
    @objc public func coordinates(for points: [NSValue]) -> [NSValue] {
        return origin.coordinates(for: points.map { $0.cgPointValue }).map { NSValue(mkCoordinate: $0) }
    }
    
    // MARK: - Camera options setters/getters

    /// Changes the map view by any combination of center, zoom, bearing, and pitch,
    /// without an animated transition. The map will retain its current values
    /// for any details not passed via the camera options argument. It is not
    /// guaranteed that the provided `CameraOptions` will be set, the map may apply
    /// constraints resulting in a different `CameraState`.
    ///
    /// - Important:
    ///     This method does not cancel existing animations. Call
    ///     `CameraAnimationsManager.cancelAnimations()`to cancel existing animations.
    ///
    /// - Parameter cameraOptions: New camera options
    @objc public func setCamera(to cameraOptions: TMBCameraOptions) {
        origin.setCamera(to: cameraOptions.unwrap())
    }

    /// Returns the current camera state
    @objc public var cameraState: TMBCameraState {
        origin.cameraState.wrap()
    }

    /// Sets/get the map view with the free camera options.
    ///
    /// FreeCameraOptions provides more direct access to the underlying camera entity.
    /// For backwards compatibility the state set using this API must be representable
    /// with `CameraOptions` as well. Parameters are clamped to a valid range or
    /// discarded as invalid if the conversion to the pitch and bearing presentation
    /// is ambiguous. For example orientation can be invalid if it leads to the
    /// camera being upside down or the quaternion has zero length.
    ///
    /// - Parameter freeCameraOptions: The free camera options to set.
    @objc public var freeCameraOptions: FreeCameraOptions {
        get {
            return origin.freeCameraOptions
        }
        set {
            origin.freeCameraOptions = newValue
        }
    }

    /// Returns the bounds of the map.
    @objc public var cameraBounds: TMBCameraBounds {
        origin.cameraBounds.wrap()
    }

    /// Sets the bounds of the map.
    ///
    /// - Parameter options: New camera bounds. Nil values will not take effect.
    /// - Throws: `MapError`
    @objc public func setCameraBounds(with options: TMBCameraBoundsOptions, completion: ((Error?)->Void)?) {
        do {
            try origin.setCameraBounds(with: options.unwrap())
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    // MARK: - Drag API

    /// Calculates target point where camera should move after drag. The method
    /// should be called after `dragStart` and before `dragEnd`.
    ///
    /// - Parameters:
    ///   - fromPoint: The point from which the map is dragged.
    ///   - toPoint: The point to which the map is dragged.
    ///
    /// - Returns:
    ///     The camera options object showing end point.
    @objc public func dragCameraOptions(from: CGPoint, to: CGPoint) -> TMBCameraOptions {
        origin.dragCameraOptions(from: from, to: to).wrap()
    }

    // MARK: - Gesture and Animation Flags

    /// If implementing a custom animation mechanism, call this method when the animation begins.
    /// Must always be paired with a corresponding call to `endAnimation()`
    @objc public func beginAnimation() {
        origin.beginAnimation()
    }

    /// If implementing a custom animation mechanism, call this method when the animation ends.
    /// Must always be paired with a corresponding call to `beginAnimation()`
    @objc public func endAnimation() {
        origin.endAnimation()
    }

    /// If implementing a custom gesture, call this method when the gesture begins.
    /// Must always be paired with a corresponding call to `endGesture()`
    @objc public func beginGesture() {
        origin.beginGesture()
    }

    /// If implementing a custom gesture, call this method when the gesture ends.
    /// Must always be paired with a corresponding call to `beginGesture()`
    @objc public func endGesture() {
        origin.endGesture()
    }
}

// swiftlint:enable type_body_length

// MARK: - MapFeatureQueryable

extension TMBMapboxMap {
    @discardableResult
    @objc public func queryRenderedFeatures(withShape shape: [CGPoint],
                                            options: RenderedQueryOptions? = nil,
                                            completion: (([QueriedRenderedFeature]?, Error?)->Void)?) -> TMBCancelable {
        let cancelable = origin.queryRenderedFeatures(with: shape, options: options) { result in
            switch result {
            case .success(let features):
                completion?(features, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
        return TMBCancelable(cancelable: cancelable)
    }

    @discardableResult
    @objc public func queryRenderedFeatures(withRect rect: CGRect,
                                            options: RenderedQueryOptions? = nil,
                                            completion: (([QueriedRenderedFeature]?, Error?)->Void)?) -> TMBCancelable {
        let cancelable = origin.queryRenderedFeatures(with: rect, options: options) { result in
            switch result {
            case .success(let features):
                completion?(features, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
        return TMBCancelable(cancelable: cancelable)
    }

    @discardableResult
    @objc public func queryRenderedFeatures(withPoint point: CGPoint,
                                            options: RenderedQueryOptions? = nil,
                                            completion: (([QueriedRenderedFeature]?, Error?)->Void)?) -> TMBCancelable {
        let cancelable = origin.queryRenderedFeatures(with: point, options: options) { result in
            switch result {
            case .success(let features):
                completion?(features, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
        return TMBCancelable(cancelable: cancelable)
    }

    /// Queries the map for source features.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier used to query for source features.
    ///   - options: Options for querying source features.
    ///   - completion: Callback called when the query completes
    @objc public func querySourceFeatures(for sourceId: String,
                                          options: SourceQueryOptions,
                                          completion: (([QueriedSourceFeature]?, Error?)->Void)?) {
        origin.querySourceFeatures(for: sourceId, options: options) { result in
            switch result {
            case .success(let features):
                completion?(features, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }

    /// Returns all the leaves (original points) of a cluster (given its cluster_id) from a GeoJSON source, with pagination support: limit is the number of leaves
    /// to return (set to Infinity for all points), and offset is the amount of points to skip (for pagination).
    ///
    /// - Parameters:
    ///   - sourceId: The identifier of the source to query.
    ///   - feature: Feature to look for in the query.
    ///   - limit: the number of points to return from the query, default to 10
    ///   - offset: the amount of points to skip, default to 0
    ///   - completion: The result could be a feature extension value containing
    ///         either a value (expansion-zoom) or a feature collection (children
    ///         or leaves). An error is passed if the operation was not successful.
    @objc public func getGeoJsonClusterLeaves(
        forSourceId sourceId: String,
        feature: MapboxCommon.Feature,
        limit: UInt64 = 10,
        offset: UInt64 = 0,
        completion: @escaping (FeatureExtensionValue?, Error?)->Void) {
        let xfeature = Turf.Feature(feature)
        origin.getGeoJsonClusterLeaves(
            forSourceId: sourceId,
            feature: xfeature,
            limit: limit,
            offset: offset) { result in
                switch result {
                case .success(let features):
                    completion(features, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }

    /// Returns the children (original points or clusters) of a cluster (on the next zoom level)
    /// given its id (cluster_id value from feature properties) from a GeoJSON source.
    ///
    /// - Parameters:
    ///   - sourceId: The identifier of the source to query.
    ///   - feature: Feature to look for in the query.
    ///   - completion: The result could be a feature extension value containing
    ///         either a value (expansion-zoom) or a feature collection (children
    ///         or leaves). An error is passed if the operation was not successful.
    @objc public func getGeoJsonClusterChildren(
        forSourceId sourceId: String,
        feature: MapboxCommon.Feature,
        completion: @escaping (FeatureExtensionValue?, Error?)->Void) {
        let xfeature = Turf.Feature(feature)
        origin.getGeoJsonClusterChildren(
            forSourceId: sourceId,
            feature: xfeature) { result in
                switch result {
                case .success(let features):
                    completion(features, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }

    /// Returns the zoom on which the cluster expands into several children (useful for "click to zoom" feature)
    /// given the cluster's cluster_id (cluster_id value from feature properties) from a GeoJSON source.
    ///
    /// - Parameters:
    ///   - sourceId: The identifier of the source to query.
    ///   - feature: Feature to look for in the query.
    ///   - completion: The result could be a feature extension value containing
    ///         either a value (expansion-zoom) or a feature collection (children
    ///         or leaves). An error is passed if the operation was not successful.
    @objc public func getGeoJsonClusterExpansionZoom(
        forSourceId sourceId: String,
        feature: MapboxCommon.Feature,
        completion: @escaping (FeatureExtensionValue?, Error?)->Void) {
        let xfeature = Turf.Feature(feature)
        origin.getGeoJsonClusterExpansionZoom(
            forSourceId: sourceId,
            feature: xfeature) { result in
                switch result {
                case .success(let features):
                    completion(features, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
}

extension TMBMapboxMap {
    /// The style has been fully loaded, and the map has rendered all visible tiles.
    @discardableResult
    @objc public func onMapLoaded(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onMapLoaded.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// An error that has occurred while loading the Map. The `type` property defines what resource could
    /// not be loaded and the `message` property will contain a descriptive error message.
    /// In case of `source` or `tile` loading errors, `sourceID` or `tileID` will contain the identifier of the source failing.
    @discardableResult
    @objc public func onMapLoadingError(_ handler: @escaping (MapLoadingError) -> Void) -> TMBCancelable {
        let cancelable = origin.onMapLoadingError.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The requested style has been fully loaded, including the style, specified sprite and sources' metadata.
    ///
    /// The style specified sprite would be marked as loaded even with sprite loading error (an error will be emitted via ``MapboxMap/onMapLoadingError``).
    /// Sprite loading error is not fatal and we don't want it to block the map rendering, thus this event will still be emitted if style and sources are fully loaded.
    @discardableResult
    @objc public func onStyleLoaded(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onStyleLoaded.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The requested style data has been loaded. The `type` property defines what kind of style data has been loaded.
    /// Event may be emitted synchronously, for example, when ``MapboxMap/loadStyle(_:transition:completion:)-2jmep`` is used to load style.
    ///
    /// Based on an event data `type` property value, following use-cases may be implemented:
    /// - `style`: Style is parsed, style layer properties could be read and modified, style layers and sources could be
    /// added or removed before rendering is started.
    /// - `sprite`: Style's sprite sheet is parsed and it is possible to add or update images.
    /// - `sources`: All sources defined by the style are loaded and their properties could be read and updated if needed.
    @discardableResult
    @objc public func onStyleDataLoaded(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onStyleDataLoaded.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The camera has changed. This event is emitted whenever the visible viewport
    /// changes due to the MapView's size changing or when the camera
    /// is modified by calling camera methods. The event is emitted synchronously,
    /// so that an updated camera state can be fetched immediately.
    @discardableResult
    @objc public func onCameraChanged(_ handler: @escaping (TMBCameraChanged) -> Void) -> TMBCancelable {
        let cancelable = origin.onCameraChanged.observe { event in
            handler(event.wrap())
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The map has entered the idle state. The map is in the idle state when there are no ongoing transitions
    /// and the map has rendered all requested non-volatile tiles. The event will not be emitted if animation is in progress (see ``MapboxMap/beginAnimation()``, ``MapboxMap/endAnimation()``)
    /// and / or gesture is in progress (see ``MapboxMap/beginGesture()``, ``MapboxMap/endGesture()``).
    @discardableResult
    @objc public func onMapIdle(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onMapIdle.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The source has been added with ``StyleManager/addSource(_:dataId:)``  or ``StyleManager/addSource(withId:properties:)``.
    /// The event is emitted synchronously, therefore, it is possible to immediately
    /// read added source's properties.
    @discardableResult
    @objc public func onSourceAdded(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onSourceAdded.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The source has been removed with ``StyleManager/removeSource(withId:)``.
    /// The event is emitted synchronously, thus, ``StyleManager/allSourceIdentifiers`` will be
    /// in sync when the observer receives the notification.
    @discardableResult
    @objc public func onSourceRemoved(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onSourceRemoved.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// A source data has been loaded.
    /// Event may be emitted synchronously in cases when source's metadata is available when source is added to the style.
    ///
    /// The `dataID` property defines the source id.
    ///
    /// The `type` property defines if source's metadata (e.g., TileJSON) or tile has been loaded. The property of `metadata`
    /// value might be useful to identify when particular source's metadata is loaded, thus all source's properties are
    /// readable and can be updated before map will start requesting data to be rendered.
    ///
    /// The `loaded` property will be set to `true` if all source's data required for visible viewport of the map, are loaded.
    /// The `tileID` property defines the tile id if the `type` field equals `tile`.
    /// The `dataID` property will be returned if it has been set for this source.
    @discardableResult
    @objc public func onSourceDataLoaded(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onSourceDataLoaded.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// A style has a missing image. This event is emitted when the map renders visible tiles and
    /// one of the required images is missing in the sprite sheet. Subscriber has to provide the missing image
    /// by calling ``StyleManager/addImage(_:id:sdf:contentInsets:)``.
    @discardableResult
    @objc public func onStyleImageMissing(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onStyleImageMissing.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// An image added to the style is no longer needed and can be removed using ``StyleManager/removeImage(withId:)``.
    @discardableResult
    @objc public func onStyleImageRemoveUnused(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onStyleImageRemoveUnused.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The map started rendering a frame.
    @discardableResult
    @objc public func onRenderFrameStarted(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onRenderFrameStarted.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The map finished rendering a frame.
    /// The `renderMode` property tells whether the map has all data (`full`) required to render the visible viewport.
    /// The `needsRepaint` property provides information about ongoing transitions that trigger map repaint.
    /// The `placementChanged` property tells if the symbol placement has been changed in the visible viewport.
    @discardableResult
    @objc public func onRenderFrameFinished(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = origin.onRenderFrameFinished.observe(handler)
        
        return TMBCancelable(cancelable: cancelable)
    }
}

// MARK: - Map data clearing

extension TMBMapboxMap {

    /// Clears temporary map data.
    ///
    /// Clears temporary map data from the data path defined in the given resource
    /// options. Useful to reduce the disk usage or in case the disk cache contains
    /// invalid data.
    ///
    /// - Note: Calling this API will affect all maps that use the same data path
    ///         and does not affect persistent map data like offline style packages.
    ///
    /// - Parameter completion: Called once the request is complete
    @objc public class func clearData(completion: @escaping (Error?) -> Void) {
        MapboxMap.clearData(completion: completion)
    }
}

// MARK: - Feature State

extension TMBMapboxMap {

    /// Update the state map of a feature within a style source.
    /// Update entries in the state map of a given feature within a style source. Only entries listed in the state map
    /// will be updated. An entry in the feature state map that is not listed in `state` will retain its previous value.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier
    ///   - sourceLayerId: Style source layer identifier (for multi-layer sources such as vector sources). Defaults to `nil`.
    ///   - featureId: Identifier of the feature whose state should be updated
    ///   - state: Map of entries to update with their respective new values
    ///   - callback: The `feature state operation callback` called when the operation completes or ends.
    ///
    /// - Returns: A `Cancelable` object  that could be used to cancel the pending operation.
    @discardableResult
    @objc public func setFeatureState(sourceId: String, sourceLayerId: String?, featureId: String, state: [String: Any], callback: @escaping (Error?) -> Void) -> TMBCancelable {
        let cancellable = origin.setFeatureState(
            sourceId: sourceId, sourceLayerId: sourceLayerId, featureId: featureId, state: state) { result in
                switch(result){
                case .success(_):
                    callback(nil)
                case .failure(let error):
                    callback(error)
                }
            }
        
        return TMBCancelable(cancelable: cancellable)
    }

    /// Get the state map of a feature within a style source.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier.
    ///   - sourceLayerId: Style source layer identifier (for multi-layer sources such as vector sources).
    ///   - featureId: Identifier of the feature whose state should be queried.
    ///   - callback: Feature's state map or an empty map if the feature could not be found.
    ///
    /// - Returns: A `Cancelable` object that could be used to cancel the pending query.
    @discardableResult
    @objc public func getFeatureState(sourceId: String, sourceLayerId: String? = nil, featureId: String, callback: @escaping ([String: Any]?, Error?) -> Void) -> TMBCancelable {
        let cancellable = origin.getFeatureState(sourceId: sourceId, sourceLayerId: sourceLayerId, featureId: featureId) { result in
            switch(result){
            case .success(let data):
                callback(data, nil)
            case .failure(let error):
                callback(nil, error)
            }
        }
        
        return TMBCancelable(cancelable: cancellable)
    }

    /// Removes entries from a feature state object.
    /// Remove a specified property or all property from a feature's state object, depending on the value of `stateKey`.
    ///
    /// - Parameters:
    ///   - sourceId: The style source identifier
    ///   - sourceLayerId: The style source layer identifier (for multi-layer sources such as vector sources). Defaults to `nil`.
    ///   - featureId: The feature identifier of the feature whose state should be removed.
    ///   - stateKey: The key of the property to remove. If `nil`, all feature's state object properties are removed. Defaults to `nil`.
    ///   - callback: The `feature state operation callback` called when the operation completes or ends.
    ///
    /// - Returns: A `cancelable` object that could be used to cancel the pending operation.
    @discardableResult
    @objc public func removeFeatureState(sourceId: String, sourceLayerId: String? = nil, featureId: String, stateKey: String? = nil, callback: @escaping (Error?) -> Void) -> TMBCancelable {
        let cancellable = origin.removeFeatureState(sourceId: sourceId, sourceLayerId: sourceLayerId, featureId: featureId, stateKey: stateKey) { result in
            switch(result){
            case .success(_):
                callback(nil)
            case .failure(let error):
                callback(error)
            }
        }
        
        return TMBCancelable(cancelable: cancellable)
    }

    /// Reset all the feature states within a style source.
    /// Remove all feature state entries from the specified style source or source layer.
    /// Note that updates to feature state are asynchronous, so changes made by this method might not be
    /// immediately visible using `getStateFeature`.
    ///
    /// - Parameters:
    ///   - sourceId: The style source identifier
    ///   - sourceLayerId: The style source layer identifier (for multi-layer sources such as vector sources). Defaults to `nil`.
    ///   - callback: The `feature state operation callback` called when the operation completes or ends.
    ///
    /// - Returns: A `cancelable` object that could be used to cancel the pending operation.
    @discardableResult
    @objc public func resetFeatureStates(sourceId: String, sourceLayerId: String? = nil, callback: @escaping (Error?) -> Void) -> TMBCancelable {
        let  cancellable = origin.resetFeatureStates(sourceId: sourceId, sourceLayerId: sourceLayerId) { result in
            switch(result){
            case .success(_):
                callback(nil)
            case .failure(let error):
                callback(error)
            }
        }
        
        return TMBCancelable(cancelable: cancellable)
    }
}
