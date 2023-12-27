// This file is generated.
import Foundation
import MapboxMaps

/// An image data source.
///
/// - SeeAlso: [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/#image)
@objc open class TMBImageSource: NSObject, TMBSource {
    @objc public convenience init(id: String) {
        self.init(id, type: TMBSourceType.image)
    }
    
    private init(_ id: String, type: TMBSourceType) {
        self.id = id
        self.type = type
    }
    
    let id: String

    @objc public let type: TMBSourceType

    /// URL that points to an image.
    @objc public var url: String?

    /// Corners of image specified in longitude, latitude pairs.
    @objc public var coordinates: [[Double]]?

    /// When loading a map, if PrefetchZoomDelta is set to any number greater than 0, the map will first request a tile at zoom level lower than zoom - delta, but so that the zoom level is multiple of delta, in an attempt to display a full map at lower resolution as quick as possible. It will get clamped at the tile source minimum zoom. The default delta is 4.
    @objc public var prefetchZoomDelta: NSNumber?

}

extension TMBImageSource {
    public func mapTo(_ source: inout ImageSource) {

        source.url = self.url
        source.coordinates = self.coordinates
        source.prefetchZoomDelta = self.prefetchZoomDelta?.double()
    }
}

extension ImageSource {
    public func mapTo(_ source:inout TMBImageSource) {

        source.url = self.url
        source.coordinates = self.coordinates
        source.prefetchZoomDelta = self.prefetchZoomDelta?.asNumber()
    }
}

extension TMBImageSource: SwiftValueConvertible {
    public func swiftValue() -> ImageSource {
        var source = ImageSource()
        
        self.mapTo(&source)
        
        return source
    }
}

extension ImageSource {
    public func objcValue(_ id: String) ->  TMBImageSource {
        var source = TMBImageSource(id: id)
        
        self.mapTo(&source)
        
        return source
    }
}