import CoreLocation
import MapboxMaps


/// A structure that defines additional information about map content gesture
@objc open class TMBMapContentGestureContext: NSObject {
    /// The location of gesture in Map view bounds.
    @objc public var point: CGPoint {
        origin.point
    }

    /// Geographical coordinate of the map gesture.
    @objc public var coordinate: CLLocationCoordinate2D {
        origin.coordinate
    }
    
    public let origin: MapContentGestureContext
    init(origin: MapContentGestureContext) {
        self.origin = origin
    }
}

extension TMBMapContentGestureContext {
    func unwrap() -> MapContentGestureContext {
        self.origin
    }
}
extension MapContentGestureContext {
    func wrap() -> TMBMapContentGestureContext {
        TMBMapContentGestureContext(origin: self)
    }
}

/// Handles tap on a layer.
///
/// This handler receives a rendered feature from a gesture input and context with the related information.
public typealias TMBMapLayerGestureHandler = (QueriedFeature, TMBMapContentGestureContext) -> Bool
