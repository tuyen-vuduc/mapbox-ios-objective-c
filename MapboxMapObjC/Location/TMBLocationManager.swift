import CoreLocation
import MapboxMaps

import UIKit
import MapboxMaps

import MapboxCommon
import MapboxMaps


/// An object responsible for managing user location Puck.
@objc open class TMBLocationManager: NSObject {
    /// A stream of location change events that drive the puck.
    @objc public var onLocationChange: TMBSignal<[Location]>  {            
        origin.onLocationChange.wrap()}

    /// A stream of heading update events that drive the puck.
    ///
    /// Heading is used when puck uses ``PuckBearing/heading`` as a bearing type.
    @objc public var onHeadingChange: TMBSignal<Heading>  {            
        origin.onHeadingChange.wrap()}

    /// A stream of puck render events.
    ///
    /// A subscriber will get the accurate (interpolated) data used to render puck,
    /// as opposed to the ``onLocationChange`` and ``onHeadingChange`` that emit non-interpolated source data.
    ///
    /// Observe this stream to adjust any elements that connected the actual puck position, such as route line, annotations, camera position,
    /// or you can render a custom puck.
    @objc public var onPuckRender: TMBSignal<PuckRenderingData> {            
        origin.onPuckRender.wrap()
    }