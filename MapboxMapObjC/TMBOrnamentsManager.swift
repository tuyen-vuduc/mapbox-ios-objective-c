import MapboxMaps

@objc
extension MapView {
    @objc public func ornaments() -> TMBOrnamentsManager {
        TMBOrnamentsManager(self.ornaments)
    }
}

@objc
open class TMBOrnamentsManager : NSObject {
    private let _self: OrnamentsManager
    
    init(_ _self: OrnamentsManager) {
        self._self = _self
    }
    
    /// The ``OrnamentOptions`` object that is used to set up and update the required ornaments on the map.
    @objc public var options: TMBOrnamentOptions {
        get {
            TMBOrnamentOptions(_self.options)
        }
        set {
            _self.options = newValue.swiftValue
        }
    }

    /// The view for the logo ornament. This view can be used to position other views relative to the logo
    /// ornament, but it should not be manipulated. Use ``OrnamentOptions/logo`` to configure the
    /// logo presentation if customization is needed.
    @objc public var logoView: UIView {
        return _self.logoView
    }

    /// The view for the scale bar ornament. This view can be used to position other views relative to the
    /// scale bar ornament, but it should not be manipulated. Use ``OrnamentOptions/scaleBar``
    /// to configure the scale bar presentation if customization is needed.
    @objc public var scaleBarView: UIView {
        return _self.scaleBarView
    }

    /// The view for the compass ornament. This view can be used to position other views relative to the
    /// compass ornament, but it should not be manipulated. Use ``OrnamentOptions/compass`` to
    /// configure the compass presentation if customization is needed.
    @objc public var compassView: UIView {
        return _self.compassView
    }

    /// The view for the attribution button ornament. This view can be used to position other views relative
    /// to the attribution button ornament, but it should not be manipulated. Use
    /// ``OrnamentOptions/attributionButton`` to configure the attribution button presentation
    /// if customization is needed.
    @objc public var attributionButton: UIView {
        return _self.attributionButton
    }
}

/// Used to configure Ornament-specific capabilities of the map
///
/// All margin values are relative to the ``MapView``'s safe area. To allow the safe area
/// (and thereby ornaments) to track the presence of navigation bars and tab bars,
/// make MapView the root view of a view controller.
@objc open class TMBOrnamentOptions: NSObject {
    private var _self: OrnamentOptions
    
    init(_ _self: OrnamentOptions) {
        self._self = _self
    }
    
    public var swiftValue: OrnamentOptions {
        return _self
    }
    
    // MARK: - Scale Bar
    
    /// The ornament options for the map's scale bar.
    @objc public var scaleBar: TMBScaleBarViewOptions {
        get {
            TMBScaleBarViewOptions(_self.scaleBar)
        }
        set {
            _self.scaleBar = newValue.swiftValue
        }
    }
    
    // MARK: - Compass
    
    /// The ornament options for the map's compass view.
    @objc public var compass: TMBCompassViewOptions {
        get {
            TMBCompassViewOptions(_self.compass)
        }
        set {
            _self.compass = newValue.swiftValue
        }
    }
    
    // MARK: - Logo View
    
    /// The ornament options for the map's logo view.
    ///
    /// Per our terms of service, a Mapbox map is required to display both
    /// a Mapbox logo as well as an information icon that contains attribution
    /// information. See https://docs.mapbox.com/help/how-mapbox-works/attribution/
    /// for details.
    @objc public var logo: TMBLogoViewOptions {
        get {
            TMBLogoViewOptions(_self.logo)
        }
        set {
            _self.logo = newValue.swiftValue
        }
    }
    
    // MARK: - Attribution Button
    
    /// The ornament options for the map's attribution button.
    @objc public var attributionButton: TMBAttributionButtonOptions {
        get {
            TMBAttributionButtonOptions(_self.attributionButton)
        }
        set {
            _self.attributionButton = newValue.swiftValue
        }
    }
}

/// Used to configure position, margin, and visibility for the map's scale bar view.
@objc open class TMBScaleBarViewOptions : NSObject {
    private var _self: ScaleBarViewOptions
    
    init(_ _self: ScaleBarViewOptions) {
        self._self = _self
    }
    
    public var swiftValue: ScaleBarViewOptions {
        return _self
    }
    
    /// The position of the scale bar view.
    ///
    /// The default value for this property is `.topLeading`.
    @objc public var position: TMBOrnamentPosition {
        get {
            _self.position.objcValue()
        }
        
        set {
            _self.position = newValue.swiftValue()
        }
    }

    /// The margins of the scale bar view.
    ///
    /// The default value for this property is `CGPoint(x: 8.0, y: 8.0)`.
    @objc public var margins: CGPoint {
        get {
            _self.margins
        }
        
        set {
            _self.margins = newValue
        }
    }

    /// The visibility of the scale bar view.
    ///
    /// The default value for this property is `.adaptive`.
    @objc public var visibility: TMBOrnamentVisibility {
        get {
            _self.visibility.objcValue()
        }
        
        set {
            _self.visibility = newValue.swiftValue()
        }
    }

