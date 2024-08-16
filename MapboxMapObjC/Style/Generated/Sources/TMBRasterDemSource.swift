// This file is generated.
import Foundation
import MapboxMaps

/// A RGB-encoded raster DEM source
///
/// - SeeAlso: [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/#raster_dem)
@objc open class TMBRasterDemSource: NSObject, TMBSource {
    @objc public init(id: String) {
        self.id = id
        self.type = TMBSourceType.rasterDem
    }

    @objc public let type: TMBSourceType
    @objc public let id: String

    /// A URL to a TileJSON resource. Supported protocols are `http:`, `https:`, and `mapbox://<Tileset ID>`. Required if `tiles` is not provided.
    @objc public var url: String?

    /// An array of one or more tile source URLs, as in the TileJSON spec. Required if `url` is not provided.
    @objc public var tiles: [String]?

    /// An array containing the longitude and latitude of the southwest and northeast corners of the source's bounding box in the following order: `[sw.lng, sw.lat, ne.lng, ne.lat]`. When this property is included in a source, no tiles outside of the given bounds are requested by Mapbox GL.
    /// Default value: [-180,-85.051129,180,85.051129].
    @objc public var bounds: [Double]?

    /// Minimum zoom level for which tiles are available, as in the TileJSON spec.
    /// Default value: 0.
    @objc public var minzoom: NSNumber?

    /// Maximum zoom level for which tiles are available, as in the TileJSON spec. Data from tiles at the maxzoom are used when displaying the map at higher zoom levels.
    /// Default value: 22.
    @objc public var maxzoom: NSNumber?

    /// The minimum visual size to display tiles for this layer. Only configurable for raster layers.
    /// Default value: 512.
    @objc public var tileSize: NSNumber?

    /// Contains an attribution to be displayed when the map is shown to a user.
    @objc public var attribution: String?

    /// The encoding used by this source. Mapbox Terrain RGB is used by default
    /// Default value: "mapbox".
    @objc public var encoding: TMBEncoding?

    /// A setting to determine whether a source's tiles are cached locally.
    /// Default value: false.
    @objc public var volatile: NSNumber?

    /// When loading a map, if PrefetchZoomDelta is set to any number greater than 0, the map will first request a tile at zoom level lower than zoom - delta, but so that the zoom level is multiple of delta, in an attempt to display a full map at lower resolution as quick as possible. It will get clamped at the tile source minimum zoom.
    /// Default value: 4.
    @objc public var prefetchZoomDelta: NSNumber?

    /// This property defines a source-specific resource budget, either in tile units or in megabytes. Whenever the tile cache goes over the defined limit, the least recently used tile will be evicted from the in-memory cache. Note that the current implementation does not take into account resources allocated by the visible tiles.
    @objc public var tileCacheBudget: TMBTileCacheBudgetSize?

    /// Minimum tile update interval in seconds, which is used to throttle the tile update network requests. If the given source supports loading tiles from a server, sets the minimum tile update interval. Update network requests that are more frequent than the minimum tile update interval are suppressed.
    /// Default value: 0.
    @objc public var minimumTileUpdateInterval: NSNumber?

    /// When a set of tiles for a current zoom level is being rendered and some of the ideal tiles that cover the screen are not yet loaded, parent tile could be used instead. This might introduce unwanted rendering side-effects, especially for raster tiles that are overscaled multiple times. This property sets the maximum limit for how much a parent tile can be overscaled.
    @objc public var maxOverscaleFactorForParentTiles: NSNumber?

    /// For the tiled sources, this property sets the tile requests delay. The given delay comes in action only during an ongoing animation or gestures. It helps to avoid loading, parsing and rendering of the transient tiles and thus to improve the rendering performance, especially on low-end devices.
    /// Default value: 0.
    @objc public var tileRequestsDelay: NSNumber?

    /// For the tiled sources, this property sets the tile network requests delay. The given delay comes in action only during an ongoing animation or gestures. It helps to avoid loading the transient tiles from the network and thus to avoid redundant network requests. Note that tile-network-requests-delay value is superseded with tile-requests-delay property value, if both are provided.
    /// Default value: 0.
    @objc public var tileNetworkRequestsDelay: NSNumber?

}

extension TMBRasterDemSource {
    func mapTo(_ source: inout RasterDemSource) {
        source.url = self.url
        source.tiles = self.tiles
        source.bounds = self.bounds
        source.minzoom = self.minzoom?.double()
        source.maxzoom = self.maxzoom?.double()
        source.tileSize = self.tileSize?.double()
        source.attribution = self.attribution
        source.encoding = self.encoding?.encoding()
        source.volatile = self.volatile?.bool()
        source.prefetchZoomDelta = self.prefetchZoomDelta?.double()
        source.tileCacheBudget = self.tileCacheBudget?.tileCacheBudgetSize()
        source.minimumTileUpdateInterval = self.minimumTileUpdateInterval?.double()
        source.maxOverscaleFactorForParentTiles = self.maxOverscaleFactorForParentTiles?.double()
        source.tileRequestsDelay = self.tileRequestsDelay?.double()
        source.tileNetworkRequestsDelay = self.tileNetworkRequestsDelay?.double()
    }
}

extension RasterDemSource {
    func mapTo(_ source:inout TMBRasterDemSource) {
        source.url = self.url
        source.tiles = self.tiles
        source.bounds = self.bounds
        source.minzoom = self.minzoom?.double()
        source.maxzoom = self.maxzoom?.double()
        source.tileSize = self.tileSize?.double()
        source.attribution = self.attribution
        source.encoding = self.encoding?.wrap()
        source.volatile = self.volatile?.bool()
        source.prefetchZoomDelta = self.prefetchZoomDelta?.double()
        source.tileCacheBudget = self.tileCacheBudget?.wrap()
        source.minimumTileUpdateInterval = self.minimumTileUpdateInterval?.double()
        source.maxOverscaleFactorForParentTiles = self.maxOverscaleFactorForParentTiles?.double()
        source.tileRequestsDelay = self.tileRequestsDelay?.double()
        source.tileNetworkRequestsDelay = self.tileNetworkRequestsDelay?.double()
    }
}

extension TMBRasterDemSource: SwiftValueConvertible {
    public func unwrap() -> RasterDemSource {
        var result = RasterDemSource(id: self.id)
        self.mapTo(&result)
        return result
    }
}

extension RasterDemSource {
    func wrap() ->  TMBRasterDemSource {
        var result = TMBRasterDemSource(id: self.id)
        self.mapTo(&result)
        return result
    }
}