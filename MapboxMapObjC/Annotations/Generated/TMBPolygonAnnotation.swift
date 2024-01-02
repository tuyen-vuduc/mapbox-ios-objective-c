// This file is generated.
import UIKit
import MapboxMaps
import MapboxCommon
import Turf


@objc open class TMBPolygonAnnotation: NSObject, TMBAnnotation {

    /// Identifier for this annotation
    @objc public var  id: String

    /// The geometry backing this annotation
    @objc public var  geometry: MapboxCommon.Geometry {
        self.polygon.geometry()
    }

    /// The polygon backing this annotation
    @objc public var  polygon: TMBPolygon

    /// Toggles the annotation's selection state.
    /// If the annotation is deselected, it becomes selected.
    /// If the annotation is selected, it becomes deselected.
    @objc public var  isSelected: Bool 

    /// Property to determine whether annotation can be manually moved around map
    @objc public var  isDraggable: Bool 
    
    /// Handles tap gesture on this annotation.
    ///
    /// Should return `true` if the gesture is handled, or `false` to propagate it to the annotations or layers below.
    @objc public var  tapHandler: ((TMBMapContentGestureContext) -> Bool)?

    /// Handles long press gesture on this annotation.
    ///
    /// Should return `true` if the gesture is handled, or `false` to propagate it to the annotations or layers below.
    @objc public var  longPressHandler: ((TMBMapContentGestureContext) -> Bool)?

    /// Properties associated with the annotation
    @objc public var  userInfo: [String:Any]?

    /// Create a polygon annotation with a `Polygon` and an optional identifier.
    
    @objc public init(id : String , polygon: TMBPolygon, isSelected : Bool , isDraggable : Bool ) {
        self.id = id
        self.polygon = polygon
        self.isSelected = isSelected
        self.isDraggable = isDraggable

    }

    // MARK: - Style Properties -

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var  fillSortKey: NSNumber?

    /// The color of the filled part of this layer. This color can be specified as `rgba` with an alpha component and the color's opacity will not affect the opacity of the 1px stroke, if it is used.
    @objc public var  fillColor: UIColor?

    /// The opacity of the entire fill layer. In contrast to the `fill-color`, this value will also affect the 1px stroke around the fill, if the stroke is used.
    @objc public var  fillOpacity: NSNumber?

    /// The outline color of the fill. Matches the value of `fill-color` if unspecified.
    @objc public var  fillOutlineColor: UIColor?

    /// Name of image in sprite to use for drawing image fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var  fillPattern: String?

}
extension TMBPolygonAnnotation {
    func unwrap() -> PolygonAnnotation {
        var result = PolygonAnnotation(id: self.id,
            polygon: self.polygon.unwrap(),
            isSelected: self.isSelected,
            isDraggable: self.isDraggable)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout PolygonAnnotation) {
        dest.polygon = self.polygon.unwrap()
        dest.isSelected = self.isSelected
        dest.isDraggable = self.isDraggable
        dest.fillSortKey = self.fillSortKey?.double()
        dest.fillColor = self.fillColor?.styleColor()
        dest.fillOpacity = self.fillOpacity?.double()
        dest.fillOutlineColor = self.fillOutlineColor?.styleColor()
        dest.fillPattern = self.fillPattern
    }
}
extension PolygonAnnotation {
    func wrap() -> TMBPolygonAnnotation {
        var result = TMBPolygonAnnotation(id: self.id,
          polygon: (self.polygon).wrap(),
          isSelected: self.isSelected,
          isDraggable: self.isDraggable)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBPolygonAnnotation)  {
        dest.polygon = self.polygon.wrap()
        dest.isSelected = self.isSelected
        dest.isDraggable = self.isDraggable
        dest.fillSortKey = self.fillSortKey?.double()
        dest.fillColor = self.fillColor?.wrap()
        dest.fillOpacity = self.fillOpacity?.double()
        dest.fillOutlineColor = self.fillOutlineColor?.wrap()
        dest.fillPattern = self.fillPattern
    }
}
