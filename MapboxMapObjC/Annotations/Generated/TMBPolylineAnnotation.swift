import MapboxMaps

@objc
open class TMBPolylineAnnotation : NSObject, TMBAnnotation {
    @objc
    public var id: String {
        return swiftValue.id
    }
    
    @objc
    public var geometryInJSON: String {
        return try! swiftValue.lineString.toString()
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
    
    public var swiftValue: PolylineAnnotation
    
    public init(swiftValue: PolylineAnnotation) {
        self.swiftValue = swiftValue
    }
    
    @objc
    public class func from(
        id: String = UUID().uuidString,
        coordinates: [LocationCoordinate2D],
        isSelected: Bool = false,
        isDraggable: Bool = false) -> TMBPolylineAnnotation {
        let swiftValue = PolylineAnnotation(
            id: id,
            lineCoordinates: coordinates,
            isSelected: isSelected,
            isDraggable: isDraggable)
        return TMBPolylineAnnotation(swiftValue: swiftValue)
    }
    
    // MARK: - Style Properties -

    /// The display of lines when joining.
    @objc
    public var lineJoin: NSNumber? {
        get {
            return self.swiftValue.lineJoin?.asNumber()
        }
        set {
            self.swiftValue.lineJoin = newValue?.LineJoin
        }
    }

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc
    public var lineSortKey: NSNumber? {
        get {
            guard let lineSortKey = self.swiftValue.lineSortKey else {
                return nil
            }
            return NSNumber(value: lineSortKey)
        }
        set {
            // Double?
            self.swiftValue.lineSortKey = newValue?.doubleValue
        }
    }

    /// Blur applied to the line, in pixels.
    @objc
    public var lineBlur: NSNumber? {
        get {
            guard let lineBlur = self.swiftValue.lineBlur else {
                return nil
            }
            return NSNumber(value: lineBlur)
        }
        set {
            // Double?
            self.swiftValue.lineBlur = newValue?.doubleValue
        }
    }

    /// The color with which the line will be drawn.
    @objc
    public var lineColor: UIColor? {
        get {
            return self.swiftValue.lineColor?.objcValue()
        }
        set {
            guard let lineColor = newValue else {
                self.swiftValue.lineColor = nil
                return;
            }
            
            self.swiftValue.lineColor = StyleColor(lineColor)
        }
    }

    /// Draws a line casing outside of a line's actual path. Value indicates the width of the inner gap.
    @objc
    public var lineGapWidth: NSNumber? {
        get {
            guard let lineGapWidth = self.swiftValue.lineGapWidth else {
                return nil
            }
            return NSNumber(value: lineGapWidth)
        }
        set {
            // Double?
            self.swiftValue.lineGapWidth = newValue?.doubleValue
        }
    }

    /// The line's offset. For linear features, a positive value offsets the line to the right, relative to the direction of the line, and a negative value to the left. For polygon features, a positive value results in an inset, and a negative value results in an outset.
    @objc
    public var lineOffset: NSNumber? {
        get {
            guard let lineOffset = self.swiftValue.lineOffset else {
                return nil
            }
            return NSNumber(value: lineOffset)
        }
        set {
            // Double?
            self.swiftValue.lineOffset = newValue?.doubleValue
        }
    }

    /// The opacity at which the line will be drawn.
    @objc
    public var lineOpacity: NSNumber? {
        get {
            guard let lineOpacity = self.swiftValue.lineOpacity else {
                return nil
            }
            return NSNumber(value: lineOpacity)
        }
        set {
            // Double?
            self.swiftValue.lineOpacity = newValue?.doubleValue
        }
    }

    /// Name of image in sprite to use for drawing image lines. For seamless patterns, image width must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc
    public var linePattern: String? {
        get {
            return self.swiftValue.linePattern
        }
        set {
            self.swiftValue.linePattern = newValue
        }
    }

    /// Stroke thickness.
    @objc
    public var lineWidth: NSNumber? {
        get {
            guard let lineWidth = self.swiftValue.lineWidth else {
                return nil
            }
            return NSNumber(value: lineWidth)
        }
        set {
            // Double?
            self.swiftValue.lineWidth = newValue?.doubleValue
        }
    }
}

