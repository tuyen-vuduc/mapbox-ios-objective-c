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
    @objc public var type: TMBLightType

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

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootCodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)

        var propertiesContainer = container.nestedContainer(keyedBy: PropertiesCodingKeys.self, forKey: .properties)
        try propertiesContainer.encodeIfPresent(castShadows, forKey: .castShadows)
        try propertiesContainer.encodeIfPresent(color, forKey: .color)
        try propertiesContainer.encodeIfPresent(colorTransition, forKey: .colorTransition)
        try propertiesContainer.encodeIfPresent(direction, forKey: .direction)
        try propertiesContainer.encodeIfPresent(directionTransition, forKey: .directionTransition)
        try propertiesContainer.encodeIfPresent(intensity, forKey: .intensity)
        try propertiesContainer.encodeIfPresent(intensityTransition, forKey: .intensityTransition)
        try propertiesContainer.encodeIfPresent(shadowIntensity, forKey: .shadowIntensity)
        try propertiesContainer.encodeIfPresent(shadowIntensityTransition, forKey: .shadowIntensityTransition)
    }

    @objc public init(from  decoder: TMBDecoder){
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)

        if let propertiesContainer = try? container.nestedContainer(keyedBy: PropertiesCodingKeys.self, forKey: .properties) {
            self.castShadows = try propertiesContainer.decodeIfPresent(Value<Bool>.self, forKey: .castShadows)
            self.color = try propertiesContainer.decodeIfPresent(Value<StyleColor>.self, forKey: .color)
            self.colorTransition = try propertiesContainer.decodeIfPresent(StyleTransition.self, forKey: .colorTransition)
            self.direction = try propertiesContainer.decodeIfPresent(Value<[Double]>.self, forKey: .direction)
            self.directionTransition = try propertiesContainer.decodeIfPresent(StyleTransition.self, forKey: .directionTransition)
            self.intensity = try propertiesContainer.decodeIfPresent(Value<Double>.self, forKey: .intensity)
            self.intensityTransition = try propertiesContainer.decodeIfPresent(StyleTransition.self, forKey: .intensityTransition)
            self.shadowIntensity = try propertiesContainer.decodeIfPresent(Value<Double>.self, forKey: .shadowIntensity)
            self.shadowIntensityTransition = try propertiesContainer.decodeIfPresent(StyleTransition.self, forKey: .shadowIntensityTransition)
        }
    }

    enum RootCodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case properties = "properties"
    }

    enum PropertiesCodingKeys: String, CodingKey {
        case castShadows = "cast-shadows"
        case color = "color"
        case colorTransition = "color-transition"
        case direction = "direction"
        case directionTransition = "direction-transition"
        case intensity = "intensity"
        case intensityTransition = "intensity-transition"
        case shadowIntensity = "shadow-intensity"
        case shadowIntensityTransition = "shadow-intensity-transition"
    }
}
extension TMBDirectionalLight {
    func unwrap() -> DirectionalLight {
        DirectionalLight(id: self.id)
    }
}
extension DirectionalLight {
    func wrap() -> TMBDirectionalLight {
        TMBDirectionalLight(id: self.id)
    }
}