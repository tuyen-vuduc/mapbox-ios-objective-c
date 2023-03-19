import MapboxMaps

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

extension MBXStyleTransition {
    func swiftOnly() -> StyleTransition {
        return StyleTransition(duration: duration, delay: delay)
    }
    
    class func zero() -> MBXStyleTransition {
        return MBXStyleTransition(duration: 0, delay: 0)
    }
    
    class func from(_ value: StyleTransition) -> MBXStyleTransition {
        return MBXStyleTransition(duration: value.duration, delay: value.delay)
    }
}
