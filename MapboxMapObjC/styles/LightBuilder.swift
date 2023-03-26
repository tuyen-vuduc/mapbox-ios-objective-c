import MapboxMaps

class TMBError : Error {
    public let message: String
    
    init(message: String) {
        self.message = message
    }
}

@objc
extension MapView {
    /// Whether extruded geometries are lit relative to the map or viewport.
    @objc public func lightAnchor(_ value: TMBAnchor, onError: ((Error)->Void)?) {
        do {
           try self.mapboxMap.style.setLightProperty("anchor", value: anchorMapping[value]!)
        } catch {
            onError?(error)
        }
    }

    /// Color tint for lighting extruded geometries.
    @objc public func lightColor(_ value: UIColor, onError: ((Error)->Void)?) {
        do {
            let styleColor = value.styleColor()
            let data = try styleColor.toJSON()
            try self.mapboxMap.style.setLightProperty("color", value: data)
        } catch {
            onError?(error)
        }
    }

    /// Transition property for `color`
    @objc public func lightColorTransition(_ value: TMBStyleTransition, onError: ((Error)->Void)?) {
        do {
            try self.mapboxMap.style.setLightProperty("colorTransition", value: value.swiftOnly())
        } catch {
            onError?(error)
        }
    }

    /// Intensity of lighting (on a scale from 0 to 1). Higher numbers will present as more extreme contrast.
    @objc public func lightIntensity(_ value: Double, onError: ((Error)->Void)?) {
        do {
           try self.mapboxMap.style.setLightProperty("intensity", value: value)
        } catch {
            onError?(error)
        }
    }

    /// Transition property for `intensity`
    @objc public func lightIntensityTransition(_ value: TMBStyleTransition, onError: ((Error)->Void)?) {
        do {
           try self.mapboxMap.style.setLightProperty("intensityTransition", value: value.swiftOnly())
        } catch {
            onError?(error)
        }
    }

    /// Position of the light source relative to lit (extruded) geometries, in [r radial coordinate, a azimuthal angle, p polar angle] where r indicates the distance from the center of the base of an object to its light, a indicates the position of the light relative to 0 degree (0 degree when `light.anchor` is set to `viewport` corresponds to the top of the viewport, or 0 degree when `light.anchor` is set to `map` corresponds to due north, and degrees proceed clockwise), and p indicates the height of the light (from 0 degree, directly above, to 180 degree, directly below).
    @objc public func lightPosition(_ value: [Double], onError: ((Error)->Void)?) {
        do {
            try self.mapboxMap.style.setLightProperty("position", value: value)
        } catch {
            onError?(error)
        }
    }

    /// Transition property for `position`
    @objc public func lightPositionTransition(_ value: TMBStyleTransition, onError: ((Error)->Void)?) {
        do {
            try self.mapboxMap.style.setLightProperty("positionTransition", value: value.swiftOnly())
        } catch {
            onError?(error)
        }
    }
}

internal extension Encodable {
    /// Given an Encodable object return the JSON representation
    /// - Throws: Errors occurring during conversion.
    /// - Returns: A JSON value representing the object.
    func toJSON() throws -> Any {
        // wrap self in an array since encoding and decoding JSON
        // fragments is not supported on older iOS versions.
        let object = try JSONSerialization.jsonObject(with: JSONEncoder().encode([self]))

        // Since we know that the input was wrapped in an array, we can
        // count on the output also being wrapped in an array.
        // swiftlint:disable:next force_cast
        let array = object as! [Any]

        // Since we know that the input array had length 1, we can count
        // on `first` being non-nil
        return array.first!
    }

    /// Given an Encodable object return the JSON representation as a string
    /// - Throws: Errors occurring during conversion.
    /// - Returns: A string with JSON representing the object.
    func toString(encoding: String.Encoding = .utf8) throws -> String {
        let data: Data
        if #available(iOS 13.0, *) {
            data = try JSONEncoder().encode(self)
        } else {
            // JSONEncoder doesn't support fragments on older iOS versions https://github.com/apple/swift-corelibs-foundation/issues/4402
            data = try JSONSerialization.data(withJSONObject: self.toJSON(), options: .fragmentsAllowed)
        }

        guard let result = String(data: data, encoding: encoding) else {
            throw TypeConversionError.unsuccessfulConversion
        }

        return result
    }
}
