// This file is generated.
import Foundation
import MapboxMaps


/// A style's fog property is a global effect that improves depth perception by fading out distant objects.
///
/// - SeeAlso: [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/fog/)
@objc open class TMBAtmosphere: NSObject {

    /// The color of the atmosphere region immediately below the horizon and within the `range` and above the horizon and within `horizon-blend`. Using opacity is recommended only for smoothly transitioning fog on/off as anything less than 100% opacity results in more tiles loaded and drawn.
    @objc public var color: TMBValue?

    /// Transition property for `color`
    @objc public var colorTransition: TMBStyleTransition?

    /// The color of the atmosphere region above the horizon, `high-color` extends further above the horizon than the `color` property and its spread can be controlled with `horizon-blend`. The opacity can be set to `0` to remove the high atmosphere color contribution.
    @objc public var highColor: TMBValue?

    /// Transition property for `highColor`
    @objc public var highColorTransition: TMBStyleTransition?

    /// Horizon blend applies a smooth fade from the color of the atmosphere to the color of space. A value of zero leaves a sharp transition from atmosphere to space. Increasing the value blends the color of atmosphere into increasingly high angles of the sky.
    @objc public var horizonBlend: TMBValue?

    /// Transition property for `horizonBlend`
    @objc public var horizonBlendTransition: TMBStyleTransition?

    /// The start and end distance range in which fog fades from fully transparent to fully opaque. The distance to the point at the center of the map is defined as zero, so that negative range values are closer to the camera, and positive values are farther away.
    @objc public var range: TMBValue?

    /// Transition property for `range`
    @objc public var rangeTransition: TMBStyleTransition?

    /// The color of the region above the horizon and after the end of the `horizon-blend` contribution. The opacity can be set to `0` to have a transparent background.
    @objc public var spaceColor: TMBValue?

    /// Transition property for `spaceColor`
    @objc public var spaceColorTransition: TMBStyleTransition?

    /// A value controlling the star intensity where `0` will show no stars and `1` will show stars at their maximum intensity.
    @objc public var starIntensity: TMBValue?

    /// Transition property for `starIntensity`
    @objc public var starIntensityTransition: TMBStyleTransition?

}

extension TMBAtmosphere {
    public func mapTo(_ source: inout Atmosphere) {
        source.color = self.color?.styleColor()
        source.colorTransition = self.colorTransition?.styleTransition()
        source.highColor = self.highColor?.styleColor()
        source.highColorTransition = self.highColorTransition?.styleTransition()
        source.horizonBlend = self.horizonBlend?.double()
        source.horizonBlendTransition = self.horizonBlendTransition?.styleTransition()
        source.range = self.range?.arrayOfDouble()
        source.rangeTransition = self.rangeTransition?.styleTransition()
        source.spaceColor = self.spaceColor?.styleColor()
        source.spaceColorTransition = self.spaceColorTransition?.styleTransition()
        source.starIntensity = self.starIntensity?.double()
        source.starIntensityTransition = self.starIntensityTransition?.styleTransition()
    }
}

extension Atmosphere {
    public func mapTo(_ source:inout TMBAtmosphere) {
        source.color = self.color?.styleColor()
        source.colorTransition = self.colorTransition?.objcValue()
        source.highColor = self.highColor?.styleColor()
        source.highColorTransition = self.highColorTransition?.objcValue()
        source.horizonBlend = self.horizonBlend?.double()
        source.horizonBlendTransition = self.horizonBlendTransition?.objcValue()
        source.range = self.range?.arrayOfDouble()
        source.rangeTransition = self.rangeTransition?.objcValue()
        source.spaceColor = self.spaceColor?.styleColor()
        source.spaceColorTransition = self.spaceColorTransition?.objcValue()
        source.starIntensity = self.starIntensity?.double()
        source.starIntensityTransition = self.starIntensityTransition?.objcValue()
    }
}

extension TMBAtmosphere: SwiftValueConvertible {
    public func swiftValue() -> Atmosphere {
        var source = Atmosphere()
        
        self.mapTo(&source)
        
        return source
    }
}

extension Atmosphere {
    public func objcValue() ->  TMBAtmosphere {
        var source = TMBAtmosphere()
        
        self.mapTo(&source)
        
        return source
    }
}
