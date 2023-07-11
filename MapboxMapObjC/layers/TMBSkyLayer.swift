// This file is generated.
import Foundation
import MapboxMaps

/// A spherical dome around the map that is always rendered behind all other layers.
/// Warning: As of v10.6.0, ``Atmosphere`` is the preferred method for atmospheric styling. Sky layer is not supported by the globe projection, and will be phased out in future major release.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-sky)
@objc open class TMBSkyLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.sky)
        
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

    /// A color used to tweak the main atmospheric scattering coefficients. Using white applies the default coefficients giving the natural blue color to the atmosphere. This color affects how heavily the corresponding wavelength is represented during scattering. The alpha channel describes the density of the atmosphere, with 1 maximum density and 0 no density.
    @objc public var skyAtmosphereColor: TMBValue?

    /// A color applied to the atmosphere sun halo. The alpha channel describes how strongly the sun halo is represented in an atmosphere sky layer.
    @objc public var skyAtmosphereHaloColor: TMBValue?

    /// Position of the sun center [a azimuthal angle, p polar angle]. The azimuthal angle indicates the position of the sun relative to 0 degree north, where degrees proceed clockwise. The polar angle indicates the height of the sun, where 0 degree is directly above, at zenith, and 90 degree at the horizon. When this property is ommitted, the sun center is directly inherited from the light position.
    @objc public var skyAtmosphereSun: TMBValue?

    /// Intensity of the sun as a light source in the atmosphere (on a scale from 0 to a 100). Setting higher values will brighten up the sky.
    @objc public var skyAtmosphereSunIntensity: TMBValue?

    /// Defines a radial color gradient with which to color the sky. The color values can be interpolated with an expression using `sky-radial-progress`. The range [0, 1] for the interpolant covers a radial distance (in degrees) of [0, `sky-gradient-radius`] centered at the position specified by `sky-gradient-center`.
    @objc public var skyGradient: TMBValue?

    /// Position of the gradient center [a azimuthal angle, p polar angle]. The azimuthal angle indicates the position of the gradient center relative to 0 degree north, where degrees proceed clockwise. The polar angle indicates the height of the gradient center, where 0 degree is directly above, at zenith, and 90 degree at the horizon.
    @objc public var skyGradientCenter: TMBValue?

    /// The angular distance (measured in degrees) from `sky-gradient-center` up to which the gradient extends. A value of 180 causes the gradient to wrap around to the opposite direction from `sky-gradient-center`.
    @objc public var skyGradientRadius: TMBValue?

    /// The opacity of the entire sky layer.
    @objc public var skyOpacity: TMBValue?

    /// Transition options for `skyOpacity`.
    @objc public var skyOpacityTransition: TMBStyleTransition?

    /// The type of the sky
    @objc public var skyType: TMBValue?

}

extension TMBSkyLayer {
    public func mapTo(_ layer: inout SkyLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.skyAtmosphereColor = self.skyAtmosphereColor?.styleColor()
        layer.skyAtmosphereHaloColor = self.skyAtmosphereHaloColor?.styleColor()
        layer.skyAtmosphereSun = self.skyAtmosphereSun?.arrayOfDouble()
        layer.skyAtmosphereSunIntensity = self.skyAtmosphereSunIntensity?.double()
        layer.skyGradient = self.skyGradient?.styleColor()
        layer.skyGradientCenter = self.skyGradientCenter?.arrayOfDouble()
        layer.skyGradientRadius = self.skyGradientRadius?.double()
        layer.skyOpacity = self.skyOpacity?.double()
        layer.skyOpacityTransition = self.skyOpacityTransition?.styleTransition()
        layer.skyType = self.skyType?.skyType()
    }
}

extension SkyLayer {
    public func mapTo(_ layer:inout TMBSkyLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = TMBValue.fromSwiftValue(self.visibility)
        layer.skyAtmosphereColor = TMBValue.fromSwiftValue(self.skyAtmosphereColor)
        layer.skyAtmosphereHaloColor = TMBValue.fromSwiftValue(self.skyAtmosphereHaloColor)
        layer.skyAtmosphereSun = TMBValue.fromSwiftValue(self.skyAtmosphereSun)
        layer.skyAtmosphereSunIntensity = TMBValue.fromSwiftValue(self.skyAtmosphereSunIntensity)
        layer.skyGradient = TMBValue.fromSwiftValue(self.skyGradient)
        layer.skyGradientCenter = TMBValue.fromSwiftValue(self.skyGradientCenter)
        layer.skyGradientRadius = TMBValue.fromSwiftValue(self.skyGradientRadius)
        layer.skyOpacity = TMBValue.fromSwiftValue(self.skyOpacity)
        layer.skyOpacityTransition = self.skyOpacityTransition?.objcValue()
        layer.skyType = TMBValue.fromSwiftValue(self.skyType)
    }
}

extension TMBSkyLayer: SwiftValueConvertible {
    public func swiftValue() -> SkyLayer {
        var layer = SkyLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension SkyLayer: ObjcConvertible {
    public func objcValue() ->  TMBSkyLayer {
        var layer = TMBSkyLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}