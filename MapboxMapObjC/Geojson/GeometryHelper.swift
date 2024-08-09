import MapboxCommon
import Turf

@objc
open class GeometryHelper : NSObject {
    private override init() { }

    @objc
    public class func createPoint(_ location: NSValue) -> MapboxCommon.Geometry {
        return MapboxCommon.Geometry(point: location)
    }
    @objc
    public class func createLine(_ locations: [NSValue]) -> MapboxCommon.Geometry {
        return MapboxCommon.Geometry(line: locations)
    }
    @objc
    public class func createMultiLine(_ locations: [[NSValue]]) -> MapboxCommon.Geometry {
        return MapboxCommon.Geometry(multiLine: locations)
    }
    @objc
    public class func createMultiPoint(_ locations: [NSValue]) -> MapboxCommon.Geometry {
        return MapboxCommon.Geometry(multiPoint: locations)
    }
    @objc
    public class func createMultiPolygon(_ locations: [[[NSValue]]]) -> MapboxCommon.Geometry {
        return MapboxCommon.Geometry(multiPolygon: locations)
    }
    @objc
    public class func createPolygon(_ locations: [[NSValue]]) -> MapboxCommon.Geometry {
        return MapboxCommon.Geometry(polygon: locations)
    }
    @objc
    public static func createPolygon(
        center: CLLocationCoordinate2D,
        radius: CLLocationDistance,
        vertices: Int) -> MapboxCommon.Geometry {
        let polygon = Polygon(center: center, radius: radius, vertices: vertices)
        return MapboxCommon.Geometry(Turf.Geometry.polygon(polygon))
    }
    
    @objc
    public class func create(_ items: [MapboxCommon.Geometry]) -> MapboxCommon.Geometry {
        return MapboxCommon.Geometry(geometryCollection: items)
    }
}
