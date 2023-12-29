// This file is generated.
import Foundation
import MapboxMaps


/// A RGB-encoded raster DEM source
///
/// - SeeAlso: [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/#raster_dem)
@objc open class TMBRasterDemSource: NSObject, TMBSource {

    @objc public let  type: TMBSourceType
    @objc public let  id: String

    /// A URL to a TileJSON resource. Supported protocols are `http:`, `https:`, and `mapbox://<Tileset ID>`.
    @objc public var  url: String?

    /// An array of one or more tile source URLs, as in the TileJSON spec.
    @objc public var  tiles: [String]?

    /// An array containing the longitude and latitude of the southwest and northeast corners of the source's bounding box in the following order: `[sw.lng, sw.lat, ne.lng, ne.lat]`. When this property is included in a source, no tiles outside of the given bounds are requested by Mapbox GL.
    @objc public var  bounds: [Double]?

    /// Minimum zoom level for which tiles are available, as in the TileJSON spec.
    @objc public var  minzoom: NSNumber?

    /// Maximum zoom level for which tiles are available, as in the TileJSON spec. Data from tiles at the maxzoom are used when displaying the map at higher zoom levels.
    @objc public var  maxzoom: NSNumber?

    /// The minimum visual size to display tiles for this layer. Only configurable for raster layers.
    @objc public var  tileSize: NSNumber?

    /// Contains an attribution to be displayed when the map is shown to a user.
    @objc public var  attribution: String?

    /// The encoding used by this source. Mapbox Terrain RGB is used by default
    @objc public var  encoding: TMBEncoding?

    /// A setting to determine whether a source's tiles are cached locally.
    @objc public var  volatile: NSNumber?

    /// When loading a map, if PrefetchZoomDelta is set to any number greater than 0, the map will first request a tile at zoom level lower than zoom - delta, but so that the zoom level is multiple of delta, in an attempt to display a full map at lower resolution as quick as possible. It will get clamped at the tile source minimum zoom. The default delta is 4.
    @objc public var  prefetchZoomDelta: NSNumber?

    /// Minimum tile update interval in seconds, which is used to throttle the tile update network requests. If the given source supports loading tiles from a server, sets the minimum tile update interval. Update network requests that are more frequent than the minimum tile update interval are suppressed.
    @objc public var  minimumTileUpdateInterval: NSNumber?

    /// When a set of tiles for a current zoom level is being rendered and some of the ideal tiles that cover the screen are not yet loaded, parent tile could be used instead. This might introduce unwanted rendering side-effects, especially for raster tiles that are overscaled multiple times. This property sets the maximum limit for how much a parent tile can be overscaled.
    @objc public var  maxOverscaleFactorForParentTiles: NSNumber?

    /// For the tiled sources, this property sets the tile requests delay. The given delay comes in action only during an ongoing animation or gestures. It helps to avoid loading, parsing and rendering of the transient tiles and thus to improve the rendering performance, especially on low-end devices.
    @objc public var  tileRequestsDelay: NSNumber?

    /// For the tiled sources, this property sets the tile network requests delay. The given delay comes in action only during an ongoing animation or gestures. It helps to avoid loading the transient tiles from the network and thus to avoid redundant network requests. Note that tile-network-requests-delay value is superseded with tile-requests-delay property value, if both are provided.
    @objc public var  tileNetworkRequestsDelay: NSNumber?

    
    @objc public init(id : String) {
        self.id = id
        self.type = TMBSourceType.rasterDem
    }
}
extension TMBRasterDemSource {
    func unwrap() -> RasterDemSource {
        RasterDemSource(id: self.id)
    }
}
extension RasterDemSource {
    func wrap() -> TMBRasterDemSource {
        TMBRasterDemSource(id: self.id)
    }
}