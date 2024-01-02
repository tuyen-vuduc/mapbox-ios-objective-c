// This file is generated.
import UIKit
import MapboxMaps
import MapboxCommon


@objc open class TMBPolylineAnnotation: NSObject, TMBAnnotation {

    /// Identifier for this annotation
    @objc public var  id: String

    /// The geometry backing this annotation
    @objc public var  geometry: MapboxCommon.Geometry  {
        self.lineString.geometry()
    }

    /// The line string backing this annotation
    @objc public var  lineString: TMBLineString

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

    /// Create a polyline annotation with a `LineString` and an optional identifier.
    
    @objc public init(id : String , lineString : TMBLineString, isSelected : Bool , isDraggable : Bool ) {
        self.id = id
        self.lineString = lineString
        self.isSelected = isSelected
        self.isDraggable = isDraggable

    }

    /// Create a polyline annotation with an array of coordinates and an optional identifier.
    
    @objc public init(id : String , lineCoordinates : [CLLocationCoordinate2D], isSelected : Bool , isDraggable : Bool ) {
        self.id = id
        self.lineString = TMBLineString(lineCoordinates)
        self.isSelected = isSelected
        self.isDraggable = isDraggable

    }

    // MARK: - Style Properties -

    /// The display of lines when joining.
    @objc public var  lineJoin: TMBLineJoin?

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var  lineSortKey: NSNumber?

    /// Blur applied to the line, in pixels.
    @objc public var  lineBlur: NSNumber?

    /// The color of the line border. If line-border-width is greater than zero and the alpha value of this color is 0 (default), the color for the border will be selected automatically based on the line color.
    @objc public var  lineBorderColor: UIColor?

    /// The width of the line border. A value of zero means no border.
    @objc public var  lineBorderWidth: NSNumber?

    /// The color with which the line will be drawn.
    @objc public var  lineColor: UIColor?

    /// Draws a line casing outside of a line's actual path. Value indicates the width of the inner gap.
    @objc public var  lineGapWidth: NSNumber?

    /// The line's offset. For linear features, a positive value offsets the line to the right, relative to the direction of the line, and a negative value to the left. For polygon features, a positive value results in an inset, and a negative value results in an outset.
    @objc public var  lineOffset: NSNumber?

    /// The opacity at which the line will be drawn.
    @objc public var  lineOpacity: NSNumber?

    /// Name of image in sprite to use for drawing image lines. For seamless patterns, image width must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var  linePattern: String?

    /// Stroke thickness.
    @objc public var  lineWidth: NSNumber?

}
extension TMBPolylineAnnotation {
    func unwrap() -> PolylineAnnotation {
        var result = PolylineAnnotation(id: self.id,
            lineString: (self.lineString).unwrap(),
            isSelected: self.isSelected,
            isDraggable: self.isDraggable)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout PolylineAnnotation) {
        dest.lineString = self.lineString.unwrap()
        dest.isSelected = self.isSelected
        dest.isDraggable = self.isDraggable
        dest.lineJoin = self.lineJoin?.unwrap()
        dest.lineSortKey = self.lineSortKey?.double()
        dest.lineBlur = self.lineBlur?.double()
        dest.lineBorderColor = self.lineBorderColor?.styleColor()
        dest.lineBorderWidth = self.lineBorderWidth?.double()
        dest.lineColor = self.lineColor?.styleColor()
        dest.lineGapWidth = self.lineGapWidth?.double()
        dest.lineOffset = self.lineOffset?.double()
        dest.lineOpacity = self.lineOpacity?.double()
        dest.linePattern = self.linePattern
        dest.lineWidth = self.lineWidth?.double()
    }
}
extension PolylineAnnotation {
    func wrap() -> TMBPolylineAnnotation {
        var result = TMBPolylineAnnotation(id: self.id,
          lineString: (self.lineString).wrap(),
          isSelected: self.isSelected,
          isDraggable: self.isDraggable)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBPolylineAnnotation)  {
        dest.lineString = self.lineString.wrap()
        dest.isSelected = self.isSelected
        dest.isDraggable = self.isDraggable
        dest.lineJoin = self.lineJoin?.wrap()
        dest.lineSortKey = self.lineSortKey?.double()
        dest.lineBlur = self.lineBlur?.double()
        dest.lineBorderColor = self.lineBorderColor?.wrap()
        dest.lineBorderWidth = self.lineBorderWidth?.double()
        dest.lineColor = self.lineColor?.wrap()
        dest.lineGapWidth = self.lineGapWidth?.double()
        dest.lineOffset = self.lineOffset?.double()
        dest.lineOpacity = self.lineOpacity?.double()
        dest.linePattern = self.linePattern
        dest.lineWidth = self.lineWidth?.double()
    }
}
