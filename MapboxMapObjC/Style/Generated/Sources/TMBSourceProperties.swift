// This file is generated.
import Foundation
import MapboxMaps


/// Influences the y direction of the tile coordinates. The global-mercator (aka Spherical Mercator) profile is assumed.
@objc open class TMBScheme: NSObject {

    public let origin: Scheme
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: Scheme(rawValue: rawValue))
    }

    public init(origin: Scheme) {
       self.origin = origin
    }

    /// Slippy map tilenames scheme.
    @objc public static let xyz = TMBScheme(origin: Scheme.xyz)

    /// OSGeo spec scheme.
    @objc public static let tms = TMBScheme(origin: Scheme.tms)

}
extension Scheme {
    func wrap() -> TMBScheme {
        TMBScheme(origin: self)
    }
}
extension TMBScheme: SwiftValueConvertible {
    public func unwrap() -> Scheme {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func scheme(_ value: TMBScheme) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == Scheme {
    func scheme() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [Scheme] {
    func arrayOfScheme() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func scheme() -> Value<Scheme>? {
        if let constant = self.constant as? String {
            return Value.constant(Scheme(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfScheme() -> Value<[Scheme]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ Scheme(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

/// The encoding used by this source. Mapbox Terrain RGB is used by default
@objc open class TMBEncoding: NSObject {

    public let origin: Encoding
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: Encoding(rawValue: rawValue))
    }

    public init(origin: Encoding) {
       self.origin = origin
    }

    /// Terrarium format PNG tiles. See https://aws.amazon.com/es/public-datasets/terrain/ for more info.
    @objc public static let terrarium = TMBEncoding(origin: Encoding.terrarium)

    /// Mapbox Terrain RGB tiles. See https://www.mapbox.com/help/access-elevation-data/#mapbox-terrain-rgb for more info.
    @objc public static let mapbox = TMBEncoding(origin: Encoding.mapbox)

}
extension Encoding {
    func wrap() -> TMBEncoding {
        TMBEncoding(origin: self)
    }
}
extension TMBEncoding: SwiftValueConvertible {
    public func unwrap() -> Encoding {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func encoding(_ value: TMBEncoding) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == Encoding {
    func encoding() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [Encoding] {
    func arrayOfEncoding() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func encoding() -> Value<Encoding>? {
        if let constant = self.constant as? String {
            return Value.constant(Encoding(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfEncoding() -> Value<[Encoding]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ Encoding(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}
