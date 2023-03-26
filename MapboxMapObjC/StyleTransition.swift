import MapboxMaps

@objc open class TMBStyleTransition: NSObject {
    /// Time allotted for transitions to complete in seconds.
    public let duration: Double
    
    /// Length of time before a transition begins in seconds.
    public let delay: Double
    
    @objc public init(duration: Double, delay: Double) {
        self.duration = duration
        self.delay = delay
    }
}

extension TMBStyleTransition {
    func swiftOnly() -> StyleTransition {
        return StyleTransition(duration: duration, delay: delay)
    }
    
    class func zero() -> TMBStyleTransition {
        return TMBStyleTransition(duration: 0, delay: 0)
    }
    
    class func from(_ value: StyleTransition) -> TMBStyleTransition {
        return TMBStyleTransition(duration: value.duration, delay: value.delay)
    }
}
