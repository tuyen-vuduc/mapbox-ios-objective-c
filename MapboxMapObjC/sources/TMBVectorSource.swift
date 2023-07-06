// This file is generated.
import Foundation
import MapboxMaps

@objc open class TMBVectorSource: TMBSource {
    private var _self: VectorSource {
        get {
            return rawValue as! VectorSource
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public init() {
        super.init(VectorSource())
    }

    /// A URL to a TileJSON resource. Supported protocols are `http:`, `https:`, and `mapbox://<Tileset ID>`.
    @objc public var url : String? {
        get {
            return _self.url
        }
        set {
            _self.url = newValue
        }
    }

    /// An array of one or more tile source URLs, as in the TileJSON spec.
    @objc public var tiles : [String]? {
        get {
            return _self.tiles
        }
        set {
            _self.tiles = newValue
        }
    }

    /// An array containing the longitude and latitude of the southwest and northeast corners of the source's bounding box in the following order: `[sw.lng, sw.lat, ne.lng, ne.lat]`. When this property is included in a source, no tiles outside of the given bounds are requested by Mapbox GL.
    @objc public var bounds : [Double]? {
        get {
            return _self.bounds
        }
        set {
            _self.bounds = newValue
        }
    }

    /// Influences the y direction of the tile coordinates. The global-mercator (aka Spherical Mercator) profile is assumed.
    @objc public var scheme : TMBScheme? {
        get {
            return _self.scheme?.objcValue()
        }
        set {
            _self.scheme = newValue?.swiftValue()
        }
    }

    /// Minimum zoom level for which tiles are available, as in the TileJSON spec.
    @objc public var minzoom : NSNumber? {
        get {
            return _self.minzoom?.NSNumber
        }
        set {
            _self.minzoom = newValue?.doubleValue
        }
    }

    /// Maximum zoom level for which tiles are available, as in the TileJSON spec. Data from tiles at the maxzoom are used when displaying the map at higher zoom levels.
    @objc public var maxzoom : NSNumber? {
        get {
            return _self.maxzoom?.NSNumber
        }
        set {
            _self.maxzoom = newValue?.doubleValue
        }
    }

    /// Contains an attribution to be displayed when the map is shown to a user.
    @objc public var attribution : String? {
        get {
            return _self.attribution
        }
        set {
            _self.attribution = newValue
        }
    }

    /// A property to use as a feature id (for feature state). Either a property name, or an object of the form `{<sourceLayer>: <propertyName>}`. If specified as a string for a vector tile source, the same property is used across all its source layers. If specified as an object only specified source layers will have id overriden, others will fallback to original feature id
    @objc public var promoteId : TMBPromoteId? {
        get {
            return _self.promoteId?.objcValue()
        }
        set {
            _self.promoteId = newValue?.rawValue
        }
    }

    /// A setting to determine whether a source's tiles are cached locally.
    @objc public var volatile : NSNumber? {
        get {
            return _self.volatile?.asNumber()
        }
        set {
            _self.volatile = newValue?.boolValue
        }
    }

    /// When loading a map, if PrefetchZoomDelta is set to any number greater than 0, the map will first request a tile at zoom level lower than zoom - delta, but so that the zoom level is multiple of delta, in an attempt to display a full map at lower resolution as quick as possible. It will get clamped at the tile source minimum zoom. The default delta is 4.
    @objc public var prefetchZoomDelta : NSNumber? {
        get {
            return _self.prefetchZoomDelta?.NSNumber
        }
        set {
            _self.prefetchZoomDelta = newValue?.doubleValue
        }
    }

    /// Minimum tile update interval in seconds, which is used to throttle the tile update network requests. If the given source supports loading tiles from a server, sets the minimum tile update interval. Update network requests that are more frequent than the minimum tile update interval are suppressed.
    @objc public var minimumTileUpdateInterval : NSNumber? {
        get {
            return _self.minimumTileUpdateInterval?.NSNumber
        }
        set {
            _self.minimumTileUpdateInterval = newValue?.doubleValue
        }
    }

    /// When a set of tiles for a current zoom level is being rendered and some of the ideal tiles that cover the screen are not yet loaded, parent tile could be used instead. This might introduce unwanted rendering side-effects, especially for raster tiles that are overscaled multiple times. This property sets the maximum limit for how much a parent tile can be overscaled.
    @objc public var maxOverscaleFactorForParentTiles : NSNumber? {
        get {
            return _self.maxOverscaleFactorForParentTiles?.NSNumber
        }
        set {
            _self.maxOverscaleFactorForParentTiles = newValue?.doubleValue
        }
    }

    /// For the tiled sources, this property sets the tile requests delay. The given delay comes in action only during an ongoing animation or gestures. It helps to avoid loading, parsing and rendering of the transient tiles and thus to improve the rendering performance, especially on low-end devices.
    @objc public var tileRequestsDelay : NSNumber? {
        get {
            return _self.tileRequestsDelay?.NSNumber
        }
        set {
            _self.tileRequestsDelay = newValue?.doubleValue
        }
    }

    /// For the tiled sources, this property sets the tile network requests delay. The given delay comes in action only during an ongoing animation or gestures. It helps to avoid loading the transient tiles from the network and thus to avoid redundant network requests. Note that tile-network-requests-delay value is superseded with tile-requests-delay property value, if both are provided.
    @objc public var tileNetworkRequestsDelay : NSNumber? {
        get {
            return _self.tileNetworkRequestsDelay?.NSNumber
        }
        set {
            _self.tileNetworkRequestsDelay = newValue?.doubleValue
        }
    }
}
