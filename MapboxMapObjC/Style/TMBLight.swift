// This file is generated.
import Foundation
import MapboxMaps

/// The global light source.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#light)
@objc open class TMBLight: NSObject {

    /// Whether extruded geometries are lit relative to the map or viewport.
    @objc public var anchor: NSNumber?

    /// Color tint for lighting extruded geometries.
    @objc public var color: UIColor?

    /// Transition property for `color`
    @objc public var colorTransition: TMBStyleTransition?

    /// Intensity of lighting (on a scale from 0 to 1). Higher numbers will present as more extreme contrast.
    @objc public var intensity: NSNumber?

    /// Transition property for `intensity`
    @objc public var intensityTransition: TMBStyleTransition?

    /// Position of the light source relative to lit (extruded) geometries, in [r radial coordinate, a azimuthal angle, p polar angle] where r indicates the distance from the center of the base of an object to its light, a indicates the position of the light relative to 0 degree (0 degree when `light.anchor` is set to `viewport` corresponds to the top of the viewport, or 0 degree when `light.anchor` is set to `map` corresponds to due north, and degrees proceed clockwise), and p indicates the height of the light (from 0 degree, directly above, to 180 degree, directly below).
    @objc public var position: [Double]?

    /// Transition property for `position`
    @objc public var positionTransition: TMBStyleTransition?

}

extension TMBLight {
    public func mapTo(_ source: inout Light) {
        source.anchor = self.anchor?.anchor().swiftValue()
        source.color = self.color?.styleColor()
        source.colorTransition = self.colorTransition?.styleTransition()
        source.intensity = self.intensity?.double()
        source.intensityTransition = self.intensityTransition?.styleTransition()
        source.position = self.position
        source.positionTransition = self.positionTransition?.styleTransition()
    }
}

extension Light {
    public func mapTo(_ source:inout TMBLight) {
        source.anchor = self.anchor?.objcValue().asNumber()
        source.color = self.color?.objcValue()
        source.colorTransition = self.colorTransition?.objcValue()
        source.intensity = self.intensity?.asNumber()
        source.intensityTransition = self.intensityTransition?.objcValue()
        source.position = self.position
        source.positionTransition = self.positionTransition?.objcValue()
    }
}

extension TMBLight: SwiftValueConvertible {
    public func swiftValue() -> Light {
        var source = Light()
        
        self.mapTo(&source)
        
        return source
    }
}

extension Light {
    public func objcValue() ->  TMBLight {
        var source = TMBLight()
        
        self.mapTo(&source)
        
        return source
    }
}
