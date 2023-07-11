import Foundation

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
