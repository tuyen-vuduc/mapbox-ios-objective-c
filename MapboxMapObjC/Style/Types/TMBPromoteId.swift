import MapboxMaps

@objc public enum TMBPromoteIdType: Int{
    case string
    case object
}

@objc open class TMBPromoteId : NSObject {
    private let _self: PromoteId
    init(_ _self: PromoteId) {
        self._self = _self
    }
    public var rawValue: PromoteId {
        return _self
    }
    
    @objc public var type: TMBPromoteIdType {
        switch(_self) {
        case .string(_):
            return .string
        case .object(_):
            return .object
        }
    }
    
    @objc public class func string(_ value: String) -> TMBPromoteId {
        return TMBPromoteId(.string(value))
    }
    
    @objc public class func object(_ value: [String: String]) -> TMBPromoteId {
        return TMBPromoteId(.object(value))
    }
}

extension PromoteId: ObjcConvertible {
    public func wrap() -> TMBPromoteId {
        return TMBPromoteId(self)
    }
    
    public func promoteId() -> TMBPromoteId {
        return TMBPromoteId(self)
    }
}

extension TMBPromoteId: SwiftValueConvertible {
    public func unwrap() -> PromoteId {
        return self.rawValue
    }
    
    public func promoteId() -> PromoteId {
        return unwrap()
    }
}
