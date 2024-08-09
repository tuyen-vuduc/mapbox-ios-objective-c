// This file is generated.
import Foundation
import MapboxMaps


/// A light that has a direction and is located at infinite, so its rays are parallel. Simulates the sun light and it can cast shadows
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#light)
@objc open class TMBDirectionalLight: NSObject {

    /// Unique light name
    @objc public var id: String

    /// Type of the light.
    @objc public let type: TMBLightType = .directional

    /// Enable/Disable shadow casting for this light
    @objc public var castShadows: TMBValue?

    /// Color of the directional light.
    @objc public var color: TMBValue?

    /// Transition property for `color`
    @objc public var colorTransition: TMBStyleTransition?

    /// Direction of the light source specified as [a azimuthal angle, p polar angle] where a indicates the azimuthal angle of the light relative to north (in degrees and proceeding clockwise), and p indicates polar angle of the light (from 0 degree, directly above, to 180 degree, directly below).
    @objc public var direction: TMBValue?

    /// Transition property for `direction`
    @objc public var directionTransition: TMBStyleTransition?

    /// A multiplier for the color of the directional light.
    @objc public var intensity: TMBValue?

    /// Transition property for `intensity`
    @objc public var intensityTransition: TMBStyleTransition?

    /// Determines the shadow strength, affecting the shadow receiver surfaces final color. Values near 0.0 reduce the shadow contribution to the final color. Values near to 1.0 make occluded surfaces receive almost no directional light. Designed to be used mostly for transitioning between values 0 and 1.
    @objc public var shadowIntensity: TMBValue?

    /// Transition property for `shadowIntensity`
    @objc public var shadowIntensityTransition: TMBStyleTransition?

    /// Creates a new Directional light.
    @objc public init(id : String){
        self.id = id
    }
}
extension TMBDirectionalLight {
    func unwrap() -> DirectionalLight {
        var result = DirectionalLight(id: self.id)
        result.castShadows = self.castShadows?.bool()
        result.color = self.color?.styleColor()
        result.colorTransition = self.colorTransition?.unwrap()
        result.direction = self.direction?.arrayOfDouble()
        result.directionTransition = self.directionTransition?.unwrap()
        result.intensity = self.intensity?.double()
        result.intensityTransition = self.intensityTransition?.unwrap()
        result.shadowIntensity = self.shadowIntensity?.double()
        result.shadowIntensityTransition = self.shadowIntensityTransition?.unwrap()
        return result
    }
}
extension DirectionalLight {
    func wrap() -> TMBDirectionalLight {
        var result = TMBDirectionalLight(id: self.id)
        result.castShadows = self.castShadows?.bool()
        result.color = self.color?.styleColor()
        result.colorTransition = self.colorTransition?.wrap()
        result.direction = self.direction?.arrayOfDouble()
        result.directionTransition = self.directionTransition?.wrap()
        result.intensity = self.intensity?.double()
        result.intensityTransition = self.intensityTransition?.wrap()
        result.shadowIntensity = self.shadowIntensity?.double()
        result.shadowIntensityTransition = self.shadowIntensityTransition?.wrap()
        return result
    }
}
