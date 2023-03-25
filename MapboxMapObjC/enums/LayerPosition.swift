import MapboxMaps

@objc
public enum MBXLayerPosition : Int {
    case at
    case below
    case above
    case unowned
}

extension MBXLayerPosition {
    public func swiftValue(_ layerParam: AnyObject?) -> LayerPosition {
        switch self {
        case .at:
            if let index = layerParam as? Int {
                return .at(index)
            }
        case .below:
            if let layerId = layerParam as? String {
                return .below(layerId)
            }
        case .above:
            if let layerId = layerParam as? String {
                return .above(layerId)
            }
        default:
            break
        }
        return .default
    }
}
