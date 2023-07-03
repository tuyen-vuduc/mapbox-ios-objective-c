import MapboxMaps

@objc open class TMBStyleTransition: NSObject {
    private var _self: StyleTransition
    init(_ _self: StyleTransition) {
        self._self = _self
    }
    public var rawValue: StyleTransition {
        return _self
    }
    
    /// Time allotted for transitions to complete in seconds.
    public var duration: Double {
        get {
            _self.duration
        }
        set {
            _self.duration = newValue
        }
    }
    
    /// Length of time before a transition begins in seconds.
    public var delay: Double {
        get {
            _self.delay
        }
        set {
            _self.delay = newValue
        }
    }
    
    @objc public init(duration: Double, delay: Double) {
        self._self = StyleTransition(duration: duration, delay: delay)
    }
    
    @objc class public var zero: TMBStyleTransition {
        return TMBStyleTransition(duration: 0, delay: 0)
    }
}

extension StyleTransition {
    func objcValue() -> TMBStyleTransition {
        return TMBStyleTransition(self)
    }
}
