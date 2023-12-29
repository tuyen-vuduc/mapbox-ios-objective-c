// This file is generated.
import Foundation
import MapboxMaps


/// A filled polygon with an optional stroked border.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-fill)
@objc open class TMBFillLayer: NSObject, TMBLayer {

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
    @objc public var  id: String

    /// Rendering type of this layer.
    @objc public let  type: TMBLayerType

    /// An expression specifying conditions on source features.
    /// Only features that match the filter are displayed.
    @objc public var  filter: TMBExpression?

    /// Name of a source description to be used for this layer.
    /// Required for all layer types except ``BackgroundLayer``, ``SkyLayer``, and ``LocationIndicatorLayer``.
    @objc public var  source: String?

    /// Layer to use from a vector tile source.
    ///
    /// Required for vector tile sources.
    /// Prohibited for all other source types, including GeoJSON sources.
    @objc public var  sourceLayer: String?
    
    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc public var  slot: TMBSlot?

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc public var  minZoom: NSNumber?

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc public var  maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var  visibility: TMBValue

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var  fillSortKey: TMBValue?

    /// Whether or not the fill should be antialiased.
    @objc public var  fillAntialias: TMBValue?

    /// The color of the filled part of this layer. This color can be specified as `rgba` with an alpha component and the color's opacity will not affect the opacity of the 1px stroke, if it is used.
    @objc public var  fillColor: TMBValue?

    /// Transition options for `fillColor`.
    @objc public var  fillColorTransition: TMBStyleTransition?

    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var  fillEmissiveStrength: TMBValue?

    /// Transition options for `fillEmissiveStrength`.
    @objc public var  fillEmissiveStrengthTransition: TMBStyleTransition?

    /// The opacity of the entire fill layer. In contrast to the `fill-color`, this value will also affect the 1px stroke around the fill, if the stroke is used.
    @objc public var  fillOpacity: TMBValue?

    /// Transition options for `fillOpacity`.
    @objc public var  fillOpacityTransition: TMBStyleTransition?

    /// The outline color of the fill. Matches the value of `fill-color` if unspecified.
    @objc public var  fillOutlineColor: TMBValue?

    /// Transition options for `fillOutlineColor`.
    @objc public var  fillOutlineColorTransition: TMBStyleTransition?

    /// Name of image in sprite to use for drawing image fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var  fillPattern: TMBValue?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var  fillTranslate: TMBValue?

    /// Transition options for `fillTranslate`.
    @objc public var  fillTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `fill-translate`.
    @objc public var  fillTranslateAnchor: TMBValue?

    
    @objc public init(id : String, source : String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.fill
        self.visibility = .visibility(.visible)
    }
}
extension TMBFillLayer {
    func unwrap() -> FillLayer {
        FillLayer(id: self.id,
            source: self.source)
    }
}
extension FillLayer {
    func wrap() -> TMBFillLayer {
        TMBFillLayer(id: self.id,
          source: self.source)
    }
}