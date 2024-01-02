import MapboxMaps

@objc
open class TMBPointAnnotation : NSObject, TMBAnnotation {
    @objc
    public var id: String {
        return swiftValue.id
    }
    
    @objc
    public var geometryInJSON: String {
        return try! swiftValue.point.toString()
    }

    @objc
    public var userInfo: [String : Any]? {
        return swiftValue.userInfo
    }
    
    @objc
    public var isSelected: Bool {
        set {
            swiftValue.isSelected = newValue
        }
        get {
            swiftValue.isSelected
        }
    }
    
    @objc
    public var isDraggable: Bool {
        set {
            swiftValue.isDraggable = newValue
        }
        get {
            return swiftValue.isDraggable
        }
    }
    
    @objc
    public func image(_ image: UIImage, name: String) {
        swiftValue.image = PointAnnotation.Image(image: image, name: name)
    }
    
    public var swiftValue: PointAnnotation
    
    public init(swiftValue: PointAnnotation) {
        self.swiftValue = swiftValue
        super.init()
    }
    
    @objc
    public class func from(coordinate: LocationCoordinate2D) -> TMBPointAnnotation {
        let swiftValue = PointAnnotation(point: Point(coordinate))
        return TMBPointAnnotation(swiftValue: swiftValue)
    }
    
    // MARK: - Style Properties -

    /// Part of the icon placed closest to the anchor.
    @objc
    public var iconAnchor: NSNumber? {
        get {
            return swiftValue.iconAnchor?.asNumber()
        }
        set {
            swiftValue.iconAnchor = newValue?.IconAnchor
        }
    }

    /// Name of image in sprite to use for drawing an image background.
    @objc
    public var iconImage: String? {
        get {
            return self.swiftValue.iconImage
        }
        set {
            self.swiftValue.iconImage = newValue
        }
    }

    /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
    @objc
    public var iconOffset: [Double]? {
        get {
            return self.swiftValue.iconOffset
        }
        set {
            self.swiftValue.iconOffset = newValue
        }
    }

    /// Rotates the icon clockwise.
    @objc
    public var iconRotate: NSNumber? {
        get {
            // Double?
            guard let iconRotate = self.swiftValue.iconRotate else {
                return nil
            }
            return NSNumber(value: iconRotate)
        }
        set {
            self.swiftValue.iconRotate = newValue?.doubleValue
        }
    }

    /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
    @objc
    public var iconSize: NSNumber? {
        get {
            // Double?
            guard let iconSize = self.swiftValue.iconSize else {
                return nil
            }
            return NSNumber(value: iconSize)
        }
        set {
            self.swiftValue.iconSize = newValue?.doubleValue
        }
    }

    /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first.  When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
    @objc
    public var symbolSortKey: NSNumber? {
        get {
            // Double?
            guard let symbolSortKey = self.swiftValue.symbolSortKey else {
                return nil
            }
            return NSNumber(value: symbolSortKey)
        }
        set {
            self.swiftValue.symbolSortKey = newValue?.doubleValue
        }
    }

    /// Part of the text placed closest to the anchor.
    @objc
    public var textAnchor: NSNumber? {
        get {
            return swiftValue.textAnchor?.asNumber()
        }
        set {
            swiftValue.textAnchor = newValue?.TextAnchor
        }
    }

    /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
    @objc
    public var textField: String? {
        get {
            return self.swiftValue.textField
        }
        set {
            self.swiftValue.textField = newValue
        }
    }

    /// Text justification options.
    @objc
    public var textJustify: NSNumber? {
        get {
            return swiftValue.textJustify?.asNumber()
        }
        set {
            swiftValue.textJustify = newValue?.TextJustify
        }
    }

    /// Text tracking amount.
    @objc
    public var textLetterSpacing: NSNumber? {
        get {
            // Double?
            guard let textLetterSpacing = self.swiftValue.textLetterSpacing else {
                return nil
            }
            return NSNumber(value: textLetterSpacing)
        }
        set {
            self.swiftValue.textLetterSpacing = newValue?.doubleValue
        }
    }

    /// Text leading value for multi-line text.
    @objc
    public var textLineHeight: NSNumber? {
        get {
            // Double?
            guard let textLineHeight = self.swiftValue.textLineHeight else {
                return nil
            }
            return NSNumber(value: textLineHeight)
        }
        set {
            self.swiftValue.textLineHeight = newValue?.doubleValue
        }
    }

    /// The maximum line width for text wrapping.
    @objc
    public var textMaxWidth: NSNumber? {
        get {
            // Double?
            guard let textMaxWidth = self.swiftValue.textMaxWidth else {
                return nil
            }
            return NSNumber(value: textMaxWidth)
        }
        set {
            self.swiftValue.textMaxWidth = newValue?.doubleValue
        }
    }

    /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
    @objc
    public var textOffset: [Double]? {
        get {
            return self.swiftValue.textOffset
        }
        set {
            self.swiftValue.textOffset = newValue
        }
    }

    /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
    @objc
    public var textRadialOffset: NSNumber? {
        get {
            // Double?
            guard let textRadialOffset = self.swiftValue.textRadialOffset else {
                return nil
            }
            return NSNumber(value: textRadialOffset)
        }
        set {
            self.swiftValue.textRadialOffset = newValue?.doubleValue
        }
    }

