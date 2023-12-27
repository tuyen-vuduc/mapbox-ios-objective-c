import Foundation
import MapboxMaps

/// Supported light types
@objc open class TMBLightType: NSObject {

    /// A global directional light.
    @objc public static let flat = TMBLightType(origin: LightType.flat)

    /// An indirect type of light.
    @objc public static let ambient = TMBLightType(origin: LightType.ambient)

    /// A type of light that has a direction.
    @objc public static let directional = TMBLightType(origin: LightType.directional)

    public let origin: LightType
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: LightType(rawValue: rawValue))
    }

    public init(origin: LightType) {
       self.origin = origin
    }
}
extension LightType {
    func wrap() -> TMBLightType {
        TMBLightType(origin: self)
    }
}
extension TMBLightType {
    func unwrap() -> LightType {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func lightType(_ value: TMBLightType) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == LightType {
    func lightType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [LightType] {
    func arrayOfLightType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func lightType() -> Value<LightType>? {
        if let constant = self.constant as? String {
            return Value.constant(LightType(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfLightType() -> Value<[LightType]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ LightType(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}