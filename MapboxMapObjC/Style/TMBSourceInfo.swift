import MapboxMaps

/// Information about a Source
@objc open class TMBSourceInfo: NSObject {
    /// The identifier of the source
    @objc public var id: String

    /// The type of the source
    @objc public var type: TMBSourceType

    /// Create a `SourceInfo` value
    /// - Parameters:
    ///   - id: A source ID
    ///   - type: A source type
    @objc public init(id : String, type : TMBSourceType){
        self.id = id
        self.type = type
    }
}
extension TMBSourceInfo {
    func unwrap() -> SourceInfo {
        SourceInfo(id: self.id,
            type: (self.type).unwrap())
    }
}
extension SourceInfo {
    func wrap() -> TMBSourceInfo {
        TMBSourceInfo(id: self.id,
          type: (self.type).wrap())
    }
}