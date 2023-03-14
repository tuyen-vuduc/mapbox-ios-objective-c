import MapboxMaps

@objc
open class MBXValue : NSObject {
    let constant: NSObject?
    let expression: NSObject?
    
    @objc public init(constant: NSObject) {
        self.constant = constant
        self.expression = nil
    }
    
    @objc public init(expression: NSObject) {
        self.expression = expression
        self.constant = nil
    }
    
    @objc class public func constant(_ constant: NSObject) -> MBXValue {
        return MBXValue(constant: constant)
    }
    
    @objc class public func expression(_ expression: NSObject) -> MBXValue {
        return MBXValue(expression: expression)
    }
}


extension MBXValue {
    func swiftOnly<T>() -> Value<T> {
        if let constant = self.constant as? T {
            return Value.constant(constant)
        }
        
        // TODO To be completed
        return Value.expression(Expression(.id))
    }
}
