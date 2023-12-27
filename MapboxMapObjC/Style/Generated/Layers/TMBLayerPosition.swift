import MapboxMaps

@objc open class TMBLayerPosition : NSObject {
    @objc public let arg: AnyObject
    @objc public let type: TMBLayerPositionType
    @objc public init(_ type: TMBLayerPositionType, arg: AnyObject) {
        self.type = type
        self.arg = arg
    }
    
    @objc public static func at(index: Int) -> TMBLayerPosition {
        return TMBLayerPosition(.at, arg: index as AnyObject)
    }
    
    @objc public static func below(layerId: String) -> TMBLayerPosition {
        return TMBLayerPosition(.below, arg:layerId as AnyObject)
    }
    
    @objc public static func above(layerId: String) -> TMBLayerPosition {
        return TMBLayerPosition(.above, arg:layerId as AnyObject)
    }
}

@objc public enum TMBLayerPositionType : Int {
    case at
    case above
    case below
}

extension TMBLayerPosition {
    public func swiftValue() -> LayerPosition {
        switch self.type {
        case .at:
            if let index = self.arg as? Int {
                return .at(index)
            }
        case .below:
            if let layerId = self.arg as? String {
                return .below(layerId)
            }
        case .above:
            if let layerId = self.arg as? String {
                return .above(layerId)
            }
        default:
            break
        }
        return .default
    }
}