    /// Specifies the whether the scale bar uses the metric system.
    /// True if the scale bar is using metric units, false if the scale bar is using imperial units.
    ///
    /// The default value for this property is `Locale.current.usesMetricSystem`.
    public var useMetricUnits: Bool{
        get {
            _self.useMetricUnits
        }
        
        set {
            _self.useMetricUnits = newValue
        }
    }
}

@objc
public enum TMBOrnamentVisibility : Int {
    case adaptive
    case hidden
    case visible
}

extension TMBOrnamentVisibility {
    func swiftValue() -> OrnamentVisibility {
        switch (self) {
        case .adaptive:
            return .adaptive
        case .hidden:
            return .hidden
        case .visible:
            return .visible
        }
    }
}

extension OrnamentVisibility {
    func objcValue() -> TMBOrnamentVisibility {
        switch (self) {
        case .adaptive:
            return .adaptive
        case .hidden:
            return .hidden
        case .visible:
            return .visible
        }
    }
}

@objc public enum TMBOrnamentPosition : Int {
    // Clockwise from top left
    case topLeft
    case topRight
    case bottomRight
    case bottomLeft

    case topLeading
    case topTrailing
    case bottomLeading
    case bottomTrailing
}

extension TMBOrnamentPosition {
    func swiftValue() -> OrnamentPosition {
        switch(self) {
        case .topLeft:
            return .topLeft
        case .topRight:
            return .topRight
        case .bottomRight:
            return .bottomRight
        case .bottomLeft:
            return .bottomLeft
        case .topLeading:
            return .topLeading
        case .topTrailing:
            return .topTrailing
        case .bottomLeading:
            return .bottomLeading
        case .bottomTrailing:
            return .bottomTrailing
        }
    }
}

extension OrnamentPosition {
    func objcValue() -> TMBOrnamentPosition {
        switch(self) {
        case .topLeft:
            return .topLeft
        case .topRight:
            return .topRight
        case .bottomRight:
            return .bottomRight
        case .bottomLeft:
            return .bottomLeft
        case .topLeading:
            return .topLeading
        case .topTrailing:
            return .topTrailing
        case .bottomLeading:
            return .bottomLeading
        case .bottomTrailing:
            return .bottomTrailing
        }
    }
}

// Used to configure position, margin, image, and visibility for the map's compass view.
@objc open class TMBCompassViewOptions : NSObject {
    private var _self: CompassViewOptions
    
    init(_ _self: CompassViewOptions) {
        self._self = _self
    }
    
    public var swiftValue: CompassViewOptions {
        return _self
    }
    
    /// The position of the compass view.
    ///
    /// The default value for this property is `.topTrailing`.
    public var position: TMBOrnamentPosition {
        get {
            _self.position.objcValue()
        }
        
        set {
            _self.position = newValue.swiftValue()
        }
    }
    
    /// The margins of the compass view.
    ///
    /// The default value for this property is `CGPoint(x: 8.0, y: 8.0)`.
    public var margins: CGPoint {
        get {
            _self.margins
        }
        
        set {
            _self.margins = newValue
        }
    }
    
    /// The image used for displaying the compass.
    ///
    /// The default value for this property is nil, default compass image will be drawn.
    public var image: UIImage? {
        get {
            _self.image
        }
        
        set {
            _self.image = newValue
        }
    }
    
    /// The visibility of the compass view.
    ///
    /// The default value for this property is `.adaptive`.
    public var visibility: TMBOrnamentVisibility {
        get {
            _self.visibility.objcValue()
        }
        
        set {
            _self.visibility = newValue.swiftValue()
        }
    }
}

/// Used to configure position, margin, and visibility for the map's logo view.
@objc open class TMBLogoViewOptions: NSObject {
    private var _self: LogoViewOptions
    
    init(_ _self: LogoViewOptions) {
        self._self = _self
    }
    
    public var swiftValue: LogoViewOptions {
        return _self
    }
    
    /// The position of the logo view.
    ///
    /// The default value for this property is `.bottomLeading`.
    public var position: TMBOrnamentPosition {
        get {
            _self.position.objcValue()
        }
        
        set {
            _self.position = newValue.swiftValue()
        }
    }
    
    /// The margins of the logo view.
    ///
    /// The default value for this property is `CGPoint(x: 8.0, y: 8.0)`.
    public var margins: CGPoint {
        get {
            _self.margins
        }
        
        set {
            _self.margins = newValue
        }
    }
}

/// Used to configure position, margin, and visibility for the map's attribution button.
@objc open class TMBAttributionButtonOptions: NSObject {
    private var _self: AttributionButtonOptions
    
    init(_ _self: AttributionButtonOptions) {
        self._self = _self
    }
    
    public var swiftValue: AttributionButtonOptions {
        return _self
    }
    
    /// The position of the attribution button.
    ///
    /// The default value for this property is `.bottomTrailing`.
    public var position: TMBOrnamentPosition {
        get {
            _self.position.objcValue()
        }
        
        set {
            _self.position = newValue.swiftValue()
        }
    }
    
    /// The margins of the attribution button.
    ///
    /// The default value for this property is `CGPoint(x: 8.0, y: 8.0)`.
    public var margins: CGPoint {
        get {
            _self.margins
        }
        
        set {
            _self.margins = newValue
        }
    }
}
