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
    
    @objc public func options(forAnnotationId id: String) -> MapboxCoreMaps.ViewAnnotationOptions? {
        if let annotationView = _self.view(forId: id),
           let options = _self.options(for: annotationView) {
            return MapboxCoreMaps.ViewAnnotationOptions(options)
        }
        
        return nil
    }
    
    @objc public func options(forAnnotationView view: UIView) -> MapboxCoreMaps.ViewAnnotationOptions? {
        if let options = _self.options(for: view) {
            return MapboxCoreMaps.ViewAnnotationOptions(options)
        }
        
        return nil
    }
    
    @objc public func view(forAnnotationId id: String) -> UIView? {
        if let annotationView = _self.view(forId: id) {
            return annotationView
        }
        
        return nil
    }
    
    @objc public func view(forAnnotationFeatureId id: String) -> UIView? {
        if let annotationView = _self.view(forFeatureId: id) {
            return annotationView
        }
        
        return nil
    }
    
    @objc public func options(forAnnotationFeatureId id: String) -> MapboxCoreMaps.ViewAnnotationOptions? {
        if let options = _self.options(forFeatureId: id) {
            return MapboxCoreMaps.ViewAnnotationOptions(options)
        }
        
        return nil
    }
    
    @objc public func add(
        viewAnnotation: UIView,
        id: String?,
        options: MapboxCoreMaps.ViewAnnotationOptions,
        completion: ((Error?)->Void)?) {
        do {
            try _self.add(
                viewAnnotation,
                id: id,
                options: MapboxMaps.ViewAnnotationOptions(options))
            completion?(nil)
        } catch {
            completion?(error)
        }
    }
    
    @objc public func update(
        viewAnnotation: UIView,
        options: MapboxCoreMaps.ViewAnnotationOptions,
        completion: ((Error?)->Void)?) {
        do {
            try _self.update(
                viewAnnotation,
                options: MapboxMaps.ViewAnnotationOptions(options))
            completion?(nil)
        } catch {
            completion?(error)
        }
    }
    
    @objc public func remove(viewAnnotation: UIView) {
        _self.remove(viewAnnotation)
    }
    
    @objc public func removeAllViewAnnotations() {
        _self.removeAll()
    }
    
    /// Add an observer for annotation views updates
    ///
    /// Observers are held strongly.
    ///
    /// - Parameter observer: The object to notify when updates occur.
    @objc public func addViewAnnotationUpdateObserver(_ observer: TMBViewAnnotationUpdateObserver) {
        let xobserver = ViewAnnotationUpdateObserverAdapter(observer)
        observers[ObjectIdentifier(observer)] = xobserver
        _self.addViewAnnotationUpdateObserver(xobserver)
    }
    
    /// Remove an observer for annotation views updates.
    ///
    /// - Parameter observer: The object to stop sending notifications to.
    @objc public func removeViewAnnotationUpdateObserver(_ observer: TMBViewAnnotationUpdateObserver) {
        let objKey = ObjectIdentifier(observer)
        guard let xobserver = observers[objKey] else { return }
        
        _self.removeViewAnnotationUpdateObserver(xobserver)
        observers.removeValue(forKey: objKey)
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
        forAnnotations identifiers: [String],
        padding: UIEdgeInsets = .zero,
        bearing: NSNumber?,
        pitch: NSNumber?
    ) -> MapboxCoreMaps.CameraOptions? {
        guard let cameraOptions = _self.camera(
            forAnnotations: identifiers,
            padding: padding,
            bearing: bearing?.CGFloat,
            pitch: pitch?.CGFloat) else {
            return nil
        }
        
        return MapboxCoreMaps.CameraOptions(cameraOptions)
    }
}

class ViewAnnotationUpdateObserverAdapter : ViewAnnotationUpdateObserver {
    private let _observer: TMBViewAnnotationUpdateObserver;
    
    init(_ _observer: TMBViewAnnotationUpdateObserver) {
        self._observer = _observer
    }
    
    func framesDidChange(for annotationViews: [UIView]) {
        _observer.framesDidChange(for: annotationViews)
    }
    
