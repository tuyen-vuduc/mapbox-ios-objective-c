// This file is generated.
import MapboxMaps

extension Visibility {
    func objcValue() -> TMBVisibility {
        TMBVisibility(value: self)
    }
}
@objc
open class TMBVisibility :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: Visibility) {
        self.value = value.rawValue
    }
    func swiftValue() -> Visibility{
        Visibility(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The layer is shown.
    @objc
    public static let visible:TMBVisibility = TMBVisibility(value: .visible)

    /// The layer is not shown.
    @objc
    public static let none:TMBVisibility = TMBVisibility(value: .none)
}

// MARK: LINE_CAP

/// The display of line endings.
extension LineCap {
    func objcValue() -> TMBLineCap {
        TMBLineCap(value: self)
    }
}
@objc
open class TMBLineCap :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: LineCap) {
        self.value = value.rawValue
    }
    func swiftValue() -> LineCap{
        LineCap(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// A cap with a squared-off end which is drawn to the exact endpoint of the line.
    @objc
    public static let butt:TMBLineCap = TMBLineCap(value: .butt)

    /// A cap with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
    @objc
    public static let round:TMBLineCap = TMBLineCap(value: .round)

    /// A cap with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
    @objc
    public static let square:TMBLineCap = TMBLineCap(value: .square)

}

// MARK: LINE_JOIN

/// The display of lines when joining.
extension LineJoin {
    func objcValue() -> TMBLineJoin {
        TMBLineJoin(value: self)
    }
}
@objc
open class TMBLineJoin :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: LineJoin) {
        self.value = value.rawValue
    }
    func swiftValue() -> LineJoin{
        LineJoin(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// A join with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
    @objc
    public static let bevel:TMBLineJoin = TMBLineJoin(value: .bevel)

    /// A join with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
    @objc
    public static let round:TMBLineJoin = TMBLineJoin(value: .round)

    /// A join with a sharp, angled corner which is drawn with the outer sides beyond the endpoint of the path until they meet.
    @objc
    public static let miter:TMBLineJoin = TMBLineJoin(value: .miter)

}

// MARK: ICON_ANCHOR

/// Part of the icon placed closest to the anchor.
extension IconAnchor {
    func objcValue() -> TMBIconAnchor {
        TMBIconAnchor(value: self)
    }
}
@objc
open class TMBIconAnchor :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: IconAnchor) {
        self.value = value.rawValue
    }
    func swiftValue() -> IconAnchor{
        IconAnchor(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The center of the icon is placed closest to the anchor.
    @objc
    public static let center:TMBIconAnchor = TMBIconAnchor(value: .center)

    /// The left side of the icon is placed closest to the anchor.
    @objc
    public static let left:TMBIconAnchor = TMBIconAnchor(value: .left)

    /// The right side of the icon is placed closest to the anchor.
    @objc
    public static let right:TMBIconAnchor = TMBIconAnchor(value: .right)

    /// The top of the icon is placed closest to the anchor.
    @objc
    public static let top:TMBIconAnchor = TMBIconAnchor(value: .top)

    /// The bottom of the icon is placed closest to the anchor.
    @objc
    public static let bottom:TMBIconAnchor = TMBIconAnchor(value: .bottom)

    /// The top left corner of the icon is placed closest to the anchor.
    @objc
    public static let topLeft:TMBIconAnchor = TMBIconAnchor(value: .topLeft)

    /// The top right corner of the icon is placed closest to the anchor.
    @objc
    public static let topRight:TMBIconAnchor = TMBIconAnchor(value: .topRight)

    /// The bottom left corner of the icon is placed closest to the anchor.
    @objc
    public static let bottomLeft:TMBIconAnchor = TMBIconAnchor(value: .bottomLeft)

    /// The bottom right corner of the icon is placed closest to the anchor.
    @objc
    public static let bottomRight:TMBIconAnchor = TMBIconAnchor(value: .bottomRight)

}

// MARK: ICON_PITCH_ALIGNMENT

/// Orientation of icon when map is pitched.
extension IconPitchAlignment {
    func objcValue() -> TMBIconPitchAlignment {
        TMBIconPitchAlignment(value: self)
    }
}
@objc
open class TMBIconPitchAlignment :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: IconPitchAlignment) {
        self.value = value.rawValue
    }
    func swiftValue() -> IconPitchAlignment{
        IconPitchAlignment(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The icon is aligned to the plane of the map.
    @objc
    public static let map:TMBIconPitchAlignment = TMBIconPitchAlignment(value: .map)

    /// The icon is aligned to the plane of the viewport.
    @objc
    public static let viewport:TMBIconPitchAlignment = TMBIconPitchAlignment(value: .viewport)

    /// Automatically matches the value of {@link ICON_ROTATION_ALIGNMENT}.
    @objc
    public static let auto:TMBIconPitchAlignment = TMBIconPitchAlignment(value: .auto)

}

// MARK: ICON_ROTATION_ALIGNMENT

/// In combination with `symbol-placement`, determines the rotation behavior of icons.
extension IconRotationAlignment {
    func objcValue() -> TMBIconRotationAlignment {
        TMBIconRotationAlignment(value: self)
    }
}
@objc
open class TMBIconRotationAlignment :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: IconRotationAlignment) {
        self.value = value.rawValue
    }
    func swiftValue() -> IconRotationAlignment{
        IconRotationAlignment(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, aligns icons east-west. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, aligns icon x-axes with the line.
    @objc
    public static let map:TMBIconRotationAlignment = TMBIconRotationAlignment(value: .map)

    /// Produces icons whose x-axes are aligned with the x-axis of the viewport, regardless of the value of {@link SYMBOL_PLACEMENT}.
    @objc
    public static let viewport:TMBIconRotationAlignment = TMBIconRotationAlignment(value: .viewport)

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, this is equivalent to {@link Property#ICON_ROTATION_ALIGNMENT_VIEWPORT}. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, this is equivalent to {@link Property#ICON_ROTATION_ALIGNMENT_MAP}.
    @objc
    public static let auto:TMBIconRotationAlignment = TMBIconRotationAlignment(value: .auto)

}

// MARK: ICON_TEXT_FIT

/// Scales the icon to fit around the associated text.
extension IconTextFit {
    func objcValue() -> TMBIconTextFit {
        TMBIconTextFit(value: self)
    }
}
@objc
open class TMBIconTextFit :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: IconTextFit) {
        self.value = value.rawValue
    }
    func swiftValue() -> IconTextFit{
        IconTextFit(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The icon is displayed at its intrinsic aspect ratio.
    @objc
    public static let none:TMBIconTextFit = TMBIconTextFit(value: .none)

    /// The icon is scaled in the x-dimension to fit the width of the text.
    @objc
    public static let width:TMBIconTextFit = TMBIconTextFit(value: .width)

    /// The icon is scaled in the y-dimension to fit the height of the text.
    @objc
    public static let height:TMBIconTextFit = TMBIconTextFit(value: .height)

    /// The icon is scaled in both x- and y-dimensions.
    @objc
    public static let both:TMBIconTextFit = TMBIconTextFit(value: .both)

}

// MARK: SYMBOL_PLACEMENT

/// Label placement relative to its geometry.
extension SymbolPlacement {
    func objcValue() -> TMBSymbolPlacement {
        TMBSymbolPlacement(value: self)
    }
}
@objc
open class TMBSymbolPlacement :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: SymbolPlacement) {
        self.value = value.rawValue
    }
    func swiftValue() -> SymbolPlacement{
        SymbolPlacement(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The label is placed at the point where the geometry is located.
    @objc
    public static let point:TMBSymbolPlacement = TMBSymbolPlacement(value: .point)

    /// The label is placed along the line of the geometry. Can only be used on LineString and Polygon geometries.
    @objc
    public static let line:TMBSymbolPlacement = TMBSymbolPlacement(value: .line)

    /// The label is placed at the center of the line of the geometry. Can only be used on LineString and Polygon geometries. Note that a single feature in a vector tile may contain multiple line geometries.
    @objc
    public static let lineCenter:TMBSymbolPlacement = TMBSymbolPlacement(value: .lineCenter)

}

// MARK: SYMBOL_Z_ORDER

/// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
extension SymbolZOrder {
    func objcValue() -> TMBSymbolZOrder {
        TMBSymbolZOrder(value: self)
    }
}
@objc
open class TMBSymbolZOrder :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: SymbolZOrder) {
        self.value = value.rawValue
    }
    func swiftValue() -> SymbolZOrder{
        SymbolZOrder(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// Sorts symbols by symbol sort key if set. Otherwise, sorts symbols by their y-position relative to the viewport if {@link ICON_ALLOW_OVERLAP} or {@link TEXT_ALLOW_OVERLAP} is set to {@link TRUE} or {@link ICON_IGNORE_PLACEMENT} or {@link TEXT_IGNORE_PLACEMENT} is {@link FALSE}.
    @objc
    public static let auto:TMBSymbolZOrder = TMBSymbolZOrder(value: .auto)

    /// Sorts symbols by their y-position relative to the viewport if {@link ICON_ALLOW_OVERLAP} or {@link TEXT_ALLOW_OVERLAP} is set to {@link TRUE} or {@link ICON_IGNORE_PLACEMENT} or {@link TEXT_IGNORE_PLACEMENT} is {@link FALSE}.
    @objc
    public static let viewportY:TMBSymbolZOrder = TMBSymbolZOrder(value: .viewportY)

    /// Sorts symbols by symbol sort key if set. Otherwise, no sorting is applied; symbols are rendered in the same order as the source data.
    @objc
    public static let source:TMBSymbolZOrder = TMBSymbolZOrder(value: .source)

}

// MARK: TEXT_ANCHOR

/// Part of the text placed closest to the anchor.
extension TextAnchor {
    func objcValue() -> TMBTextAnchor {
        TMBTextAnchor(value: self)
    }
}
@objc
open class TMBTextAnchor :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: TextAnchor) {
        self.value = value.rawValue
    }
    func swiftValue() -> TextAnchor{
        TextAnchor(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The center of the text is placed closest to the anchor.
    @objc
    public static let center:TMBTextAnchor = TMBTextAnchor(value: .center)

    /// The left side of the text is placed closest to the anchor.
    @objc
    public static let left:TMBTextAnchor = TMBTextAnchor(value: .left)

    /// The right side of the text is placed closest to the anchor.
    @objc
    public static let right:TMBTextAnchor = TMBTextAnchor(value: .right)

    /// The top of the text is placed closest to the anchor.
    @objc
    public static let top:TMBTextAnchor = TMBTextAnchor(value: .top)

    /// The bottom of the text is placed closest to the anchor.
    @objc
    public static let bottom:TMBTextAnchor = TMBTextAnchor(value: .bottom)

    /// The top left corner of the text is placed closest to the anchor.
    @objc
    public static let topLeft:TMBTextAnchor = TMBTextAnchor(value: .topLeft)

    /// The top right corner of the text is placed closest to the anchor.
    @objc
    public static let topRight:TMBTextAnchor = TMBTextAnchor(value: .topRight)

    /// The bottom left corner of the text is placed closest to the anchor.
    @objc
    public static let bottomLeft:TMBTextAnchor = TMBTextAnchor(value: .bottomLeft)

    /// The bottom right corner of the text is placed closest to the anchor.
    @objc
    public static let bottomRight:TMBTextAnchor = TMBTextAnchor(value: .bottomRight)

}

// MARK: TEXT_JUSTIFY

/// Text justification options.
extension TextJustify {
    func objcValue() -> TMBTextJustify {
        TMBTextJustify(value: self)
    }
}
@objc
open class TMBTextJustify :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: TextJustify) {
        self.value = value.rawValue
    }
    func swiftValue() -> TextJustify{
        TextJustify(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The text is aligned towards the anchor position.
    @objc
    public static let auto:TMBTextJustify = TMBTextJustify(value: .auto)

    /// The text is aligned to the left.
    @objc
    public static let left:TMBTextJustify = TMBTextJustify(value: .left)

    /// The text is centered.
    @objc
    public static let center:TMBTextJustify = TMBTextJustify(value: .center)

    /// The text is aligned to the right.
    @objc
    public static let right:TMBTextJustify = TMBTextJustify(value: .right)

}

// MARK: TEXT_PITCH_ALIGNMENT

/// Orientation of text when map is pitched.
extension TextPitchAlignment {
    func objcValue() -> TMBTextPitchAlignment {
        TMBTextPitchAlignment(value: self)
    }
}
@objc
open class TMBTextPitchAlignment :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: TextPitchAlignment) {
        self.value = value.rawValue
    }
    func swiftValue() -> TextPitchAlignment{
        TextPitchAlignment(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The text is aligned to the plane of the map.
    @objc
    public static let map:TMBTextPitchAlignment = TMBTextPitchAlignment(value: .map)

    /// The text is aligned to the plane of the viewport.
    @objc
    public static let viewport:TMBTextPitchAlignment = TMBTextPitchAlignment(value: .viewport)

    /// Automatically matches the value of {@link TEXT_ROTATION_ALIGNMENT}.
    @objc
    public static let auto:TMBTextPitchAlignment = TMBTextPitchAlignment(value: .auto)

}

// MARK: TEXT_ROTATION_ALIGNMENT

/// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
extension TextRotationAlignment {
    func objcValue() -> TMBTextRotationAlignment {
        TMBTextRotationAlignment(value: self)
    }
}
@objc
open class TMBTextRotationAlignment :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: TextRotationAlignment) {
        self.value = value.rawValue
    }
    func swiftValue() -> TextRotationAlignment{
        TextRotationAlignment(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, aligns text east-west. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, aligns text x-axes with the line.
    @objc
    public static let map:TMBTextRotationAlignment = TMBTextRotationAlignment(value: .map)

    /// Produces glyphs whose x-axes are aligned with the x-axis of the viewport, regardless of the value of {@link SYMBOL_PLACEMENT}.
    @objc
    public static let viewport:TMBTextRotationAlignment = TMBTextRotationAlignment(value: .viewport)

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, this is equivalent to {@link Property#TEXT_ROTATION_ALIGNMENT_VIEWPORT}. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, this is equivalent to {@link Property#TEXT_ROTATION_ALIGNMENT_MAP}.
    @objc
    public static let auto:TMBTextRotationAlignment = TMBTextRotationAlignment(value: .auto)

}

// MARK: TEXT_TRANSFORM

/// Specifies how to capitalize text, similar to the CSS `text-transform` property.
extension TextTransform {
    func objcValue() -> TMBTextTransform {
        TMBTextTransform(value: self)
    }
}
@objc
open class TMBTextTransform :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: TextTransform) {
        self.value = value.rawValue
    }
    func swiftValue() -> TextTransform{
        TextTransform(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The text is not altered.
    @objc
    public static let none:TMBTextTransform = TMBTextTransform(value: .none)

    /// Forces all letters to be displayed in uppercase.
    @objc
    public static let uppercase:TMBTextTransform = TMBTextTransform(value: .uppercase)

    /// Forces all letters to be displayed in lowercase.
    @objc
    public static let lowercase:TMBTextTransform = TMBTextTransform(value: .lowercase)

}

// MARK: FILL_TRANSLATE_ANCHOR

/// Controls the frame of reference for `fill-translate`.
extension FillTranslateAnchor {
    func objcValue() -> TMBFillTranslateAnchor {
        TMBFillTranslateAnchor(value: self)
    }
}
@objc
open class TMBFillTranslateAnchor :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: FillTranslateAnchor) {
        self.value = value.rawValue
    }
    func swiftValue() -> FillTranslateAnchor{
        FillTranslateAnchor(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The fill is translated relative to the map.
    @objc
    public static let map:TMBFillTranslateAnchor = TMBFillTranslateAnchor(value: .map)

    /// The fill is translated relative to the viewport.
    @objc
    public static let viewport:TMBFillTranslateAnchor = TMBFillTranslateAnchor(value: .viewport)

}

// MARK: LINE_TRANSLATE_ANCHOR

/// Controls the frame of reference for `line-translate`.
extension LineTranslateAnchor {
    func objcValue() -> TMBLineTranslateAnchor {
        TMBLineTranslateAnchor(value: self)
    }
}
@objc
open class TMBLineTranslateAnchor :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: LineTranslateAnchor) {
        self.value = value.rawValue
    }
    func swiftValue() -> LineTranslateAnchor{
        LineTranslateAnchor(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The line is translated relative to the map.
    @objc
    public static let map:TMBFillTranslateAnchor = TMBFillTranslateAnchor(value: .map)

    /// The line is translated relative to the viewport.
    @objc
    public static let viewport:TMBFillTranslateAnchor = TMBFillTranslateAnchor(value: .viewport)

}

// MARK: ICON_TRANSLATE_ANCHOR

/// Controls the frame of reference for `icon-translate`.
extension IconTranslateAnchor {
    func objcValue() -> TMBIconTranslateAnchor {
        TMBIconTranslateAnchor(value: self)
    }
}
@objc
open class TMBIconTranslateAnchor :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: IconTranslateAnchor) {
        self.value = value.rawValue
    }
    func swiftValue() -> IconTranslateAnchor{
        IconTranslateAnchor(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// Icons are translated relative to the map.
    @objc
    public static let map:TMBIconTranslateAnchor = TMBIconTranslateAnchor(value: .map)

    /// Icons are translated relative to the viewport.
    @objc
    public static let viewport:TMBIconTranslateAnchor = TMBIconTranslateAnchor(value: .viewport)

}

// MARK: TEXT_TRANSLATE_ANCHOR

/// Controls the frame of reference for `text-translate`.
extension TextTranslateAnchor {
    func objcValue() -> TMBTextTranslateAnchor {
        TMBTextTranslateAnchor(value: self)
    }
}
@objc
open class TMBTextTranslateAnchor :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: TextTranslateAnchor) {
        self.value = value.rawValue
    }
    func swiftValue() -> TextTranslateAnchor{
        TextTranslateAnchor(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The text is translated relative to the map.
    @objc
    public static let map:TMBTextTranslateAnchor = TMBTextTranslateAnchor(value: .map)

    /// The text is translated relative to the viewport.
    @objc
    public static let viewport:TMBTextTranslateAnchor = TMBTextTranslateAnchor(value: .viewport)

}

// MARK: CIRCLE_PITCH_ALIGNMENT

/// Orientation of circle when map is pitched.
extension CirclePitchAlignment {
    func objcValue() -> TMBCirclePitchAlignment {
        TMBCirclePitchAlignment(value: self)
    }
}
@objc
open class TMBCirclePitchAlignment :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: CirclePitchAlignment) {
        self.value = value.rawValue
    }
    func swiftValue() -> CirclePitchAlignment{
        CirclePitchAlignment(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The circle is aligned to the plane of the map.
    @objc
    public static let map:TMBCirclePitchAlignment = TMBCirclePitchAlignment(value: .map)

    /// The circle is aligned to the plane of the viewport.
    @objc
    public static let viewport:TMBCirclePitchAlignment = TMBCirclePitchAlignment(value: .viewport)

}

// MARK: CIRCLE_PITCH_SCALE

/// Controls the scaling behavior of the circle when the map is pitched.
extension CirclePitchScale {
    func objcValue() -> TMBCirclePitchScale {
        TMBCirclePitchScale(value: self)
    }
}
@objc
open class TMBCirclePitchScale :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: CirclePitchScale) {
        self.value = value.rawValue
    }
    func swiftValue() -> CirclePitchScale{
        CirclePitchScale(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// Circles are scaled according to their apparent distance to the camera.
    @objc
    public static let map:TMBCirclePitchScale = TMBCirclePitchScale(value: .map)

    /// Circles are not scaled.
    @objc
    public static let viewport:TMBCirclePitchScale = TMBCirclePitchScale(value: .viewport)

}

// MARK: CIRCLE_TRANSLATE_ANCHOR

/// Controls the frame of reference for `circle-translate`.
extension CircleTranslateAnchor {
    func objcValue() -> TMBCircleTranslateAnchor {
        TMBCircleTranslateAnchor(value: self)
    }
}
@objc
open class TMBCircleTranslateAnchor :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: CircleTranslateAnchor) {
        self.value = value.rawValue
    }
    func swiftValue() -> CircleTranslateAnchor{
        CircleTranslateAnchor(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The circle is translated relative to the map.
    @objc
    public static let map:TMBCircleTranslateAnchor = TMBCircleTranslateAnchor(value: .map)

    /// The circle is translated relative to the viewport.
    @objc
    public static let viewport:TMBCircleTranslateAnchor = TMBCircleTranslateAnchor(value: .viewport)

}

// MARK: FILL_EXTRUSION_TRANSLATE_ANCHOR

/// Controls the frame of reference for `fill-extrusion-translate`.
extension FillExtrusionTranslateAnchor {
    func objcValue() -> TMBFillExtrusionTranslateAnchor {
        TMBFillExtrusionTranslateAnchor(value: self)
    }
}
@objc
open class TMBFillExtrusionTranslateAnchor :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: FillExtrusionTranslateAnchor) {
        self.value = value.rawValue
    }
    func swiftValue() -> FillExtrusionTranslateAnchor{
        FillExtrusionTranslateAnchor(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The fill extrusion is translated relative to the map.
    @objc
    public static let map:TMBFillExtrusionTranslateAnchor = TMBFillExtrusionTranslateAnchor(value: .map)

    /// The fill extrusion is translated relative to the viewport.
    @objc
    public static let viewport:TMBFillExtrusionTranslateAnchor = TMBFillExtrusionTranslateAnchor(value: .viewport)

}

// MARK: RASTER_RESAMPLING

/// The resampling/interpolation method to use for overscaling, also known as texture magnification filter
extension RasterResampling {
    func objcValue() -> TMBRasterResampling {
        TMBRasterResampling(value: self)
    }
}
@objc
open class TMBRasterResampling :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: RasterResampling) {
        self.value = value.rawValue
    }
    func swiftValue() -> RasterResampling{
        RasterResampling(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// (Bi)linear filtering interpolates pixel values using the weighted average of the four closest original source pixels creating a smooth but blurry look when overscaled
    @objc
    public static let linear:TMBRasterResampling = TMBRasterResampling(value: .linear)

    /// Nearest neighbor filtering interpolates pixel values using the nearest original source pixel creating a sharp but pixelated look when overscaled
    @objc
    public static let nearest:TMBRasterResampling = TMBRasterResampling(value: .nearest)

}

// MARK: HILLSHADE_ILLUMINATION_ANCHOR

/// Direction of light source when map is rotated.
extension HillshadeIlluminationAnchor {
    func objcValue() -> TMBHillshadeIlluminationAnchor {
        TMBHillshadeIlluminationAnchor(value: self)
    }
}
@objc
open class TMBHillshadeIlluminationAnchor :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: HillshadeIlluminationAnchor) {
        self.value = value.rawValue
    }
    func swiftValue() -> HillshadeIlluminationAnchor{
        HillshadeIlluminationAnchor(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The hillshade illumination is relative to the north direction.
    @objc
    public static let map:TMBHillshadeIlluminationAnchor = TMBHillshadeIlluminationAnchor(value: .map)

    /// The hillshade illumination is relative to the top of the viewport.
    @objc
    public static let viewport:TMBHillshadeIlluminationAnchor = TMBHillshadeIlluminationAnchor(value: .viewport)

}

// MARK: SKY_TYPE

/// The type of the sky
extension SkyType {
    func objcValue() -> TMBSkyType {
        TMBSkyType(value: self)
    }
}
@objc
open class TMBSkyType :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: SkyType) {
        self.value = value.rawValue
    }
    func swiftValue() -> SkyType{
        SkyType(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// Renders the sky with a gradient that can be configured with {@link SKY_GRADIENT_RADIUS} and {@link SKY_GRADIENT}.
    @objc
    public static let gradient:TMBSkyType = TMBSkyType(value: .gradient)

    /// Renders the sky with a simulated atmospheric scattering algorithm, the sun direction can be attached to the light position or explicitly set through {@link SKY_ATMOSPHERE_SUN}.
    @objc
    public static let atmosphere:TMBSkyType = TMBSkyType(value: .atmosphere)

}

// MARK: ANCHOR

/// Whether extruded geometries are lit relative to the map or viewport.
extension Anchor {
    func objcValue() -> TMBAnchor {
        TMBAnchor(value: self)
    }
}
@objc
open class TMBAnchor :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: Anchor) {
        self.value = value.rawValue
    }
    func swiftValue() -> Anchor {
        Anchor(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The position of the light source is aligned to the rotation of the map.
    @objc
    public static let map:TMBAnchor = TMBAnchor(value: .map)

    /// The position of the light source is aligned to the rotation of the viewport.
    @objc
    public static let viewport:TMBAnchor = TMBAnchor(value: .viewport)

}

// MARK: NAME

/// The name of the projection to be used for rendering the map.
extension StyleProjectionName {
    func objcValue() -> TMBStyleProjectionName {
        TMBStyleProjectionName(value: self)
    }
}
@objc
open class TMBStyleProjectionName :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: StyleProjectionName) {
        self.value = value.rawValue
    }
    func swiftValue() -> StyleProjectionName{
        StyleProjectionName(rawValue: value)!
    }
    
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// The Mercator projection is the default projection.
    @objc
    public static let mercator:TMBStyleProjectionName = TMBStyleProjectionName(value: .mercator)

    /// A globe projection.
    @objc
    public static let globe:TMBStyleProjectionName = TMBStyleProjectionName(value: .globe)

}

// MARK: TEXT_WRITING_MODE

/// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
extension TextWritingMode {
    func objcValue() -> TMBTextWritingMode {
        TMBTextWritingMode(value: self)
    }
}
@objc
open class TMBTextWritingMode :NSObject, NamedString {
    private let value: String
    @objc
    public init(value: String) {
        self.value = value
    }

    init(value: TextWritingMode) {
        self.value = value.rawValue
    }
    func swiftValue() -> TextWritingMode{
        TextWritingMode(rawValue: value)!
    }
    @objc
    public func stringValue() -> String {
        return self.value
    }

    /// If a text's language supports horizontal writing mode, symbols would be laid out horizontally.
    @objc
    public static let horizontal:TMBTextWritingMode = TMBTextWritingMode(value: .horizontal)

    /// If a text's language supports vertical writing mode, symbols would be laid out vertically.
    @objc
    public static let vertical:TMBTextWritingMode = TMBTextWritingMode(value: .vertical)

}

// End of generated file.
