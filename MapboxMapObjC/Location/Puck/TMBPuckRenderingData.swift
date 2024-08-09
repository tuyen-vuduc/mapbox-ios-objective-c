import MapboxMaps

/// Represents the interpolated data ready to render the user location puck.
@objc open class TMBPuckRenderingData: NSObject {
    /// Puck's location.
    @objc public var location: Location

    /// Puck's heading.
    @objc public var heading: TMBHeading?

    /// Creates a puck rendering data.
    @objc public init(location : Location, heading : TMBHeading?){
        self.location = location
        self.heading = heading
    }
}
extension TMBPuckRenderingData {
    func unwrap() -> PuckRenderingData {
        PuckRenderingData(location: (self.location),
            heading: (self.heading)?.unwrap())
    }
}
extension PuckRenderingData {
    func wrap() -> TMBPuckRenderingData {
        TMBPuckRenderingData(location: (self.location),
          heading: (self.heading)?.wrap())
    }
}
