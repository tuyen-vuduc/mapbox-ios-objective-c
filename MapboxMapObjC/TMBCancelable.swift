import MapboxMaps

@objc
open class TMBCancelable : NSObject {
    public let cancelable: Cancelable;
    
    init(cancelable: Cancelable) {
        self.cancelable = cancelable
    }
    
    init(cancelable: MapboxCommon.Cancelable) {
        self.cancelable = cancelable.asCancelable()
    }
    
    @objc public func cancel() {
        cancelable.cancel()
    }
}

internal final class CommonCancelableWrapper: Cancelable {
    private let cancelable: MapboxCommon.Cancelable

    internal init(_ cancelable: MapboxCommon.Cancelable) {
        self.cancelable = cancelable
    }

    internal func cancel() {
        cancelable.cancel()
    }
}

extension MapboxCommon.Cancelable {
    internal func asCancelable() -> Cancelable {
        return CommonCancelableWrapper(self)
    }
}