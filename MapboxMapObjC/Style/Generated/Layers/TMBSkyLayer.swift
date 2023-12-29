// This file is generated.
import Foundation
import MapboxMaps


/// A spherical dome around the map that is always rendered behind all other layers.
/// Warning: As of v10.6.0, ``Atmosphere`` is the preferred method for atmospheric styling. Sky layer is not supported by the globe projection, and will be phased out in future major release.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-sky)
@objc open class TMBSkyLayer: NSObject, TMBLayer {

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

    /// A color used to tweak the main atmospheric scattering coefficients. Using white applies the default coefficients giving the natural blue color to the atmosphere. This color affects how heavily the corresponding wavelength is represented during scattering. The alpha channel describes the density of the atmosphere, with 1 maximum density and 0 no density.
    @objc public var  skyAtmosphereColor: TMBValue?

    /// A color applied to the atmosphere sun halo. The alpha channel describes how strongly the sun halo is represented in an atmosphere sky layer.
    @objc public var  skyAtmosphereHaloColor: TMBValue?

    /// Position of the sun center [a azimuthal angle, p polar angle]. The azimuthal angle indicates the position of the sun relative to 0 degree north, where degrees proceed clockwise. The polar angle indicates the height of the sun, where 0 degree is directly above, at zenith, and 90 degree at the horizon. When this property is ommitted, the sun center is directly inherited from the light position.
    @objc public var  skyAtmosphereSun: TMBValue?

    /// Intensity of the sun as a light source in the atmosphere (on a scale from 0 to a 100). Setting higher values will brighten up the sky.
    @objc public var  skyAtmosphereSunIntensity: TMBValue?

    /// Defines a radial color gradient with which to color the sky. The color values can be interpolated with an expression using `sky-radial-progress`. The range [0, 1] for the interpolant covers a radial distance (in degrees) of [0, `sky-gradient-radius`] centered at the position specified by `sky-gradient-center`.
    @objc public var  skyGradient: TMBValue?

    /// Position of the gradient center [a azimuthal angle, p polar angle]. The azimuthal angle indicates the position of the gradient center relative to 0 degree north, where degrees proceed clockwise. The polar angle indicates the height of the gradient center, where 0 degree is directly above, at zenith, and 90 degree at the horizon.
    @objc public var  skyGradientCenter: TMBValue?

    /// The angular distance (measured in degrees) from `sky-gradient-center` up to which the gradient extends. A value of 180 causes the gradient to wrap around to the opposite direction from `sky-gradient-center`.
    @objc public var  skyGradientRadius: TMBValue?

    /// The opacity of the entire sky layer.
    @objc public var  skyOpacity: TMBValue?

    /// Transition options for `skyOpacity`.
    @objc public var  skyOpacityTransition: TMBStyleTransition?

    /// The type of the sky
    @objc public var  skyType: TMBValue?

    
    @objc public init(id : String) {
        self.id = id
        self.type = TMBLayerType.sky
        self.visibility = .visibility(.visible)
    }
}
extension TMBSkyLayer {
    func unwrap() -> SkyLayer {
        SkyLayer(id: self.id)
    }
}
extension SkyLayer {
    func wrap() -> TMBSkyLayer {
        TMBSkyLayer(id: self.id)
    }
}