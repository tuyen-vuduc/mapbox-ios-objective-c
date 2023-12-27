import MapboxMaps

@objc public protocol TMBSource {
    /// Rendering type of this source.
    var type: TMBSourceType { get }
    
    var id: String { get }
}
