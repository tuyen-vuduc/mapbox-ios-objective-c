import MapboxMaps

@objc open class TMBAnimationOwner: NSObject {
    public typealias RawValue = String

    public let origin: AnimationOwner
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: AnimationOwner(rawValue: rawValue))
    }

    public init(origin: AnimationOwner) {
       self.origin = origin
    }

    @objc public static let gestures = TMBAnimationOwner(origin: AnimationOwner.gestures)

    @objc public static let unspecified = TMBAnimationOwner(origin: AnimationOwner.unspecified)
}
extension AnimationOwner {
    func wrap() -> TMBAnimationOwner {
        TMBAnimationOwner(origin: self)
    }
}
extension TMBAnimationOwner {
    func unwrap() -> AnimationOwner {
        self.origin
    }
}
