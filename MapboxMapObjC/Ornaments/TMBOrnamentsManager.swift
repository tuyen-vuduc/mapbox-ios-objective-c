import UIKit
import MapboxMaps


/// Options used to configure the corner position of an ornament
@objc public enum TMBOrnamentPosition: Int {
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
extension OrnamentPosition {
    func wrap() -> TMBOrnamentPosition {
        switch self {
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
extension TMBOrnamentPosition {
    func unwrap() -> OrnamentPosition {
        switch self {
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

/// Options used to configure the visibility of an ornament
@objc public enum TMBOrnamentVisibility: Int {
    /// Shows the ornament when relevant
    case adaptive
    /// Hides the ornament
    case hidden
    /// Shows the ornament
    case visible
}
extension OrnamentVisibility {
    func wrap() -> TMBOrnamentVisibility {
        switch self {
        case .adaptive:
            return .adaptive
        case .hidden:
            return .hidden
        case .visible:
            return .visible
        }
    }
}
extension TMBOrnamentVisibility {
    func unwrap() -> OrnamentVisibility {
        switch self {
        case .adaptive:
            return .adaptive
        case .hidden:
            return .hidden
        case .visible:
            return .visible
        }
    }
}

/// APIs for managing map ornaments
@objc open class TMBOrnamentsManager: NSObject {

    /// The ``OrnamentOptions`` object that is used to set up and update the required ornaments on the map.
    @objc public var options: TMBOrnamentOptions  {            
        get {
            origin.options.wrap()
        }
        set {
            origin.options = newValue.unwrap()
        }
    }

    /// The view for the logo ornament. This view can be used to position other views relative to the logo
    /// ornament, but it should not be manipulated. Use ``OrnamentOptions/logo`` to configure the
    /// logo presentation if customization is needed.
    @objc public var logoView: UIView  {            
        origin.logoView
    }

    /// The view for the scale bar ornament. This view can be used to position other views relative to the
    /// scale bar ornament, but it should not be manipulated. Use ``OrnamentOptions/scaleBar``
    /// to configure the scale bar presentation if customization is needed.
    @objc public var scaleBarView: UIView  {            
        origin.scaleBarView
    }

    /// The view for the compass ornament. This view can be used to position other views relative to the
    /// compass ornament, but it should not be manipulated. Use ``OrnamentOptions/compass`` to
    /// configure the compass presentation if customization is needed.
    @objc public var compassView: UIView  {            
        origin.compassView
    }

    /// The view for the attribution button ornament. This view can be used to position other views relative
    /// to the attribution button ornament, but it should not be manipulated. Use
    /// ``OrnamentOptions/attributionButton`` to configure the attribution button presentation
    /// if customization is needed.
    @objc public var attributionButton: UIView  {            
        origin.attributionButton
    }    
    private let origin:OrnamentsManager
    init(origin: OrnamentsManager) {
        self.origin = origin
    }
}
extension TMBOrnamentsManager {
    func unwrap() -> OrnamentsManager {
        self.origin
    }
}
extension OrnamentsManager {
    func wrap() -> TMBOrnamentsManager {
        TMBOrnamentsManager(origin: self)
    }
}
