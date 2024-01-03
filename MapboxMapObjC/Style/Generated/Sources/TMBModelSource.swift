/// A structure represeting a Model

import MapboxMaps
@objc open class TMBModel: NSObject {

    /// URL to a `gltf` 3D asset in the application bundle
    @objc public var uri: URL?

    /// Coordinates of the model in `[longitude, latitude]`format
    @objc public var position: [Double]?

    /// Orientation of the model
    @objc public var orientation: [Double]?

    @objc public init(uri: URL? = nil, position: [Double]? = nil, orientation: [Double]? = nil) {
        self.uri = uri
        self.position = position
        self.orientation = orientation
    }
}
extension TMBModel {
    func unwrap() -> Model {
        Model(uri: self.uri, position: self.position, orientation: self.orientation)
    }
}
extension Model {
    func wrap() -> TMBModel {
        TMBModel(uri: self.uri, position: self.position, orientation: self.orientation)
    }
}
