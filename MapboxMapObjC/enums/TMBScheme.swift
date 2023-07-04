// This file is generated.
import Foundation
import MapboxMaps

/// Influences the y direction of the tile coordinates. The global-mercator (aka Spherical Mercator) profile is assumed.
extension Scheme {
    func objcValue() -> TMBScheme {
        TMBScheme(value: self)
    }
}
@objc
open class TMBScheme :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }
    init(value: Scheme) {
        self.value = value.rawValue
    }
    func swiftValue() -> Scheme{
        Scheme(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }
    
    /// Slippy map tilenames scheme.
    @objc
    public static let xyz:TMBScheme = TMBScheme(value: .xyz)

    /// OSGeo spec scheme.
    @objc
    public static let tms:TMBScheme = TMBScheme(value: .tms)
}

/// The encoding used by this source. Mapbox Terrain RGB is used by default
extension Encoding {
    func objcValue() -> TMBEncoding {
        TMBEncoding(value: self)
    }
}
@objc
open class TMBEncoding :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }
    init(value: Encoding) {
        self.value = value.rawValue
    }
    func swiftValue() -> Encoding {
        Encoding(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }
    
    /// Terrarium format PNG tiles. See https://aws.amazon.com/es/public-datasets/terrain/ for more info.
    @objc
    public static let terrarium:TMBEncoding = TMBEncoding(value: .terrarium)

    /// Mapbox Terrain RGB tiles. See https://www.mapbox.com/help/access-elevation-data/#mapbox-terrain-rgb for more info.
    @objc
    public static let mapbox:TMBEncoding = TMBEncoding(value: .mapbox)
}

// End of generated file.
