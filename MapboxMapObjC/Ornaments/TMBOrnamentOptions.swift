import UIKit
import MapboxMaps


/// Used to configure Ornament-specific capabilities of the map
///
/// All margin values are relative to the ``MapView``'s safe area. To allow the safe area
/// (and thereby ornaments) to track the presence of navigation bars and tab bars,
/// make MapView the root view of a view controller.
@objc open class TMBOrnamentOptions: NSObject {

    // MARK: - Scale Bar

    /// The ornament options for the map's scale bar.
    @objc public var scaleBar: TMBScaleBarViewOptions

    // MARK: - Compass

    /// The ornament options for the map's compass view.
    @objc public var compass: TMBCompassViewOptions

    // MARK: - Logo View

    /// The ornament options for the map's logo view.
    ///
    /// Per our terms of service, a Mapbox map is required to display both
    /// a Mapbox logo as well as an information icon that contains attribution
    /// information. See https://docs.mapbox.com/help/how-mapbox-works/attribution/
    /// for details.
    @objc public var logo: TMBLogoViewOptions

    // MARK: - Attribution Button

    /// The ornament options for the map's attribution button.
    @objc public var attributionButton: TMBAttributionButtonOptions

    /// Initializes an `OrnamentOptions`.
    /// - Parameters:
    ///   - scaleBar: The ornament options for the map's scale bar.
    ///   - compass: The ornament options for the map's compass view.
    ///   - logo: The ornament options for the map's logo view.
    ///   - attributionButton: The ornament options for the map's attribution button.
    @objc public init(
        scaleBar : TMBScaleBarViewOptions , 
        compass : TMBCompassViewOptions , 
        logo : TMBLogoViewOptions , 
        attributionButton : TMBAttributionButtonOptions ){
        self.scaleBar = scaleBar
        self.compass = compass
        self.logo = logo
        self.attributionButton = attributionButton
    }
}
extension TMBOrnamentOptions {
    func unwrap() -> OrnamentOptions {
        OrnamentOptions(scaleBar: (self.scaleBar).unwrap(),
            compass: (self.compass).unwrap(),
            logo: (self.logo).unwrap(),
            attributionButton: (self.attributionButton).unwrap())
    }
}
extension OrnamentOptions {
    func wrap() -> TMBOrnamentOptions {
        TMBOrnamentOptions(scaleBar: (self.scaleBar).wrap(),
          compass: (self.compass).wrap(),
          logo: (self.logo).wrap(),
          attributionButton: (self.attributionButton).wrap())
    }
}

/// Used to configure position, margin, and visibility for the map's scale bar view.
@objc open class TMBScaleBarViewOptions: NSObject {

    /// The position of the scale bar view.
    ///
    /// The default value for this property is `.topLeading`.
    @objc public var position: TMBOrnamentPosition

    /// The margins of the scale bar view.
    ///
    /// The default value for this property is `CGPoint(x: 8.0, y: 8.0)`.
    @objc public var margins: CGPoint

    /// The visibility of the scale bar view.
    ///
    /// The default value for this property is `.adaptive`.
    @objc public var visibility: TMBOrnamentVisibility

    /// Specifies the whether the scale bar uses the metric system.
    /// True if the scale bar is using metric units, false if the scale bar is using imperial units.
    ///
    /// The default value for this property is `Locale.current.usesMetricSystem`.
    @objc public var useMetricUnits: Bool

    /// Initializes a `ScaleBarViewOptions`.
    /// - Parameters:
    ///   - position: The position of the scale bar view.
    ///   - margins: The margins of the scale bar view.
    ///   - visibility: The visibility of the scale bar view.
    ///   - useMetricUnits: Whether the scale bar uses the metric system.
    @objc public init(
        position : TMBOrnamentPosition , 
        margins : CGPoint , 
        visibility : TMBOrnamentVisibility , 
        useMetricUnits : Bool ){
        self.position = position
        self.margins = margins
        self.visibility = visibility
        self.useMetricUnits = useMetricUnits
    }
}
extension TMBScaleBarViewOptions {
    func unwrap() -> ScaleBarViewOptions {
        ScaleBarViewOptions(position: (self.position).unwrap(),
            margins: self.margins,
            visibility: (self.visibility).unwrap(),
            useMetricUnits: self.useMetricUnits)
    }
}
extension ScaleBarViewOptions {
    func wrap() -> TMBScaleBarViewOptions {
        TMBScaleBarViewOptions(position: (self.position).wrap(),
          margins: self.margins,
          visibility: (self.visibility).wrap(),
          useMetricUnits: self.useMetricUnits)
    }
}

