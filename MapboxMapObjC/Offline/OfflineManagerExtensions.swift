import MapboxCoreMaps
import MapboxMaps

@objc
extension OfflineManager {

    /// Loads a new style package or updates the existing one.
    ///
    /// - Parameters:
    ///   - styleURI: The URI of the style package's associated style
    ///   - loadOptions: The style package load options.
    ///   - progress: Invoked multiple times to report progress of the loading
    ///         operation.
    ///   - completion: Invoked only once upon success, failure, or cancelation
    ///         of the loading operation. Any `Result` error could be of type
    ///         `StylePackError`.
    /// - Returns: Returns a Cancelable object to cancel the load request
    ///
    /// If a style package with the given id already exists, it is updated with
    /// the values provided to the given load options. The missing resources get
    /// loaded and the expired resources get updated.
    ///
    /// If there no values provided to the given load options, the existing
    /// style package gets refreshed: the missing resources get loaded and the
    /// expired resources get updated.
    ///
    /// A failed load request can be reattempted with another `loadStylePack()` call.
    ///
    /// If the style cannot be fetched for any reason, the load request is terminated.
    /// If the style is fetched but loading some of the style package resources
    /// fails, the load request proceeds trying to load the remaining style package
    /// resources.
    ///
    /// - Important:
    ///     By default, users may download up to 750 tile packs for offline
    ///     use across all regions. If the limit is hit, any loadRegion call
    ///     will fail until excess regions are deleted. This limit is subject
    ///     to change. Please contact Mapbox if you require a higher limit.
    ///     Additional charges may apply.
    @discardableResult
    @objc
    public func loadStylePack(for styleUriString: String,
                              loadOptions: StylePackLoadOptions,
                              progress: StylePackLoadProgressCallback? = nil,
                              completion: @escaping (StylePack?, Error?) -> Void) -> TMBCancelable {
        let cancelable = self.loadStylePack(
            for: StyleURI(rawValue: styleUriString)!,
            loadOptions: loadOptions,
            progress: progress
        ) { result in
            switch(result) {
            case .success(let stylePack):
                completion(stylePack, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
        return TMBCancelable(cancelable: cancelable)
    }

    /// Fetch an array of the existing style packages.
    ///
    /// - Parameter completion: The result callback. Any `Result` error should
    ///         be of type `StylePackError`.
    ///
    /// - Note:
    ///     The user-provided callbacks will be executed on a worker thread; it
    ///     is the responsibility of the user to dispatch to a user-controlled
    ///     thread.
    @objc
    public func allStylePacks(_ completion: @escaping ([StylePack]?, Error?) -> Void) {
        self.allStylePacks { result in
            switch(result) {
            case .success(let stylePack):
                completion(stylePack, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    /// Returns a style package by its id.
    ///
    /// - Parameters:
    ///   - styleURI: The URI of the style package's associated style
    ///   - completion: The result callback. Any `Result` error could be of type
    ///         `StylePackError`.
    ///
    /// - Note:
    ///     The user-provided callbacks will be executed on a worker thread; it
    ///     is the responsibility of the user to dispatch to a user-controlled
    ///     thread.
    @objc
    public func stylePack(for styleUriString: String,
                          completion: @escaping (StylePack?, Error?) -> Void) {
        self.stylePack(
            for: StyleURI(rawValue: styleUriString)!
        ) { result in
            switch(result) {
            case .success(let stylePack):
                completion(stylePack, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    /// Returns a style package's associated metadata.
    ///
    /// - Parameters:
    ///   - styleURI: The URI of the style package's associated style
    ///   - completion: The result callback. Any `Result` error could be of type
    ///         `StylePackError`.
    ///
    /// The style package's associated metadata that a user previously set.
    @objc
    public func stylePackMetadata(for styleUriString: String,
                                  completion: @escaping (AnyObject?, Error?) -> Void) {
        self.stylePackMetadata(
            for: StyleURI(rawValue: styleUriString)!
        ) { result in
            switch(result) {
            case .success(let stylePack):
                completion(stylePack, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    /// Removes a style package.
    ///
    /// - Parameter styleURI: The URI of the style package's associated style
    /// - Parameter completion: The result callback. Any `Result` error could be of type ``StylePackError-swift.enum``.
    ///
    /// Removes a style package from the existing packages list. The actual
    /// resources eviction might be deferred. All pending loading operations for
    /// the style package with the given id will fail with Canceled error.
    @objc
    public func removeStylePack(for styleUriString: String,
                                completion: ((StylePack?, Error?) -> Void)? = nil) {
        self.removeStylePack(
            for: StyleURI(rawValue: styleUriString)!
        ) { result in
            switch(result) {
            case .success(let stylePack):
                completion?(stylePack, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
}
