// This file is generated.
import UIKit
import MapboxMaps


@objc open class TMBPointAnnotation: NSObject, TMBAnnotation {

    /// Identifier for this annotation
    @objc public var  id: String
    

    /// The geometry backing this annotation
    @objc public var  geometry: MapboxCommon.Geometry {
        point.geometry()
    }

    /// The point backing this annotation
    @objc public var  point: TMBPoint

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

    /// Create a point annotation with a `Point` and an optional identifier.
    
    @objc public init(id : String , point : TMBPoint, isSelected : Bool , isDraggable : Bool ) {
        self.id = id
        self.point = point
        self.isSelected = isSelected
        self.isDraggable = isDraggable

    }

    /// Create a point annotation with a coordinate and an optional identifier
    /// - Parameters:
    ///   - id: Optional identifier for this annotation
    ///   - coordinate: Coordinate where this annotation should be rendered
    
    @objc public init(id : String , coordinate : CLLocationCoordinate2D, isSelected : Bool , isDraggable : Bool ) {
        self.id = id
        self.point = TMBPoint(coordinate)
        self.isSelected = isSelected
        self.isDraggable = isDraggable

    }

    // MARK: - Style Properties -

    /// Part of the icon placed closest to the anchor.
    @objc public var  iconAnchor: TMBIconAnchor?

    /// Name of image in sprite to use for drawing an image background.
    @objc public var  iconImage: String?

    /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
    @objc public var  iconOffset: [Double]?

    /// Rotates the icon clockwise.
    @objc public var  iconRotate: NSNumber?

    /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
    @objc public var  iconSize: NSNumber?

    /// Scales the icon to fit around the associated text.
    @objc public var  iconTextFit: TMBIconTextFit?

    /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
    @objc public var  iconTextFitPadding: [Double]?

    /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first. When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
    @objc public var  symbolSortKey: NSNumber?

    /// Part of the text placed closest to the anchor.
    @objc public var  textAnchor: TMBTextAnchor?

    /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
    @objc public var  textField: String?

    /// Text justification options.
    @objc public var  textJustify: TMBTextJustify?

    /// Text tracking amount.
    @objc public var  textLetterSpacing: NSNumber?

    /// Text leading value for multi-line text.
    @objc public var  textLineHeight: NSNumber?

    /// The maximum line width for text wrapping.
    @objc public var  textMaxWidth: NSNumber?

    /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
    @objc public var  textOffset: [Double]?

    /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
    @objc public var  textRadialOffset: NSNumber?

    /// Rotates the text clockwise.
    @objc public var  textRotate: NSNumber?

    /// Font size.
    @objc public var  textSize: NSNumber?

    /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
    @objc public var  textTransform: TMBTextTransform?

    /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc public var  iconColor: UIColor?

    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var  iconEmissiveStrength: NSNumber?

    /// Fade out the halo towards the outside.
    @objc public var  iconHaloBlur: NSNumber?

    /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc public var  iconHaloColor: UIColor?

    /// Distance of halo to the icon outline.
    @objc public var  iconHaloWidth: NSNumber?

    /// Controls the transition progress between the image variants of icon-image. Zero means the first variant is used, one is the second, and in between they are blended together.
    @objc public var  iconImageCrossFade: NSNumber?

    /// The opacity at which the icon will be drawn.
    @objc public var  iconOpacity: NSNumber?

    /// The color with which the text will be drawn.
    @objc public var  textColor: UIColor?

    /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
    @objc public var  textEmissiveStrength: NSNumber?

    /// The halo's fadeout distance towards the outside.
    @objc public var  textHaloBlur: NSNumber?

    /// The color of the text's halo, which helps it stand out from backgrounds.
    @objc public var  textHaloColor: UIColor?

    /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
    @objc public var  textHaloWidth: NSNumber?

    /// The opacity at which the text will be drawn.
    @objc public var  textOpacity: NSNumber?
    
    // MARK: - Image Convenience -

