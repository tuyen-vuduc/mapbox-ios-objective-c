// This file is generated.
import UIKit
import MapboxMaps
import MapboxCommon
import Turf

@objc open class TMBCircleAnnotation: NSObject, TMBAnnotation {

    /// Identifier for this annotation
    @objc public var  id: String

    /// The geometry backing this annotation
    @objc public var  geometry: MapboxCommon.Geometry {
        MapboxCommon.Geometry(point: centerCoordinate.toValue())
    }

    /// The point backing this annotation
    @objc public var  centerCoordinate: CLLocationCoordinate2D

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

    /// Create a circle annotation with a center coordinate and an optional identifier
    /// - Parameters:
    ///   - id: Optional identifier for this annotation
    ///   - coordinate: Coordinate where this circle annotation should be centered
    
    @objc public init(id : String , centerCoordinate : CLLocationCoordinate2D, isSelected : Bool , isDraggable : Bool ) {
        self.id = id
        self.centerCoordinate = centerCoordinate
        self.isSelected = isSelected
        self.isDraggable = isDraggable
    }

    // MARK: - Style Properties -

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var  circleSortKey: NSNumber?

    /// Amount to blur the circle. 1 blurs the circle such that only the centerpoint is full opacity.
    @objc public var  circleBlur: NSNumber?

    /// The fill color of the circle.
    @objc public var  circleColor: UIColor?

    /// The opacity at which the circle will be drawn.
    @objc public var  circleOpacity: NSNumber?

    /// Circle radius.
    @objc public var  circleRadius: NSNumber?

    /// The stroke color of the circle.
    @objc public var  circleStrokeColor: UIColor?

    /// The opacity of the circle's stroke.
    @objc public var  circleStrokeOpacity: NSNumber?

    /// The width of the circle's stroke. Strokes are placed outside of the `circle-radius`.
    @objc public var  circleStrokeWidth: NSNumber?

}
extension TMBCircleAnnotation {
    func unwrap() -> CircleAnnotation {
        var result = CircleAnnotation(id: self.id,
            point: Turf.Point(self.centerCoordinate),
            isSelected: self.isSelected,
            isDraggable: self.isDraggable)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout CircleAnnotation) {
        dest.point = Turf.Point(self.centerCoordinate)
        dest.isSelected = self.isSelected
        dest.isDraggable = self.isDraggable
        dest.circleSortKey = self.circleSortKey?.double()
        dest.circleBlur = self.circleBlur?.double()
        dest.circleColor = self.circleColor?.styleColor()
        dest.circleOpacity = self.circleOpacity?.double()
        dest.circleRadius = self.circleRadius?.double()
        dest.circleStrokeColor = self.circleStrokeColor?.styleColor()
        dest.circleStrokeOpacity = self.circleStrokeOpacity?.double()
        dest.circleStrokeWidth = self.circleStrokeWidth?.double()
    }
}
extension CircleAnnotation {
    func wrap() -> TMBCircleAnnotation {
        var result = TMBCircleAnnotation(id: self.id,
          centerCoordinate: self.point.coordinates,
          isSelected: self.isSelected,
          isDraggable: self.isDraggable)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBCircleAnnotation)  {
        dest.centerCoordinate = self.point.coordinates
        dest.isSelected = self.isSelected
        dest.isDraggable = self.isDraggable
        dest.circleSortKey = self.circleSortKey?.double()
        dest.circleBlur = self.circleBlur?.double()
        dest.circleColor = self.circleColor?.wrap()
        dest.circleOpacity = self.circleOpacity?.double()
        dest.circleRadius = self.circleRadius?.double()
        dest.circleStrokeColor = self.circleStrokeColor?.wrap()
        dest.circleStrokeOpacity = self.circleStrokeOpacity?.double()
        dest.circleStrokeWidth = self.circleStrokeWidth?.double()
    }
}
