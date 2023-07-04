// This file is generated.
import Foundation
import MapboxMaps

/// A RGB-encoded raster DEM source
///
/// - SeeAlso: [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/#raster_dem)
@objc open class TMBRasterDemSource: TMBSource {
    private var _self: RasterDemSource
    
    @objc public init(id: String = UUID().uuidString) {
        self._self = RasterDemSource()
        super.init(self._self)
    }

    /// A URL to a TileJSON resource. Supported protocols are `http:`, `https:`, and `mapbox://<Tileset ID>`.
    public var url: String?

    /// An array of one or more tile source URLs, as in the TileJSON spec.
    public var tiles: [String]?

    /// An array containing the longitude and latitude of the southwest and northeast corners of the source's bounding box in the following order: `[sw.lng, sw.lat, ne.lng, ne.lat]`. When this property is included in a source, no tiles outside of the given bounds are requested by Mapbox GL.
    public var bounds: [Double]?

    /// Minimum zoom level for which tiles are available, as in the TileJSON spec.
    public var minzoom: Double?

    /// Maximum zoom level for which tiles are available, as in the TileJSON spec. Data from tiles at the maxzoom are used when displaying the map at higher zoom levels.
    public var maxzoom: Double?

    /// The minimum visual size to display tiles for this layer. Only configurable for raster layers.
    public var tileSize: Double?

    /// Contains an attribution to be displayed when the map is shown to a user.
    public var attribution: String?

    /// The encoding used by this source. Mapbox Terrain RGB is used by default
    public var encoding: Encoding?

    /// A setting to determine whether a source's tiles are cached locally.
    public var volatile: Bool?

    /// When loading a map, if PrefetchZoomDelta is set to any number greater than 0, the map will first request a tile at zoom level lower than zoom - delta, but so that the zoom level is multiple of delta, in an attempt to display a full map at lower resolution as quick as possible. It will get clamped at the tile source minimum zoom. The default delta is 4.
    public var prefetchZoomDelta: Double?

    /// Minimum tile update interval in seconds, which is used to throttle the tile update network requests. If the given source supports loading tiles from a server, sets the minimum tile update interval. Update network requests that are more frequent than the minimum tile update interval are suppressed.
    public var minimumTileUpdateInterval: Double?

    /// When a set of tiles for a current zoom level is being rendered and some of the ideal tiles that cover the screen are not yet loaded, parent tile could be used instead. This might introduce unwanted rendering side-effects, especially for raster tiles that are overscaled multiple times. This property sets the maximum limit for how much a parent tile can be overscaled.
    public var maxOverscaleFactorForParentTiles: Double?

    /// For the tiled sources, this property sets the tile requests delay. The given delay comes in action only during an ongoing animation or gestures. It helps to avoid loading, parsing and rendering of the transient tiles and thus to improve the rendering performance, especially on low-end devices.
    public var tileRequestsDelay: Double?

    /// For the tiled sources, this property sets the tile network requests delay. The given delay comes in action only during an ongoing animation or gestures. It helps to avoid loading the transient tiles from the network and thus to avoid redundant network requests. Note that tile-network-requests-delay value is superseded with tile-requests-delay property value, if both are provided.
    public var tileNetworkRequestsDelay: Double?
}
// End of generated file.