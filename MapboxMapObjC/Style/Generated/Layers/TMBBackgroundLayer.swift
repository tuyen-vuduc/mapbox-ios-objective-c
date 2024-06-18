// This file is generated.
import Foundation
import MapboxMaps


/// The background color or pattern of the map.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-background)
@objc open class TMBBackgroundLayer: NSObject, TMBLayer {

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
    @objc public var  id: String

    /// Rendering type of this layer.
    @objc public let  type: TMBLayerType

    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc public var  slot: TMBSlot?

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc public var  minZoom: NSNumber?

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc public var  maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var  visibility: TMBValue

    /// The color with which the background will be drawn.
    @objc public var  backgroundColor: TMBValue?

    /// Transition options for `backgroundColor`.
    @objc public var  backgroundColorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var  backgroundEmissiveStrength: TMBValue?

    /// Transition options for `backgroundEmissiveStrength`.
    @objc public var  backgroundEmissiveStrengthTransition: TMBStyleTransition?

    /// The opacity at which the background will be drawn.
    @objc public var  backgroundOpacity: TMBValue?

    /// Transition options for `backgroundOpacity`.
    @objc public var  backgroundOpacityTransition: TMBStyleTransition?

    /// Name of image in sprite to use for drawing an image background. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var  backgroundPattern: TMBValue?

    
    @objc public init(id : String) {
        self.id = id
        self.type = TMBLayerType.background
        self.visibility = .visibility(.visible)
    }
}
extension TMBBackgroundLayer: SwiftValueConvertible {
    public func unwrap() -> BackgroundLayer {
        var result = BackgroundLayer(id: self.id)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout BackgroundLayer) {
        dest.slot = self.slot?.unwrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.backgroundColor = self.backgroundColor?.styleColor()
        dest.backgroundColorTransition = self.backgroundColorTransition?.unwrap()
        dest.backgroundEmissiveStrength = self.backgroundEmissiveStrength?.double()
        dest.backgroundEmissiveStrengthTransition = self.backgroundEmissiveStrengthTransition?.unwrap()
        dest.backgroundOpacity = self.backgroundOpacity?.double()
        dest.backgroundOpacityTransition = self.backgroundOpacityTransition?.unwrap()
        dest.backgroundPattern = self.backgroundPattern?.resolvedImage()
    }
}
extension BackgroundLayer {
    func wrap() -> TMBBackgroundLayer {
        var result = TMBBackgroundLayer(id: self.id)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBBackgroundLayer)  {
        dest.slot = self.slot?.wrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.backgroundColor = self.backgroundColor?.styleColor()
        dest.backgroundColorTransition = self.backgroundColorTransition?.wrap()
        dest.backgroundEmissiveStrength = self.backgroundEmissiveStrength?.double()
        dest.backgroundEmissiveStrengthTransition = self.backgroundEmissiveStrengthTransition?.wrap()
        dest.backgroundOpacity = self.backgroundOpacity?.double()
        dest.backgroundOpacityTransition = self.backgroundOpacityTransition?.wrap()
        dest.backgroundPattern = self.backgroundPattern?.resolvedImage()
    }
}