    /// Rotates the text clockwise.
    @objc
    public var textRotate: NSNumber? {
        get {
            // Double?
            guard let textRotate = self.swiftValue.textRotate else {
                return nil
            }
            return NSNumber(value: textRotate)
        }
        set {
            self.swiftValue.textRotate = newValue?.doubleValue
        }
    }

    /// Font size.
    @objc
    public var textSize: NSNumber? {
        get {
            // Double?
            guard let textSize = self.swiftValue.textSize else {
                return nil
            }
            return NSNumber(value: textSize)
        }
        set {
            self.swiftValue.textSize = newValue?.doubleValue
        }
    }

    /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
    @objc
    public var textTransform: NSNumber? {
        get {
            return swiftValue.textTransform?.asNumber()
        }
        set {
            swiftValue.textTransform = newValue?.TextTransform
        }
    }

    /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc
    public var iconColor: UIColor? {
        get {
            guard let iconColor = self.swiftValue.iconColor else {
                return nil
            }
            return UIColor(
                red: iconColor.red,
                green: iconColor.green,
                blue: iconColor.blue,
                alpha: iconColor.alpha)
        }
        set {
            guard let iconColor = newValue else {
                self.swiftValue.iconColor = nil
                return
            }
            
            self.swiftValue.iconColor = StyleColor(iconColor)
        }
    }

    /// Fade out the halo towards the outside.
    @objc
    public var iconHaloBlur: NSNumber? {
        get {
            // Double?
            guard let iconHaloBlur = self.swiftValue.iconHaloBlur else {
                return nil
            }
            return NSNumber(value: iconHaloBlur)
        }
        set {
            self.swiftValue.iconHaloBlur = newValue?.doubleValue
        }
    }

    /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc
    public var iconHaloColor: UIColor? {
        get {
            guard let iconHaloColor = self.swiftValue.iconHaloColor else {
                return nil
            }
            return UIColor(
                red: iconHaloColor.red,
                green: iconHaloColor.green,
                blue: iconHaloColor.blue,
                alpha: iconHaloColor.alpha)
        }
        set {
            guard let iconHaloColor = newValue else {
                self.swiftValue.iconHaloColor = nil
                return
            }
            
            self.swiftValue.iconHaloColor = StyleColor(iconHaloColor)
        }
    }

    /// Distance of halo to the icon outline.
    @objc
    public var iconHaloWidth: NSNumber? {
        get {
            // Double?
            guard let iconHaloWidth = self.swiftValue.iconHaloWidth else {
                return nil
            }
            return NSNumber(value: iconHaloWidth)
        }
        set {
            self.swiftValue.iconHaloWidth = newValue?.doubleValue
        }
    }

    /// The opacity at which the icon will be drawn.
    @objc
    public var iconOpacity: NSNumber? {
        get {
            // Double?
            guard let iconOpacity = self.swiftValue.iconOpacity else {
                return nil
            }
            return NSNumber(value: iconOpacity)
        }
        set {
            self.swiftValue.iconOpacity = newValue?.doubleValue
        }
    }

    /// The color with which the text will be drawn.
    @objc
    public var textColor: UIColor? {
        get {
            guard let textColor = self.swiftValue.textColor else {
                return nil
            }
            return UIColor(
                red: textColor.red,
                green: textColor.green,
                blue: textColor.blue,
                alpha: textColor.alpha)
        }
        set {
            guard let textColor = newValue else {
                self.swiftValue.textColor = nil
                return
            }
            
            self.swiftValue.textColor = StyleColor(textColor)
        }
    }

    /// The halo's fadeout distance towards the outside.
    @objc
    public var textHaloBlur: NSNumber? {
        get {
            // Double?
            guard let textHaloBlur = self.swiftValue.textHaloBlur else {
                return nil
            }
            return NSNumber(value: textHaloBlur)
        }
        set {
            self.swiftValue.textHaloBlur = newValue?.doubleValue
        }
    }

    /// The color of the text's halo, which helps it stand out from backgrounds.
    @objc
    public var textHaloColor: UIColor? {
        get {
            guard let textHaloColor = self.swiftValue.textHaloColor else {
                return nil
            }
            return UIColor(
                red: textHaloColor.red,
                green: textHaloColor.green,
                blue: textHaloColor.blue,
                alpha: textHaloColor.alpha)
        }
        set {
            guard let textHaloColor = newValue else {
                self.swiftValue.textHaloColor = nil
                return
            }
            
            self.swiftValue.textHaloColor = StyleColor(textHaloColor)
        }
    }

    /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
    @objc
    public var textHaloWidth: NSNumber? {
        get {
            // Double?
            guard let textHaloWidth = self.swiftValue.textHaloWidth else {
                return nil
            }
            return NSNumber(value: textHaloWidth)
        }
        set {
            self.swiftValue.textHaloWidth = newValue?.doubleValue
        }
    }

    /// The opacity at which the text will be drawn.
    @objc
    public var textOpacity: NSNumber? {
        get {
            // Double?
            guard let textOpacity = self.swiftValue.textOpacity else {
                return nil
            }
            return NSNumber(value: textOpacity)
        }
        set {
            self.swiftValue.textOpacity = newValue?.doubleValue
        }
    }
}
