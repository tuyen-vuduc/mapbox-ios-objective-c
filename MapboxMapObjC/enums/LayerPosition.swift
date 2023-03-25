import MapboxMaps

@objc
public enum MBXLayerPosition : Int {
    case at
    case below
    case above
    case unowned
}

extension MBXLayerPosition {
    public func swiftValue(_ layerPositionParam: AnyObject?) -> LayerPosition {
        switch self {
        case .at:
            if let index = layerPositionParam as? Int {
                return .at(index)
            }
            if let index = layerPositionParam as? NSNumber {
                return .at(index.intValue)
            }
        case .below:
            if let layerId = layerPositionParam as? String {
                return .below(layerId)
            }
        case .above:
            if let layerId = layerPositionParam as? String {
                return .above(layerId)
            }
        default:
            break
        }
        return .default
    }
}
