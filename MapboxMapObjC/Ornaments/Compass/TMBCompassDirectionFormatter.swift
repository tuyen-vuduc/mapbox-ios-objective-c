import Foundation
import MapboxMaps

import CoreLocation
import MapboxMaps


/// `Style` is used to configure how a `CompassDirectionFormatter`
/// translates a compass direction into a `String`.
@objc public enum TMBCompassDirectionFormatterStyle: Int {

    /// When a `CompassDirectionFormatter` is configured to use
    /// the `short` style, it uses an abbreviation of the compass direction,
    /// like “N” for north or “NE” for northeast.
    case short

    /// When a `CompassDirectionFormatter` is configured to use
    /// the `long` style, it uses full descriptions of the compass direction,
    /// like “north” or “northeast.”
    case long
}
extension TMBCompassDirectionFormatterStyle {
    func unwrap() -> CompassDirectionFormatter.Style {
        switch(self) {
        case .short:
            .short
        case .long:
            .long
        }
    }
}
extension CompassDirectionFormatter.Style {
    func wrap() -> TMBCompassDirectionFormatterStyle {
        switch(self){
        case .short:
            .short
        case .long:
            .long
        }
    }
}

/// The `CompassDirectionFormatter` class provides properly formatted
/// descriptions of absolute compass directions. For example, a value of `90` may
/// be formatted as “east”, depending on the locale.
@objc open class TMBCompassDirectionFormatter: NSObject {
    
    /// The `Style` used by this formatter. Defaults to `Style.long`.
    @objc public var style: TMBCompassDirectionFormatterStyle {
        get {
            origin.style.wrap()
        }
        set {
            origin.style = newValue.unwrap()
        }
    }
    
    /// Returns a localized string describing the provided compass direction.
    ///
    /// - Parameter direction: A compass direction, measured in degrees, where 0°
    /// means “due north” and 90° means “due east”.
    /// - Returns: A localized `String` describing the provided `direction`
    @objc public func string(from  direction: CLLocationDirection) -> String {
        origin.string(from: direction)
    }    
    private let origin:CompassDirectionFormatter
    init(origin: CompassDirectionFormatter) {
        self.origin = origin
    }
}
extension TMBCompassDirectionFormatter {
    func unwrap() -> CompassDirectionFormatter {
        self.origin
    }
}
extension CompassDirectionFormatter {
    func wrap() -> TMBCompassDirectionFormatter {
        TMBCompassDirectionFormatter(origin: self)
    }
}
