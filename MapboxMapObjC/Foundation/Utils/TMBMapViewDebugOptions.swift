import Foundation
import MapboxMaps


/// Options for enabling debugging features in a map.
@objc open class TMBMapViewDebugOptions: NSObject {

    /// Edges of tile boundaries are shown as thick, red lines to help diagnose
    /// tile clipping issues.
    @objc public static let tileBorders = TMBMapViewDebugOptions(origin: MapViewDebugOptions.tileBorders)

    /// Each tile shows its tile coordinate (x/y/z) in the upper-left corner.
    @objc public static let parseStatus = TMBMapViewDebugOptions(origin: MapViewDebugOptions.parseStatus)

    /// Each tile shows a timestamp indicating when it was loaded.
    @objc public static let timestamps = TMBMapViewDebugOptions(origin: MapViewDebugOptions.timestamps)

    /// Edges of glyphs and symbols are shown as faint, green lines to help
    /// diagnose collision and label placement issues.
    @objc public static let collision = TMBMapViewDebugOptions(origin: MapViewDebugOptions.collision)

    /// Each drawing operation is replaced by a translucent fill. Overlapping
    /// drawing operations appear more prominent to help diagnose overdrawing.
    @objc public static let overdraw = TMBMapViewDebugOptions(origin: MapViewDebugOptions.overdraw)

    /// The stencil buffer is shown instead of the color buffer.
    @objc public static let stencilClip = TMBMapViewDebugOptions(origin: MapViewDebugOptions.stencilClip)

    /// The depth buffer is shown instead of the color buffer.
    @objc public static let depthBuffer = TMBMapViewDebugOptions(origin: MapViewDebugOptions.depthBuffer)

    /// Show 3D model bounding boxes.
    @objc public static let modelBounds = TMBMapViewDebugOptions(origin: MapViewDebugOptions.modelBounds)

    /// Each tile shows its local lighting conditions in the upper-left corner. (If `lights` properties are used, otherwise they show zero.)
    @objc public static let light = TMBMapViewDebugOptions(origin: MapViewDebugOptions.light)

    /// Show a debug UIView with information about the CameraState
    /// including lat, long, zoom, pitch, & bearing.
    @objc public static let camera = TMBMapViewDebugOptions(origin: MapViewDebugOptions.camera)

    /// Draws camera padding frame.
    @objc public static let padding = TMBMapViewDebugOptions(origin: MapViewDebugOptions.padding)

    public let origin: MapViewDebugOptions
    @objc public var rawValue: Int {
        origin.rawValue
    }

    @objc public convenience init(rawValue: Int) {
        self.init(origin: MapViewDebugOptions(rawValue: rawValue))
    }

    public init(origin: MapViewDebugOptions) {
       self.origin = origin
    }
}
extension MapViewDebugOptions {
    func wrap() -> TMBMapViewDebugOptions {
        TMBMapViewDebugOptions(origin: self)
    }
    
    func options() -> [MapDebugOptions] {
        var nativeDebugOptions = [MapDebugOptions]()
        if contains(.tileBorders) { nativeDebugOptions.append( .tileBorders ) }
        if contains(.parseStatus) { nativeDebugOptions.append( .parseStatus ) }
        if contains(.timestamps) { nativeDebugOptions.append( .timestamps ) }
        if contains(.collision) { nativeDebugOptions.append(.collision) }
        if contains(.overdraw) { nativeDebugOptions.append( .overdraw ) }
        if contains(.stencilClip) { nativeDebugOptions.append( .stencilClip ) }
        if contains(.depthBuffer) { nativeDebugOptions.append( .depthBuffer ) }
        if contains(.modelBounds) { nativeDebugOptions.append( .modelBounds ) }
        if contains(.light) { nativeDebugOptions.append( .light ) }
        return nativeDebugOptions
    }
}
extension TMBMapViewDebugOptions {
    func unwrap() -> MapViewDebugOptions {
        self.origin
    }
}
