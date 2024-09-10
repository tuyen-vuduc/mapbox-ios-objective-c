// This file is generated.
import UIKit
import MapboxMaps

/// A heatmap.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-heatmap)
@objc open class TMBHeatmapLayer: NSObject, TMBLayer {
    @objc public init(id: String, source: String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.heatmap
        self.visibility = .visibility(.visible)
    }

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
    @objc public var id: String

    /// Rendering type of this layer.
    @objc public let type: TMBLayerType

    /// An expression specifying conditions on source features.
    /// Only features that match the filter are displayed.
    @objc public var filter: TMBExpression?

    /// Name of a source description to be used for this layer.
    /// Required for all layer types except ``BackgroundLayer``, ``SkyLayer``, and ``LocationIndicatorLayer``.
    @objc public var source: String?

    /// Layer to use from a vector tile source.
    ///
    /// Required for vector tile sources.
    /// Prohibited for all other source types, including GeoJSON sources.
    @objc public var sourceLayer: String?

    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc public var slot: TMBSlot?

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc public var minZoom: NSNumber?

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc public var maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var visibility: TMBValue

    /// Defines the color of each pixel based on its density value in a heatmap. Should be an expression that uses `["heatmap-density"]` as input.
    /// Default value: ["interpolate",["linear"],["heatmap-density"],0,"rgba(0, 0, 255, 0)",0.1,"royalblue",0.3,"cyan",0.5,"lime",0.7,"yellow",1,"red"].
    @objc public var heatmapColor: TMBValue?

    /// Similar to `heatmap-weight` but controls the intensity of the heatmap globally. Primarily used for adjusting the heatmap based on zoom level.
    /// Default value: 1. Minimum value: 0.
    @objc public var heatmapIntensity: TMBValue?

    /// Transition options for `heatmapIntensity`.
    @objc public var heatmapIntensityTransition: TMBStyleTransition?

    /// The global opacity at which the heatmap layer will be drawn.
    /// Default value: 1. Value range: [0, 1]
    @objc public var heatmapOpacity: TMBValue?

    /// Transition options for `heatmapOpacity`.
    @objc public var heatmapOpacityTransition: TMBStyleTransition?

    /// Radius of influence of one heatmap point in pixels. Increasing the value makes the heatmap smoother, but less detailed. `queryRenderedFeatures` on heatmap layers will return points within this radius.
    /// Default value: 30. Minimum value: 1.
    @objc public var heatmapRadius: TMBValue?

    /// Transition options for `heatmapRadius`.
    @objc public var heatmapRadiusTransition: TMBStyleTransition?

    /// A measure of how much an individual point contributes to the heatmap. A value of 10 would be equivalent to having 10 points of weight 1 in the same spot. Especially useful when combined with clustering.
    /// Default value: 1. Minimum value: 0.
    @objc public var heatmapWeight: TMBValue?

}

extension TMBHeatmapLayer {
    func mapTo(_ source: inout HeatmapLayer) {
        source.id = self.id
        source.filter = self.filter?.expression()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.heatmapColor = self.heatmapColor?.styleColor()
        source.heatmapIntensity = self.heatmapIntensity?.double()
        source.heatmapIntensityTransition = self.heatmapIntensityTransition?.styleTransition()
        source.heatmapOpacity = self.heatmapOpacity?.double()
        source.heatmapOpacityTransition = self.heatmapOpacityTransition?.styleTransition()
        source.heatmapRadius = self.heatmapRadius?.double()
        source.heatmapRadiusTransition = self.heatmapRadiusTransition?.styleTransition()
        source.heatmapWeight = self.heatmapWeight?.double()
    }
}

extension HeatmapLayer {
    func mapTo(_ source:inout TMBHeatmapLayer) {
        source.id = self.id
        source.filter = self.filter?.wrap()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.heatmapColor = self.heatmapColor?.styleColor()
        source.heatmapIntensity = self.heatmapIntensity?.double()
        source.heatmapIntensityTransition = self.heatmapIntensityTransition?.wrap()
        source.heatmapOpacity = self.heatmapOpacity?.double()
        source.heatmapOpacityTransition = self.heatmapOpacityTransition?.wrap()
        source.heatmapRadius = self.heatmapRadius?.double()
        source.heatmapRadiusTransition = self.heatmapRadiusTransition?.wrap()
        source.heatmapWeight = self.heatmapWeight?.double()
    }
}

extension TMBHeatmapLayer: SwiftValueConvertible {
    public func unwrap() -> HeatmapLayer {
        var result = HeatmapLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}

extension HeatmapLayer {
    func wrap() -> TMBHeatmapLayer {
        var result = TMBHeatmapLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}