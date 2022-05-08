import Foundation
import MapboxMaps

extension MapboxCoreMaps.CameraOptions {
    func create() -> MapboxMaps.CameraOptions {
        return MapboxMaps.CameraOptions(
            center: self.__center?.coordinate,
            padding: self.__padding?.toUIEdgeInsetsValue(),
            anchor: self.__anchor?.point,
            zoom: self.__zoom?.CGFloat,
            bearing: self.__bearing?.CLLocationDirection,
            pitch: self.__pitch?.CGFloat)
    }
}

extension EdgeInsets {
    func toUIEdgeInsetsValue() -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(self.top),
                            left: CGFloat(self.left),
                            bottom: CGFloat(self.bottom),
                            right: CGFloat(self.right))
    }
}

extension MapboxCoreMaps.ScreenCoordinate {
    var point: CGPoint {
        get {
            return CGPoint(x: self.x, y: self.y)
        }
    }
}
