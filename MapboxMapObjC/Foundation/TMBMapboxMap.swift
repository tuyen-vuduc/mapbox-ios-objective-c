// swiftlint:disable file_length
import MapboxCoreMaps
import MapboxMaps
import UIKit
import Turf
@_implementationOnly import MapboxCommon_Private
@_implementationOnly import MapboxCoreMaps_Private

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
@objc open class TMBMapboxMap: NSObject {
    private var _self: MapboxMap
    init(_ _self: MapboxMap) {
        self._self = _self
        self.style = TMBStyle(_self.style)
    }
    
    /// The `style` object supports run time styling.
    @objc public let style: TMBStyle

    // MARK: - Render loop

    /// Triggers a repaint of the map. Calling this method is typically unnecessary but
    /// may be needed if using a custom layer that needs to be redrawn independently
    /// of other map changes.
    @objc public func triggerRepaint() {
        _self.triggerRepaint()
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
    @objc public func loadStyleURI(_ styleUri: String, completion: ((TMBStyle?, Error?) -> Void)?) {
        let uri = StyleURI(url: URL(string: styleUri)!)!
        _self.loadStyleURI(uri) { result in
            guard let completion = completion else {
                return
            }
            
            switch(result) {
                case .success(let style):
                    completion(TMBStyle(style), nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }

    /// Loads a `style` from a JSON string, calling a completion closure when the
    /// style is fully loaded or there has been an error during load.
    ///
    /// - Parameters:
    ///   - styleURI: Style JSON string
    ///   - completion: Closure called when the style has been fully loaded. The
    ///     `Result` type encapsulates the `Style` or error that occurred. See
    ///     `MapLoadingError`
    @objc public func loadStyleJSON(_ JSON: String, completion: ((TMBStyle?, Error?) -> Void)?) {
        _self.loadStyleJSON(JSON) { result in
            guard let completion = completion else {
                return
            }
            
            switch(result) {
                case .success(let style):
                    completion(TMBStyle(style), nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
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
            return _self.prefetchZoomDelta
        }
        set {
            _self.prefetchZoomDelta = newValue
        }
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
            return _self.shouldRenderWorldCopies
        }
        set {
            _self.shouldRenderWorldCopies = newValue
        }
    }

    /// Gets the resource options for the map.
    ///
    /// All optional fields of the returned object are initialized with the
    /// actual values.
    ///
    /// - Note: The result of this property is different from the `ResourceOptions`
    /// that were provided to the map's initializer.
    @objc public var resourceOptions: MapboxCoreMaps.ResourceOptions {
        return MapboxCoreMaps.ResourceOptions(_self.resourceOptions)
    }

    /// Clears temporary map data.
    ///
    /// Clears temporary map data from the data path defined in the given resource
    /// options. Useful to reduce the disk usage or in case the disk cache contains
    /// invalid data.
    ///
    /// - Note: Calling this API will affect all maps that use the same data path
    ///         and does not affect persistent map data like offline style packages.
    ///
    /// - Parameters:
    ///   - resourceOptions: The `resource options` that contain the map data path
    ///         to be used
    ///   - completion: Called once the request is complete
    @objc public static func clearData(for resourceOptions: MapboxCoreMaps.ResourceOptions, completion: @escaping (Error?) -> Void) {
        MapboxMap.clearData(for: ResourceOptions(resourceOptions), completion: completion)
    }

    /// Gets elevation for the given coordinate.
    ///
    /// - Note: Elevation is only available for the visible region on the screen.
    ///
    /// - Parameter coordinate: Coordinate for which to return the elevation.
    /// - Returns: Elevation (in meters) multiplied by current terrain
    ///     exaggeration, or empty if elevation for the coordinate is not available.
    @objc public func elevation(at coordinate: CLLocationCoordinate2D) -> NSNumber? {
        if let elevation = _self.elevation(at: coordinate) {
            return NSNumber(value: elevation)
        }
        
        return nil
    }

    // MARK: - Camera Fitting

    /// Transforms a view's frame into a set of coordinate bounds
    /// - Parameter rect: The `rect` whose bounds will be transformed into a set of map coordinate bounds.
    /// - Returns: A `CoordinateBounds` object that represents the southwest and northeast corners of the view's bounds.
    @objc public func coordinateBounds(for rect: CGRect) -> CoordinateBounds {
        return _self.coordinateBounds(for: rect)
    }

    /// Transforms a set of map coordinate bounds to a `CGRect` relative to the `MapView`.
    /// - Parameter coordinateBounds: The `coordinateBounds` that will be converted into a rect relative to the `MapView`
    /// - Returns: A `CGRect` whose corners represent the vertices of a set of `CoordinateBounds`.
    @objc public func rect(for coordinateBounds: CoordinateBounds) -> CGRect {
        return _self.rect(for: coordinateBounds)
    }

    // MARK: Debug options
    /// The array of `MapDebugOptions`. Setting this property to an empty array
    /// disables previously enabled `MapDebugOptions`.
    /// The default value is an empty array.
    @objc public var debugOptions: [NSNumber] {
        get {
            return _self.debugOptions.map{
                return NSNumber(value: $0.rawValue)
            }
        }
        set {
            let debugOptions = newValue.map {
                return MapDebugOptions(rawValue: $0.intValue)!
            }
            
            _self.debugOptions = debugOptions;
        }
    }

    /// Returns the map's options
    @objc public var options: MapOptions {
        return _self.options
    }

    /// Calculates a `CameraOptions` to fit a `CoordinateBounds`
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameters:
    ///   - coordinateBounds: The coordinate bounds that will be displayed within the viewport.
    ///   - padding: The new padding to be used by the camera.
    ///   - bearing: The new bearing to be used by the camera.
    ///   - pitch: The new pitch to be used by the camera.
    /// - Returns: A `CameraOptions` that fits the provided constraints
    @objc public func camera(forCoordinateBounds coordinateBounds: CoordinateBounds,
                       padding: UIEdgeInsets,
                       bearing: NSNumber?,
                     pitch: NSNumber?) -> MapboxCoreMaps.CameraOptions {
        let camereaOptions = _self.camera(
            for: coordinateBounds,
            padding: padding,
            bearing: bearing?.doubleValue,
            pitch: pitch?.doubleValue)
        return MapboxCoreMaps.CameraOptions(camereaOptions)
    }

    /// Calculates a `CameraOptions` to fit a list of coordinates.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameters:
    ///   - coordinates: Array of coordinates that should fit within the new viewport.
    ///   - padding: The new padding to be used by the camera.
    ///   - bearing: The new bearing to be used by the camera.
    ///   - pitch: The new pitch to be used by the camera.
    /// - Returns: A `CameraOptions` that fits the provided constraints
    @objc public func camera(forCoordinates coordinates: [NSValue],
                       padding: UIEdgeInsets,
                       bearing: NSNumber?,
                       pitch: NSNumber?) -> MapboxCoreMaps.CameraOptions {
        let camereaOptions = _self.camera(
            for: coordinates.map { $0.coordinateValue() },
            padding: padding,
            bearing: bearing?.doubleValue,
            pitch: pitch?.doubleValue)
        return MapboxCoreMaps.CameraOptions(camereaOptions)
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
                             camera: MapboxCoreMaps.CameraOptions,
                             rect: CGRect) -> MapboxCoreMaps.CameraOptions {
        let camereaOptions = _self.camera(
            for: coordinates.map { $0.coordinateValue() },
            camera: CameraOptions(camera),
            rect: rect)
        return MapboxCoreMaps.CameraOptions(camereaOptions)
    }

    /// Calculates a `CameraOptions` to fit a geometry
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameters:
    ///   - geometry: The geoemtry that will be displayed within the viewport.
    ///   - padding: The new padding to be used by the camera.
    ///   - bearing: The new bearing to be used by the camera.
    ///   - pitch: The new pitch to be used by the camera.
    /// - Returns: A `CameraOptions` that fits the provided constraints
    @objc public func camera(for geometry: MapboxCommon.Geometry,
                       padding: UIEdgeInsets,
                       bearing: NSNumber?,
                       pitch: NSNumber?) -> MapboxCoreMaps.CameraOptions {
        let camereaOptions = _self.camera(
            for: Geometry(geometry)!,
            padding: padding,
            bearing: bearing?.CGFloat,
            pitch: pitch?.CGFloat)
        return MapboxCoreMaps.CameraOptions(camereaOptions)
    }

    // MARK: - CameraOptions to CoordinateBounds

    /// Returns the coordinate bounds corresponding to a given `CameraOptions`
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter camera: The camera for which the coordinate bounds will be returned.
    /// - Returns: `CoordinateBounds` for the given `CameraOptions`
    @objc public func coordinateBounds(forCameraBounds camera: MapboxCoreMaps.CameraOptions) -> CoordinateBounds {
        return _self.coordinateBounds(for: CameraOptions(camera))
    }

    /// Returns the unwrapped coordinate bounds to a given ``CameraOptions``.
    ///
    /// This function is particularly useful, if the camera shows the antimeridian.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter camera: The camera for which the coordinate bounds will be returned.
    /// - Returns: `CoordinateBounds` for the given ``CameraOptions``.
    @objc public func coordinateBoundsUnwrapped(for camera: MapboxCoreMaps.CameraOptions) -> CoordinateBounds {
        return _self.coordinateBoundsUnwrapped(for: CameraOptions(camera))
    }

    /// Returns the coordinate bounds and zoom for a given `CameraOptions`.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter camera: The camera for which the `CoordinateBoundsZoom` will be returned.
    /// - Returns: `CoordinateBoundsZoom` for the given `CameraOptions`
    @objc public func coordinateBoundsZoom(for camera: MapboxCoreMaps.CameraOptions) -> CoordinateBoundsZoom {
        return _self.coordinateBoundsZoom(for: CameraOptions(camera))
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
    @objc public func coordinateBoundsZoomUnwrapped(for camera: MapboxCoreMaps.CameraOptions) -> CoordinateBoundsZoom {
        return _self.coordinateBoundsZoomUnwrapped(for: CameraOptions(camera))
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
        return _self.coordinate(for: point)
    }

    /// Converts a map coordinate to a `CGPoint`, relative to the `MapView`.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter coordinate: The coordinate to convert.
    /// - Returns: A `CGPoint` relative to the `UIView`. If the point is outside of the bounds
    ///     of `MapView` the returned point contains `-1.0` for both coordinates.
    @objc public func point(for coordinate: CLLocationCoordinate2D) -> CGPoint {
        return _self.point(for: coordinate)
    }

    /// Converts map coordinates to an array of `CGPoint`, relative to the `MapView`.
    ///
    /// This API isn't supported by Globe projection.
    ///
    /// - Parameter coordinates: The coordinate to convert.
    /// - Returns: An array of `CGPoint` relative to the `UIView.
    /// If a coordinate's point is outside of map view's bounds, it will be `(-1, -1)`
    @objc public func points(for coordinates: [CLLocationCoordinate2D]) -> [NSValue] {
        return _self.points(for: coordinates).map { NSValue(cgPoint: $0) }
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
        return _self.coordinates(for: points.map { $0.cgPointValue }).map { NSValue(mkCoordinate: $0) }
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
    @objc public func setCamera(to cameraOptions: MapboxCoreMaps.CameraOptions) {
        _self.setCamera(to: CameraOptions(cameraOptions))
    }

    /// Returns the current camera state
    @objc public var cameraState: MapboxCoreMaps.CameraState {
        return MapboxCoreMaps.CameraState(_self.cameraState)
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
            return _self.freeCameraOptions
        }
        set {
            _self.freeCameraOptions = newValue
        }
    }

    /// Returns the bounds of the map.
    @objc public var cameraBounds: MapboxCoreMaps.CameraBounds {
        return MapboxCoreMaps.CameraBounds(_self.cameraBounds)
    }

    /// Sets the bounds of the map.
    ///
    /// - Parameter options: New camera bounds. Nil values will not take effect.
    /// - Throws: `MapError`
    @objc public func setCameraBounds(with options: MapboxCoreMaps.CameraBoundsOptions, completion: ((Error?)->Void)?) {
        do {
            try _self.setCameraBounds(with: CameraBoundsOptions(options))
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    // MARK: - Drag API

    /// Prepares the drag gesture to use the provided screen coordinate as a pivot
    /// point. This function should be called each time when user starts a
    /// dragging action (e.g. by clicking on the map). The following dragging
    /// will be relative to the pivot.
    ///
    /// - Parameter point: Screen point
    @objc public func dragStart(for point: CGPoint) {
        _self.dragStart(for: point)
    }

    /// Calculates target point where camera should move after drag. The method
    /// should be called after `dragStart` and before `dragEnd`.
    ///
    /// - Parameters:
    ///   - fromPoint: The point from which the map is dragged.
    ///   - toPoint: The point to which the map is dragged.
    ///
    /// - Returns:
    ///     The camera options object showing end point.
    @objc public func dragCameraOptions(from: CGPoint, to: CGPoint) -> MapboxCoreMaps.CameraOptions {
        return MapboxCoreMaps.CameraOptions(_self.dragCameraOptions(from: from, to: to))
    }

    /// Ends the ongoing drag gesture. This function should be called always after
    /// the user has ended a drag gesture initiated by `dragStart`.
    @objc public func dragEnd() {
        _self.dragEnd()
    }

    // MARK: - Gesture and Animation Flags

    /// If implementing a custom animation mechanism, call this method when the animation begins.
    /// Must always be paired with a corresponding call to `endAnimation()`
    @objc public func beginAnimation() {
        _self.beginAnimation()
    }

    /// If implementing a custom animation mechanism, call this method when the animation ends.
    /// Must always be paired with a corresponding call to `beginAnimation()`
    @objc public func endAnimation() {
        _self.endAnimation()
    }

    /// If implementing a custom gesture, call this method when the gesture begins.
    /// Must always be paired with a corresponding call to `endGesture()`
    @objc public func beginGesture() {
        _self.beginGesture()
    }

    /// If implementing a custom gesture, call this method when the gesture ends.
    /// Must always be paired with a corresponding call to `beginGesture()`
    @objc public func endGesture() {
        _self.endGesture()
    }
}

// swiftlint:enable type_body_length

// MARK: - MapFeatureQueryable

extension TMBMapboxMap {
    @discardableResult
    @objc public func queryRenderedFeatures(withShape shape: [CGPoint],
                                            options: RenderedQueryOptions? = nil,
                                            completion: (([QueriedFeature]?, Error?)->Void)?) -> TMBCancelable {
        let cancelable = _self.queryRenderedFeatures(with: shape, options: options) { result in
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
                                            completion: (([QueriedFeature]?, Error?)->Void)?) -> TMBCancelable {
        let cancelable = _self.queryRenderedFeatures(with: rect, options: options) { result in
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
                                            completion: (([QueriedFeature]?, Error?)->Void)?) -> TMBCancelable {
        let cancelable = _self.queryRenderedFeatures(with: point, options: options) { result in
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
                                          completion: (([QueriedFeature]?, Error?)->Void)?) {
        _self.querySourceFeatures(for: sourceId, options: options) { result in
            switch result {
            case .success(let features):
                completion?(features, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }

    /// Queries for feature extension values in a GeoJSON source.
    ///
    /// - Parameters:
    ///   - sourceId: The identifier of the source to query.
    ///   - feature: Feature to look for in the query.
    ///   - extension: Currently supports keyword `supercluster`.
    ///   - extensionField: Currently supports following three extensions:
    ///
    ///       1. `children`: returns the children of a cluster (on the next zoom
    ///         level).
    ///       2. `leaves`: returns all the leaves of a cluster (given its cluster_id)
    ///       3. `expansion-zoom`: returns the zoom on which the cluster expands
    ///         into several children (useful for "click to zoom" feature).
    ///
    ///   - args: Used for further query specification when using 'leaves'
    ///         extensionField. Now only support following two args:
    ///
    ///       1. `limit`: the number of points to return from the query (must
    ///             use type 'UInt64', set to maximum for all points)
    ///       2. `offset`: the amount of points to skip (for pagination, must
    ///             use type 'UInt64')
    ///
    ///   - completion: The result could be a feature extension value containing
    ///         either a value (expansion-zoom) or a feature collection (children
    ///         or leaves). An error is passed if the operation was not successful.
    /// Deprecated. Use getGeoJsonClusterLeaves/getGeoJsonClusterChildren/getGeoJsonClusterExpansionZoom to instead.
    @objc public func queryFeatureExtension(for sourceId: String,
                                            feature: MapboxCommon.Feature,
                                            extension: String,
                                            extensionField: String,
                                            args: [String: Any]? = nil,
                                            completion: ((FeatureExtensionValue?, Error?)->Void)?) {
        let xfeature = Turf.Feature(feature)
        _self.queryFeatureExtension(
            for: sourceId,
            feature: xfeature,
            extension: `extension`,
            extensionField: extensionField,
            args: args) { result in
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
        _self.getGeoJsonClusterLeaves(
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
        _self.getGeoJsonClusterChildren(
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
        _self.getGeoJsonClusterExpansionZoom(
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
    /// Subscribes an observer to a list of events.
    ///
    /// `MapboxMap` holds a strong reference to `observer` while it is subscribed. To stop receiving
    /// notifications, pass the same `observer` to `unsubscribe(_:events:)`.
    ///
    /// - Parameters:
    ///   - observer: An object that will receive events of the types specified by `events`
    ///   - events: Array of event types to deliver to `observer`
    ///
    /// - Note:
    ///     Prefer `onNext(eventTypes:handler:)`, `onNext(_:handler:)`, and
    ///     `onEvery(_:handler:)` to using this lower-level APIs
    @objc public func subscribe(_ observer: Observer, events: [String]) {
        _self.subscribe(observer, events: events)
    }

    /// Unsubscribes an observer from a provided list of event types.
    ///
    /// `MapboxMap` holds a strong reference to `observer` while it is subscribed. To stop receiving
    /// notifications, pass the same `observer` to this method as was passed to
    /// `subscribe(_:events:)`.
    ///
    /// - Parameters:
    ///   - observer: The object to unsubscribe
    ///   - events: Array of event types to unsubscribe from. Pass an
    ///     empty array (the default) to unsubscribe from all events.
    @objc public func unsubscribe(_ observer: Observer, events: [String] = []) {
        _self.unsubscribe(observer, events: events)
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
    @objc public func clearData(completion: @escaping (Error?) -> Void) {
        TMBMapboxMap.clearData(for: resourceOptions, completion: completion)
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
    @objc public func setFeatureState(sourceId: String, sourceLayerId: String? = nil, featureId: String, state: [String: Any]) {
        _self.setFeatureState(
            sourceId: sourceId,
            sourceLayerId: sourceLayerId,
            featureId: featureId,
            state: state)
    }

    /// Get the state map of a feature within a style source.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier.
    ///   - sourceLayerId: Style source layer identifier (for multi-layer sources such as vector sources).
    ///   - featureId: Identifier of the feature whose state should be queried.
    ///   - callback: Feature's state map or an empty map if the feature could not be found.
    @objc public func getFeatureState(sourceId: String, sourceLayerId: String? = nil, featureId: String, callback: @escaping ([String: Any]?, Error?) -> Void) {
        _self.getFeatureState(sourceId: sourceId,
                              sourceLayerId: sourceLayerId,
                              featureId: featureId) { result in
            switch(result) {
            case .success(let value):
                callback(value, nil)
            case .failure(let error):
                callback(nil, error)
            }
        }
    }

    /// Removes entries from a feature state object.
    /// Remove a specified property or all property from a feature's state object, depending on the value of `stateKey`.
    ///
    /// - Parameters:
    ///   - sourceId: The style source identifier
    ///   - sourceLayerId: The style source layer identifier (for multi-layer sources such as vector sources). Defaults to `nil`.
    ///   - featureId: The feature identifier of the feature whose state should be removed.
    ///   - stateKey: The key of the property to remove. If `nil`, all feature's state object properties are removed. Defaults to `nil`.
    @objc public func removeFeatureState(sourceId: String, sourceLayerId: String? = nil, featureId: String, stateKey: String? = nil) {
        _self.removeFeatureState(sourceId: sourceId,
                                 sourceLayerId: sourceLayerId,
                                 featureId: featureId,
                                 stateKey: stateKey)
    }
}

extension MapboxMaps.CameraState {
    internal init(_ objcValue: MapboxCoreMaps.CameraState) {
        self.init(center: objcValue.center,
                  padding: UIEdgeInsets(objcValue.padding),
                  zoom: objcValue.zoom,
                  bearing: objcValue.bearing,
                  pitch: objcValue.pitch)
    }
}

extension MapboxCoreMaps.CameraState {
    internal convenience init(_ swiftValue: MapboxMaps.CameraState) {
        self.init(
            center: swiftValue.center,
            padding: MapboxCoreMaps.EdgeInsets(swiftValue.padding),
            zoom:swiftValue.zoom,
            bearing:swiftValue.bearing,
            pitch:swiftValue.pitch)
    }
}

extension MapboxCoreMaps.EdgeInsets {
    internal convenience init(_ swiftValue: UIEdgeInsets) {
        self.init(
            top: swiftValue.top,
            left: swiftValue.left,
            bottom: swiftValue.bottom,
            right: swiftValue.right)
    }
}
extension UIEdgeInsets {
    internal init(_ objcValue: MapboxCoreMaps.EdgeInsets) {
        self.init(
            top: objcValue.top,
            left: objcValue.left,
            bottom: objcValue.bottom,
            right: objcValue.right)
    }
}

/// Holds information about camera bounds.
extension MapboxCoreMaps.CameraBounds {
    internal convenience init(_ swiftValue: MapboxMaps.CameraBounds) {
        self.init(
            bounds: swiftValue.bounds,
            maxZoom: swiftValue.maxZoom,
            minZoom: swiftValue.minZoom,
            maxPitch: swiftValue.maxPitch,
            minPitch: swiftValue.minPitch)
    }
}

extension MapboxMaps.CameraBoundsOptions {
    internal init(_ objcValue: MapboxCoreMaps.CameraBoundsOptions) {
        self.init(
            bounds: objcValue.bounds,
            maxZoom: objcValue.__maxZoom?.CGFloat,
            minZoom: objcValue.__minZoom?.CGFloat,
            maxPitch: objcValue.__maxPitch?.CGFloat,
            minPitch: objcValue.__minPitch?.CGFloat)
    }
}


extension TMBMapboxMap {
    /// The style has been fully loaded, and the map has rendered all visible tiles.
    @discardableResult
    @objc public func onMapLoaded(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .mapLoaded) { data in
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// Describes an error that has occurred while loading the Map. The `type` property defines what resource could
    /// not be loaded and the `message` property will contain a descriptive error message.
    /// In case of `source` or `tile` loading errors, `source-id` will contain the id of the source failing.
    /// In case of `tile` loading errors, `tile-id` will contain the id of the tile.
    @discardableResult
    @objc public func onMapLoadingError(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .mapLoadingError) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The map has entered the idle state. The map is in the idle state when there are no ongoing transitions
    /// and the map has rendered all requested non-volatile tiles. The event will not be emitted if `setUserAnimationInProgress`
    /// and / or `setGestureInProgress` is set to `true`.
    @discardableResult
    @objc public func onMapIdle(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .mapIdle) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The requested style data has been loaded. The `type` property defines what kind of style data has been loaded.
    /// Event may be emitted synchronously, for example, when `setStyleJSON` is used to load style.
    ///
    /// Based on an event data `type` property value, following use-cases may be implemented:
    /// - `style`: Style is parsed, style layer properties could be read and modified, style layers and sources could be
    /// added or removed before rendering is started.
    /// - `sprite`: Style's sprite sheet is parsed and it is possible to add or update images.
    /// - `sources`: All sources defined by the style are loaded and their properties could be read and updated if needed.
    @discardableResult
    @objc public func onStyleDataLoaded(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .styleDataLoaded) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The requested style has been fully loaded, including the style, specified sprite and sources' metadata.
    ///
    /// Note: The style specified sprite would be marked as loaded even with sprite loading error (An error will be emitted via `.mapLoadingError`).
    /// Sprite loading error is not fatal and we don't want it to block the map rendering, thus this event will still be emitted if style and sources are fully loaded.
    @discardableResult
    @objc public func onStyleLoaded(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .styleLoaded) { data in
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// A style has a missing image. This event is emitted when the map renders visible tiles and
    /// one of the required images is missing in the sprite sheet. Subscriber has to provide the missing image
    /// by calling ``Style/addImage(_:id:sdf:contentInsets:)``.
    @discardableResult
    @objc public func onStyleImageMissing(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .styleImageMissing) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// An image added to the style is no longer needed and can be removed using ``Style/removeImage(withId:)``.
    @discardableResult
    @objc public func onStyleImageRemoveUnused(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .styleImageRemoveUnused) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// A source data has been loaded.
    /// Event may be emitted synchronously in cases when source's metadata is available when source is added to the style.
    ///
    /// The `id` property defines the source id.
    ///
    /// The `type` property defines if source's metadata (e.g., TileJSON) or tile has been loaded. The property of `metadata`
    /// value might be useful to identify when particular source's metadata is loaded, thus all source's properties are
    /// readable and can be updated before map will start requesting data to be rendered.
    ///
    /// The `loaded` property will be set to `true` if all source's data required for visible viewport of the map, are loaded.
    /// The `tile-id` property defines the tile id if the `type` field equals `tile`.
    @discardableResult
    @objc public func onSourceDataLoaded(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .sourceDataLoaded) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The source has been added with ``Style/addSource(_:id:)`` or ``Style/addSource(withId:properties:)``.
    /// The event is emitted synchronously, therefore, it is possible to immediately
    /// read added source's properties.
    @discardableResult
    @objc public func onSourceAdded(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .sourceAdded) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The source has been removed with ``Style/removeSource(withId:)``.
    /// The event is emitted synchronously, thus, ``Style/allSourceIdentifiers`` will be
    /// in sync when the observer receives the notification.
    @discardableResult
    @objc public func onSourceRemoved(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .sourceRemoved) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The map finished rendering a frame.
    /// The `render-mode` property tells whether the map has all data (`full`) required to render the visible viewport.
    /// The `needs-repaint` property provides information about ongoing transitions that trigger map repaint.
    /// The `placement-changed` property tells if the symbol placement has been changed in the visible viewport.
    @discardableResult
    @objc public func onRenderFrameStarted(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .renderFrameStarted) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The camera has changed. This event is emitted whenever the visible viewport
    /// changes due to the MapView's size changing or when the camera
    /// is modified by calling camera methods. The event is emitted synchronously,
    /// so that an updated camera state can be fetched immediately.
    @discardableResult
    @objc public func onRenderFrameFinished(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .renderFrameFinished) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The camera has changed. This event is emitted whenever the visible viewport
    /// changes due to the MapView's size changing or when the camera
    /// is modified by calling camera methods. The event is emitted synchronously,
    /// so that an updated camera state can be fetched immediately.
    @discardableResult
    @objc public func onEvenCameraChanged(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .cameraChanged) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// The `ResourceRequest` event allows client to observe resource requests made by a
    /// map or snapshotter.
    @discardableResult
    @objc public func onResourceRequest(_ handler: @escaping (Any) -> Void) -> TMBCancelable {
        let cancelable = _self.onNext(event: .resourceRequest) { data in
            // TODO Convert data to obj-c data
            handler([
                "name": data.name
            ])
        }
        
        return TMBCancelable(cancelable: cancelable)
    }
}
