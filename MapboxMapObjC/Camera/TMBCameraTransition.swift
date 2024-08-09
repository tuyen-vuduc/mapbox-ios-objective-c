import UIKit
import MapboxMaps

import CoreLocation
import MapboxMaps

/// Structure used to represent a desired change to the map's camera
@objc open class TMBCameraTransition: NSObject {
    private var origin: CameraTransition
    init(_ origin: CameraTransition) {
        self.origin = origin
    }
    
    /// Represents a change to the center coordinate of the map.
    /// NOTE: Setting the `toValue` of `center` overrides any `anchor` animations
    @objc public var center: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(origin.center)
    }
    
    /// Represents a change to the zoom of the map.
    @objc public var zoom: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(origin.center)
    }
    
    /// Represents a change to the padding of the map.
    @objc public var padding: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(origin.center)
    }
    
    /// Represents a change to the anchor of the map
    /// NOTE: Incompatible with concurrent center animations
    @objc public var anchor: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(origin.center)
    }
    
    /// Represents a change to the bearing of the map.
    @objc public var bearing: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(origin.center)
    }
    
    /// Ensures that bearing transitions are optimized to take the shortest path. Defaults to `true`.
    @objc public var shouldOptimizeBearingPath: Bool  {
        get {
            origin.shouldOptimizeBearingPath
        }
        set {
            origin.shouldOptimizeBearingPath = newValue
        }
    }
    
    /// Represents a change to the pitch of the map.
    @objc public var pitch: TMBCameraTransitionChange {
        TMBCameraTransitionChange.fromCoordinate(origin.center)
    }
}
extension TMBCameraTransition {
    func unwrap() -> CameraTransition {
        self.origin
    }
}
extension CameraTransition {
    func wrap() -> TMBCameraTransition {
        TMBCameraTransition(self)
    }
}

/// Generic struct used to represent a change in a value from a starting point (i.e. `fromValue`) to an end point (i.e. `toValue`).
@objc open class TMBCameraTransitionChange : NSObject {
    @objc public var fromValue: NSValue
    @objc public var toValue: NSValue?
    
    @objc init(fromValue: NSValue, toValue: NSValue? = nil) {
        self.fromValue = fromValue
        self.toValue = toValue
    }
    
    public static func fromChange(_ change: CameraTransition.Change<CLLocationCoordinate2D>)
        -> TMBCameraTransitionChange {
            TMBCameraTransitionChange(
                fromValue: NSValue(mkCoordinate: change.fromValue),
                toValue: change.toValue != nil
                    ? NSValue(mkCoordinate: change.toValue!)
                    : nil)
    }
    
    public static func fromCoordinate(_ change: CameraTransition.Change<CLLocationCoordinate2D>)
        -> TMBCameraTransitionChange {
            TMBCameraTransitionChange(
                fromValue: NSValue(mkCoordinate: change.fromValue),
                toValue: change.toValue != nil
                    ? NSValue(mkCoordinate: change.toValue!)
                    : nil)
    }
    
    public static func fromEdgeInsets(_ change: CameraTransition.Change<UIEdgeInsets>)
        -> TMBCameraTransitionChange {
            TMBCameraTransitionChange(
                fromValue: NSValue(uiEdgeInsets: change.fromValue),
                toValue: change.toValue != nil
                    ? NSValue(uiEdgeInsets: change.toValue!)
                    : nil)
    }
    
    public static func fromCGFloat(_ change: CameraTransition.Change<CGFloat>)
        -> TMBCameraTransitionChange {
            TMBCameraTransitionChange(
                fromValue: NSNumber(value: change.fromValue),
                toValue: change.toValue != nil
                ? NSNumber(value: change.toValue!)
                    : nil)
    }
    
    public func change(_ change: inout CameraTransition.Change<CLLocationCoordinate2D>) {
        change.fromValue = fromValue.coordinateValue()
        change.toValue = toValue?.coordinateValue()
    }
    
    public func change(_ change: inout CameraTransition.Change<UIEdgeInsets>) {
        change.fromValue = fromValue.uiEdgeInsetsValue
        change.toValue = toValue?.uiEdgeInsetsValue
    }
    
    public func change(_ change: inout CameraTransition.Change<CGFloat>) {
        if let fromValue = fromValue as? NSNumber {
            change.fromValue = fromValue.CGFloat
        }
        
        if toValue == nil {
            change.toValue = nil
        }
        else if let toValue = toValue as? NSNumber {
            change.toValue = toValue.CGFloat
        }
    }
}
