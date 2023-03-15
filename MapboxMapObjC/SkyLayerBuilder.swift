import MapboxMaps

@objc
extension MapView {
    @objc public func addSkyLayer(_ id: String, configure: (SkyLayerBuilder)->Void, onError: ((Error)->Void)?) {
        let layerBuilder = SkyLayerBuilder(id: id)
        configure(layerBuilder)
        
        do {
            try self.mapboxMap.style.addLayer(layerBuilder.build())
        } catch {
            onError?(error)
        }
    }
    
    @objc public func addLayerBelow(withProperties properties: NSDictionary, layerId: String, onError: ((Error)->Void)?) {
        do {
            let swiftProperties = properties as! [String: Any]
            try self.mapboxMap.style.addLayer(with: swiftProperties,
                                              layerPosition: .below(layerId))
        } catch {
            onError?(error)
        }
    }
}

@objc
open class SkyLayerBuilder : NSObject {
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func build() -> SkyLayer {
        var result = SkyLayer(id: id)
        
        result.filter = filter?.swiftOnly()
        result.source = source
        result.sourceLayer = sourceLayer
        result.minZoom = minZoom?.doubleValue
        result.maxZoom = maxZoom?.doubleValue

        /// Whether this layer is displayed.
        result.visibility = visibility?.visibility()

        /// A color used to tweak the main atmospheric scattering coefficients. Using white applies the default coefficients giving the natural blue color to the atmosphere. This color affects how heavily the corresponding wavelength is represented during scattering. The alpha channel describes the density of the atmosphere, with 1 maximum density and 0 no density.
        result.skyAtmosphereColor = skyAtmosphereColor?.styleColor()

        /// A color applied to the atmosphere sun halo. The alpha channel describes how strongly the sun halo is represented in an atmosphere sky layer.
        result.skyAtmosphereHaloColor = skyAtmosphereHaloColor?.styleColor()

        /// Position of the sun center [a azimuthal angle, p polar angle]. The azimuthal angle indicates the position of the sun relative to 0 degree north, where degrees proceed clockwise. The polar angle indicates the height of the sun, where 0 degree is directly above, at zenith, and 90 degree at the horizon. When this property is ommitted, the sun center is directly inherited from the light position.
        result.skyAtmosphereSun = skyAtmosphereSun?.arrayOfDouble()

        /// Intensity of the sun as a light source in the atmosphere (on a scale from 0 to a 100). Setting higher values will brighten up the sky.
        result.skyAtmosphereSunIntensity = skyAtmosphereSunIntensity?.double()

        /// Defines a radial color gradient with which to color the sky. The color values can be interpolated with an expression using `sky-radial-progress`. The range [0, 1] for the interpolant covers a radial distance (in degrees) of [0, `sky-gradient-radius`] centered at the position specified by `sky-gradient-center`.
        result.skyGradient = skyGradient?.styleColor()

        /// Position of the gradient center [a azimuthal angle, p polar angle]. The azimuthal angle indicates the position of the gradient center relative to 0 degree north, where degrees proceed clockwise. The polar angle indicates the height of the gradient center, where 0 degree is directly above, at zenith, and 90 degree at the horizon.
        result.skyGradientCenter = skyGradientCenter?.arrayOfDouble()

        /// The angular distance (measured in degrees) from `sky-gradient-center` up to which the gradient extends. A value of 180 causes the gradient to wrap around to the opposite direction from `sky-gradient-center`.
        result.skyGradientRadius = skyGradientRadius?.double()

        /// The opacity of the entire sky layer.
        result.skyOpacity = skyOpacity?.double()

        /// Transition options for `skyOpacity`.
        result.skyOpacityTransition = skyOpacityTransition?.swiftOnly()

        /// The type of the sky
        result.skyType = skyType?.skyType()
        
        return result
    }
    
