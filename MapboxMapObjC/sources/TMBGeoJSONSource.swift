// This file is generated.
import Foundation
import MapboxMaps

/// A GeoJSON data source.
///
/// - SeeAlso: [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/#geo_json)
@objc open class TMBGeoJSONSource: NSObject, TMBSource {
    @objc public convenience init(id: String) {
        self.init(id, type: TMBSourceType.geoJson)
    }
    
    private init(_ id: String, type: TMBSourceType) {
        self.id = id
        self.type = type
    }
    
    let id: String

    @objc public let type: TMBSourceType

    /// A URL to a GeoJSON file, or inline GeoJSON.
    @objc public var data: TMBGeoJSONSourceData?

    /// Maximum zoom level at which to create vector tiles (higher means greater detail at high zoom levels).
    @objc public var maxzoom: NSNumber?

    /// Contains an attribution to be displayed when the map is shown to a user.
    @objc public var attribution: String?

    /// Size of the tile buffer on each side. A value of 0 produces no buffer. A value of 512 produces a buffer as wide as the tile itself. Larger values produce fewer rendering artifacts near tile edges and slower performance.
    @objc public var buffer: NSNumber?

    /// Douglas-Peucker simplification tolerance (higher means simpler geometries and faster performance).
    @objc public var tolerance: NSNumber?

    /// If the data is a collection of point features, setting this to true clusters the points by radius into groups. Cluster groups become new `Point` features in the source with additional properties:
    ///  * `cluster` Is `true` if the point is a cluster
    ///  * `cluster_id` A unqiue id for the cluster to be used in conjunction with the [cluster inspection methods](https://www.mapbox.com/mapbox-gl-js/api/#geojsonsource#getclusterexpansionzoom)
    ///  * `point_count` Number of original points grouped into this cluster
    ///  * `point_count_abbreviated` An abbreviated point count
    @objc public var cluster: NSNumber?

    /// Radius of each cluster if clustering is enabled. A value of 512 indicates a radius equal to the width of a tile.
    @objc public var clusterRadius: NSNumber?

    /// Max zoom on which to cluster points if clustering is enabled. Defaults to one zoom less than maxzoom (so that last zoom features are not clustered). Clusters are re-evaluated at integer zoom levels so setting clusterMaxZoom to 14 means the clusters will be displayed until z15.
    @objc public var clusterMaxZoom: NSNumber?

    /// An object defining custom properties on the generated clusters if clustering is enabled, aggregating values from clustered points. Has the form `{"property_name": [operator, map_expression]}`. `operator` is any expression function that accepts at least 2 operands (e.g. `"+"` or `"max"`) — it accumulates the property value from clusters/points the cluster contains; `map_expression` produces the value of a single point.
    ///
    /// Example: `{"sum": ["+", ["get", "scalerank"]]}`.
    ///
    /// For more advanced use cases, in place of `operator`, you can use a custom reduce expression that references a special `["accumulated"]` value, e.g.:
    /// `{"sum": [["+", ["accumulated"], ["get", "sum"]], ["get", "scalerank"]]}`
    @objc public var clusterProperties: [String: TMBExpression]?

    /// Whether to calculate line distance metrics. This is required for line layers that specify `line-gradient` values.
    @objc public var lineMetrics: NSNumber?

    /// Whether to generate ids for the geojson features. When enabled, the `feature.id` property will be auto assigned based on its index in the `features` array, over-writing any previous values.
    @objc public var generateId: NSNumber?

    /// A property to use as a feature id (for feature state). Either a property name, or an object of the form `{<sourceLayer>: <propertyName>}`.
    @objc public var promoteId: TMBPromoteId?

    /// When loading a map, if PrefetchZoomDelta is set to any number greater than 0, the map will first request a tile at zoom level lower than zoom - delta, but so that the zoom level is multiple of delta, in an attempt to display a full map at lower resolution as quick as possible. It will get clamped at the tile source minimum zoom. The default delta is 4.
    @objc public var prefetchZoomDelta: NSNumber?

}

extension TMBGeoJSONSource {
    public func mapTo(_ source: inout GeoJSONSource) {

        source.data = self.data?.geoJSONSourceData()
        source.maxzoom = self.maxzoom?.double()
        source.attribution = self.attribution
        source.buffer = self.buffer?.double()
        source.tolerance = self.tolerance?.double()
        source.cluster = self.cluster?.bool()
        source.clusterRadius = self.clusterRadius?.double()
        source.clusterMaxZoom = self.clusterMaxZoom?.double()
        source.clusterProperties = self.clusterProperties?.mapValues { $0.rawValue }
        source.lineMetrics = self.lineMetrics?.bool()
        source.generateId = self.generateId?.bool()
        source.promoteId = self.promoteId?.promoteId()
        source.prefetchZoomDelta = self.prefetchZoomDelta?.double()
    }
}

extension GeoJSONSource {
    public func mapTo(_ source:inout TMBGeoJSONSource) {

        source.data = self.data?.objcValue()
        source.maxzoom = self.maxzoom?.asNumber()
        source.attribution = self.attribution
        source.buffer = self.buffer?.asNumber()
        source.tolerance = self.tolerance?.asNumber()
        source.cluster = self.cluster?.asNumber()
        source.clusterRadius = self.clusterRadius?.asNumber()
        source.clusterMaxZoom = self.clusterMaxZoom?.asNumber()
        source.clusterProperties = self.clusterProperties?.mapValues { $0.objcValue() }
        source.lineMetrics = self.lineMetrics?.asNumber()
        source.generateId = self.generateId?.asNumber()
        source.promoteId = self.promoteId?.objcValue()
        source.prefetchZoomDelta = self.prefetchZoomDelta?.asNumber()
    }
}

extension TMBGeoJSONSource: SwiftValueConvertible {
    public func swiftValue() -> GeoJSONSource {
        var source = GeoJSONSource()
        
        self.mapTo(&source)
        
        return source
    }
}

extension GeoJSONSource {
    public func objcValue(_ id: String) ->  TMBGeoJSONSource {
        var source = TMBGeoJSONSource(id: id)
        
        self.mapTo(&source)
        
        return source
    }
}
