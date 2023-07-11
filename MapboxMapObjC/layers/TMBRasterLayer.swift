// This file is generated.
import Foundation
import MapboxMaps

/// Raster map textures such as satellite imagery.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-raster)
@objc open class TMBRasterLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.raster)
        
        self.visibility = TMBValue(constant: TMBVisibility.visible)
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

    /// Increase or reduce the brightness of the image. The value is the maximum brightness.
    @objc public var rasterBrightnessMax : TMBValue?

    /// Transition options for `rasterBrightnessMax`.
    @objc public var rasterBrightnessMaxTransition : TMBStyleTransition?

    /// Increase or reduce the brightness of the image. The value is the minimum brightness.
    @objc public var rasterBrightnessMin : TMBValue?

    /// Transition options for `rasterBrightnessMin`.
    @objc public var rasterBrightnessMinTransition : TMBStyleTransition?

    /// Increase or reduce the contrast of the image.
    @objc public var rasterContrast : TMBValue?

    /// Transition options for `rasterContrast`.
    @objc public var rasterContrastTransition : TMBStyleTransition?

    /// Fade duration when a new tile is added.
    @objc public var rasterFadeDuration : TMBValue?

    /// Rotates hues around the color wheel.
    @objc public var rasterHueRotate : TMBValue?

    /// Transition options for `rasterHueRotate`.
    @objc public var rasterHueRotateTransition : TMBStyleTransition?

    /// The opacity at which the image will be drawn.
    @objc public var rasterOpacity : TMBValue?

    /// Transition options for `rasterOpacity`.
    @objc public var rasterOpacityTransition : TMBStyleTransition?

    /// The resampling/interpolation method to use for overscaling, also known as texture magnification filter
    @objc public var rasterResampling : TMBValue?

    /// Increase or reduce the saturation of the image.
    @objc public var rasterSaturation : TMBValue?

    /// Transition options for `rasterSaturation`.
    @objc public var rasterSaturationTransition : TMBStyleTransition?

}

extension TMBRasterLayer {
    public func mapTo(_ layer: inout RasterLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.rasterBrightnessMax = self.rasterBrightnessMax?.double()
        layer.rasterBrightnessMaxTransition = self.rasterBrightnessMaxTransition?.styleTransition()
        layer.rasterBrightnessMin = self.rasterBrightnessMin?.double()
        layer.rasterBrightnessMinTransition = self.rasterBrightnessMinTransition?.styleTransition()
        layer.rasterContrast = self.rasterContrast?.double()
        layer.rasterContrastTransition = self.rasterContrastTransition?.styleTransition()
        layer.rasterFadeDuration = self.rasterFadeDuration?.double()
        layer.rasterHueRotate = self.rasterHueRotate?.double()
        layer.rasterHueRotateTransition = self.rasterHueRotateTransition?.styleTransition()
        layer.rasterOpacity = self.rasterOpacity?.double()
        layer.rasterOpacityTransition = self.rasterOpacityTransition?.styleTransition()
        layer.rasterResampling = self.rasterResampling?.rasterResampling()
        layer.rasterSaturation = self.rasterSaturation?.double()
        layer.rasterSaturationTransition = self.rasterSaturationTransition?.styleTransition()
    }
}

extension RasterLayer {
    public func mapTo(_ layer:inout TMBRasterLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = TMBValue.fromSwiftValue(self.visibility)
        layer.rasterBrightnessMax = TMBValue.fromSwiftValue(self.rasterBrightnessMax)
        layer.rasterBrightnessMaxTransition = self.rasterBrightnessMaxTransition?.objcValue()
        layer.rasterBrightnessMin = TMBValue.fromSwiftValue(self.rasterBrightnessMin)
        layer.rasterBrightnessMinTransition = self.rasterBrightnessMinTransition?.objcValue()
        layer.rasterContrast = TMBValue.fromSwiftValue(self.rasterContrast)
        layer.rasterContrastTransition = self.rasterContrastTransition?.objcValue()
        layer.rasterFadeDuration = TMBValue.fromSwiftValue(self.rasterFadeDuration)
        layer.rasterHueRotate = TMBValue.fromSwiftValue(self.rasterHueRotate)
        layer.rasterHueRotateTransition = self.rasterHueRotateTransition?.objcValue()
        layer.rasterOpacity = TMBValue.fromSwiftValue(self.rasterOpacity)
        layer.rasterOpacityTransition = self.rasterOpacityTransition?.objcValue()
        layer.rasterResampling = TMBValue.fromSwiftValue(self.rasterResampling)
        layer.rasterSaturation = TMBValue.fromSwiftValue(self.rasterSaturation)
        layer.rasterSaturationTransition = self.rasterSaturationTransition?.objcValue()
    }
}

extension TMBRasterLayer: SwiftValueConvertible {
    public func swiftValue() -> RasterLayer {
        var layer = RasterLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension RasterLayer: ObjcConvertible {
    public func objcValue() ->  TMBRasterLayer {
        var layer = TMBRasterLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}