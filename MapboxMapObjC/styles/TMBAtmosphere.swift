// This file is generated.
import Foundation
import MapboxMaps


/// A style's fog property is a global effect that improves depth perception by fading out distant objects.
///
/// - SeeAlso: [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/fog/)
@objc open class TMBAtmosphere: NSObject  {
    private var _self: Atmosphere;
    init(_ _self: Atmosphere) {
        self._self = _self
    }
    public var rawValue: Atmosphere {
        return _self
    }
    
    /// The color of the atmosphere region immediately below the horizon and within the `range` and above the horizon and within `horizon-blend`. Using opacity is recommended only for smoothly transitioning fog on/off as anything less than 100% opacity results in more tiles loaded and drawn.
    public var color: TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.color)
        }
        set {
            _self.color = newValue?.styleColor()
        }
    }

    /// Transition property for `color`
    public var colorTransition: TMBStyleTransition? {
        get {
            _self.colorTransition?.objcValue()
        }
        set {
            _self.colorTransition = newValue?.rawValue
        }
    }

    /// The color of the atmosphere region above the horizon, `high-color` extends further above the horizon than the `color` property and its spread can be controlled with `horizon-blend`. The opacity can be set to `0` to remove the high atmosphere color contribution.
    public var highColor: TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.highColor)
        }
        set {
            _self.highColor = newValue?.styleColor()
        }
    }


    /// Transition property for `highColor`
    public var highColorTransition: TMBStyleTransition? {
        get {
            _self.highColorTransition?.objcValue()
        }
        set {
            _self.highColorTransition = newValue?.rawValue
        }
    }

    /// Horizon blend applies a smooth fade from the color of the atmosphere to the color of space. A value of zero leaves a sharp transition from atmosphere to space. Increasing the value blends the color of atmosphere into increasingly high angles of the sky.
    public var horizonBlend: TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.horizonBlend)
        }
        set {
            _self.horizonBlend = newValue?.double()
        }
    }

    /// Transition property for `horizonBlend`
    public var horizonBlendTransition: TMBStyleTransition? {
        get {
            _self.horizonBlendTransition?.objcValue()
        }
        set {
            _self.horizonBlendTransition = newValue?.rawValue
        }
    }

    /// The start and end distance range in which fog fades from fully transparent to fully opaque. The distance to the point at the center of the map is defined as zero, so that negative range values are closer to the camera, and positive values are farther away.
    public var range: TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.range)
        }
        set {
            _self.range = newValue?.arrayOfDouble()
        }
    }

    /// Transition property for `range`
    public var rangeTransition: TMBStyleTransition? {
        get {
            _self.rangeTransition?.objcValue()
        }
        set {
            _self.rangeTransition = newValue?.rawValue
        }
    }

    /// The color of the region above the horizon and after the end of the `horizon-blend` contribution. The opacity can be set to `0` to have a transparent background.
    public var spaceColor: TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.spaceColor)
        }
        set {
            _self.spaceColor = newValue?.styleColor()
        }
    }

    /// Transition property for `spaceColor`
    public var spaceColorTransition: TMBStyleTransition? {
        get {
            _self.starIntensityTransition?.objcValue()
        }
        set {
            _self.starIntensityTransition = newValue?.rawValue
        }
    }

    /// A value controlling the star intensity where `0` will show no stars and `1` will show stars at their maximum intensity.
    public var starIntensity: TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.starIntensity)
        }
        set {
            _self.starIntensity = newValue?.double()
        }
    }

    /// Transition property for `starIntensity`
    public var starIntensityTransition: TMBStyleTransition? {
        get {
            _self.starIntensityTransition?.objcValue()
        }
        set {
            _self.starIntensityTransition = newValue?.rawValue
        }
    }

    @objc public override init() {
        _self = Atmosphere()
    }
}

extension Atmosphere {
    func objcValue() -> TMBAtmosphere {
        return TMBAtmosphere(self)
    }
}
