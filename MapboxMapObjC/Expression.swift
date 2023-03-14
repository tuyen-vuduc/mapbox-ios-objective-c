
@objc open class MBXExpression: NSObject {
    /// Time allotted for transitions to complete in seconds.
    public let `operator`: MBXOperator
    
    /// Length of time before a transition begins in seconds.
    public let arguments: [Any]
    
    @objc public init(`operator`: MBXOperator, arguments: [Any]) {
        self.operator =  `operator`
        self.arguments = arguments
    }
}
