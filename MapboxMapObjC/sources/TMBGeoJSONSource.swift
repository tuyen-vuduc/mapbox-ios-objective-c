// This file is generated.
import Foundation
import MapboxMaps

@objc open class TMBGeoJSONSource: TMBSource {
    private var _self: GeoJSONSource
    
    @objc public init() {
        self._self = GeoJSONSource()
        super.init(self._self)
    }

    /// A URL to a GeoJSON file, or inline GeoJSON.
    @objc public var data : TMBGeoJSONSourceData? {
        get {
            return _self.data?.objcValue()
        }
        set {
            _self.data = newValue?.rawValue
        }
    }

    /// Maximum zoom level at which to create vector tiles (higher means greater detail at high zoom levels).
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

    /// Size of the tile buffer on each side. A value of 0 produces no buffer. A value of 512 produces a buffer as wide as the tile itself. Larger values produce fewer rendering artifacts near tile edges and slower performance.
    @objc public var buffer : NSNumber? {
        get {
            return _self.buffer?.NSNumber
        }
        set {
            _self.buffer = newValue?.doubleValue
        }
    }

    /// Douglas-Peucker simplification tolerance (higher means simpler geometries and faster performance).
    @objc public var tolerance : NSNumber? {
        get {
            return _self.tolerance?.NSNumber
        }
        set {
            _self.tolerance = newValue?.doubleValue
        }
    }

    /// If the data is a collection of point features, setting this to true clusters the points by radius into groups. Cluster groups become new `Point` features in the source with additional properties:
    ///  * `cluster` Is `true` if the point is a cluster
    ///  * `cluster_id` A unqiue id for the cluster to be used in conjunction with the [cluster inspection methods](https://www.mapbox.com/mapbox-gl-js/api/#geojsonsource#getclusterexpansionzoom)
    ///  * `point_count` Number of original points grouped into this cluster
    ///  * `point_count_abbreviated` An abbreviated point count
    @objc public var cluster : NSNumber? {
        get {
            return _self.cluster?.asNumber()
        }
        set {
            _self.cluster = newValue?.boolValue
        }
    }

    /// Radius of each cluster if clustering is enabled. A value of 512 indicates a radius equal to the width of a tile.
    @objc public var clusterRadius : NSNumber? {
        get {
            return _self.clusterRadius?.NSNumber
        }
        set {
            _self.clusterRadius = newValue?.doubleValue
        }
    }

    /// Max zoom on which to cluster points if clustering is enabled. Defaults to one zoom less than maxzoom (so that last zoom features are not clustered). Clusters are re-evaluated at integer zoom levels so setting clusterMaxZoom to 14 means the clusters will be displayed until z15.
    @objc public var clusterMaxZoom : NSNumber? {
        get {
            return _self.clusterMaxZoom?.NSNumber
        }
        set {
            _self.clusterMaxZoom = newValue?.doubleValue
        }
    }

    /// An object defining custom properties on the generated clusters if clustering is enabled, aggregating values from clustered points. Has the form `{"property_name": [operator, map_expression]}`. `operator` is any expression function that accepts at least 2 operands (e.g. `"+"` or `"max"`) — it accumulates the property value from clusters/points the cluster contains; `map_expression` produces the value of a single point.
    ///
    /// Example: `{"sum": ["+", ["get", "scalerank"]]}`.
    ///
    /// For more advanced use cases, in place of `operator`, you can use a custom reduce expression that references a special `["accumulated"]` value, e.g.:
    /// `{"sum": [["+", ["accumulated"], ["get", "sum"]], ["get", "scalerank"]]}`
    @objc public var clusterProperties : [String: TMBExpression]? {
        get {
            return _self.clusterProperties?.mapValues { TMBExpression($0) }
        }
        set {
            _self.clusterProperties = newValue?.mapValues { $0.rawValue }
        }
    }

    /// Whether to calculate line distance metrics. This is required for line layers that specify `line-gradient` values.
    @objc public var lineMetrics : NSNumber? {
        get {
            return _self.lineMetrics?.asNumber()
        }
        set {
            _self.lineMetrics = newValue?.boolValue
        }
    }

    /// Whether to generate ids for the geojson features. When enabled, the `feature.id` property will be auto assigned based on its index in the `features` array, over-writing any previous values.
    @objc public var generateId : NSNumber? {
        get {
            return _self.generateId?.asNumber()
        }
        set {
            _self.generateId = newValue?.boolValue
        }
    }

    /// A property to use as a feature id (for feature state). Either a property name, or an object of the form `{<sourceLayer>: <propertyName>}`.
    @objc public var promoteId : TMBPromoteId? {
        get {
            return _self.promoteId?.objcValue()
        }
        set {
            _self.promoteId = newValue?.rawValue
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
}
