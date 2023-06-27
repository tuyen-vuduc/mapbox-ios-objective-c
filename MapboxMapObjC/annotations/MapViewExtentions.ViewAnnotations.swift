import MapboxMaps
import MapboxCoreMaps
import UIKit

@objc
extension MapView {
    @objc public func options(forAnnotationId id: String) -> MapboxCoreMaps.ViewAnnotationOptions? {
        if let annotationView = self.viewAnnotations.view(forId: id),
           let options = self.viewAnnotations.options(for: annotationView) {
            return MapboxCoreMaps.ViewAnnotationOptions(options)
        }
        
        return nil
    }
    
    @objc public func options(forAnnotationView view: UIView) -> MapboxCoreMaps.ViewAnnotationOptions? {
        if let options = self.viewAnnotations.options(for: view) {
            return MapboxCoreMaps.ViewAnnotationOptions(options)
        }
        
        return nil
    }
    
    @objc public func view(forAnnotationId id: String) -> UIView? {
        if let annotationView = self.viewAnnotations.view(forId: id) {
            return annotationView
        }
        
        return nil
    }
    
    @objc public func view(forAnnotationFeatureId id: String) -> UIView? {
        if let annotationView = self.viewAnnotations.view(forFeatureId: id) {
            return annotationView
        }
        
        return nil
    }
    
    @objc public func options(forAnnotationFeatureId id: String) -> MapboxCoreMaps.ViewAnnotationOptions? {
        if let options = self.viewAnnotations.options(forFeatureId: id) {
            return MapboxCoreMaps.ViewAnnotationOptions(options)
        }
        
        return nil
    }
    
    @objc public func add(
        viewAnnotation viewAnnotation: UIView,
        id: String?,
        options: MapboxCoreMaps.ViewAnnotationOptions,
        completion: ((Error?)->Void)?) {
        do {
            try self.viewAnnotations.add(
                viewAnnotation,
                id: id,
                options: MapboxMaps.ViewAnnotationOptions(options))
            completion?(nil)
        } catch {
            completion?(error)
        }
    }
    
    @objc public func update(
        viewAnnotation viewAnnotation: UIView,
        options: MapboxCoreMaps.ViewAnnotationOptions,
        completion: ((Error?)->Void)?) {
        do {
            try self.viewAnnotations.update(
                viewAnnotation,
                options: MapboxMaps.ViewAnnotationOptions(options))
            completion?(nil)
        } catch {
            completion?(error)
        }
    }
    
    @objc public func remove(viewAnnotation viewAnnotation: UIView) {
        self.viewAnnotations.remove(viewAnnotation)
    }
    
    @objc public func removeAllViewAnnotations() {
        self.viewAnnotations.removeAll()
    }
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
