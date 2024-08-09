import Foundation
import MapboxMaps
import CoreLocation
import MapboxMaps
import UIKit
import MapboxMaps

@objc open class TMBCameraOptions: NSObject {
    /// The geographic coordinate that will be rendered at the midpoint of the area defined by `padding`. Defaults to (0, 0).
    @objc public var center: CLLocationCoordinate2D

    /// Insets from each edge of the map. Impacts the "principal point" of the graphical projection and the location at which `center` is rendered. Defaults to 0.
    @objc public var padding: UIEdgeInsets

    /// Point in the map's coordinate system about which `zoom` and `bearing` should be applied. Mutually exclusive with `center`. Defaults to (0, 0).
    @objc public var anchor: CGPoint

    /// The zoom level of the map. Defaults to 0.
    @objc public var zoom: CGFloat
    /// The bearing of the map, measured in degrees clockwise from true north. Defaults to 0.
    @objc public var bearing: CLLocationDirection
    /// Pitch toward the horizon measured in degrees, with 0 degrees resulting in a top-down view for a two-dimensional map. Defaults to 0.
    @objc public var pitch: CGFloat

    /**
    `CameraOptions` represents a set of updates to make to the camera.

    - Parameter center: The geographic coordinate that will be rendered at the midpoint of the area defined by `padding`.
    - Parameter padding: Insets from each edge of the map. Impacts the "principal point" of the graphical projection and the location at which `center` is rendered.
    - Parameter anchor: Point in the map's coordinate system about which `zoom` and `bearing` should be applied. Mutually exclusive with `center`.
    - Parameter zoom: The zoom level of the map.
    - Parameter bearing: The bearing of the map, measured in degrees clockwise from true north.
    - Parameter pitch: Pitch toward the horizon measured in degrees, with 0 degrees resulting in a top-down view for a two-dimensional map.
    - Returns: A `CameraOptions` that contains all configuration information the map will use to determine which part of the map to render.
    */
    @objc public init(center : CLLocationCoordinate2D, 
                padding : UIEdgeInsets, 
                anchor : CGPoint, 
                zoom : CGFloat, 
                bearing : CLLocationDirection, 
                pitch : CGFloat){
        self.center     = center
        self.padding    = padding
        self.anchor     = anchor
        self.zoom       = zoom
        self.bearing    = bearing
        self.pitch      = pitch
    }

    @objc public init(cameraState : TMBCameraState, anchor : CGPoint){
        self.center     = cameraState.center
        self.padding    = cameraState.padding
        self.zoom       = cameraState.zoom
        self.bearing    = cameraState.bearing
        self.pitch      = cameraState.pitch
        self.anchor     = anchor
    }
}
extension TMBCameraOptions {
    func unwrap() -> CameraOptions {
        CameraOptions(center: self.center,
            padding: self.padding,
            anchor: self.anchor,
            zoom: self.zoom,
            bearing: self.bearing,
            pitch: self.pitch)
    }
}
extension CameraOptions {
    func wrap() -> TMBCameraOptions {
        TMBCameraOptions(center: self.center ?? CLLocationCoordinate2D(),
          padding: self.padding ?? UIEdgeInsets(),
          anchor: self.anchor ?? CGPoint(),
          zoom: self.zoom ?? CGFloat(),
          bearing: self.bearing ?? CLLocationDirection(),
          pitch: self.pitch ?? CGFloat())
    }
}