    func visibilityDidChange(for annotationViews: [UIView]) {
        _observer.visibilityDidChange(for: annotationViews)
    }
}

@objc
public enum TMBViewAnnotationManagerError: Int {
    case viewIsAlreadyAdded
    case associatedFeatureIdIsAlreadyInUse
    case annotationNotFound
    case geometryFieldMissing
}

extension TMBViewAnnotationManagerError {
    func swiftValue() -> ViewAnnotationManagerError {
        switch(self) {
        case .viewIsAlreadyAdded:
           return .viewIsAlreadyAdded
        case .associatedFeatureIdIsAlreadyInUse:
            return .associatedFeatureIdIsAlreadyInUse
        case .annotationNotFound:
            return .annotationNotFound
        case .geometryFieldMissing:
            return .geometryFieldMissing
        }
    }
}

extension ViewAnnotationManagerError: ObjcConvertible {
    public func objcValue() -> TMBViewAnnotationManagerError {
        switch(self) {
        case .viewIsAlreadyAdded:
           return .viewIsAlreadyAdded
        case .associatedFeatureIdIsAlreadyInUse:
            return .associatedFeatureIdIsAlreadyInUse
        case .annotationNotFound:
            return .annotationNotFound
        case .geometryFieldMissing:
            return .geometryFieldMissing
        }
    }
}


/// An interface you use to detect when the map view lays out or updates visibility of annotation views.
///
/// When visible portion of a map changes, e.g. responding to the user interaction, the map view adjusts the positions and visibility of its annotation views.
/// Implement methods of ``ViewAnnotationUpdateObserver`` to detect when the map view updates position/size for supplied annotation views.
/// As well as when annotation views get show/hidden when going in/out of visible portion of the map.
///
/// To register an observer for view annotation updates, call the ``ViewAnnotationManager/addViewAnnotationUpdateObserver(_:)`` method.
@objc
public protocol TMBViewAnnotationUpdateObserver {

    /// Tells the observer that the frames of the annotation views changed.
    ///
    /// - Parameters:
    ///   - annotationViews: The annotation views whose frames changed.
    ///
    func framesDidChange(for annotationViews: [UIView])

    /// Tells the observer that the visibility of the annotation views changed.
    ///
    /// Use `isHidden` property to determine whether a view is visible or not.
    /// - Parameters:
    ///   - annotationsViews: The annotation vies whose visibility changed.
    func visibilityDidChange(for annotationViews: [UIView])
}

extension MapboxMaps.ViewAnnotationOptions {
    internal init(_ objcValue: MapboxCoreMaps.ViewAnnotationOptions) {
        self.init(
            geometry: objcValue.__geometry.flatMap(Geometry.init(_:)),
            width: objcValue.__width?.CGFloat,
            height: objcValue.__height?.CGFloat,
            associatedFeatureId: objcValue.__associatedFeatureId,
            allowOverlap: objcValue.__allowOverlap?.boolValue,
            visible: objcValue.__visible?.boolValue,
            anchor: objcValue.__anchor.flatMap { ViewAnnotationAnchor(rawValue: $0.intValue) },
            offsetX: objcValue.__offsetX?.CGFloat,
            offsetY: objcValue.__offsetY?.CGFloat,
            selected: objcValue.__selected?.boolValue
        )
    }
}

extension MapboxCoreMaps.ViewAnnotationOptions {
    internal convenience init(_ swiftValue: MapboxMaps.ViewAnnotationOptions) {
        self.init(__geometry: swiftValue.geometry.map(MapboxCommon.Geometry.init),
                  associatedFeatureId: swiftValue.associatedFeatureId,
                  width: swiftValue.width as NSNumber?,
                  height: swiftValue.height as NSNumber?,
                  allowOverlap: swiftValue.allowOverlap as NSNumber?,
                  visible: swiftValue.visible as NSNumber?,
                  anchor: swiftValue.anchor?.rawValue as NSNumber?,
                  offsetX: swiftValue.offsetX as NSNumber?,
                  offsetY: swiftValue.offsetY as NSNumber?,
                  selected: swiftValue.selected as NSNumber?)
    }
}