    @objc public var image: TMBPointAnnotationImage? {
        didSet {
            self.iconImage = image?.name
        }
    }
}
extension TMBPointAnnotation {
    func unwrap() -> PointAnnotation {
        var result = PointAnnotation(id: self.id,
            point: (self.point).unwrap(),
            isSelected: self.isSelected,
            isDraggable: self.isDraggable)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout PointAnnotation) {
        dest.point = self.point.unwrap()
        dest.isSelected = self.isSelected
        dest.isDraggable = self.isDraggable
        dest.iconAnchor = self.iconAnchor?.unwrap()
        dest.iconImage = self.iconImage
        dest.iconOffset = self.iconOffset?.map { $0 }
        dest.iconRotate = self.iconRotate?.double()
        dest.iconSize = self.iconSize?.double()
        dest.iconTextFit = self.iconTextFit?.unwrap()
        dest.iconTextFitPadding = self.iconTextFitPadding?.map { $0 }
        dest.symbolSortKey = self.symbolSortKey?.double()
        dest.textAnchor = self.textAnchor?.unwrap()
        dest.textField = self.textField
        dest.textJustify = self.textJustify?.unwrap()
        dest.textLetterSpacing = self.textLetterSpacing?.double()
        dest.textLineHeight = self.textLineHeight?.double()
        dest.textMaxWidth = self.textMaxWidth?.double()
        dest.textOffset = self.textOffset?.map { $0 }
        dest.textRadialOffset = self.textRadialOffset?.double()
        dest.textRotate = self.textRotate?.double()
        dest.textSize = self.textSize?.double()
        dest.textTransform = self.textTransform?.unwrap()
        dest.iconColor = self.iconColor?.styleColor()
        dest.iconEmissiveStrength = self.iconEmissiveStrength?.double()
        dest.iconHaloBlur = self.iconHaloBlur?.double()
        dest.iconHaloColor = self.iconHaloColor?.styleColor()
        dest.iconHaloWidth = self.iconHaloWidth?.double()
        dest.iconImageCrossFade = self.iconImageCrossFade?.double()
        dest.iconOpacity = self.iconOpacity?.double()
        dest.textColor = self.textColor?.styleColor()
        dest.textEmissiveStrength = self.textEmissiveStrength?.double()
        dest.textHaloBlur = self.textHaloBlur?.double()
        dest.textHaloColor = self.textHaloColor?.styleColor()
        dest.textHaloWidth = self.textHaloWidth?.double()
        dest.textOpacity = self.textOpacity?.double()
        
        if let image = self.image {
            dest.image = image.unwrap()
        }
    }
}
extension PointAnnotation {
    func wrap() -> TMBPointAnnotation {
        var result = TMBPointAnnotation(id: self.id,
          point: (self.point).wrap(),
          isSelected: self.isSelected,
          isDraggable: self.isDraggable)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBPointAnnotation)  {
        dest.point = self.point.wrap()
        dest.isSelected = self.isSelected
        dest.isDraggable = self.isDraggable
        dest.iconAnchor = self.iconAnchor?.wrap()
        dest.iconImage = self.iconImage
        dest.iconOffset = self.iconOffset?.map { $0 }
        dest.iconRotate = self.iconRotate?.double()
        dest.iconSize = self.iconSize?.double()
        dest.iconTextFit = self.iconTextFit?.wrap()
        dest.iconTextFitPadding = self.iconTextFitPadding?.map { $0 }
        dest.symbolSortKey = self.symbolSortKey?.double()
        dest.textAnchor = self.textAnchor?.wrap()
        dest.textField = self.textField
        dest.textJustify = self.textJustify?.wrap()
        dest.textLetterSpacing = self.textLetterSpacing?.double()
        dest.textLineHeight = self.textLineHeight?.double()
        dest.textMaxWidth = self.textMaxWidth?.double()
        dest.textOffset = self.textOffset?.map { $0 }
        dest.textRadialOffset = self.textRadialOffset?.double()
        dest.textRotate = self.textRotate?.double()
        dest.textSize = self.textSize?.double()
        dest.textTransform = self.textTransform?.wrap()
        dest.iconColor = self.iconColor?.wrap()
        dest.iconEmissiveStrength = self.iconEmissiveStrength?.double()
        dest.iconHaloBlur = self.iconHaloBlur?.double()
        dest.iconHaloColor = self.iconHaloColor?.wrap()
        dest.iconHaloWidth = self.iconHaloWidth?.double()
        dest.iconImageCrossFade = self.iconImageCrossFade?.double()
        dest.iconOpacity = self.iconOpacity?.double()
        dest.textColor = self.textColor?.wrap()
        dest.textEmissiveStrength = self.textEmissiveStrength?.double()
        dest.textHaloBlur = self.textHaloBlur?.double()
        dest.textHaloColor = self.textHaloColor?.wrap()
        dest.textHaloWidth = self.textHaloWidth?.double()
        dest.textOpacity = self.textOpacity?.double()
        
        if let image = self.image {
            dest.image = image.wrap()
        }
    }
}
