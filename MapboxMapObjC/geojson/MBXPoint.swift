import Turf
@objc
open class MBXPoint : NSObject, MBXGeoData {
    public var swiftValue: Point
    
    public var coordinates: LocationCoordinate2D {
        get {
            swiftValue.coordinates
        }
        set {
            swiftValue.coordinates = newValue
        }
    }
    
    public init(_ coordinates: LocationCoordinate2D) {
        swiftValue = Point(coordinates)
    }
    
    @objc
    public class func with(coordinates: LocationCoordinate2D) -> MBXPoint {
        MBXPoint(coordinates)
    }
}
