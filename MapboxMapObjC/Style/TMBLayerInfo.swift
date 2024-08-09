import MapboxMaps
/// Information about a layer
@objc open class TMBLayerInfo: NSObject {
    /// The identifier of the layer
    @objc public var id: String

    /// The type of the layer
    @objc public var type: TMBLayerType

    /// Create a `LayerInfo` value
    /// - Parameters:
    ///   - id: A layer ID
    ///   - type: A layer type
    @objc public init(id : String, type : TMBLayerType){
        self.id = id
        self.type = type
    }
}
extension TMBLayerInfo {
    func unwrap() -> LayerInfo {
        LayerInfo(id: self.id,
            type: (self.type).unwrap())
    }
}
extension LayerInfo {
    func wrap() -> TMBLayerInfo {
        TMBLayerInfo(id: self.id,
          type: (self.type).wrap())
    }
}