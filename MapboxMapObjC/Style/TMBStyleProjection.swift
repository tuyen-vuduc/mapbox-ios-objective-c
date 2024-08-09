import MapboxMaps

/// Describes the projection used to render the map.
@objc open class TMBStyleProjection: NSObject {

    /// The name of the projection.
    @objc public var name: TMBStyleProjectionName

    /// Initializes a projection
    @objc public init(name : TMBStyleProjectionName){
        self.name = name
    }
}
extension TMBStyleProjection {
    func unwrap() -> StyleProjection {
        StyleProjection(name: (self.name).unwrap())
    }
}
extension StyleProjection {
    func wrap() -> TMBStyleProjection {
        TMBStyleProjection(name: (self.name).wrap())
    }
}
