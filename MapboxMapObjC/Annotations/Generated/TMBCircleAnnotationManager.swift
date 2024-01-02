// This file is generated.
import Foundation
import os
import MapboxMaps


/// An instance of `CircleAnnotationManager` is responsible for a collection of `CircleAnnotation`s.
@objc open class TMBCircleAnnotationManager: NSObject, TMBAnnotationManager {
    @objc public var sourceId: String  {
        origin.sourceId
    }

    @objc public var layerId: String  {
        origin.layerId
    }

    @objc public var id: String {            
        origin.id
    }

    /// The collection of ``CircleAnnotation`` being managed.
    @objc public var annotations: [TMBCircleAnnotation] {
        get {
            origin.annotations.map { $0.wrap() }
        }
        set {
            origin.annotations = newValue.map { $0.unwrap() }
        }
    }

    // MARK: - Common layer properties


    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var circleEmissiveStrength: NSNumber? {
        get {
            origin.circleEmissiveStrength?.double()
        }
        set {
            origin.circleEmissiveStrength = newValue?.doubleValue
        }
    }

    /// Orientation of circle when map is pitched.
    @objc public var circlePitchAlignment: TMBCirclePitchAlignment? {            
        get {
            origin.circlePitchAlignment?.wrap()
        }
        set {
            origin.circlePitchAlignment = newValue?.unwrap()
        }
    }

    /// Controls the scaling behavior of the circle when the map is pitched.
    @objc public var circlePitchScale: TMBCirclePitchScale? {            
        get {
            origin.circlePitchScale?.wrap()
        }
        set {
            origin.circlePitchScale = newValue?.unwrap()
        }
    }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var circleTranslate: [Double]? {
        get {
            origin.circleTranslate
        }
        set {
            origin.circleTranslate = newValue
        }
    }

    /// Controls the frame of reference for `circle-translate`.
    @objc public var circleTranslateAnchor: TMBCircleTranslateAnchor? {            
        get {
            origin.circleTranslateAnchor?.wrap()
        }
        set {
            origin.circleTranslateAnchor = newValue?.unwrap()
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
    
    private let origin:CircleAnnotationManager
    init(origin: CircleAnnotationManager) {
        self.origin = origin
    }
}
extension TMBCircleAnnotationManager {
    func unwrap() -> CircleAnnotationManager {
        self.origin
    }
}
extension CircleAnnotationManager {
    func wrap() -> TMBCircleAnnotationManager {
        TMBCircleAnnotationManager(origin: self)
    }
}
