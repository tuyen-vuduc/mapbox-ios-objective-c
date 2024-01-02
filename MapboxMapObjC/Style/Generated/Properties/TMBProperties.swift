// This file is generated.
import Foundation
import MapboxMaps


@objc public enum TMBVisibility: Int {

    /// The layer is shown.
    case visible

    /// The layer is not shown.
    case none
}
extension Visibility {
    func wrap() -> TMBVisibility {
        switch self {
        case .visible:
            return .visible
        case .none:
            return .none
        }
    }
}
extension TMBVisibility {
    func unwrap() -> Visibility {
        switch self {
        case .visible:
            return .visible
        case .none:
            return .none
        }
    }
}
@objc extension TMBValue {
    @objc public class func visibility(_ value: TMBVisibility) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == Visibility {
    func visibility() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [Visibility] {
    func arrayOfVisibility() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func visibility() -> Value<Visibility> {
        if let constant = self.constant as? String,
            let value = Visibility(rawValue: constant) {
            return Value.constant(value)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfVisibility() -> Value<[Visibility]> {
        if let constant = self.constant as? [String] {
            return Value.constant(constant
                .map{ Visibility(rawValue: $0) }
                .filter { $0 != nil }
                .map{ $0! })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: LINE_CAP

/// The display of line endings.
@objc open class TMBLineCap: NSObject {

    public let origin: LineCap
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: LineCap(rawValue: rawValue))
    }

    public init(origin: LineCap) {
       self.origin = origin
    }

    /// A cap with a squared-off end which is drawn to the exact endpoint of the line.
    @objc public static let butt = TMBLineCap(origin: LineCap.butt)

    /// A cap with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
    @objc public static let round = TMBLineCap(origin: LineCap.round)

    /// A cap with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
    @objc public static let square = TMBLineCap(origin: LineCap.square)

}
extension LineCap {
    func wrap() -> TMBLineCap {
        TMBLineCap(origin: self)
    }
}
extension TMBLineCap {
    func unwrap() -> LineCap {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func lineCap(_ value: TMBLineCap) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == LineCap {
    func lineCap() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [LineCap] {
    func arrayOfLineCap() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func lineCap() -> Value<LineCap>? {
        if let constant = self.constant as? String {
            return Value.constant(LineCap(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfLineCap() -> Value<[LineCap]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ LineCap(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: LINE_JOIN

/// The display of lines when joining.
@objc open class TMBLineJoin: NSObject {

    public let origin: LineJoin
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: LineJoin(rawValue: rawValue))
    }

    public init(origin: LineJoin) {
       self.origin = origin
    }

    /// A join with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
    @objc public static let bevel = TMBLineJoin(origin: LineJoin.bevel)

    /// A join with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
    @objc public static let round = TMBLineJoin(origin: LineJoin.round)

    /// A join with a sharp, angled corner which is drawn with the outer sides beyond the endpoint of the path until they meet.
    @objc public static let miter = TMBLineJoin(origin: LineJoin.miter)

}
extension LineJoin {
    func wrap() -> TMBLineJoin {
        TMBLineJoin(origin: self)
    }
}
extension TMBLineJoin {
    func unwrap() -> LineJoin {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func lineJoin(_ value: TMBLineJoin) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == LineJoin {
    func lineJoin() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [LineJoin] {
    func arrayOfLineJoin() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func lineJoin() -> Value<LineJoin>? {
        if let constant = self.constant as? String {
            return Value.constant(LineJoin(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfLineJoin() -> Value<[LineJoin]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ LineJoin(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: ICON_ANCHOR

/// Part of the icon placed closest to the anchor.
@objc open class TMBIconAnchor: NSObject {

    public let origin: IconAnchor
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: IconAnchor(rawValue: rawValue))
    }

    public init(origin: IconAnchor) {
       self.origin = origin
    }

    /// The center of the icon is placed closest to the anchor.
    @objc public static let center = TMBIconAnchor(origin: IconAnchor.center)

    /// The left side of the icon is placed closest to the anchor.
    @objc public static let left = TMBIconAnchor(origin: IconAnchor.left)

    /// The right side of the icon is placed closest to the anchor.
    @objc public static let right = TMBIconAnchor(origin: IconAnchor.right)

    /// The top of the icon is placed closest to the anchor.
    @objc public static let top = TMBIconAnchor(origin: IconAnchor.top)

    /// The bottom of the icon is placed closest to the anchor.
    @objc public static let bottom = TMBIconAnchor(origin: IconAnchor.bottom)

    /// The top left corner of the icon is placed closest to the anchor.
    @objc public static let topLeft = TMBIconAnchor(origin: IconAnchor.topLeft)

    /// The top right corner of the icon is placed closest to the anchor.
    @objc public static let topRight = TMBIconAnchor(origin: IconAnchor.topRight)

    /// The bottom left corner of the icon is placed closest to the anchor.
    @objc public static let bottomLeft = TMBIconAnchor(origin: IconAnchor.bottomLeft)

    /// The bottom right corner of the icon is placed closest to the anchor.
    @objc public static let bottomRight = TMBIconAnchor(origin: IconAnchor.bottomRight)

}
extension IconAnchor {
    func wrap() -> TMBIconAnchor {
        TMBIconAnchor(origin: self)
    }
}
extension TMBIconAnchor {
    func unwrap() -> IconAnchor {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func iconAnchor(_ value: TMBIconAnchor) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == IconAnchor {
    func iconAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [IconAnchor] {
    func arrayOfIconAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func iconAnchor() -> Value<IconAnchor>? {
        if let constant = self.constant as? String {
            return Value.constant(IconAnchor(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfIconAnchor() -> Value<[IconAnchor]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ IconAnchor(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: ICON_PITCH_ALIGNMENT

/// Orientation of icon when map is pitched.
@objc open class TMBIconPitchAlignment: NSObject {

    public let origin: IconPitchAlignment
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: IconPitchAlignment(rawValue: rawValue))
    }

    public init(origin: IconPitchAlignment) {
       self.origin = origin
    }

    /// The icon is aligned to the plane of the map.
    @objc public static let map = TMBIconPitchAlignment(origin: IconPitchAlignment.map)

    /// The icon is aligned to the plane of the viewport.
    @objc public static let viewport = TMBIconPitchAlignment(origin: IconPitchAlignment.viewport)

    /// Automatically matches the value of {@link ICON_ROTATION_ALIGNMENT}.
    @objc public static let auto = TMBIconPitchAlignment(origin: IconPitchAlignment.auto)

}
extension IconPitchAlignment {
    func wrap() -> TMBIconPitchAlignment {
        TMBIconPitchAlignment(origin: self)
    }
}
extension TMBIconPitchAlignment {
    func unwrap() -> IconPitchAlignment {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func iconPitchAlignment(_ value: TMBIconPitchAlignment) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == IconPitchAlignment {
    func iconPitchAlignment() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [IconPitchAlignment] {
    func arrayOfIconPitchAlignment() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func iconPitchAlignment() -> Value<IconPitchAlignment>? {
        if let constant = self.constant as? String {
            return Value.constant(IconPitchAlignment(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfIconPitchAlignment() -> Value<[IconPitchAlignment]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ IconPitchAlignment(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: ICON_ROTATION_ALIGNMENT

/// In combination with `symbol-placement`, determines the rotation behavior of icons.
@objc open class TMBIconRotationAlignment: NSObject {

    public let origin: IconRotationAlignment
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: IconRotationAlignment(rawValue: rawValue))
    }

    public init(origin: IconRotationAlignment) {
       self.origin = origin
    }

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, aligns icons east-west. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, aligns icon x-axes with the line.
    @objc public static let map = TMBIconRotationAlignment(origin: IconRotationAlignment.map)

    /// Produces icons whose x-axes are aligned with the x-axis of the viewport, regardless of the value of {@link SYMBOL_PLACEMENT}.
    @objc public static let viewport = TMBIconRotationAlignment(origin: IconRotationAlignment.viewport)

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, this is equivalent to {@link Property#ICON_ROTATION_ALIGNMENT_VIEWPORT}. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, this is equivalent to {@link Property#ICON_ROTATION_ALIGNMENT_MAP}.
    @objc public static let auto = TMBIconRotationAlignment(origin: IconRotationAlignment.auto)

}
extension IconRotationAlignment {
    func wrap() -> TMBIconRotationAlignment {
        TMBIconRotationAlignment(origin: self)
    }
}
extension TMBIconRotationAlignment {
    func unwrap() -> IconRotationAlignment {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func iconRotationAlignment(_ value: TMBIconRotationAlignment) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == IconRotationAlignment {
    func iconRotationAlignment() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [IconRotationAlignment] {
    func arrayOfIconRotationAlignment() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func iconRotationAlignment() -> Value<IconRotationAlignment>? {
        if let constant = self.constant as? String {
            return Value.constant(IconRotationAlignment(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfIconRotationAlignment() -> Value<[IconRotationAlignment]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ IconRotationAlignment(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: ICON_TEXT_FIT

/// Scales the icon to fit around the associated text.
@objc open class TMBIconTextFit: NSObject {

    public let origin: IconTextFit
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: IconTextFit(rawValue: rawValue))
    }

    public init(origin: IconTextFit) {
       self.origin = origin
    }

    /// The icon is displayed at its intrinsic aspect ratio.
    @objc public static let none = TMBIconTextFit(origin: IconTextFit.none)

    /// The icon is scaled in the x-dimension to fit the width of the text.
    @objc public static let width = TMBIconTextFit(origin: IconTextFit.width)

    /// The icon is scaled in the y-dimension to fit the height of the text.
    @objc public static let height = TMBIconTextFit(origin: IconTextFit.height)

    /// The icon is scaled in both x- and y-dimensions.
    @objc public static let both = TMBIconTextFit(origin: IconTextFit.both)

}
extension IconTextFit {
    func wrap() -> TMBIconTextFit {
        TMBIconTextFit(origin: self)
    }
}
extension TMBIconTextFit {
    func unwrap() -> IconTextFit {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func iconTextFit(_ value: TMBIconTextFit) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == IconTextFit {
    func iconTextFit() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [IconTextFit] {
    func arrayOfIconTextFit() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func iconTextFit() -> Value<IconTextFit>? {
        if let constant = self.constant as? String {
            return Value.constant(IconTextFit(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfIconTextFit() -> Value<[IconTextFit]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ IconTextFit(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: SYMBOL_PLACEMENT

/// Label placement relative to its geometry.
@objc open class TMBSymbolPlacement: NSObject {

    public let origin: SymbolPlacement
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: SymbolPlacement(rawValue: rawValue))
    }

    public init(origin: SymbolPlacement) {
       self.origin = origin
    }

    /// The label is placed at the point where the geometry is located.
    @objc public static let point = TMBSymbolPlacement(origin: SymbolPlacement.point)

    /// The label is placed along the line of the geometry. Can only be used on LineString and Polygon geometries.
    @objc public static let line = TMBSymbolPlacement(origin: SymbolPlacement.line)

    /// The label is placed at the center of the line of the geometry. Can only be used on LineString and Polygon geometries. Note that a single feature in a vector tile may contain multiple line geometries.
    @objc public static let lineCenter = TMBSymbolPlacement(origin: SymbolPlacement.lineCenter)

}
extension SymbolPlacement {
    func wrap() -> TMBSymbolPlacement {
        TMBSymbolPlacement(origin: self)
    }
}
extension TMBSymbolPlacement {
    func unwrap() -> SymbolPlacement {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func symbolPlacement(_ value: TMBSymbolPlacement) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == SymbolPlacement {
    func symbolPlacement() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [SymbolPlacement] {
    func arrayOfSymbolPlacement() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func symbolPlacement() -> Value<SymbolPlacement>? {
        if let constant = self.constant as? String {
            return Value.constant(SymbolPlacement(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfSymbolPlacement() -> Value<[SymbolPlacement]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ SymbolPlacement(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: SYMBOL_Z_ORDER

/// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
@objc open class TMBSymbolZOrder: NSObject {

    public let origin: SymbolZOrder
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: SymbolZOrder(rawValue: rawValue))
    }

    public init(origin: SymbolZOrder) {
       self.origin = origin
    }

    /// Sorts symbols by symbol sort key if set. Otherwise, sorts symbols by their y-position relative to the viewport if {@link ICON_ALLOW_OVERLAP} or {@link TEXT_ALLOW_OVERLAP} is set to {@link TRUE} or {@link ICON_IGNORE_PLACEMENT} or {@link TEXT_IGNORE_PLACEMENT} is {@link FALSE}.
    @objc public static let auto = TMBSymbolZOrder(origin: SymbolZOrder.auto)

    /// Sorts symbols by their y-position relative to the viewport if {@link ICON_ALLOW_OVERLAP} or {@link TEXT_ALLOW_OVERLAP} is set to {@link TRUE} or {@link ICON_IGNORE_PLACEMENT} or {@link TEXT_IGNORE_PLACEMENT} is {@link FALSE}.
    @objc public static let viewportY = TMBSymbolZOrder(origin: SymbolZOrder.viewportY)

    /// Sorts symbols by symbol sort key if set. Otherwise, no sorting is applied; symbols are rendered in the same order as the source data.
    @objc public static let source = TMBSymbolZOrder(origin: SymbolZOrder.source)

}
extension SymbolZOrder {
    func wrap() -> TMBSymbolZOrder {
        TMBSymbolZOrder(origin: self)
    }
}
extension TMBSymbolZOrder {
    func unwrap() -> SymbolZOrder {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func symbolZOrder(_ value: TMBSymbolZOrder) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == SymbolZOrder {
    func symbolZOrder() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [SymbolZOrder] {
    func arrayOfSymbolZOrder() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func symbolZOrder() -> Value<SymbolZOrder>? {
        if let constant = self.constant as? String {
            return Value.constant(SymbolZOrder(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfSymbolZOrder() -> Value<[SymbolZOrder]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ SymbolZOrder(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: TEXT_ANCHOR

/// Part of the text placed closest to the anchor.
@objc open class TMBTextAnchor: NSObject {

    public let origin: TextAnchor
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: TextAnchor(rawValue: rawValue))
    }

    public init(origin: TextAnchor) {
       self.origin = origin
    }

    /// The center of the text is placed closest to the anchor.
    @objc public static let center = TMBTextAnchor(origin: TextAnchor.center)

    /// The left side of the text is placed closest to the anchor.
    @objc public static let left = TMBTextAnchor(origin: TextAnchor.left)

    /// The right side of the text is placed closest to the anchor.
    @objc public static let right = TMBTextAnchor(origin: TextAnchor.right)

    /// The top of the text is placed closest to the anchor.
    @objc public static let top = TMBTextAnchor(origin: TextAnchor.top)

    /// The bottom of the text is placed closest to the anchor.
    @objc public static let bottom = TMBTextAnchor(origin: TextAnchor.bottom)

    /// The top left corner of the text is placed closest to the anchor.
    @objc public static let topLeft = TMBTextAnchor(origin: TextAnchor.topLeft)

    /// The top right corner of the text is placed closest to the anchor.
    @objc public static let topRight = TMBTextAnchor(origin: TextAnchor.topRight)

    /// The bottom left corner of the text is placed closest to the anchor.
    @objc public static let bottomLeft = TMBTextAnchor(origin: TextAnchor.bottomLeft)

    /// The bottom right corner of the text is placed closest to the anchor.
    @objc public static let bottomRight = TMBTextAnchor(origin: TextAnchor.bottomRight)

}
extension TextAnchor {
    func wrap() -> TMBTextAnchor {
        TMBTextAnchor(origin: self)
    }
}
extension TMBTextAnchor {
    func unwrap() -> TextAnchor {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func textAnchor(_ value: TMBTextAnchor) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == TextAnchor {
    func textAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [TextAnchor] {
    func arrayOfTextAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func textAnchor() -> Value<TextAnchor>? {
        if let constant = self.constant as? String {
            return Value.constant(TextAnchor(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfTextAnchor() -> Value<[TextAnchor]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ TextAnchor(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: TEXT_JUSTIFY

/// Text justification options.
@objc open class TMBTextJustify: NSObject {

    public let origin: TextJustify
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: TextJustify(rawValue: rawValue))
    }

    public init(origin: TextJustify) {
       self.origin = origin
    }

    /// The text is aligned towards the anchor position.
    @objc public static let auto = TMBTextJustify(origin: TextJustify.auto)

    /// The text is aligned to the left.
    @objc public static let left = TMBTextJustify(origin: TextJustify.left)

    /// The text is centered.
    @objc public static let center = TMBTextJustify(origin: TextJustify.center)

    /// The text is aligned to the right.
    @objc public static let right = TMBTextJustify(origin: TextJustify.right)

}
extension TextJustify {
    func wrap() -> TMBTextJustify {
        TMBTextJustify(origin: self)
    }
}
extension TMBTextJustify {
    func unwrap() -> TextJustify {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func textJustify(_ value: TMBTextJustify) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == TextJustify {
    func textJustify() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [TextJustify] {
    func arrayOfTextJustify() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func textJustify() -> Value<TextJustify>? {
        if let constant = self.constant as? String {
            return Value.constant(TextJustify(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfTextJustify() -> Value<[TextJustify]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ TextJustify(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: TEXT_PITCH_ALIGNMENT

/// Orientation of text when map is pitched.
@objc open class TMBTextPitchAlignment: NSObject {

    public let origin: TextPitchAlignment
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: TextPitchAlignment(rawValue: rawValue))
    }

    public init(origin: TextPitchAlignment) {
       self.origin = origin
    }

    /// The text is aligned to the plane of the map.
    @objc public static let map = TMBTextPitchAlignment(origin: TextPitchAlignment.map)

    /// The text is aligned to the plane of the viewport.
    @objc public static let viewport = TMBTextPitchAlignment(origin: TextPitchAlignment.viewport)

    /// Automatically matches the value of {@link TEXT_ROTATION_ALIGNMENT}.
    @objc public static let auto = TMBTextPitchAlignment(origin: TextPitchAlignment.auto)

}
extension TextPitchAlignment {
    func wrap() -> TMBTextPitchAlignment {
        TMBTextPitchAlignment(origin: self)
    }
}
extension TMBTextPitchAlignment {
    func unwrap() -> TextPitchAlignment {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func textPitchAlignment(_ value: TMBTextPitchAlignment) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == TextPitchAlignment {
    func textPitchAlignment() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [TextPitchAlignment] {
    func arrayOfTextPitchAlignment() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func textPitchAlignment() -> Value<TextPitchAlignment>? {
        if let constant = self.constant as? String {
            return Value.constant(TextPitchAlignment(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfTextPitchAlignment() -> Value<[TextPitchAlignment]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ TextPitchAlignment(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: TEXT_ROTATION_ALIGNMENT

/// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
@objc open class TMBTextRotationAlignment: NSObject {

    public let origin: TextRotationAlignment
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: TextRotationAlignment(rawValue: rawValue))
    }

    public init(origin: TextRotationAlignment) {
       self.origin = origin
    }

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, aligns text east-west. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, aligns text x-axes with the line.
    @objc public static let map = TMBTextRotationAlignment(origin: TextRotationAlignment.map)

    /// Produces glyphs whose x-axes are aligned with the x-axis of the viewport, regardless of the value of {@link SYMBOL_PLACEMENT}.
    @objc public static let viewport = TMBTextRotationAlignment(origin: TextRotationAlignment.viewport)

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, this is equivalent to {@link Property#TEXT_ROTATION_ALIGNMENT_VIEWPORT}. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, this is equivalent to {@link Property#TEXT_ROTATION_ALIGNMENT_MAP}.
    @objc public static let auto = TMBTextRotationAlignment(origin: TextRotationAlignment.auto)

}
extension TextRotationAlignment {
    func wrap() -> TMBTextRotationAlignment {
        TMBTextRotationAlignment(origin: self)
    }
}
extension TMBTextRotationAlignment {
    func unwrap() -> TextRotationAlignment {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func textRotationAlignment(_ value: TMBTextRotationAlignment) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == TextRotationAlignment {
    func textRotationAlignment() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [TextRotationAlignment] {
    func arrayOfTextRotationAlignment() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func textRotationAlignment() -> Value<TextRotationAlignment>? {
        if let constant = self.constant as? String {
            return Value.constant(TextRotationAlignment(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfTextRotationAlignment() -> Value<[TextRotationAlignment]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ TextRotationAlignment(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: TEXT_TRANSFORM

/// Specifies how to capitalize text, similar to the CSS `text-transform` property.
@objc open class TMBTextTransform: NSObject {

    public let origin: TextTransform
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: TextTransform(rawValue: rawValue))
    }

    public init(origin: TextTransform) {
       self.origin = origin
    }

    /// The text is not altered.
    @objc public static let none = TMBTextTransform(origin: TextTransform.none)

    /// Forces all letters to be displayed in uppercase.
    @objc public static let uppercase = TMBTextTransform(origin: TextTransform.uppercase)

    /// Forces all letters to be displayed in lowercase.
    @objc public static let lowercase = TMBTextTransform(origin: TextTransform.lowercase)

}
extension TextTransform {
    func wrap() -> TMBTextTransform {
        TMBTextTransform(origin: self)
    }
}
extension TMBTextTransform {
    func unwrap() -> TextTransform {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func textTransform(_ value: TMBTextTransform) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == TextTransform {
    func textTransform() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [TextTransform] {
    func arrayOfTextTransform() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func textTransform() -> Value<TextTransform>? {
        if let constant = self.constant as? String {
            return Value.constant(TextTransform(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfTextTransform() -> Value<[TextTransform]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ TextTransform(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: FILL_TRANSLATE_ANCHOR

/// Controls the frame of reference for `fill-translate`.
@objc open class TMBFillTranslateAnchor: NSObject {

    public let origin: FillTranslateAnchor
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: FillTranslateAnchor(rawValue: rawValue))
    }

    public init(origin: FillTranslateAnchor) {
       self.origin = origin
    }

    /// The fill is translated relative to the map.
    @objc public static let map = TMBFillTranslateAnchor(origin: FillTranslateAnchor.map)

    /// The fill is translated relative to the viewport.
    @objc public static let viewport = TMBFillTranslateAnchor(origin: FillTranslateAnchor.viewport)

}
extension FillTranslateAnchor {
    func wrap() -> TMBFillTranslateAnchor {
        TMBFillTranslateAnchor(origin: self)
    }
}
extension TMBFillTranslateAnchor {
    func unwrap() -> FillTranslateAnchor {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func fillTranslateAnchor(_ value: TMBFillTranslateAnchor) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == FillTranslateAnchor {
    func fillTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [FillTranslateAnchor] {
    func arrayOfFillTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func fillTranslateAnchor() -> Value<FillTranslateAnchor>? {
        if let constant = self.constant as? String {
            return Value.constant(FillTranslateAnchor(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfFillTranslateAnchor() -> Value<[FillTranslateAnchor]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ FillTranslateAnchor(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: LINE_TRANSLATE_ANCHOR

/// Controls the frame of reference for `line-translate`.
@objc open class TMBLineTranslateAnchor: NSObject {

    public let origin: LineTranslateAnchor
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: LineTranslateAnchor(rawValue: rawValue))
    }

    public init(origin: LineTranslateAnchor) {
       self.origin = origin
    }

    /// The line is translated relative to the map.
    @objc public static let map = TMBLineTranslateAnchor(origin: LineTranslateAnchor.map)

    /// The line is translated relative to the viewport.
    @objc public static let viewport = TMBLineTranslateAnchor(origin: LineTranslateAnchor.viewport)

}
extension LineTranslateAnchor {
    func wrap() -> TMBLineTranslateAnchor {
        TMBLineTranslateAnchor(origin: self)
    }
}
extension TMBLineTranslateAnchor {
    func unwrap() -> LineTranslateAnchor {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func lineTranslateAnchor(_ value: TMBLineTranslateAnchor) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == LineTranslateAnchor {
    func lineTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [LineTranslateAnchor] {
    func arrayOfLineTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func lineTranslateAnchor() -> Value<LineTranslateAnchor>? {
        if let constant = self.constant as? String {
            return Value.constant(LineTranslateAnchor(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfLineTranslateAnchor() -> Value<[LineTranslateAnchor]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ LineTranslateAnchor(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: ICON_TRANSLATE_ANCHOR

/// Controls the frame of reference for `icon-translate`.
@objc open class TMBIconTranslateAnchor: NSObject {

    public let origin: IconTranslateAnchor
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: IconTranslateAnchor(rawValue: rawValue))
    }

    public init(origin: IconTranslateAnchor) {
       self.origin = origin
    }

    /// Icons are translated relative to the map.
    @objc public static let map = TMBIconTranslateAnchor(origin: IconTranslateAnchor.map)

    /// Icons are translated relative to the viewport.
    @objc public static let viewport = TMBIconTranslateAnchor(origin: IconTranslateAnchor.viewport)

}
extension IconTranslateAnchor {
    func wrap() -> TMBIconTranslateAnchor {
        TMBIconTranslateAnchor(origin: self)
    }
}
extension TMBIconTranslateAnchor {
    func unwrap() -> IconTranslateAnchor {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func iconTranslateAnchor(_ value: TMBIconTranslateAnchor) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == IconTranslateAnchor {
    func iconTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [IconTranslateAnchor] {
    func arrayOfIconTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func iconTranslateAnchor() -> Value<IconTranslateAnchor>? {
        if let constant = self.constant as? String {
            return Value.constant(IconTranslateAnchor(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfIconTranslateAnchor() -> Value<[IconTranslateAnchor]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ IconTranslateAnchor(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: TEXT_TRANSLATE_ANCHOR

/// Controls the frame of reference for `text-translate`.
@objc open class TMBTextTranslateAnchor: NSObject {

    public let origin: TextTranslateAnchor
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: TextTranslateAnchor(rawValue: rawValue))
    }

    public init(origin: TextTranslateAnchor) {
       self.origin = origin
    }

    /// The text is translated relative to the map.
    @objc public static let map = TMBTextTranslateAnchor(origin: TextTranslateAnchor.map)

    /// The text is translated relative to the viewport.
    @objc public static let viewport = TMBTextTranslateAnchor(origin: TextTranslateAnchor.viewport)

}
extension TextTranslateAnchor {
    func wrap() -> TMBTextTranslateAnchor {
        TMBTextTranslateAnchor(origin: self)
    }
}
extension TMBTextTranslateAnchor {
    func unwrap() -> TextTranslateAnchor {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func textTranslateAnchor(_ value: TMBTextTranslateAnchor) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == TextTranslateAnchor {
    func textTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [TextTranslateAnchor] {
    func arrayOfTextTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func textTranslateAnchor() -> Value<TextTranslateAnchor>? {
        if let constant = self.constant as? String {
            return Value.constant(TextTranslateAnchor(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfTextTranslateAnchor() -> Value<[TextTranslateAnchor]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ TextTranslateAnchor(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: CIRCLE_PITCH_ALIGNMENT

/// Orientation of circle when map is pitched.
@objc open class TMBCirclePitchAlignment: NSObject {

    public let origin: CirclePitchAlignment
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: CirclePitchAlignment(rawValue: rawValue))
    }

    public init(origin: CirclePitchAlignment) {
       self.origin = origin
    }

    /// The circle is aligned to the plane of the map.
    @objc public static let map = TMBCirclePitchAlignment(origin: CirclePitchAlignment.map)

    /// The circle is aligned to the plane of the viewport.
    @objc public static let viewport = TMBCirclePitchAlignment(origin: CirclePitchAlignment.viewport)

}
extension CirclePitchAlignment {
    func wrap() -> TMBCirclePitchAlignment {
        TMBCirclePitchAlignment(origin: self)
    }
}
extension TMBCirclePitchAlignment {
    func unwrap() -> CirclePitchAlignment {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func circlePitchAlignment(_ value: TMBCirclePitchAlignment) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == CirclePitchAlignment {
    func circlePitchAlignment() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [CirclePitchAlignment] {
    func arrayOfCirclePitchAlignment() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func circlePitchAlignment() -> Value<CirclePitchAlignment>? {
        if let constant = self.constant as? String {
            return Value.constant(CirclePitchAlignment(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfCirclePitchAlignment() -> Value<[CirclePitchAlignment]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ CirclePitchAlignment(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: CIRCLE_PITCH_SCALE

/// Controls the scaling behavior of the circle when the map is pitched.
@objc open class TMBCirclePitchScale: NSObject {

    public let origin: CirclePitchScale
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: CirclePitchScale(rawValue: rawValue))
    }

    public init(origin: CirclePitchScale) {
       self.origin = origin
    }

    /// Circles are scaled according to their apparent distance to the camera.
    @objc public static let map = TMBCirclePitchScale(origin: CirclePitchScale.map)

    /// Circles are not scaled.
    @objc public static let viewport = TMBCirclePitchScale(origin: CirclePitchScale.viewport)

}
extension CirclePitchScale {
    func wrap() -> TMBCirclePitchScale {
        TMBCirclePitchScale(origin: self)
    }
}
extension TMBCirclePitchScale {
    func unwrap() -> CirclePitchScale {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func circlePitchScale(_ value: TMBCirclePitchScale) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == CirclePitchScale {
    func circlePitchScale() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [CirclePitchScale] {
    func arrayOfCirclePitchScale() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func circlePitchScale() -> Value<CirclePitchScale>? {
        if let constant = self.constant as? String {
            return Value.constant(CirclePitchScale(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfCirclePitchScale() -> Value<[CirclePitchScale]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ CirclePitchScale(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: CIRCLE_TRANSLATE_ANCHOR

/// Controls the frame of reference for `circle-translate`.
@objc open class TMBCircleTranslateAnchor: NSObject {

    public let origin: CircleTranslateAnchor
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: CircleTranslateAnchor(rawValue: rawValue))
    }

    public init(origin: CircleTranslateAnchor) {
       self.origin = origin
    }

    /// The circle is translated relative to the map.
    @objc public static let map = TMBCircleTranslateAnchor(origin: CircleTranslateAnchor.map)

    /// The circle is translated relative to the viewport.
    @objc public static let viewport = TMBCircleTranslateAnchor(origin: CircleTranslateAnchor.viewport)

}
extension CircleTranslateAnchor {
    func wrap() -> TMBCircleTranslateAnchor {
        TMBCircleTranslateAnchor(origin: self)
    }
}
extension TMBCircleTranslateAnchor {
    func unwrap() -> CircleTranslateAnchor {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func circleTranslateAnchor(_ value: TMBCircleTranslateAnchor) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == CircleTranslateAnchor {
    func circleTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [CircleTranslateAnchor] {
    func arrayOfCircleTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func circleTranslateAnchor() -> Value<CircleTranslateAnchor>? {
        if let constant = self.constant as? String {
            return Value.constant(CircleTranslateAnchor(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfCircleTranslateAnchor() -> Value<[CircleTranslateAnchor]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ CircleTranslateAnchor(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: FILL_EXTRUSION_TRANSLATE_ANCHOR

/// Controls the frame of reference for `fill-extrusion-translate`.
@objc open class TMBFillExtrusionTranslateAnchor: NSObject {

    public let origin: FillExtrusionTranslateAnchor
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: FillExtrusionTranslateAnchor(rawValue: rawValue))
    }

    public init(origin: FillExtrusionTranslateAnchor) {
       self.origin = origin
    }

    /// The fill extrusion is translated relative to the map.
    @objc public static let map = TMBFillExtrusionTranslateAnchor(origin: FillExtrusionTranslateAnchor.map)

    /// The fill extrusion is translated relative to the viewport.
    @objc public static let viewport = TMBFillExtrusionTranslateAnchor(origin: FillExtrusionTranslateAnchor.viewport)

}
extension FillExtrusionTranslateAnchor {
    func wrap() -> TMBFillExtrusionTranslateAnchor {
        TMBFillExtrusionTranslateAnchor(origin: self)
    }
}
extension TMBFillExtrusionTranslateAnchor {
    func unwrap() -> FillExtrusionTranslateAnchor {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func fillExtrusionTranslateAnchor(_ value: TMBFillExtrusionTranslateAnchor) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == FillExtrusionTranslateAnchor {
    func fillExtrusionTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [FillExtrusionTranslateAnchor] {
    func arrayOfFillExtrusionTranslateAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func fillExtrusionTranslateAnchor() -> Value<FillExtrusionTranslateAnchor>? {
        if let constant = self.constant as? String {
            return Value.constant(FillExtrusionTranslateAnchor(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfFillExtrusionTranslateAnchor() -> Value<[FillExtrusionTranslateAnchor]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ FillExtrusionTranslateAnchor(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: RASTER_RESAMPLING

/// The resampling/interpolation method to use for overscaling, also known as texture magnification filter
@objc open class TMBRasterResampling: NSObject {

    public let origin: RasterResampling
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: RasterResampling(rawValue: rawValue))
    }

    public init(origin: RasterResampling) {
       self.origin = origin
    }

    /// (Bi)linear filtering interpolates pixel values using the weighted average of the four closest original source pixels creating a smooth but blurry look when overscaled
    @objc public static let linear = TMBRasterResampling(origin: RasterResampling.linear)

    /// Nearest neighbor filtering interpolates pixel values using the nearest original source pixel creating a sharp but pixelated look when overscaled
    @objc public static let nearest = TMBRasterResampling(origin: RasterResampling.nearest)

}
extension RasterResampling {
    func wrap() -> TMBRasterResampling {
        TMBRasterResampling(origin: self)
    }
}
extension TMBRasterResampling {
    func unwrap() -> RasterResampling {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func rasterResampling(_ value: TMBRasterResampling) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == RasterResampling {
    func rasterResampling() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [RasterResampling] {
    func arrayOfRasterResampling() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func rasterResampling() -> Value<RasterResampling>? {
        if let constant = self.constant as? String {
            return Value.constant(RasterResampling(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfRasterResampling() -> Value<[RasterResampling]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ RasterResampling(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: HILLSHADE_ILLUMINATION_ANCHOR

/// Direction of light source when map is rotated.
@objc open class TMBHillshadeIlluminationAnchor: NSObject {

    public let origin: HillshadeIlluminationAnchor
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: HillshadeIlluminationAnchor(rawValue: rawValue))
    }

    public init(origin: HillshadeIlluminationAnchor) {
       self.origin = origin
    }

    /// The hillshade illumination is relative to the north direction.
    @objc public static let map = TMBHillshadeIlluminationAnchor(origin: HillshadeIlluminationAnchor.map)

    /// The hillshade illumination is relative to the top of the viewport.
    @objc public static let viewport = TMBHillshadeIlluminationAnchor(origin: HillshadeIlluminationAnchor.viewport)

}
extension HillshadeIlluminationAnchor {
    func wrap() -> TMBHillshadeIlluminationAnchor {
        TMBHillshadeIlluminationAnchor(origin: self)
    }
}
extension TMBHillshadeIlluminationAnchor {
    func unwrap() -> HillshadeIlluminationAnchor {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func hillshadeIlluminationAnchor(_ value: TMBHillshadeIlluminationAnchor) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == HillshadeIlluminationAnchor {
    func hillshadeIlluminationAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [HillshadeIlluminationAnchor] {
    func arrayOfHillshadeIlluminationAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func hillshadeIlluminationAnchor() -> Value<HillshadeIlluminationAnchor>? {
        if let constant = self.constant as? String {
            return Value.constant(HillshadeIlluminationAnchor(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfHillshadeIlluminationAnchor() -> Value<[HillshadeIlluminationAnchor]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ HillshadeIlluminationAnchor(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: MODEL_SCALE_MODE

/// Defines scaling mode. Only applies to location-indicator type layers.
@objc open class TMBModelScaleMode: NSObject {

    public let origin: ModelScaleMode
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: ModelScaleMode(rawValue: rawValue))
    }

    public init(origin: ModelScaleMode) {
       self.origin = origin
    }

    /// Model is scaled so that it's always the same size relative to other map features. The property model-scale specifies how many meters each unit in the model file should cover.
    @objc public static let map = TMBModelScaleMode(origin: ModelScaleMode.map)

    /// Model is scaled so that it's always the same size on the screen. The property model-scale specifies how many pixels each unit in model file should cover.
    @objc public static let viewport = TMBModelScaleMode(origin: ModelScaleMode.viewport)

}
extension ModelScaleMode {
    func wrap() -> TMBModelScaleMode {
        TMBModelScaleMode(origin: self)
    }
}
extension TMBModelScaleMode {
    func unwrap() -> ModelScaleMode {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func modelScaleMode(_ value: TMBModelScaleMode) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == ModelScaleMode {
    func modelScaleMode() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [ModelScaleMode] {
    func arrayOfModelScaleMode() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func modelScaleMode() -> Value<ModelScaleMode>? {
        if let constant = self.constant as? String {
            return Value.constant(ModelScaleMode(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfModelScaleMode() -> Value<[ModelScaleMode]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ ModelScaleMode(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: MODEL_TYPE

/// Defines rendering behavior of model in respect to other 3D scene objects.
@objc open class TMBModelType: NSObject {

    public let origin: ModelType
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: ModelType(rawValue: rawValue))
    }

    public init(origin: ModelType) {
       self.origin = origin
    }

    /// Integrated to 3D scene, using depth testing, along with terrain, fill-extrusions and custom layer.
    @objc public static let common3d = TMBModelType(origin: ModelType.common3d)

    /// Displayed over other 3D content, occluded by terrain.
    @objc public static let locationIndicator = TMBModelType(origin: ModelType.locationIndicator)

}
extension ModelType {
    func wrap() -> TMBModelType {
        TMBModelType(origin: self)
    }
}
extension TMBModelType {
    func unwrap() -> ModelType {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func modelType(_ value: TMBModelType) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == ModelType {
    func modelType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [ModelType] {
    func arrayOfModelType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func modelType() -> Value<ModelType>? {
        if let constant = self.constant as? String {
            return Value.constant(ModelType(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfModelType() -> Value<[ModelType]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ ModelType(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: SKY_TYPE

/// The type of the sky
@objc open class TMBSkyType: NSObject {

    public let origin: SkyType
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: SkyType(rawValue: rawValue))
    }

    public init(origin: SkyType) {
       self.origin = origin
    }

    /// Renders the sky with a gradient that can be configured with {@link SKY_GRADIENT_RADIUS} and {@link SKY_GRADIENT}.
    @objc public static let gradient = TMBSkyType(origin: SkyType.gradient)

    /// Renders the sky with a simulated atmospheric scattering algorithm, the sun direction can be attached to the light position or explicitly set through {@link SKY_ATMOSPHERE_SUN}.
    @objc public static let atmosphere = TMBSkyType(origin: SkyType.atmosphere)

}
extension SkyType {
    func wrap() -> TMBSkyType {
        TMBSkyType(origin: self)
    }
}
extension TMBSkyType {
    func unwrap() -> SkyType {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func skyType(_ value: TMBSkyType) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == SkyType {
    func skyType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [SkyType] {
    func arrayOfSkyType() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func skyType() -> Value<SkyType>? {
        if let constant = self.constant as? String {
            return Value.constant(SkyType(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfSkyType() -> Value<[SkyType]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ SkyType(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: ANCHOR

/// Whether extruded geometries are lit relative to the map or viewport.
@objc open class TMBAnchor: NSObject {

    public let origin: Anchor
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: Anchor(rawValue: rawValue))
    }

    public init(origin: Anchor) {
       self.origin = origin
    }

    /// The position of the light source is aligned to the rotation of the map.
    @objc public static let map = TMBAnchor(origin: Anchor.map)

    /// The position of the light source is aligned to the rotation of the viewport.
    @objc public static let viewport = TMBAnchor(origin: Anchor.viewport)

}
extension Anchor {
    func wrap() -> TMBAnchor {
        TMBAnchor(origin: self)
    }
}
extension TMBAnchor {
    func unwrap() -> Anchor {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func anchor(_ value: TMBAnchor) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == Anchor {
    func anchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [Anchor] {
    func arrayOfAnchor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func anchor() -> Value<Anchor>? {
        if let constant = self.constant as? String {
            return Value.constant(Anchor(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfAnchor() -> Value<[Anchor]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ Anchor(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: NAME

/// The name of the projection to be used for rendering the map.
@objc open class TMBStyleProjectionName: NSObject {

    public let origin: StyleProjectionName
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: StyleProjectionName(rawValue: rawValue))
    }

    public init(origin: StyleProjectionName) {
       self.origin = origin
    }

    /// The Mercator projection is the default projection.
    @objc public static let mercator = TMBStyleProjectionName(origin: StyleProjectionName.mercator)

    /// A globe projection.
    @objc public static let globe = TMBStyleProjectionName(origin: StyleProjectionName.globe)

}
extension StyleProjectionName {
    func wrap() -> TMBStyleProjectionName {
        TMBStyleProjectionName(origin: self)
    }
}
extension TMBStyleProjectionName {
    func unwrap() -> StyleProjectionName {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func styleProjectionName(_ value: TMBStyleProjectionName) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == StyleProjectionName {
    func styleProjectionName() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [StyleProjectionName] {
    func arrayOfStyleProjectionName() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func styleProjectionName() -> Value<StyleProjectionName>? {
        if let constant = self.constant as? String {
            return Value.constant(StyleProjectionName(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfStyleProjectionName() -> Value<[StyleProjectionName]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ StyleProjectionName(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// MARK: TEXT_WRITING_MODE

/// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
@objc open class TMBTextWritingMode: NSObject {

    public let origin: TextWritingMode
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: TextWritingMode(rawValue: rawValue))
    }

    public init(origin: TextWritingMode) {
       self.origin = origin
    }

    /// If a text's language supports horizontal writing mode, symbols would be laid out horizontally.
    @objc public static let horizontal = TMBTextWritingMode(origin: TextWritingMode.horizontal)

    /// If a text's language supports vertical writing mode, symbols would be laid out vertically.
    @objc public static let vertical = TMBTextWritingMode(origin: TextWritingMode.vertical)

}
extension TextWritingMode {
    func wrap() -> TMBTextWritingMode {
        TMBTextWritingMode(origin: self)
    }
}
extension TMBTextWritingMode {
    func unwrap() -> TextWritingMode {
        self.origin
    }
}
@objc extension TMBValue {
    @objc public class func textWritingMode(_ value: TMBTextWritingMode) -> TMBValue {
        return TMBValue(constant: value.rawValue)
    }
}
extension MapboxMaps.Value where T == TextWritingMode {
    func textWritingMode() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension MapboxMaps.Value where T == [TextWritingMode] {
    func arrayOfTextWritingMode() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func textWritingMode() -> Value<TextWritingMode>? {
        if let constant = self.constant as? String {
            return Value.constant(TextWritingMode(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfTextWritingMode() -> Value<[TextWritingMode]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ TextWritingMode(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}