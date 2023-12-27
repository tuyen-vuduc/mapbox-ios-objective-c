// This file is generated.
import Foundation
import MapboxMaps

/// A filled polygon with an optional stroked border.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-fill)
@objc open class TMBFillLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.fill)
        
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

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var fillSortKey: TMBValue?

    /// Whether or not the fill should be antialiased.
    @objc public var fillAntialias: TMBValue?

    /// The color of the filled part of this layer. This color can be specified as `rgba` with an alpha component and the color's opacity will not affect the opacity of the 1px stroke, if it is used.
    @objc public var fillColor: TMBValue?

    /// Transition options for `fillColor`.
    @objc public var fillColorTransition: TMBStyleTransition?

    /// The opacity of the entire fill layer. In contrast to the `fill-color`, this value will also affect the 1px stroke around the fill, if the stroke is used.
    @objc public var fillOpacity: TMBValue?

    /// Transition options for `fillOpacity`.
    @objc public var fillOpacityTransition: TMBStyleTransition?

    /// The outline color of the fill. Matches the value of `fill-color` if unspecified.
    @objc public var fillOutlineColor: TMBValue?

    /// Transition options for `fillOutlineColor`.
    @objc public var fillOutlineColorTransition: TMBStyleTransition?

    /// Name of image in sprite to use for drawing image fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var fillPattern: TMBValue?

    /// Transition options for `fillPattern`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    @objc public var fillPatternTransition: TMBStyleTransition?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var fillTranslate: TMBValue?

    /// Transition options for `fillTranslate`.
    @objc public var fillTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `fill-translate`.
    @objc public var fillTranslateAnchor: TMBValue?

}

extension TMBFillLayer {
    public func mapTo(_ layer: inout FillLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.fillSortKey = self.fillSortKey?.double()
        layer.fillAntialias = self.fillAntialias?.boolean()
        layer.fillColor = self.fillColor?.styleColor()
        layer.fillColorTransition = self.fillColorTransition?.styleTransition()
        layer.fillOpacity = self.fillOpacity?.double()
        layer.fillOpacityTransition = self.fillOpacityTransition?.styleTransition()
        layer.fillOutlineColor = self.fillOutlineColor?.styleColor()
        layer.fillOutlineColorTransition = self.fillOutlineColorTransition?.styleTransition()
        layer.fillPattern = self.fillPattern?.resolvedImage()
        layer.fillPatternTransition = self.fillPatternTransition?.styleTransition()
        layer.fillTranslate = self.fillTranslate?.arrayOfDouble()
        layer.fillTranslateTransition = self.fillTranslateTransition?.styleTransition()
        layer.fillTranslateAnchor = self.fillTranslateAnchor?.fillTranslateAnchor()
    }
}

extension FillLayer {
    public func mapTo(_ layer:inout TMBFillLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = self.visibility?.visibility()
        layer.fillSortKey = self.fillSortKey?.double()
        layer.fillAntialias = self.fillAntialias?.boolean()
        layer.fillColor = self.fillColor?.styleColor()
        layer.fillColorTransition = self.fillColorTransition?.objcValue()
        layer.fillOpacity = self.fillOpacity?.double()
        layer.fillOpacityTransition = self.fillOpacityTransition?.objcValue()
        layer.fillOutlineColor = self.fillOutlineColor?.styleColor()
        layer.fillOutlineColorTransition = self.fillOutlineColorTransition?.objcValue()
        layer.fillPattern = self.fillPattern?.resolvedImage()
        layer.fillPatternTransition = self.fillPatternTransition?.objcValue()
        layer.fillTranslate = self.fillTranslate?.arrayOfDouble()
        layer.fillTranslateTransition = self.fillTranslateTransition?.objcValue()
        layer.fillTranslateAnchor = self.fillTranslateAnchor?.fillTranslateAnchor()
    }
}

extension TMBFillLayer: SwiftValueConvertible {
    public func swiftValue() -> FillLayer {
        var layer = FillLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension FillLayer: ObjcConvertible {
    public func objcValue() ->  TMBFillLayer {
        var layer = TMBFillLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}