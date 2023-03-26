import Turf
@objc
public protocol MBXGeoData {
    
}

@objc
open class MBCGeometry : NSObject {
    public let data: MBXGeoData
    
    init(_ data: MBXGeoData) {
        self.data = data
    }
    
    @objc
    public class func from(data: MBXGeoData) -> MBCGeometry {
        MBCGeometry(data)
    }
}

extension MBCGeometry {
    func swiftValue() -> Geometry? {
        switch (self.data) {
        case let point as MBXPoint:
            return Geometry.point(point.swiftValue)
        default:
            break
        }
        
        return nil
    }
}
