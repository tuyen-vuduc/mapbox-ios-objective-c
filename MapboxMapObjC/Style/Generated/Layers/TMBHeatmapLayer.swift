// This file is generated.
import Foundation
import MapboxMaps


/// A heatmap.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-heatmap)
@objc open class TMBHeatmapLayer: NSObject, TMBLayer {

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
    @objc public var  id: String

    /// Rendering type of this layer.
    @objc public let  type: TMBLayerType

    /// An expression specifying conditions on source features.
    /// Only features that match the filter are displayed.
    @objc public var  filter: TMBExpression?

    /// Name of a source description to be used for this layer.
    /// Required for all layer types except ``BackgroundLayer``, ``SkyLayer``, and ``LocationIndicatorLayer``.
    @objc public var  source: String?

    /// Layer to use from a vector tile source.
    ///
    /// Required for vector tile sources.
    /// Prohibited for all other source types, including GeoJSON sources.
    @objc public var  sourceLayer: String?
    
    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc public var  slot: TMBSlot?

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc public var  minZoom: NSNumber?

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc public var  maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var  visibility: TMBValue

    /// Defines the color of each pixel based on its density value in a heatmap. Should be an expression that uses `["heatmap-density"]` as input.
    @objc public var  heatmapColor: TMBValue?

    /// Similar to `heatmap-weight` but controls the intensity of the heatmap globally. Primarily used for adjusting the heatmap based on zoom level.
    @objc public var  heatmapIntensity: TMBValue?

    /// Transition options for `heatmapIntensity`.
    @objc public var  heatmapIntensityTransition: TMBStyleTransition?

    /// The global opacity at which the heatmap layer will be drawn.
    @objc public var  heatmapOpacity: TMBValue?

    /// Transition options for `heatmapOpacity`.
    @objc public var  heatmapOpacityTransition: TMBStyleTransition?

    /// Radius of influence of one heatmap point in pixels. Increasing the value makes the heatmap smoother, but less detailed. `queryRenderedFeatures` on heatmap layers will return points within this radius.
    @objc public var  heatmapRadius: TMBValue?

    /// Transition options for `heatmapRadius`.
    @objc public var  heatmapRadiusTransition: TMBStyleTransition?

    /// A measure of how much an individual point contributes to the heatmap. A value of 10 would be equivalent to having 10 points of weight 1 in the same spot. Especially useful when combined with clustering.
    @objc public var  heatmapWeight: TMBValue?

    
    @objc public init(id : String, source : String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.heatmap
        self.visibility = .visibility(.visible)
    }
}
extension TMBHeatmapLayer {
    func unwrap() -> HeatmapLayer {
        HeatmapLayer(id: self.id,
            source: self.source)
    }
}
extension HeatmapLayer {
    func wrap() -> TMBHeatmapLayer {
        TMBHeatmapLayer(id: self.id,
          source: self.source)
    }
}