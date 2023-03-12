import MapboxMaps

@objc
public enum MBXOrnamentVisibility : Int {
    case adaptive
    case hidden
    case visible
}

extension MBXOrnamentVisibility {
    func swiftOnly() -> OrnamentVisibility {
        switch (self) {
        case .adaptive:
            return .adaptive
        case .hidden:
            return .hidden
        case .visible:
            return .visible
        }
    }
}
