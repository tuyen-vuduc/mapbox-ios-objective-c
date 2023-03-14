import MapboxMaps

@objc
extension MapView {
    @objc public func addRasterDemSource(_ id: String, configure: (RasterDemSourceBuilder)->Void, onError: ((Error)->Void)?) -> Void {
        let sourceBuilder = RasterDemSourceBuilder()
        configure(sourceBuilder)
        
        let source = sourceBuilder.build()
        
        do {
            try self.mapboxMap.style.addSource(source, id: id)
        } catch {
            onError?(error)
        }
            
    }
}

@objc
open class RasterDemSourceBuilder : NSObject {
    func build() -> RasterDemSource {
        var result = RasterDemSource()
        result.url = url
        result.attribution = attribution
        result.bounds = bounds;
        
        switch(encoding) {
        case .mapbox: result.encoding = .mapbox
        case .terrarium: result.encoding = .terrarium
        default:break
        }
        
        result.maxOverscaleFactorForParentTiles = maxOverscaleFactorForParentTiles
        result.maxzoom = maxzoom
        result.minimumTileUpdateInterval = minimumTileUpdateInterval
        result.minzoom = minzoom
        result.prefetchZoomDelta = prefetchZoomDelta
        result.tileNetworkRequestsDelay = tileNetworkRequestsDelay
        result.tileRequestsDelay = tileRequestsDelay
        result.tileSize = tileSize
        result.tiles = tiles
        result.volatile = volatile
        
        
        return result;
    }
        
    /// A URL to a TileJSON resource. Supported protocols are `http:`, `https:`, and `mapbox://<Tileset ID>`.
    private var url: String?;
    @discardableResult
    @objc public func url(_ value: String?) -> RasterDemSourceBuilder {
        url = value
        
        return self
    }

    /// An array of one or more tile source URLs, as in the TileJSON spec.
    private var tiles: [String]?;
    @discardableResult
    @objc public func tiles(_ value: [String]?) -> RasterDemSourceBuilder {
        tiles = value
        
        return self
    }

    /// An array containing the longitude and latitude of the southwest and northeast corners of the source's bounding box in the following order: `[sw.lng, sw.lat, ne.lng, ne.lat]`. When this property is included in a source, no tiles outside of the given bounds are requested by Mapbox GL.
    private var bounds: [Double]?;
    @discardableResult
    @objc public func bounds(_ value: [Double]?) -> RasterDemSourceBuilder {
        bounds = value
        
        return self
    }

    /// Minimum zoom level for which tiles are available, as in the TileJSON spec.
    private var minzoom: Double?;
    @discardableResult
    @objc public func minzoom(_ value: Double) -> RasterDemSourceBuilder {
        minzoom = value
        
        return self
    }

    /// Maximum zoom level for which tiles are available, as in the TileJSON spec. Data from tiles at the maxzoom are used when displaying the map at higher zoom levels.
    private var maxzoom: Double?;
    @discardableResult
    @objc public func maxzoom(_ value: Double) -> RasterDemSourceBuilder {
        maxzoom = value
        
        return self
    }

    /// The minimum visual size to display tiles for this layer. Only configurable for raster layers.
    private var tileSize: Double?;
    @discardableResult
    @objc public func tileSize(_ value: Double) -> RasterDemSourceBuilder {
        tileSize = value
        
        return self
    }

    /// Contains an attribution to be displayed when the map is shown to a user.
    private var attribution: String?;
    @discardableResult
    @objc public func attribution(_ value: String?) -> RasterDemSourceBuilder {
        attribution = value
        
        return self
    }

    /// The encoding used by this source. Mapbox Terrain RGB is used by default
    private var encoding: MBXEncoding?;
    @discardableResult
    @objc public func encoding(_ value: MBXEncoding) -> RasterDemSourceBuilder {
        encoding = value
        
        return self
    }

    /// A setting to determine whether a source's tiles are cached locally.
    private var volatile: Bool?;
    @discardableResult
    @objc public func volatile(_ value: Bool) -> RasterDemSourceBuilder {
        volatile = value
        
        return self
    }

    /// When loading a map, if PrefetchZoomDelta is set to any number greater than 0, the map will first request a tile at zoom level lower than zoom - delta, but so that the zoom level is multiple of delta, in an attempt to display a full map at lower resolution as quick as possible. It will get clamped at the tile source minimum zoom. The default delta is 4.
    private var prefetchZoomDelta: Double?;
    @discardableResult
    @objc public func prefetchZoomDelta(_ value: Double) -> RasterDemSourceBuilder {
        prefetchZoomDelta = value
        
        return self
    }

    /// Minimum tile update interval in seconds, which is used to throttle the tile update network requests. If the given source supports loading tiles from a server, sets the minimum tile update interval. Update network requests that are more frequent than the minimum tile update interval are suppressed.
    private var minimumTileUpdateInterval: Double?;
    @discardableResult
    @objc public func minimumTileUpdateInterval(_ value: Double) -> RasterDemSourceBuilder {
        minimumTileUpdateInterval = value
        
        return self
    }

    /// When a set of tiles for a current zoom level is being rendered and some of the ideal tiles that cover the screen are not yet loaded, parent tile could be used instead. This might introduce unwanted rendering side-effects, especially for raster tiles that are overscaled multiple times. This property sets the maximum limit for how much a parent tile can be overscaled.
    private var maxOverscaleFactorForParentTiles: Double?;
    @discardableResult
    @objc public func maxOverscaleFactorForParentTiles(_ value: Double) -> RasterDemSourceBuilder {
        maxOverscaleFactorForParentTiles = value
        
        return self
    }

    /// For the tiled sources, this property sets the tile requests delay. The given delay comes in action only during an ongoing animation or gestures. It helps to avoid loading, parsing and rendering of the transient tiles and thus to improve the rendering performance, especially on low-end devices.
    private var tileRequestsDelay: Double?;
    @discardableResult
    @objc public func tileRequestsDelay(_ value: Double) -> RasterDemSourceBuilder {
        tileRequestsDelay = value
        
        return self
    }

    /// For the tiled sources, this property sets the tile network requests delay. The given delay comes in action only during an ongoing animation or gestures. It helps to avoid loading the transient tiles from the network and thus to avoid redundant network requests. Note that tile-network-requests-delay value is superseded with tile-requests-delay property value, if both are provided.
    private var tileNetworkRequestsDelay: Double?;
    @discardableResult
    @objc public func tileNetworkRequestsDelay(_ value: Double) -> RasterDemSourceBuilder {
        tileNetworkRequestsDelay = value
        
        return self
    }
}
