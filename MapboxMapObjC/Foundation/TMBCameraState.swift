import Foundation
import MapboxMaps
import CoreLocation
import MapboxMaps
import UIKit
import MapboxMaps

@objc open class TMBCameraState: NSObject {
    /// The geographic coordinate that will be rendered at the midpoint of the area defined by `padding`.
    @objc public var center: CLLocationCoordinate2D

    /// Insets from each edge of the map. Impacts the "principal point" of the graphical projection and the location at which `center` is rendered.
    @objc public var padding: UIEdgeInsets

    /// The zoom level of the map.
    @objc public var zoom: CGFloat
    /// The bearing of the map, measured in degrees clockwise from true north.
    @objc public var bearing: CLLocationDirection
    /// Pitch toward the horizon measured in degrees, with 0 degrees resulting in a top-down view for a two-dimensional map.
    @objc public var pitch: CGFloat

    @objc public init(center : CLLocationCoordinate2D, 
                padding : UIEdgeInsets, 
                zoom : CGFloat, 
                bearing : CLLocationDirection, 
                pitch : CGFloat){
        self.center = (center)
        self.padding = (padding)
        self.zoom = zoom
        self.bearing = bearing
        self.pitch = pitch
    }
}
extension TMBCameraState {
    func unwrap() -> CameraState {
        CameraState(center: self.center,
            padding: self.padding,
            zoom: self.zoom,
            bearing: self.bearing,
            pitch: self.pitch)
    }
}
extension CameraState {
    func wrap() -> TMBCameraState {
        TMBCameraState(center: self.center,
          padding: self.padding,
          zoom: self.zoom,
          bearing: self.bearing,
          pitch: self.pitch)
    }
}