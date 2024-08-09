// This file is generated.
import Foundation
import os
import MapboxMaps

/// An instance of `PolygonAnnotationManager` is responsible for a collection of `PolygonAnnotation`s.
@objc open class TMBPolygonAnnotationManager: NSObject, TMBAnnotationManager {
    @objc public var sourceId: String  {
        origin.sourceId
    }

    @objc public var layerId: String  {
        origin.layerId
    }

    @objc public var id: String {            
        origin.id
    }

    /// The collection of ``PolygonAnnotation`` being managed.
    @objc public var annotations: [TMBPolygonAnnotation] {            
        get {
            origin.annotations.map { $0.wrap() }
        }
        set {
            origin.annotations = newValue.map { $0.unwrap() }
        }
    }

    // MARK: - Common layer properties


    /// Whether or not the fill should be antialiased.
    @objc public var fillAntialias: NSNumber? {
        get {
            origin.fillAntialias?.bool()
        }
        set {
            origin.fillAntialias = newValue?.boolValue
        }
    }

    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var fillEmissiveStrength: NSNumber? {
        get {
            origin.fillEmissiveStrength?.double()
        }
        set {
            origin.fillEmissiveStrength = newValue?.doubleValue
        }
    }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var fillTranslate: [Double]? {
        get {
            origin.fillTranslate
        }
        set {
            origin.fillTranslate = newValue
        }
    }

    /// Controls the frame of reference for `fill-translate`.
    @objc public var fillTranslateAnchor: TMBFillTranslateAnchor? {            
        get {
            origin.fillTranslateAnchor?.wrap()
        }
        set {
            origin.fillTranslateAnchor = newValue?.unwrap()
        }
    }

    /// 
    /// Slot for the underlying layer.
    ///
    /// Use this property to position the annotations relative to other map features if you use Mapbox Standard Style.
    /// See <doc:Migrate-to-v11##21-The-Mapbox-Standard-Style> for more info.
    @objc public var slot: String? {            
        get {
            origin.slot
        }
        set {
            origin.slot = newValue
        }
    }    
    private let origin:PolygonAnnotationManager
    init(origin: PolygonAnnotationManager) {
        self.origin = origin
    }
}
extension TMBPolygonAnnotationManager {
    func unwrap() -> PolygonAnnotationManager {
        self.origin
    }
}

@objc
extension TMBPolygonAnnotationManager {
    @objc public func addAnnotations(_ annotations: [TMBPolygonAnnotation]) {
        self.origin.annotations.append(contentsOf: annotations.map{ $0.unwrap() })
    }
    @objc public func addAnnotation(_ annotation: TMBPolygonAnnotation) {
        self.origin.annotations.append(annotation.unwrap())
    }
    @objc public func removeAnnotation(_ annotation: TMBPolygonAnnotation) {
        self.origin.annotations.removeAll(where: { item in
            item.id == annotation.id
        })
    }
    @objc public func removeAnnotationById(_ annotationId: String) {
        self.origin.annotations.removeAll(where: { item in
            item.id == annotationId
        })
    }
    @objc public func removeAllAnnotations() {
        self.origin.annotations.removeAll()
    }
}
extension PolygonAnnotationManager {
    func wrap() -> TMBPolygonAnnotationManager {
        TMBPolygonAnnotationManager(origin: self)
    }
}
