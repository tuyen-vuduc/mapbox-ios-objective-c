// This file is generated.
import UIKit
import MapboxMaps

/// The background color or pattern of the map.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-background)
@objc open class TMBBackgroundLayer: NSObject, TMBLayer {
    @objc public init(id: String) {
        self.id = id
        self.type = TMBLayerType.background
        self.visibility = .visibility(.visible)
    }

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
    @objc public var id: String

    /// Rendering type of this layer.
    @objc public let type: TMBLayerType

    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc public var slot: TMBSlot?

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc public var minZoom: NSNumber?

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc public var maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var visibility: TMBValue

    /// The color with which the background will be drawn.
    /// Default value: "#000000".
    @objc public var backgroundColor: TMBValue?

    /// Transition options for `backgroundColor`.
    @objc public var backgroundColorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features.
    /// Default value: 0. Minimum value: 0.
    @objc public var backgroundEmissiveStrength: TMBValue?

    /// Transition options for `backgroundEmissiveStrength`.
    @objc public var backgroundEmissiveStrengthTransition: TMBStyleTransition?

    /// The opacity at which the background will be drawn.
    /// Default value: 1. Value range: [0, 1]
    @objc public var backgroundOpacity: TMBValue?

    /// Transition options for `backgroundOpacity`.
    @objc public var backgroundOpacityTransition: TMBStyleTransition?

    /// Name of image in sprite to use for drawing an image background. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var backgroundPattern: TMBValue?

}

extension TMBBackgroundLayer {
    func mapTo(_ source: inout BackgroundLayer) {
        source.id = self.id
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.backgroundColor = self.backgroundColor?.styleColor()
        source.backgroundColorTransition = self.backgroundColorTransition?.styleTransition()
        source.backgroundEmissiveStrength = self.backgroundEmissiveStrength?.double()
        source.backgroundEmissiveStrengthTransition = self.backgroundEmissiveStrengthTransition?.styleTransition()
        source.backgroundOpacity = self.backgroundOpacity?.double()
        source.backgroundOpacityTransition = self.backgroundOpacityTransition?.styleTransition()
        source.backgroundPattern = self.backgroundPattern?.resolvedImage()
    }
}

extension BackgroundLayer {
    func mapTo(_ source:inout TMBBackgroundLayer) {
        source.id = self.id
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.backgroundColor = self.backgroundColor?.styleColor()
        source.backgroundColorTransition = self.backgroundColorTransition?.wrap()
        source.backgroundEmissiveStrength = self.backgroundEmissiveStrength?.double()
        source.backgroundEmissiveStrengthTransition = self.backgroundEmissiveStrengthTransition?.wrap()
        source.backgroundOpacity = self.backgroundOpacity?.double()
        source.backgroundOpacityTransition = self.backgroundOpacityTransition?.wrap()
        source.backgroundPattern = self.backgroundPattern?.resolvedImage()
    }
}

extension TMBBackgroundLayer: SwiftValueConvertible {
    public func unwrap() -> BackgroundLayer {
        var result = BackgroundLayer(id: self.id)
        self.mapTo(&result)
        return result
    }
}

extension BackgroundLayer {
    func wrap() -> TMBBackgroundLayer {
        var result = TMBBackgroundLayer(id: self.id)
        self.mapTo(&result)
        return result
    }
}