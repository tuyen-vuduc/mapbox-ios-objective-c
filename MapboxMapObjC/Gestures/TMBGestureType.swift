import MapboxMaps

@objc public enum TMBGestureType: Int {
    /// The pan gesture
    case pan

    /// The pinch gesture
    case pinch

    /// The pitch gesture
    case pitch

    /// The double tap to zoom in gesture
    case doubleTapToZoomIn

    /// The double touch to zoom out gesture
    case doubleTouchToZoomOut

    /// The quick zoom gesture
    case quickZoom

    /// The single tap gesture
    case singleTap

    /// The rotation gesture
    case rotation
}
extension GestureType {
    func wrap() -> TMBGestureType {
        switch self {
        case .pan:
            return .pan
        case .pinch:
            return .pinch
        case .pitch:
            return .pitch
        case .doubleTapToZoomIn:
            return .doubleTapToZoomIn
        case .doubleTouchToZoomOut:
            return .doubleTouchToZoomOut
        case .quickZoom:
            return .quickZoom
        case .singleTap:
            return .singleTap
        case .rotation:
            return .rotation
        }
    }
}
extension TMBGestureType {
    func unwrap() -> GestureType {
        switch self {
        case .pan:
            return .pan
        case .pinch:
            return .pinch
        case .pitch:
            return .pitch
        case .doubleTapToZoomIn:
            return .doubleTapToZoomIn
        case .doubleTouchToZoomOut:
            return .doubleTouchToZoomOut
        case .quickZoom:
            return .quickZoom
        case .singleTap:
            return .singleTap
        case .rotation:
            return .rotation
        }
    }
}
