import Foundation
import CoreLocation
import CoreGraphics

extension Bool {
    func asNumber() -> NSNumber {
        return NSNumber(value: self)
    }
}

extension Int {
    func asNumber() -> NSNumber {
        return NSNumber(value: self)
    }
}

extension Double {
    func asNumber() -> NSNumber {
        return Foundation.NSNumber(value: self)
    }
}

extension NSNumber {
    func double() -> Double {
        return doubleValue
    }
    func int() -> Int {
        return intValue
    }
    func bool() -> Bool {
        return boolValue
    }
}

extension NSNumber {

    /// Converts an `NSNumber` to a `CGFloat` value from its `Double` representation.
    var CGFloat: CGFloat {
        CoreGraphics.CGFloat(doubleValue)
    }

    /// Converts the `Float` value of an `NSNumber` to a `CLLocationDirection` representation.
    var CLLocationDirection: CLLocationDirection {
        CoreLocation.CLLocationDirection(doubleValue)
    }

    // Useful for converting between NSNumbers and Core enums
    func intValueAsRawRepresentable<T>() -> T? where
        T: RawRepresentable,
        T.RawValue == Int {
        return T(rawValue: intValue)
    }
}
