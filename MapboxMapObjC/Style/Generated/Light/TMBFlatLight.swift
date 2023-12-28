// This file is generated.
import Foundation
import MapboxMaps


/// A global directional light source which is only applied on 3D layers and hillshade layers. Using this type disables other light sources.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#light)
@objc open class TMBFlatLight: NSObject {

    /// Unique light name
    @objc public var id: String

    /// Type of the light.
    @objc public var type: TMBLightType

    /// Whether extruded geometries are lit relative to the map or viewport.
    @objc public var anchor: TMBValue?

    /// Color tint for lighting extruded geometries.
    @objc public var color: TMBValue?

    /// Transition property for `color`
    @objc public var colorTransition: TMBStyleTransition?

    /// Intensity of lighting (on a scale from 0 to 1). Higher numbers will present as more extreme contrast.
    @objc public var intensity: TMBValue?

    /// Transition property for `intensity`
    @objc public var intensityTransition: TMBStyleTransition?

    /// Position of the light source relative to lit (extruded) geometries, in [r radial coordinate, a azimuthal angle, p polar angle] where r indicates the distance from the center of the base of an object to its light, a indicates the position of the light relative to 0 degree (0 degree when `light.anchor` is set to `viewport` corresponds to the top of the viewport, or 0 degree when `light.anchor` is set to `map` corresponds to due north, and degrees proceed clockwise), and p indicates the height of the light (from 0 degree, directly above, to 180 degree, directly below).
    @objc public var position: TMBValue?

    /// Transition property for `position`
    @objc public var positionTransition: TMBStyleTransition?

    /// Creates a new Flat light.
    @objc public init(id : String){
        self.id = id
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootCodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)

        var propertiesContainer = container.nestedContainer(keyedBy: PropertiesCodingKeys.self, forKey: .properties)
        try propertiesContainer.encodeIfPresent(anchor, forKey: .anchor)
        try propertiesContainer.encodeIfPresent(color, forKey: .color)
        try propertiesContainer.encodeIfPresent(colorTransition, forKey: .colorTransition)
        try propertiesContainer.encodeIfPresent(intensity, forKey: .intensity)
        try propertiesContainer.encodeIfPresent(intensityTransition, forKey: .intensityTransition)
        try propertiesContainer.encodeIfPresent(position, forKey: .position)
        try propertiesContainer.encodeIfPresent(positionTransition, forKey: .positionTransition)
    }

    @objc public init(from  decoder: TMBDecoder){
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)

        if let propertiesContainer = try? container.nestedContainer(keyedBy: PropertiesCodingKeys.self, forKey: .properties) {
            self.anchor = try propertiesContainer.decodeIfPresent(Value<Anchor>.self, forKey: .anchor)
            self.color = try propertiesContainer.decodeIfPresent(Value<StyleColor>.self, forKey: .color)
            self.colorTransition = try propertiesContainer.decodeIfPresent(StyleTransition.self, forKey: .colorTransition)
            self.intensity = try propertiesContainer.decodeIfPresent(Value<Double>.self, forKey: .intensity)
            self.intensityTransition = try propertiesContainer.decodeIfPresent(StyleTransition.self, forKey: .intensityTransition)
            self.position = try propertiesContainer.decodeIfPresent(Value<[Double]>.self, forKey: .position)
            self.positionTransition = try propertiesContainer.decodeIfPresent(StyleTransition.self, forKey: .positionTransition)
        }
    }

    enum RootCodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case properties = "properties"
    }

    enum PropertiesCodingKeys: String, CodingKey {
        case anchor = "anchor"
        case color = "color"
        case colorTransition = "color-transition"
        case intensity = "intensity"
        case intensityTransition = "intensity-transition"
        case position = "position"
        case positionTransition = "position-transition"
    }
}
extension TMBFlatLight {
    func unwrap() -> FlatLight {
        FlatLight(id: self.id)
    }
}
extension FlatLight {
    func wrap() -> TMBFlatLight {
        TMBFlatLight(id: self.id)
    }
}