/// Used to configure position, margin, image, and visibility for the map's compass view.
@objc open class TMBCompassViewOptions: NSObject {

    /// The position of the compass view.
    ///
    /// The default value for this property is `.topTrailing`.
    @objc public var position: TMBOrnamentPosition

    /// The margins of the compass view.
    ///
    /// The default value for this property is `CGPoint(x: 8.0, y: 8.0)`.
    @objc public var margins: CGPoint

    /// The image used for displaying the compass.
    ///
    /// The default value for this property is nil, default compass image will be drawn.
    @objc public var image: UIImage?

    /// The visibility of the compass view.
    ///
    /// The default value for this property is `.adaptive`.
    @objc public var visibility: TMBOrnamentVisibility

    /// Initializes a `CompassViewOptions`.
    /// - Parameters:
    ///   - position: The position of the compass view.
    ///   - margins: The margins of the compass view.
    ///   - image: The image used for displaying the compass.
    ///   - visibility: The visibility of the compass view.
    @objc public init(
        position : TMBOrnamentPosition , 
        margins : CGPoint , 
        image : UIImage?, 
        visibility : TMBOrnamentVisibility ){
        self.position = position
        self.margins = margins
        self.image = image
        self.visibility = visibility
    }
}
extension TMBCompassViewOptions {
    func unwrap() -> CompassViewOptions {
        CompassViewOptions(position: (self.position).unwrap(),
            margins: self.margins,
            image: self.image,
            visibility: (self.visibility).unwrap())
    }
}
extension CompassViewOptions {
    func wrap() -> TMBCompassViewOptions {
        TMBCompassViewOptions(position: (self.position).wrap(),
          margins: self.margins,
          image: self.image,
          visibility: (self.visibility).wrap())
    }
}

/// Used to configure position, margin, and visibility for the map's attribution button.
@objc open class TMBAttributionButtonOptions: NSObject {

    /// The position of the attribution button.
    ///
    /// The default value for this property is `.bottomTrailing`.
    @objc public var position: TMBOrnamentPosition

    /// The margins of the attribution button.
    ///
    /// The default value for this property is `CGPoint(x: 8.0, y: 8.0)`.
    @objc public var margins: CGPoint

    /// Initializes an `AttributionButtonOptions`.
    /// - Parameters:
    ///   - position: The position of the attribution button.
    ///   - margins: The margins of the attribution button.
    @objc public init(
        position : TMBOrnamentPosition , 
        margins : CGPoint ){
        self.position = position
        self.margins = margins
    }
}
extension TMBAttributionButtonOptions {
    func unwrap() -> AttributionButtonOptions {
        AttributionButtonOptions(position: (self.position).unwrap(),
            margins: self.margins)
    }
}
extension AttributionButtonOptions {
    func wrap() -> TMBAttributionButtonOptions {
        TMBAttributionButtonOptions(position: (self.position).wrap(),
          margins: self.margins)
    }
}

/// Used to configure position, margin, and visibility for the map's logo view.
@objc open class TMBLogoViewOptions: NSObject {

    /// The position of the logo view.
    ///
    /// The default value for this property is `.bottomLeading`.
    @objc public var position: TMBOrnamentPosition

    /// The margins of the logo view.
    ///
    /// The default value for this property is `CGPoint(x: 8.0, y: 8.0)`.
    @objc public var margins: CGPoint

    /// Initializes a `LogoViewOptions`.
    /// - Parameters:
    ///   - position: The position of the logo view.
    ///   - margins: The margins of the logo view.
    @objc public init(
        position : TMBOrnamentPosition , 
        margins : CGPoint ){
        self.position = position
        self.margins = margins
    }
}
extension TMBLogoViewOptions {
    func unwrap() -> LogoViewOptions {
        LogoViewOptions(position: (self.position).unwrap(),
            margins: self.margins)
    }
}
extension LogoViewOptions {
    func wrap() -> TMBLogoViewOptions {
        TMBLogoViewOptions(position: (self.position).wrap(),
          margins: self.margins)
    }
}
