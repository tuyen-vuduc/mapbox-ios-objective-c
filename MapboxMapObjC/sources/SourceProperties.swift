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

extension TMBScheme: SwiftValueConvertible {
    public func swiftValue() -> Scheme {
        switch(self) {
            case .xyz:
                return .xyz
            case .tms:
                return .tms
        }
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

extension TMBEncoding: SwiftValueConvertible {
    public func swiftValue() -> Encoding {
        switch(self) {
            case .terrarium:
                return .terrarium
            case .mapbox:
                return .mapbox
        }
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
}

// End of generated file.