    private var filter: MBXExpression?;
    @objc public func filter(_ value: MBXExpression?) {
        filter = value
    }
    private var source: String?;
    @objc public func source(_ value: String?) {
        source = value
    }
    private var sourceLayer: String?;
    @objc public func sourceLayer(_ value: String?) {
        sourceLayer = value
    }
    private var minZoom: NSNumber?;
    @objc public func minZoom(_ value: NSNumber?) {
        minZoom = value
    }
    private var maxZoom: NSNumber?;
    @objc public func maxZoom(_ value: NSNumber?) {
        maxZoom = value
    }

    /// Whether this layer is displayed.
    private var visibility: MBXValue?;
    @objc public func visibility(_ value: MBXValue?) {
        visibility = value
    }

    /// A color used to tweak the main atmospheric scattering coefficients. Using white applies the default coefficients giving the natural blue color to the atmosphere. This color affects how heavily the corresponding wavelength is represented during scattering. The alpha channel describes the density of the atmosphere, with 1 maximum density and 0 no density.
    private var skyAtmosphereColor: MBXValue?;
    @objc public func skyAtmosphereColor(_ value: MBXValue?) {
        skyAtmosphereColor = value
    }

    /// A color applied to the atmosphere sun halo. The alpha channel describes how strongly the sun halo is represented in an atmosphere sky layer.
    private var skyAtmosphereHaloColor: MBXValue?;
    @objc public func skyAtmosphereHaloColor(_ value: MBXValue?) {
        skyAtmosphereHaloColor = value
    }

    /// Position of the sun center [a azimuthal angle, p polar angle]. The azimuthal angle indicates the position of the sun relative to 0 degree north, where degrees proceed clockwise. The polar angle indicates the height of the sun, where 0 degree is directly above, at zenith, and 90 degree at the horizon. When this property is ommitted, the sun center is directly inherited from the light position.
    private var skyAtmosphereSun: MBXValue?;
    @objc public func skyAtmosphereSun(_ value: MBXValue?) {
        skyAtmosphereSun = value
    }

    /// Intensity of the sun as a light source in the atmosphere (on a scale from 0 to a 100). Setting higher values will brighten up the sky.
    private var skyAtmosphereSunIntensity: MBXValue?;
    @objc public func skyAtmosphereSunIntensity(_ value: MBXValue?) {
        skyAtmosphereSunIntensity = value
    }

    /// Defines a radial color gradient with which to color the sky. The color values can be interpolated with an expression using `sky-radial-progress`. The range [0, 1] for the interpolant covers a radial distance (in degrees) of [0, `sky-gradient-radius`] centered at the position specified by `sky-gradient-center`.
    private var skyGradient: MBXValue?;
    @objc public func skyGradient(_ value: MBXValue?) {
        skyGradient = value
    }

    /// Position of the gradient center [a azimuthal angle, p polar angle]. The azimuthal angle indicates the position of the gradient center relative to 0 degree north, where degrees proceed clockwise. The polar angle indicates the height of the gradient center, where 0 degree is directly above, at zenith, and 90 degree at the horizon.
    private var skyGradientCenter: MBXValue?;
    @objc public func skyGradientCenter(_ value: MBXValue?) {
        skyGradientCenter = value
    }

    /// The angular distance (measured in degrees) from `sky-gradient-center` up to which the gradient extends. A value of 180 causes the gradient to wrap around to the opposite direction from `sky-gradient-center`.
    private var skyGradientRadius: MBXValue?;
    @objc public func skyGradientRadius(_ value: MBXValue?) {
        skyGradientRadius = value
    }

    /// The opacity of the entire sky layer.
    private var skyOpacity: MBXValue?;
    @objc public func skyOpacity(_ value: MBXValue?) {
        skyOpacity = value
    }

    /// Transition options for `skyOpacity`.
    private var skyOpacityTransition: MBXStyleTransition?;
    @objc public func skyOpacityTransition(_ value: MBXStyleTransition?) {
        skyOpacityTransition = value
    }

    /// The type of the sky
    private var skyType: MBXValue?;
    @objc public func skyType(_ value: MBXValue?) {
        skyType = value
    }
}
