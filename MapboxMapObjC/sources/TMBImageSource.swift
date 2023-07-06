// This file is generated.
import Foundation
import MapboxMaps

@objc open class TMBImageSource: TMBSource {
    private var _self: ImageSource {
        get {
            return rawValue as! ImageSource
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public init() {
        super.init(ImageSource())
    }

    /// URL that points to an image.
    @objc public var url : String? {
        get {
            return _self.url
        }
        set {
            _self.url = newValue
        }
    }

    /// Corners of image specified in longitude, latitude pairs.
    @objc public var coordinates : [[Double]]? {
        get {
            return _self.coordinates
        }
        set {
            _self.coordinates = newValue
        }
    }

    /// When loading a map, if PrefetchZoomDelta is set to any number greater than 0, the map will first request a tile at zoom level lower than zoom - delta, but so that the zoom level is multiple of delta, in an attempt to display a full map at lower resolution as quick as possible. It will get clamped at the tile source minimum zoom. The default delta is 4.
    @objc public var prefetchZoomDelta : NSNumber? {
        get {
            return _self.prefetchZoomDelta?.NSNumber
        }
        set {
            _self.prefetchZoomDelta = newValue?.doubleValue
        }
    }
}
