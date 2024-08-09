// This file is generated.
import Foundation
import MapboxMaps


/// An indirect light affecting all objects in the map adding a constant amount of light on them. It has no explicit direction and cannot cast shadows.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#light)
@objc open class TMBAmbientLight: NSObject {

    /// Unique light name
    @objc public var id: String

    /// Type of the light.
    @objc public let type: TMBLightType = TMBLightType.ambient

    /// Color of the ambient light.
    @objc public var color: TMBValue?

    /// Transition property for `color`
    @objc public var colorTransition: TMBStyleTransition?

    /// A multiplier for the color of the ambient light.
    @objc public var intensity: TMBValue?

    /// Transition property for `intensity`
    @objc public var intensityTransition: TMBStyleTransition?
    
    @objc public init(id: String) {
        self.id = id
    }
}

extension TMBAmbientLight {
    func unwrap() -> AmbientLight {
        var result = AmbientLight(id: self.id)
        result.color = self.color?.styleColor()
        result.colorTransition = self.colorTransition?.unwrap()
        result.intensity = self.intensity?.double()
        result.intensityTransition = self.intensityTransition?.unwrap()
        return result
    }
}

extension AmbientLight {
    func wrap() -> TMBAmbientLight {
        let result = TMBAmbientLight(id: self.id)
        result.color = self.color?.styleColor()
        result.colorTransition = self.colorTransition?.wrap()
        result.intensity = self.intensity?.double()
        result.intensityTransition = self.intensityTransition?.wrap()
        return result
    }
}
