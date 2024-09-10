// This file is generated.
import Foundation
import MapboxMaps

/// An image data source.
///
/// - SeeAlso: [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/#image)
@objc open class TMBImageSource: NSObject, TMBSource {
    @objc public init(id: String) {
        self.id = id
        self.type = TMBSourceType.image
    }

    @objc public let type: TMBSourceType
    @objc public let id: String

    /// URL that points to an image. If the URL is not specified, the image is expected to be loaded directly during runtime.
    @objc public var url: String?

    /// Corners of image specified in longitude, latitude pairs. Note: When using globe projection, the image will be centered at the North or South Pole in the respective hemisphere if the average latitude value exceeds 85 degrees or falls below -85 degrees.
    @objc public var coordinates: [[Double]]?

    /// When loading a map, if PrefetchZoomDelta is set to any number greater than 0, the map will first request a tile at zoom level lower than zoom - delta, but so that the zoom level is multiple of delta, in an attempt to display a full map at lower resolution as quick as possible. It will get clamped at the tile source minimum zoom.
    /// Default value: 4.
    @objc public var prefetchZoomDelta: NSNumber?

}

extension TMBImageSource {
    func mapTo(_ source: inout ImageSource) {
        source.url = self.url
        source.coordinates = self.coordinates
        source.prefetchZoomDelta = self.prefetchZoomDelta?.double()
    }
}

extension ImageSource {
    func mapTo(_ source:inout TMBImageSource) {
        source.url = self.url
        source.coordinates = self.coordinates
        source.prefetchZoomDelta = self.prefetchZoomDelta?.double()
    }
}

extension TMBImageSource: SwiftValueConvertible {
    public func unwrap() -> ImageSource {
        var result = ImageSource(id: self.id)
        self.mapTo(&result)
        return result
    }
}

extension ImageSource {
    func wrap() -> TMBImageSource {
        var result = TMBImageSource(id: self.id)
        self.mapTo(&result)
        return result
    }
}