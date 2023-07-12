import Foundation
import MapboxMaps

/// The global light source.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#light)
@objc open class TMBLight: NSObject {
    private var _self: Light;
    init(_ _self: Light) {
        self._self = _self
    }
    public var rawValue: Light {
        return _self
    }
    
    /// Whether extruded geometries are lit relative to the map or viewport.
    @objc public var anchor: NSNumber? {
        get {
            return _self.anchor?.asNumber()
        }
        set {
            _self.anchor = newValue?.Anchor
        }
    }

    /// Color tint for lighting extruded geometries.
    @objc public var color: UIColor? {
        get {
            _self.color?.uiColor()
        }
        set {
            _self.color = newValue?.styleColor()
        }
    }

    /// Transition property for `color`
    @objc public var colorTransition: TMBStyleTransition? {
        get {
            _self.colorTransition?.objcValue()
        }
        set {
            _self.colorTransition = newValue?.rawValue
        }
    }

    /// Intensity of lighting (on a scale from 0 to 1). Higher numbers will present as more extreme contrast.
    @objc public var intensity: NSNumber? {
        get {
            _self.intensity?.NSNumber
        }
        set {
            _self.intensity = newValue?.doubleValue
        }
    }

    /// Transition property for `intensity`
    @objc public var intensityTransition: TMBStyleTransition? {
        get {
            _self.intensityTransition?.objcValue()
        }
        set {
            _self.intensityTransition = newValue?.rawValue
        }
    }

    /// Position of the light source relative to lit (extruded) geometries, in [r radial coordinate, a azimuthal angle, p polar angle] where r indicates the distance from the center of the base of an object to its light, a indicates the position of the light relative to 0 degree (0 degree when `light.anchor` is set to `viewport` corresponds to the top of the viewport, or 0 degree when `light.anchor` is set to `map` corresponds to due north, and degrees proceed clockwise), and p indicates the height of the light (from 0 degree, directly above, to 180 degree, directly below).
    @objc public var position: [Double]? {
        get {
            _self.position
        }
        set {
            _self.position = newValue
        }
    }

    /// Transition property for `position`
    @objc public var positionTransition: TMBStyleTransition? {
        get {
            _self.positionTransition?.objcValue()
        }
        set {
            _self.positionTransition = newValue?.rawValue
        }
    }

    @objc public override init() {
        _self = Light()
    }
}

extension Light: ObjcConvertible {
    public func objcValue() -> TMBLight {
        return TMBLight(self)
    }
}
