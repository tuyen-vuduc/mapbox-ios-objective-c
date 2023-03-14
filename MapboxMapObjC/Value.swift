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
