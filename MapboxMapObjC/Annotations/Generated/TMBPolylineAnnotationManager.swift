// This file is generated.
import Foundation
import os
import MapboxMaps

/// An instance of `PolylineAnnotationManager` is responsible for a collection of `PolylineAnnotation`s.
@objc open class TMBPolylineAnnotationManager: NSObject, TMBAnnotationManager {
    @objc public var sourceId: String  {
        origin.sourceId
    }

    @objc public var layerId: String  {
        origin.layerId
    }

    @objc public var id: String {            
        origin.id
    }

    /// The collection of ``PolylineAnnotation`` being managed.
    @objc public var annotations: [TMBPolylineAnnotation] {            
        get {
            origin.annotations.map { $0.wrap() }
        }
        set {
            origin.annotations = newValue.map { $0.unwrap() }
        }
    }

    // MARK: - Common layer properties


    /// The display of line endings.
    @objc public var lineCap: TMBLineCap? {            
        get {
            origin.lineCap?.wrap()
        }
        set {
            origin.lineCap = newValue?.unwrap()
        }
    }

    /// Used to automatically convert miter joins to bevel joins for sharp angles.
    @objc public var lineMiterLimit: NSNumber? {
        get {
            origin.lineMiterLimit?.double()
        }
        set {
            origin.lineMiterLimit = newValue?.doubleValue
        }
    }

    /// Used to automatically convert round joins to miter joins for shallow angles.
    @objc public var lineRoundLimit: NSNumber? {
        get {
            origin.lineRoundLimit?.double()
        }
        set {
            origin.lineRoundLimit = newValue?.double()
        }
    }

    /// Specifies the lengths of the alternating dashes and gaps that form the dash pattern. The lengths are later scaled by the line width. To convert a dash length to pixels, multiply the length by the current line width. Note that GeoJSON sources with `lineMetrics: true` specified won't render dashed lines to the expected scale. Also note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var lineDasharray: [Double]? {
        get {
            origin.lineDasharray
        }
        set {
            origin.lineDasharray = newValue
        }
    }

    /// Decrease line layer opacity based on occlusion from 3D objects. Value 0 disables occlusion, value 1 means fully occluded.
    @objc public var lineDepthOcclusionFactor: NSNumber? {
        get {
            origin.lineDepthOcclusionFactor?.double()
        }
        set {
            origin.lineDepthOcclusionFactor = newValue?.double()
        }
    }

    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var lineEmissiveStrength: NSNumber? {
        get {
            origin.lineEmissiveStrength?.double()
        }
        set {
            origin.lineEmissiveStrength = newValue?.double()
        }
    }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var lineTranslate: [Double]? {
        get {
            origin.lineTranslate
        }
        set {
            origin.lineTranslate = newValue
        }
    }

    /// Controls the frame of reference for `line-translate`.
    @objc public var lineTranslateAnchor: TMBLineTranslateAnchor? {            
        get {
            origin.lineTranslateAnchor?.wrap()
        }
        set {
            origin.lineTranslateAnchor = newValue?.unwrap()
        }
    }

    /// The line part between [trim-start, trim-end] will be marked as transparent to make a route vanishing effect. The line trim-off offset is based on the whole line range [0.0, 1.0].
    @objc public var lineTrimOffset: [Double]? {
        get {
            origin.lineTrimOffset
        }
        set {
            origin.lineTrimOffset = newValue
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
    private let origin:PolylineAnnotationManager
    init(origin: PolylineAnnotationManager) {
        self.origin = origin
    }
}
extension TMBPolylineAnnotationManager {
    func unwrap() -> PolylineAnnotationManager {
        self.origin
    }
}
extension PolylineAnnotationManager {
    func wrap() -> TMBPolylineAnnotationManager {
        TMBPolylineAnnotationManager(origin: self)
    }
}
