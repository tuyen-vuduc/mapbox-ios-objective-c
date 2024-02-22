import MapboxCoreMaps
import MapboxMaps

@objc
extension TileStore {
    /// Returns a shared `TileStore` instance at the default location. Creates a
    /// new one if one doesn't yet exist.
    ///
    /// - See Also:
    ///     `shared(for:)`
    @objc
    public class func getDefault() -> TileStore {
        TileStore.default;
    }
    
    /// Gets a `TileStore` instance for the given storage path. Creates a new one
    /// if one doesn't exist.
    ///
    /// If the given path is empty, the tile store at the default location is
    /// returned.
    ///
    /// On iOS, this storage path is excluded from automatic cloud backup.
    ///
    /// - Parameter filePathURL: The path on disk where tiles and metadata will be stored
    /// - Returns: TileStore instance.
    @objc
    public static func shared(for filePathURL: URL) -> TileStore {
        TileStore.shared(for: filePathURL)
    }

    /// Loads a new tile region or updates the existing one.
    ///
    /// - Parameters:
    ///   - id: The tile region identifier.
    ///   - loadOptions: The tile region load options.
    ///   - progress: Invoked multiple times to report progress of the loading
    ///         operation. Optional, default is nil.
    ///   - completion: Invoked only once upon success, failure, or cancelation
    ///         of the loading operation. Any `Result` error could be of type
    ///         `TileRegionError`.
    ///
    /// - Returns: A `Cancelable` object to cancel the load request
    ///
    /// Creating of a new region requires providing both geometry and tileset
    /// descriptors to the given load options, otherwise the load request fails
    /// with `RegionNotFound` error.
    ///
    /// If a tile region with the given id already exists, it gets updated with
    /// the values provided to the given load options. The missing resources get
    /// loaded and the expired resources get updated.
    ///
    /// If there are no values provided to the given load options, the existing tile
    /// region gets refreshed: the missing resources get loaded and the expired
    /// resources get updated.
    ///
    /// A failed load request can be reattempted with another `loadTileRegion()` call.
    ///
    /// If there is already a pending loading operation for the tile region with
    /// the given id, the pending loading operation will fail with an error of
    /// `Canceled` type.
    ///
    /// - Note:
    ///     The user-provided callbacks will be executed on a
    ///     TileStore-controlled worker thread; it is the responsibility of the
    ///     user to dispatch to a user-controlled thread.
    ///
    /// - Important:
    ///     By default, users may download up to 750 tile packs for offline
    ///     use across all regions. If the limit is hit, any loadRegion call
    ///     will fail until excess regions are deleted. This limit is subject
    ///     to change. Please contact Mapbox if you require a higher limit.
    ///     Additional charges may apply.
    @discardableResult
    @objc
    public func loadTileRegion(forId id: String,
                               loadOptions: TileRegionLoadOptions,
                               progress: TileRegionLoadProgressCallback? = nil,
                               completion: @escaping (TileRegion?, Error?) -> Void) -> TMBCancelable {
        let cancelable = self.loadTileRegion(forId: id, loadOptions: loadOptions, progress: progress) { result in
            switch(result) {
            case .success(let tileRegion):
                completion(tileRegion, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
        
        return TMBCancelable(cancelable: cancelable)
    }

    /// Checks if a tile region with the given id contains all tilesets from all
    /// of the given tileset descriptors.
    ///
    /// - Parameters:
    ///   - id: The tile region identifier.
    ///   - descriptors: The array of tileset descriptors.
    ///   - completion: The result callback. Any `Result` error could be of type
    ///         `TileRegionError`.
    ///
    /// - Note:
    ///     The user-provided callbacks will be executed on a TileStore-controlled
    ///     worker thread; it is the responsibility of the user to dispatch to a
    ///     user-controlled thread.
    @objc
    public func tileRegionContainsDescriptors(forId id: String,
                                              descriptors: [TilesetDescriptor],
                                              completion: @escaping (Bool, Error?) -> Void) {
        self.tileRegionContainsDescriptors(forId: id, descriptors: descriptors) { result in
            switch(result) {
            case .success(let contains):
                completion(contains, nil)
            case .failure(let error):
                completion(false, error)
            }
        }
    }

    /// Fetch the array of the existing tile regions.
    ///
    /// - Parameter completion: The result callback. Any `Result` error should be
    ///         of type `TileRegionError`.
    ///
    /// - Note:
    ///     The user-provided callbacks will be executed on a TileStore-controlled
    ///     worker thread; it is the responsibility of the user to dispatch to a
    ///     user-controlled thread.
    @objc
    public func allTileRegions(_ completion: @escaping ([TileRegion]?, Error?) -> Void) {
        self.allTileRegions { result in
            switch(result) {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    /// Returns a tile region given its id.
    ///
    /// - Parameters:
    ///   - id: The tile region id.
    ///   - completion: The Result callback. Any `Result` error could be of type
    ///         `TileRegionError`.
    ///
    /// - Note:
    ///     The user-provided callbacks will be executed on a TileStore-controlled
    ///     worker thread; it is the responsibility of the user to dispatch to a
    ///     user-controlled thread.
    @objc
    public func tileRegion(forId id: String,
                           completion: @escaping (TileRegion?, Error?) -> Void) {
        self.tileRegion(forId: id) { result in
            switch(result) {
            case .success(let tileRegion):
                completion(tileRegion, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    /// Fetch a tile region's associated geometry
    ///
    /// The region associated geometry is provided by the client and it represents
    /// the area, which the tile region must cover. The actual regional geometry
    /// depends on the tiling scheme and might exceed the associated geometry.
    ///
    /// - Parameters:
    ///   - id: The tile region id.
    ///   - completion: The Result closure. Any `Result` error could be of type
    ///         `TileRegionError`.
    ///
    /// - Note:
    ///     The user-provided callbacks will be executed on a TileStore-controlled
    ///     worker thread; it is the responsibility of the user to dispatch to a
    ///     user-controlled thread.
    @objc
    public func tileRegionGeometry(forId id: String,
                                   completion: @escaping (MapboxCommon.Geometry?, Error?) -> Void) {
        self.tileRegionGeometry(forId: id) { result in
            switch(result) {
            case .success(let geometry):
                completion(MapboxCommon.Geometry(geometry), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    /// Fetch a tile region's associated metadata
    ///
    /// The region's associated metadata that a user previously set for this region.
    ///
    /// - Parameters:
    ///   - id: The tile region id.
    ///   - completion: The Result closure. Any `Result` error could be of type
    ///         `TileRegionError`.
    @objc
    public func tileRegionMetadata(forId id: String,
                                   completion: @escaping (Any?, Error?) -> Void) {
        self.tileRegionMetadata(forId: id) { result in
            switch(result) {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    /// Allows observing a tile store's activity
    /// - Parameter observer: The object to be notified when events occur. TileStore holds a strong reference to this object until the subscription is canceled.
    /// - Returns: An object that can be used to cancel the subscription.
    public func subscribe(_ observer: TMBTileStoreObserver) -> TMBCancelable {
        let wrapper = TMBTileStoreObserverWrapper(observer)
        let cancellable = self.subscribe(wrapper)
        return TMBCancelable(cancelable: cancellable)
    }

    /// An overloaded version of `removeTileRegion(forId:)` with a callback for feedback.
    /// On successful tile region removal, the given callback is invoked with the removed tile region.
    /// Otherwise, the given callback is invoked with an error.
    /// - Parameter id: The tile region identifier.
    /// - Parameter callback A callback to be invoked when a tile region was removed.
    @objc
    public func removeRegion(forId id: String, 
                             completion: @escaping (TileRegion?, Error?) -> Void) {
        self.removeRegion(forId: id) { result in
            switch(result) {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
