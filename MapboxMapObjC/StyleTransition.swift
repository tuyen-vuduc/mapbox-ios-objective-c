
@objc open class MBXStyleTransition: NSObject {
    /// Time allotted for transitions to complete in seconds.
    public let duration: Double
    
    /// Length of time before a transition begins in seconds.
    public let delay: Double
    
    @objc public init(duration: Double, delay: Double) {
        self.duration = duration
        self.delay = delay
    }
}
