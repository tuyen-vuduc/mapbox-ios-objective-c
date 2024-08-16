// This file is generated.
import UIKit
import MapboxMaps

/// Raster map textures such as satellite imagery.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-raster)
@objc open class TMBRasterLayer: NSObject, TMBLayer {
    @objc public init(id: String, source: String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.raster
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

    /// Displayed band of raster array source layer. Defaults to the first band if not set.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var rasterArrayBand: Value<String>?

    /// Increase or reduce the brightness of the image. The value is the maximum brightness.
    /// Default value: 1. Value range: [0, 1]
    @objc public var rasterBrightnessMax: TMBValue?

    /// Transition options for `rasterBrightnessMax`.
    @objc public var rasterBrightnessMaxTransition: TMBStyleTransition?

    /// Increase or reduce the brightness of the image. The value is the minimum brightness.
    /// Default value: 0. Value range: [0, 1]
    @objc public var rasterBrightnessMin: TMBValue?

    /// Transition options for `rasterBrightnessMin`.
    @objc public var rasterBrightnessMinTransition: TMBStyleTransition?

    /// Defines a color map by which to colorize a raster layer, parameterized by the `["raster-value"]` expression and evaluated at 256 uniformly spaced steps over the range specified by `raster-color-range`.
    @objc public var rasterColor: TMBValue?

    /// When `raster-color` is active, specifies the combination of source RGB channels used to compute the raster value. Computed using the equation `mix.r - src.r + mix.g - src.g + mix.b - src.b + mix.a`. The first three components specify the mix of source red, green, and blue channels, respectively. The fourth component serves as a constant offset and is -not- multipled by source alpha. Source alpha is instead carried through and applied as opacity to the colorized result. Default value corresponds to RGB luminosity.
    /// Default value: [0.2126,0.7152,0.0722,0].
    @objc public var rasterColorMix: TMBValue?

    /// Transition options for `rasterColorMix`.
    @objc public var rasterColorMixTransition: TMBStyleTransition?

    /// When `raster-color` is active, specifies the range over which `raster-color` is tabulated. Units correspond to the computed raster value via `raster-color-mix`. For `rasterarray` sources, if `raster-color-range` is unspecified, the source's stated data range is used.
    @objc public var rasterColorRange: TMBValue?

    /// Transition options for `rasterColorRange`.
    @objc public var rasterColorRangeTransition: TMBStyleTransition?

    /// Increase or reduce the contrast of the image.
    /// Default value: 0. Value range: [-1, 1]
    @objc public var rasterContrast: TMBValue?

    /// Transition options for `rasterContrast`.
    @objc public var rasterContrastTransition: TMBStyleTransition?

    /// Specifies an uniform elevation from the ground, in meters.
    /// Default value: 0. Minimum value: 0.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var rasterElevation: Value<Double>?

    /// Transition options for `rasterElevation`.
    // @_documentation(visibility: public)
    // @_spi(Experimental) public var rasterElevationTransition: StyleTransition?

    /// Controls the intensity of light emitted on the source features.
    /// Default value: 0. Minimum value: 0.
    @objc public var rasterEmissiveStrength: TMBValue?

    /// Transition options for `rasterEmissiveStrength`.
    @objc public var rasterEmissiveStrengthTransition: TMBStyleTransition?

    /// Fade duration when a new tile is added.
    /// Default value: 300. Minimum value: 0.
    @objc public var rasterFadeDuration: TMBValue?

    /// Rotates hues around the color wheel.
    /// Default value: 0.
    @objc public var rasterHueRotate: TMBValue?

    /// Transition options for `rasterHueRotate`.
    @objc public var rasterHueRotateTransition: TMBStyleTransition?

    /// The opacity at which the image will be drawn.
    /// Default value: 1. Value range: [0, 1]
    @objc public var rasterOpacity: TMBValue?

    /// Transition options for `rasterOpacity`.
    @objc public var rasterOpacityTransition: TMBStyleTransition?

    /// The resampling/interpolation method to use for overscaling, also known as texture magnification filter
    /// Default value: "linear".
    @objc public var rasterResampling: TMBValue?

    /// Increase or reduce the saturation of the image.
    /// Default value: 0. Value range: [-1, 1]
    @objc public var rasterSaturation: TMBValue?

    /// Transition options for `rasterSaturation`.
    @objc public var rasterSaturationTransition: TMBStyleTransition?

}

extension TMBRasterLayer {
    func mapTo(_ source: inout RasterLayer) {
        source.id = self.id
        source.filter = self.filter?.expression()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.rasterBrightnessMax = self.rasterBrightnessMax?.double()
        source.rasterBrightnessMaxTransition = self.rasterBrightnessMaxTransition?.styleTransition()
        source.rasterBrightnessMin = self.rasterBrightnessMin?.double()
        source.rasterBrightnessMinTransition = self.rasterBrightnessMinTransition?.styleTransition()
        source.rasterColor = self.rasterColor?.styleColor()
        source.rasterColorMix = self.rasterColorMix?.arrayOfDouble()
        source.rasterColorMixTransition = self.rasterColorMixTransition?.styleTransition()
        source.rasterColorRange = self.rasterColorRange?.arrayOfDouble()
        source.rasterColorRangeTransition = self.rasterColorRangeTransition?.styleTransition()
        source.rasterContrast = self.rasterContrast?.double()
        source.rasterContrastTransition = self.rasterContrastTransition?.styleTransition()
        source.rasterEmissiveStrength = self.rasterEmissiveStrength?.double()
        source.rasterEmissiveStrengthTransition = self.rasterEmissiveStrengthTransition?.styleTransition()
        source.rasterFadeDuration = self.rasterFadeDuration?.double()
        source.rasterHueRotate = self.rasterHueRotate?.double()
        source.rasterHueRotateTransition = self.rasterHueRotateTransition?.styleTransition()
        source.rasterOpacity = self.rasterOpacity?.double()
        source.rasterOpacityTransition = self.rasterOpacityTransition?.styleTransition()
        source.rasterResampling = self.rasterResampling?.rasterResampling()
        source.rasterSaturation = self.rasterSaturation?.double()
        source.rasterSaturationTransition = self.rasterSaturationTransition?.styleTransition()
    }
}

extension RasterLayer {
    func mapTo(_ source:inout TMBRasterLayer) {
        source.id = self.id
        source.filter = self.filter?.wrap()
        source.source = self.source
        source.sourceLayer = self.sourceLayer
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.rasterBrightnessMax = self.rasterBrightnessMax?.double()
        source.rasterBrightnessMaxTransition = self.rasterBrightnessMaxTransition?.wrap()
        source.rasterBrightnessMin = self.rasterBrightnessMin?.double()
        source.rasterBrightnessMinTransition = self.rasterBrightnessMinTransition?.wrap()
        source.rasterColor = self.rasterColor?.styleColor()
        source.rasterColorMix = self.rasterColorMix?.arrayOfDouble()
        source.rasterColorMixTransition = self.rasterColorMixTransition?.wrap()
        source.rasterColorRange = self.rasterColorRange?.arrayOfDouble()
        source.rasterColorRangeTransition = self.rasterColorRangeTransition?.wrap()
        source.rasterContrast = self.rasterContrast?.double()
        source.rasterContrastTransition = self.rasterContrastTransition?.wrap()
        source.rasterEmissiveStrength = self.rasterEmissiveStrength?.double()
        source.rasterEmissiveStrengthTransition = self.rasterEmissiveStrengthTransition?.wrap()
        source.rasterFadeDuration = self.rasterFadeDuration?.double()
        source.rasterHueRotate = self.rasterHueRotate?.double()
        source.rasterHueRotateTransition = self.rasterHueRotateTransition?.wrap()
        source.rasterOpacity = self.rasterOpacity?.double()
        source.rasterOpacityTransition = self.rasterOpacityTransition?.wrap()
        source.rasterResampling = self.rasterResampling?.rasterResampling()
        source.rasterSaturation = self.rasterSaturation?.double()
        source.rasterSaturationTransition = self.rasterSaturationTransition?.wrap()
    }
}

extension TMBRasterLayer: SwiftValueConvertible {
    public func unwrap() -> RasterLayer {
        var result = RasterLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}

extension RasterLayer {
    func wrap() -> TMBRasterLayer {
        var result = TMBRasterLayer(id: self.id, source: self.source!)
        self.mapTo(&result)
        return result
    }
}