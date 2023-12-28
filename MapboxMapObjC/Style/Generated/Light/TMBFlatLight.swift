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
    @objc public let type: TMBLightType = .flat

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
}
extension TMBFlatLight {
    func unwrap() -> FlatLight {
        var result = FlatLight(id: self.id)
        result.anchor = self.anchor?.anchor()
        result.color = self.color?.styleColor()
        result.colorTransition = self.colorTransition?.unwrap()
        result.intensity = self.intensity?.double()
        result.intensityTransition = self.intensityTransition?.unwrap()
        result.position = self.position?.arrayOfDouble()
        result.positionTransition = self.positionTransition?.unwrap()
        return result
    }
}
extension FlatLight {
    func wrap() -> TMBFlatLight {
        var result = TMBFlatLight(id: self.id)
        result.anchor = self.anchor?.anchor()
        result.color = self.color?.styleColor()
        result.colorTransition = self.colorTransition?.wrap()
        result.intensity = self.intensity?.double()
        result.intensityTransition = self.intensityTransition?.wrap()
        result.position = self.position?.arrayOfDouble()
        result.positionTransition = self.positionTransition?.wrap()
        return result
    }
}
