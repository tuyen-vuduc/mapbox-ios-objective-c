// This file is generated.
import Foundation
import MapboxMaps

/// Influences the y direction of the tile coordinates. The global-mercator (aka Spherical Mercator) profile is assumed.
@objc public enum TMBScheme: Int {

    /// Slippy map tilenames scheme.
    case xyz

    /// OSGeo spec scheme.
    case tms

}

@objc extension TMBValue {
    @objc public class func scheme(_ scheme: TMBScheme) -> TMBValue {
        return TMBValue(constant: NSNumber(value: scheme.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withScheme scheme: TMBScheme) -> NSNumber {
        return NSNumber(value: scheme.rawValue)
    }
    
    @objc public func scheme() -> TMBScheme {
        return TMBScheme(rawValue: self.intValue)!
    }
}

extension NSNumber {
    public var Scheme: Scheme {
        return scheme().swiftValue()
    }
}

extension TMBScheme: SwiftValueConvertible {
    public func swiftValue() -> Scheme {
        switch(self) {
            case .xyz:
                return .xyz
            case .tms:
                return .tms
        }
    }

    func asNumber() -> NSNumber {
        return NSNumber(value: self.rawValue)
    }
}

extension Scheme: ObjcConvertible {
    public func objcValue() -> TMBScheme {
        switch(self) {
            case .xyz:
                return .xyz
            case .tms:
                return .tms
        }
    }

    func asNumber() -> NSNumber {
        return NSNumber(value: objcValue().rawValue)
    }
}

extension MapboxMaps.Value where T == Scheme {
    func scheme() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.asNumber())
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [Scheme] {
    func arrayOfScheme() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.asNumber() })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension TMBValue {
    func scheme() -> Value<Scheme>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.Scheme)
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOfScheme() -> Value<[Scheme]>? {
        if let constant = self.constant as? [NSNumber] {
            return Value.constant(constant.map({ $0.Scheme }))
        }
        
        return Value.expression(expression!.rawValue)
    }
}

/// The encoding used by this source. Mapbox Terrain RGB is used by default
@objc public enum TMBEncoding: Int {

    /// Terrarium format PNG tiles. See https://aws.amazon.com/es/public-datasets/terrain/ for more info.
    case terrarium

    /// Mapbox Terrain RGB tiles. See https://www.mapbox.com/help/access-elevation-data/#mapbox-terrain-rgb for more info.
    case mapbox

}

@objc extension TMBValue {
    @objc public class func encoding(_ encoding: TMBEncoding) -> TMBValue {
        return TMBValue(constant: NSNumber(value: encoding.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withEncoding encoding: TMBEncoding) -> NSNumber {
        return NSNumber(value: encoding.rawValue)
    }
    
    @objc public func encoding() -> TMBEncoding {
        return TMBEncoding(rawValue: self.intValue)!
    }
}

extension NSNumber {
    public var Encoding: Encoding {
        return encoding().swiftValue()
    }
}

extension TMBEncoding: SwiftValueConvertible {
    public func swiftValue() -> Encoding {
        switch(self) {
            case .terrarium:
                return .terrarium
            case .mapbox:
                return .mapbox
        }
    }

    func asNumber() -> NSNumber {
        return NSNumber(value: self.rawValue)
    }
}

extension Encoding: ObjcConvertible {
    public func objcValue() -> TMBEncoding {
        switch(self) {
            case .terrarium:
                return .terrarium
            case .mapbox:
                return .mapbox
        }
    }

    func asNumber() -> NSNumber {
        return NSNumber(value: objcValue().rawValue)
    }
}

extension MapboxMaps.Value where T == Encoding {
    func encoding() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.asNumber())
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [Encoding] {
    func arrayOfEncoding() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.asNumber() })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension TMBValue {
    func encoding() -> Value<Encoding>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.Encoding)
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOfEncoding() -> Value<[Encoding]>? {
        if let constant = self.constant as? [NSNumber] {
            return Value.constant(constant.map({ $0.Encoding }))
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// End of generated file.
