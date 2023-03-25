@objc
public protocol MBXAnnotation: AnyObject {

    /// The unique identifier of the annotation.
    var id: String { get }

    /// The geometry that is backing this annotation.
    var geometryInJSON: String { get }

    /// Properties associated with the annotation.
    var userInfo: [String: Any]? { get }
}
