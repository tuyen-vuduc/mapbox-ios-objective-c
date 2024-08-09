import MapboxMaps
import MapboxCoreMaps
import UIKit

@objc
extension MapView {
    @objc public func viewAnnotations() -> TMBViewAnnotationManager {
        TMBViewAnnotationManager(self.viewAnnotations)
    }
}

@objc
open class TMBViewAnnotationManager : NSObject {
    private let _self: ViewAnnotationManager
    private var observers = [ObjectIdentifier: ViewAnnotationUpdateObserver]()
    
    init(_ _self: ViewAnnotationManager) {
        self._self = _self
    }
    
    @objc public func add(
        annotation: TMBViewAnnotation) {
        _self.add(annotation.unwrap())
    }
    
    @objc public func removeAllViewAnnotations() {
        _self.removeAll()
    }
    
    // MARK: Framing

    /// Calculates ``CameraOptions`` to fit the list of view annotations.
    ///
    /// - Important: This API isn't supported by Globe projection.
    ///
    /// - Parameter ids: The list of annotations ids to be framed.
    /// - Parameter padding: See ``CameraOptions/padding``.
    /// - Parameter bearing: See ``CameraOptions/bearing``.
    /// - Parameter pitch: See ``CameraOptions/pitch``.
    @objc public func camera(
        forAnnotations annotations: [TMBViewAnnotation],
        padding: UIEdgeInsets = .zero,
        bearing: NSNumber?,
        pitch: NSNumber?
    ) -> TMBCameraOptions? {
        guard let cameraOptions = _self.camera(
            forAnnotations: annotations.map { $0.unwrap() },
            padding: padding,
            bearing: bearing?.CGFloat,
            pitch: pitch?.CGFloat) else {
            return nil
        }
        
        return cameraOptions.wrap()
    }
}
