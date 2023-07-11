// This file is generated.
import Foundation
import MapboxMaps

/// The background color or pattern of the map.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-background)
@objc open class TMBBackgroundLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.background)
        
        self.visibility = TMBValue.visibility(TMBVisibility.visible)
    }
    
    private init(_ id: String = UUID().uuidString, type: TMBLayerType) {
        self.id = id
        self.type = type
    }

    // MARK: - Conformance to `Layer` protocol
    @objc public var id : String
    @objc public let type : TMBLayerType
    @objc public var filter : TMBExpression?
    @objc public var source : String?
    @objc public var sourceLayer : String?
    @objc public var minZoom : NSNumber?
    @objc public var maxZoom : NSNumber?

    /// Whether this layer is displayed.
    @objc public var visibility : TMBValue?

    /// The color with which the background will be drawn.
    @objc public var backgroundColor : TMBValue?

    /// Transition options for `backgroundColor`.
    @objc public var backgroundColorTransition : TMBStyleTransition?

    /// The opacity at which the background will be drawn.
    @objc public var backgroundOpacity : TMBValue?

    /// Transition options for `backgroundOpacity`.
    @objc public var backgroundOpacityTransition : TMBStyleTransition?

    /// Name of image in sprite to use for drawing an image background. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var backgroundPattern : TMBValue?

    /// Transition options for `backgroundPattern`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    @objc public var backgroundPatternTransition : TMBStyleTransition?

}

extension TMBBackgroundLayer {
    public func mapTo(_ layer: inout BackgroundLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.backgroundColor = self.backgroundColor?.styleColor()
        layer.backgroundColorTransition = self.backgroundColorTransition?.styleTransition()
        layer.backgroundOpacity = self.backgroundOpacity?.double()
        layer.backgroundOpacityTransition = self.backgroundOpacityTransition?.styleTransition()
        layer.backgroundPattern = self.backgroundPattern?.resolvedImage()
        layer.backgroundPatternTransition = self.backgroundPatternTransition?.styleTransition()
    }
}

extension BackgroundLayer {
    public func mapTo(_ layer:inout TMBBackgroundLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = TMBValue.fromSwiftValue(self.visibility)
        layer.backgroundColor = TMBValue.fromSwiftValue(self.backgroundColor)
        layer.backgroundColorTransition = self.backgroundColorTransition?.objcValue()
        layer.backgroundOpacity = TMBValue.fromSwiftValue(self.backgroundOpacity)
        layer.backgroundOpacityTransition = self.backgroundOpacityTransition?.objcValue()
        layer.backgroundPattern = TMBValue.fromSwiftValue(self.backgroundPattern)
        layer.backgroundPatternTransition = self.backgroundPatternTransition?.objcValue()
    }
}

extension TMBBackgroundLayer: SwiftValueConvertible {
    public func swiftValue() -> BackgroundLayer {
        var layer = BackgroundLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension BackgroundLayer: ObjcConvertible {
    public func objcValue() ->  TMBBackgroundLayer {
        var layer = TMBBackgroundLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}
