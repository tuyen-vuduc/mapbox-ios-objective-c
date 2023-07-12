// This file is generated.
import Foundation
import MapboxMaps

/// A heatmap.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-heatmap)
@objc open class TMBHeatmapLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.heatmap)
        
        self.visibility = TMBValue.visibility(.visible)
    }
    
    private init(_ id: String = UUID().uuidString, type: TMBLayerType) {
        self.id = id
        self.type = type
    }

    // MARK: - Conformance to `Layer` protocol
    @objc public var id: String
    @objc public let type: TMBLayerType
    @objc public var filter: TMBExpression?
    @objc public var source: String?
    @objc public var sourceLayer: String?
    @objc public var minZoom: NSNumber?
    @objc public var maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var visibility: TMBValue?

    /// Defines the color of each pixel based on its density value in a heatmap.  Should be an expression that uses `["heatmap-density"]` as input.
    @objc public var heatmapColor: TMBValue?

    /// Similar to `heatmap-weight` but controls the intensity of the heatmap globally. Primarily used for adjusting the heatmap based on zoom level.
    @objc public var heatmapIntensity: TMBValue?

    /// Transition options for `heatmapIntensity`.
    @objc public var heatmapIntensityTransition: TMBStyleTransition?

    /// The global opacity at which the heatmap layer will be drawn.
    @objc public var heatmapOpacity: TMBValue?

    /// Transition options for `heatmapOpacity`.
    @objc public var heatmapOpacityTransition: TMBStyleTransition?

    /// Radius of influence of one heatmap point in pixels. Increasing the value makes the heatmap smoother, but less detailed. `queryRenderedFeatures` on heatmap layers will return points within this radius.
    @objc public var heatmapRadius: TMBValue?

    /// Transition options for `heatmapRadius`.
    @objc public var heatmapRadiusTransition: TMBStyleTransition?

    /// A measure of how much an individual point contributes to the heatmap. A value of 10 would be equivalent to having 10 points of weight 1 in the same spot. Especially useful when combined with clustering.
    @objc public var heatmapWeight: TMBValue?

}

extension TMBHeatmapLayer {
    public func mapTo(_ layer: inout HeatmapLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.heatmapColor = self.heatmapColor?.styleColor()
        layer.heatmapIntensity = self.heatmapIntensity?.double()
        layer.heatmapIntensityTransition = self.heatmapIntensityTransition?.styleTransition()
        layer.heatmapOpacity = self.heatmapOpacity?.double()
        layer.heatmapOpacityTransition = self.heatmapOpacityTransition?.styleTransition()
        layer.heatmapRadius = self.heatmapRadius?.double()
        layer.heatmapRadiusTransition = self.heatmapRadiusTransition?.styleTransition()
        layer.heatmapWeight = self.heatmapWeight?.double()
    }
}

extension HeatmapLayer {
    public func mapTo(_ layer:inout TMBHeatmapLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = self.visibility?.visibility()
        layer.heatmapColor = self.heatmapColor?.styleColor()
        layer.heatmapIntensity = self.heatmapIntensity?.double()
        layer.heatmapIntensityTransition = self.heatmapIntensityTransition?.objcValue()
        layer.heatmapOpacity = self.heatmapOpacity?.double()
        layer.heatmapOpacityTransition = self.heatmapOpacityTransition?.objcValue()
        layer.heatmapRadius = self.heatmapRadius?.double()
        layer.heatmapRadiusTransition = self.heatmapRadiusTransition?.objcValue()
        layer.heatmapWeight = self.heatmapWeight?.double()
    }
}

extension TMBHeatmapLayer: SwiftValueConvertible {
    public func swiftValue() -> HeatmapLayer {
        var layer = HeatmapLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension HeatmapLayer: ObjcConvertible {
    public func objcValue() ->  TMBHeatmapLayer {
        var layer = TMBHeatmapLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}