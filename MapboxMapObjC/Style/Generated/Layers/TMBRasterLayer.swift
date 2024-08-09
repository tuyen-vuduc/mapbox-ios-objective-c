// This file is generated.
import Foundation
import MapboxMaps


/// Raster map textures such as satellite imagery.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-raster)
@objc open class TMBRasterLayer: NSObject, TMBLayer {

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

    /// Increase or reduce the brightness of the image. The value is the maximum brightness.
    @objc public var  rasterBrightnessMax: TMBValue?

    /// Transition options for `rasterBrightnessMax`.
    @objc public var  rasterBrightnessMaxTransition: TMBStyleTransition?

    /// Increase or reduce the brightness of the image. The value is the minimum brightness.
    @objc public var  rasterBrightnessMin: TMBValue?

    /// Transition options for `rasterBrightnessMin`.
    @objc public var  rasterBrightnessMinTransition: TMBStyleTransition?

    /// Defines a color map by which to colorize a raster layer, parameterized by the `["raster-value"]` expression and evaluated at 1024 uniformly spaced steps over the range specified by `raster-color-range`.
    @objc public var  rasterColor: TMBValue?

    /// When `raster-color` is active, specifies the combination of source RGB channels used to compute the raster value. Computed using the equation `mix.r * src.r + mix.g * src.g + mix.b * src.b + mix.a`. The first three components specify the mix of source red, green, and blue channels, respectively. The fourth component serves as a constant offset and is *not* multipled by source alpha. Source alpha is instead carried through and applied as opacity to the colorized result. Default value corresponds to RGB luminosity.
    @objc public var  rasterColorMix: TMBValue?

    /// Transition options for `rasterColorMix`.
    @objc public var  rasterColorMixTransition: TMBStyleTransition?

    /// When `raster-color` is active, specifies the range over which `raster-color` is tabulated. Units correspond to the computed raster value via `raster-color-mix`.
    @objc public var  rasterColorRange: TMBValue?

    /// Transition options for `rasterColorRange`.
    @objc public var  rasterColorRangeTransition: TMBStyleTransition?

    /// Increase or reduce the contrast of the image.
    @objc public var  rasterContrast: TMBValue?

    /// Transition options for `rasterContrast`.
    @objc public var  rasterContrastTransition: TMBStyleTransition?

    /// Fade duration when a new tile is added.
    @objc public var  rasterFadeDuration: TMBValue?

    /// Rotates hues around the color wheel.
    @objc public var  rasterHueRotate: TMBValue?

    /// Transition options for `rasterHueRotate`.
    @objc public var  rasterHueRotateTransition: TMBStyleTransition?

    /// The opacity at which the image will be drawn.
    @objc public var  rasterOpacity: TMBValue?

    /// Transition options for `rasterOpacity`.
    @objc public var  rasterOpacityTransition: TMBStyleTransition?

    /// The resampling/interpolation method to use for overscaling, also known as texture magnification filter
    @objc public var  rasterResampling: TMBValue?

    /// Increase or reduce the saturation of the image.
    @objc public var  rasterSaturation: TMBValue?

    /// Transition options for `rasterSaturation`.
    @objc public var  rasterSaturationTransition: TMBStyleTransition?

    
    @objc public init(id : String, source : String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.raster
        self.visibility = .visibility(.visible)
    }
}
extension TMBRasterLayer: SwiftValueConvertible {
    public func unwrap() -> RasterLayer {
        var result = RasterLayer(id: self.id,
            source: self.source!)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout RasterLayer) {
        dest.filter = self.filter?.unwrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.unwrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.rasterBrightnessMax = self.rasterBrightnessMax?.double()
        dest.rasterBrightnessMaxTransition = self.rasterBrightnessMaxTransition?.unwrap()
        dest.rasterBrightnessMin = self.rasterBrightnessMin?.double()
        dest.rasterBrightnessMinTransition = self.rasterBrightnessMinTransition?.unwrap()
        dest.rasterColor = self.rasterColor?.styleColor()
        dest.rasterColorMix = self.rasterColorMix?.arrayOfDouble()
        dest.rasterColorMixTransition = self.rasterColorMixTransition?.unwrap()
        dest.rasterColorRange = self.rasterColorRange?.arrayOfDouble()
        dest.rasterColorRangeTransition = self.rasterColorRangeTransition?.unwrap()
        dest.rasterContrast = self.rasterContrast?.double()
        dest.rasterContrastTransition = self.rasterContrastTransition?.unwrap()
        dest.rasterFadeDuration = self.rasterFadeDuration?.double()
        dest.rasterHueRotate = self.rasterHueRotate?.double()
        dest.rasterHueRotateTransition = self.rasterHueRotateTransition?.unwrap()
        dest.rasterOpacity = self.rasterOpacity?.double()
        dest.rasterOpacityTransition = self.rasterOpacityTransition?.unwrap()
        dest.rasterResampling = self.rasterResampling?.rasterResampling()
        dest.rasterSaturation = self.rasterSaturation?.double()
        dest.rasterSaturationTransition = self.rasterSaturationTransition?.unwrap()
    }
}
extension RasterLayer {
    func wrap() -> TMBRasterLayer {
        var result = TMBRasterLayer(id: self.id,
          source: self.source!)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBRasterLayer)  {
        dest.filter = self.filter?.wrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.wrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.rasterBrightnessMax = self.rasterBrightnessMax?.double()
        dest.rasterBrightnessMaxTransition = self.rasterBrightnessMaxTransition?.wrap()
        dest.rasterBrightnessMin = self.rasterBrightnessMin?.double()
        dest.rasterBrightnessMinTransition = self.rasterBrightnessMinTransition?.wrap()
        dest.rasterColor = self.rasterColor?.styleColor()
        dest.rasterColorMix = self.rasterColorMix?.arrayOfDouble()
        dest.rasterColorMixTransition = self.rasterColorMixTransition?.wrap()
        dest.rasterColorRange = self.rasterColorRange?.arrayOfDouble()
        dest.rasterColorRangeTransition = self.rasterColorRangeTransition?.wrap()
        dest.rasterContrast = self.rasterContrast?.double()
        dest.rasterContrastTransition = self.rasterContrastTransition?.wrap()
        dest.rasterFadeDuration = self.rasterFadeDuration?.double()
        dest.rasterHueRotate = self.rasterHueRotate?.double()
        dest.rasterHueRotateTransition = self.rasterHueRotateTransition?.wrap()
        dest.rasterOpacity = self.rasterOpacity?.double()
        dest.rasterOpacityTransition = self.rasterOpacityTransition?.wrap()
        dest.rasterResampling = self.rasterResampling?.rasterResampling()
        dest.rasterSaturation = self.rasterSaturation?.double()
        dest.rasterSaturationTransition = self.rasterSaturationTransition?.wrap()
    }
}
