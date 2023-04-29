import MapboxCommon

@objc
open class GeometryHelper : NSObject {
    private override init() { }
    
    @objc
    public class func createPoint(_ location: NSValue) -> Geometry {
        return Geometry(point: location)
    }
    @objc
    public class func createLine(_ locations: [NSValue]) -> Geometry {
        return Geometry(line: locations)
    }
    @objc
    public class func createMultiLine(_ locations: [[NSValue]]) -> Geometry {
        return Geometry(multiLine: locations)
    }
    @objc
    public class func createMultiPoint(_ locations: [NSValue]) -> Geometry {
        return Geometry(multiPoint: locations)
    }
    @objc
    public class func createMultiPolygon(_ locations: [[[NSValue]]]) -> Geometry {
        return Geometry(multiPolygon: locations)
    }
    @objc
    public class func createPolygon(_ locations: [[NSValue]]) -> Geometry {
        return Geometry(polygon: locations)
    }
    @objc
    public class func create(_ items: [Geometry]) -> Geometry {
        return Geometry(geometryCollection: items)
    }
}
