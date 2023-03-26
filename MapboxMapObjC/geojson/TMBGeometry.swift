import Turf
@objc
public protocol TMBGeoData {
    
}

@objc
open class TMBGeometry : NSObject {
    public let data: TMBGeoData
    
    init(_ data: TMBGeoData) {
        self.data = data
    }
    
    @objc
    public class func from(data: TMBGeoData) -> TMBGeometry {
        TMBGeometry(data)
    }
}

extension TMBGeometry {
    func swiftValue() -> Geometry? {
        switch (self.data) {
        case let point as TMBPoint:
            return Geometry.point(point.swiftValue)
        default:
            break
        }
        
        return nil
    }
}
