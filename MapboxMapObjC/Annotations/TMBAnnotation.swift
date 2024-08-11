import MapboxCommon

@objc
public protocol TMBAnnotation: AnyObject {

    /// The unique identifier of the annotation.
    var id: String { get }

    /// The geometry that is backing this annotation.
    var geometry: MapboxCommon.Geometry { get }

    /// Properties associated with the annotation.
    var userInfo: [String: Any]? { get }
}


extension TMBAnnotation {
    public static func typeOf<T>(value: T) -> Bool where T : TMBAnnotation {
        return type(of: value) == T.Type.self
    }
}
