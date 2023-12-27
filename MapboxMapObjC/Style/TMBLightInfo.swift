import Foundation
import MapboxMaps

/// Information about a light
@objc open class TMBLightInfo: NSObject {
    /// The identifier of the light
    @objc public var id: String

    /// The type of the light
    @objc public var type: TMBLightType

    /// Create a `LightInfo` value
    /// - Parameters:
    ///   - id: A light ID
    ///   - type: A light type
    @objc public init(id : String, type : TMBLightType){
        self.id = id
        self.type = type
    }
}
extension TMBLightInfo {
    func unwrap() -> LightInfo {
        LightInfo(id: self.id,
            type: (self.type).unwrap())
    }
}
extension LightInfo {
    func wrap() -> TMBLightInfo {
        TMBLightInfo(id: self.id,
          type: (self.type).wrap())
    }
}