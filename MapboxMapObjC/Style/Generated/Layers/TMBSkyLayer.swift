// This file is generated.
import UIKit
import MapboxMaps

/// A spherical dome around the map that is always rendered behind all other layers.
/// Warning: As of v10.6.0, ``Atmosphere`` is the preferred method for atmospheric styling. Sky layer is not supported by the globe projection, and will be phased out in future major release.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-sky)
@objc open class TMBSkyLayer: NSObject, TMBLayer {
    @objc public init(id: String) {
        self.id = id
        self.type = TMBLayerType.sky
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

    /// A color used to tweak the main atmospheric scattering coefficients. Using white applies the default coefficients giving the natural blue color to the atmosphere. This color affects how heavily the corresponding wavelength is represented during scattering. The alpha channel describes the density of the atmosphere, with 1 maximum density and 0 no density.
    /// Default value: "white".
    @objc public var skyAtmosphereColor: TMBValue?

    /// A color applied to the atmosphere sun halo. The alpha channel describes how strongly the sun halo is represented in an atmosphere sky layer.
    /// Default value: "white".
    @objc public var skyAtmosphereHaloColor: TMBValue?

    /// Position of the sun center [a azimuthal angle, p polar angle]. The azimuthal angle indicates the position of the sun relative to 0 degree north, where degrees proceed clockwise. The polar angle indicates the height of the sun, where 0 degree is directly above, at zenith, and 90 degree at the horizon. When this property is ommitted, the sun center is directly inherited from the light position.
    /// Minimum value: [0,0]. Maximum value: [360,180].
    @objc public var skyAtmosphereSun: TMBValue?

    /// Intensity of the sun as a light source in the atmosphere (on a scale from 0 to a 100). Setting higher values will brighten up the sky.
    /// Default value: 10. Value range: [0, 100]
    @objc public var skyAtmosphereSunIntensity: TMBValue?

    /// Defines a radial color gradient with which to color the sky. The color values can be interpolated with an expression using `sky-radial-progress`. The range [0, 1] for the interpolant covers a radial distance (in degrees) of [0, `sky-gradient-radius`] centered at the position specified by `sky-gradient-center`.
    /// Default value: ["interpolate",["linear"],["sky-radial-progress"],0.8,"#87ceeb",1,"white"].
    @objc public var skyGradient: TMBValue?

    /// Position of the gradient center [a azimuthal angle, p polar angle]. The azimuthal angle indicates the position of the gradient center relative to 0 degree north, where degrees proceed clockwise. The polar angle indicates the height of the gradient center, where 0 degree is directly above, at zenith, and 90 degree at the horizon.
    /// Default value: [0,0]. Minimum value: [0,0]. Maximum value: [360,180].
    @objc public var skyGradientCenter: TMBValue?

    /// The angular distance (measured in degrees) from `sky-gradient-center` up to which the gradient extends. A value of 180 causes the gradient to wrap around to the opposite direction from `sky-gradient-center`.
    /// Default value: 90. Value range: [0, 180]
    @objc public var skyGradientRadius: TMBValue?

    /// The opacity of the entire sky layer.
    /// Default value: 1. Value range: [0, 1]
    @objc public var skyOpacity: TMBValue?

    /// Transition options for `skyOpacity`.
    @objc public var skyOpacityTransition: TMBStyleTransition?

    /// The type of the sky
    /// Default value: "atmosphere".
    @objc public var skyType: TMBValue?

}

extension TMBSkyLayer {
    func mapTo(_ source: inout SkyLayer) {
        source.id = self.id
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.skyAtmosphereColor = self.skyAtmosphereColor?.styleColor()
        source.skyAtmosphereHaloColor = self.skyAtmosphereHaloColor?.styleColor()
        source.skyAtmosphereSun = self.skyAtmosphereSun?.arrayOfDouble()
        source.skyAtmosphereSunIntensity = self.skyAtmosphereSunIntensity?.double()
        source.skyGradient = self.skyGradient?.styleColor()
        source.skyGradientCenter = self.skyGradientCenter?.arrayOfDouble()
        source.skyGradientRadius = self.skyGradientRadius?.double()
        source.skyOpacity = self.skyOpacity?.double()
        source.skyOpacityTransition = self.skyOpacityTransition?.styleTransition()
        source.skyType = self.skyType?.skyType()
    }
}

extension SkyLayer {
    func mapTo(_ source:inout TMBSkyLayer) {
        source.id = self.id
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.skyAtmosphereColor = self.skyAtmosphereColor?.styleColor()
        source.skyAtmosphereHaloColor = self.skyAtmosphereHaloColor?.styleColor()
        source.skyAtmosphereSun = self.skyAtmosphereSun?.arrayOfDouble()
        source.skyAtmosphereSunIntensity = self.skyAtmosphereSunIntensity?.double()
        source.skyGradient = self.skyGradient?.styleColor()
        source.skyGradientCenter = self.skyGradientCenter?.arrayOfDouble()
        source.skyGradientRadius = self.skyGradientRadius?.double()
        source.skyOpacity = self.skyOpacity?.double()
        source.skyOpacityTransition = self.skyOpacityTransition?.wrap()
        source.skyType = self.skyType?.skyType()
    }
}

extension TMBSkyLayer: SwiftValueConvertible {
    public func unwrap() -> SkyLayer {
        var result = SkyLayer(id: self.id)
        self.mapTo(&result)
        return result
    }
}

extension SkyLayer {
    func wrap() -> TMBSkyLayer {
        var result = TMBSkyLayer(id: self.id)
        self.mapTo(&result)
        return result
    }
}