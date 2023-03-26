import MapboxMaps

@objc
public enum TMBOrnamentVisibility : Int {
    case adaptive
    case hidden
    case visible
}

extension TMBOrnamentVisibility {
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
