// This file is generated.
import Foundation
import MapboxMaps

@objc open class TMBVisibility: NSObject {
    public let origin: Visibility
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: Visibility(rawValue: rawValue)!)
    }

    public init(origin: Visibility) {
       self.origin = origin
    }

    /// The layer is shown.
    @objc public static let visible = TMBVisibility(origin: Visibility.visible)

    /// The layer is not shown.
    @objc public static let none = TMBVisibility(origin: Visibility.none)
}
extension Visibility: ObjcConvertible {
    public func wrap() -> TMBVisibility {
        TMBVisibility(origin: self)
    }
    func visibility() -> TMBVisibility { wrap() }
}
extension TMBVisibility: SwiftValueConvertible {
    public func unwrap() -> Visibility {
        self.origin
    }
    func visibility() -> Visibility { unwrap() }
}
@objc extension TMBValue {
    @objc public class func visibility(_ visibility: TMBVisibility) -> TMBValue {
        return TMBValue(constant: visibility.rawValue)
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
        if let constant = self.constant as? String {
            return Value.constant(Visibility(rawValue: constant)!)
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOfVisibility() -> Value<[Visibility]> {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ Visibility(rawValue: $0)! })
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
extension LineCap: ObjcConvertible {
    public func wrap() -> TMBLineCap {
        TMBLineCap(origin: self)
    }
    func lineCap() -> TMBLineCap { wrap() }
}
extension TMBLineCap: SwiftValueConvertible {
    public func unwrap() -> LineCap {
        self.origin
    }
    func lineCap() -> LineCap { unwrap() }
}
@objc extension TMBValue {
    @objc public class func lineCap(_ lineCap: TMBLineCap) -> TMBValue {
        return TMBValue(constant: lineCap.rawValue)
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

    /// Line segments are not joined together, each one creates a separate line. Useful in combination with line-pattern. Line-cap property is not respected. Can't be used with data-driven styling.
    @objc public static let none = TMBLineJoin(origin: LineJoin.none)

}
extension LineJoin: ObjcConvertible {
    public func wrap() -> TMBLineJoin {
        TMBLineJoin(origin: self)
    }
    func lineJoin() -> TMBLineJoin { wrap() }
}
extension TMBLineJoin: SwiftValueConvertible {
    public func unwrap() -> LineJoin {
        self.origin
    }
    func lineJoin() -> LineJoin { unwrap() }
}
@objc extension TMBValue {
    @objc public class func lineJoin(_ lineJoin: TMBLineJoin) -> TMBValue {
        return TMBValue(constant: lineJoin.rawValue)
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
extension IconAnchor: ObjcConvertible {
    public func wrap() -> TMBIconAnchor {
        TMBIconAnchor(origin: self)
    }
    func iconAnchor() -> TMBIconAnchor { wrap() }
}
extension TMBIconAnchor: SwiftValueConvertible {
    public func unwrap() -> IconAnchor {
        self.origin
    }
    func iconAnchor() -> IconAnchor { unwrap() }
}
@objc extension TMBValue {
    @objc public class func iconAnchor(_ iconAnchor: TMBIconAnchor) -> TMBValue {
        return TMBValue(constant: iconAnchor.rawValue)
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
extension IconPitchAlignment: ObjcConvertible {
    public func wrap() -> TMBIconPitchAlignment {
        TMBIconPitchAlignment(origin: self)
    }
    func iconPitchAlignment() -> TMBIconPitchAlignment { wrap() }
}
extension TMBIconPitchAlignment: SwiftValueConvertible {
    public func unwrap() -> IconPitchAlignment {
        self.origin
    }
    func iconPitchAlignment() -> IconPitchAlignment { unwrap() }
}
@objc extension TMBValue {
    @objc public class func iconPitchAlignment(_ iconPitchAlignment: TMBIconPitchAlignment) -> TMBValue {
        return TMBValue(constant: iconPitchAlignment.rawValue)
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
extension IconRotationAlignment: ObjcConvertible {
    public func wrap() -> TMBIconRotationAlignment {
        TMBIconRotationAlignment(origin: self)
    }
    func iconRotationAlignment() -> TMBIconRotationAlignment { wrap() }
}
extension TMBIconRotationAlignment: SwiftValueConvertible {
    public func unwrap() -> IconRotationAlignment {
        self.origin
    }
    func iconRotationAlignment() -> IconRotationAlignment { unwrap() }
}
@objc extension TMBValue {
    @objc public class func iconRotationAlignment(_ iconRotationAlignment: TMBIconRotationAlignment) -> TMBValue {
        return TMBValue(constant: iconRotationAlignment.rawValue)
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
extension IconTextFit: ObjcConvertible {
    public func wrap() -> TMBIconTextFit {
        TMBIconTextFit(origin: self)
    }
    func iconTextFit() -> TMBIconTextFit { wrap() }
}
extension TMBIconTextFit: SwiftValueConvertible {
    public func unwrap() -> IconTextFit {
        self.origin
    }
    func iconTextFit() -> IconTextFit { unwrap() }
}
@objc extension TMBValue {
    @objc public class func iconTextFit(_ iconTextFit: TMBIconTextFit) -> TMBValue {
        return TMBValue(constant: iconTextFit.rawValue)
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
extension SymbolPlacement: ObjcConvertible {
    public func wrap() -> TMBSymbolPlacement {
        TMBSymbolPlacement(origin: self)
    }
    func symbolPlacement() -> TMBSymbolPlacement { wrap() }
}
extension TMBSymbolPlacement: SwiftValueConvertible {
    public func unwrap() -> SymbolPlacement {
        self.origin
    }
    func symbolPlacement() -> SymbolPlacement { unwrap() }
}
@objc extension TMBValue {
    @objc public class func symbolPlacement(_ symbolPlacement: TMBSymbolPlacement) -> TMBValue {
        return TMBValue(constant: symbolPlacement.rawValue)
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
extension SymbolZOrder: ObjcConvertible {
    public func wrap() -> TMBSymbolZOrder {
        TMBSymbolZOrder(origin: self)
    }
    func symbolZOrder() -> TMBSymbolZOrder { wrap() }
}
extension TMBSymbolZOrder: SwiftValueConvertible {
    public func unwrap() -> SymbolZOrder {
        self.origin
    }
    func symbolZOrder() -> SymbolZOrder { unwrap() }
}
@objc extension TMBValue {
    @objc public class func symbolZOrder(_ symbolZOrder: TMBSymbolZOrder) -> TMBValue {
        return TMBValue(constant: symbolZOrder.rawValue)
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
extension TextAnchor: ObjcConvertible {
    public func wrap() -> TMBTextAnchor {
        TMBTextAnchor(origin: self)
    }
    func textAnchor() -> TMBTextAnchor { wrap() }
}
extension TMBTextAnchor: SwiftValueConvertible {
    public func unwrap() -> TextAnchor {
        self.origin
    }
    func textAnchor() -> TextAnchor { unwrap() }
}
@objc extension TMBValue {
    @objc public class func textAnchor(_ textAnchor: TMBTextAnchor) -> TMBValue {
        return TMBValue(constant: textAnchor.rawValue)
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
extension TextJustify: ObjcConvertible {
    public func wrap() -> TMBTextJustify {
        TMBTextJustify(origin: self)
    }
    func textJustify() -> TMBTextJustify { wrap() }
}
extension TMBTextJustify: SwiftValueConvertible {
    public func unwrap() -> TextJustify {
        self.origin
    }
    func textJustify() -> TextJustify { unwrap() }
}
@objc extension TMBValue {
    @objc public class func textJustify(_ textJustify: TMBTextJustify) -> TMBValue {
        return TMBValue(constant: textJustify.rawValue)
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
extension TextPitchAlignment: ObjcConvertible {
    public func wrap() -> TMBTextPitchAlignment {
        TMBTextPitchAlignment(origin: self)
    }
    func textPitchAlignment() -> TMBTextPitchAlignment { wrap() }
}
extension TMBTextPitchAlignment: SwiftValueConvertible {
    public func unwrap() -> TextPitchAlignment {
        self.origin
    }
    func textPitchAlignment() -> TextPitchAlignment { unwrap() }
}
@objc extension TMBValue {
    @objc public class func textPitchAlignment(_ textPitchAlignment: TMBTextPitchAlignment) -> TMBValue {
        return TMBValue(constant: textPitchAlignment.rawValue)
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
extension TextRotationAlignment: ObjcConvertible {
    public func wrap() -> TMBTextRotationAlignment {
        TMBTextRotationAlignment(origin: self)
    }
    func textRotationAlignment() -> TMBTextRotationAlignment { wrap() }
}
extension TMBTextRotationAlignment: SwiftValueConvertible {
    public func unwrap() -> TextRotationAlignment {
        self.origin
    }
    func textRotationAlignment() -> TextRotationAlignment { unwrap() }
}
@objc extension TMBValue {
    @objc public class func textRotationAlignment(_ textRotationAlignment: TMBTextRotationAlignment) -> TMBValue {
        return TMBValue(constant: textRotationAlignment.rawValue)
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
extension TextTransform: ObjcConvertible {
    public func wrap() -> TMBTextTransform {
        TMBTextTransform(origin: self)
    }
    func textTransform() -> TMBTextTransform { wrap() }
}
extension TMBTextTransform: SwiftValueConvertible {
    public func unwrap() -> TextTransform {
        self.origin
    }
    func textTransform() -> TextTransform { unwrap() }
}
@objc extension TMBValue {
    @objc public class func textTransform(_ textTransform: TMBTextTransform) -> TMBValue {
        return TMBValue(constant: textTransform.rawValue)
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
extension FillTranslateAnchor: ObjcConvertible {
    public func wrap() -> TMBFillTranslateAnchor {
        TMBFillTranslateAnchor(origin: self)
    }
    func fillTranslateAnchor() -> TMBFillTranslateAnchor { wrap() }
}
extension TMBFillTranslateAnchor: SwiftValueConvertible {
    public func unwrap() -> FillTranslateAnchor {
        self.origin
    }
    func fillTranslateAnchor() -> FillTranslateAnchor { unwrap() }
}
@objc extension TMBValue {
    @objc public class func fillTranslateAnchor(_ fillTranslateAnchor: TMBFillTranslateAnchor) -> TMBValue {
        return TMBValue(constant: fillTranslateAnchor.rawValue)
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
extension LineTranslateAnchor: ObjcConvertible {
    public func wrap() -> TMBLineTranslateAnchor {
        TMBLineTranslateAnchor(origin: self)
    }
    func lineTranslateAnchor() -> TMBLineTranslateAnchor { wrap() }
}
extension TMBLineTranslateAnchor: SwiftValueConvertible {
    public func unwrap() -> LineTranslateAnchor {
        self.origin
    }
    func lineTranslateAnchor() -> LineTranslateAnchor { unwrap() }
}
@objc extension TMBValue {
    @objc public class func lineTranslateAnchor(_ lineTranslateAnchor: TMBLineTranslateAnchor) -> TMBValue {
        return TMBValue(constant: lineTranslateAnchor.rawValue)
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
extension IconTranslateAnchor: ObjcConvertible {
    public func wrap() -> TMBIconTranslateAnchor {
        TMBIconTranslateAnchor(origin: self)
    }
    func iconTranslateAnchor() -> TMBIconTranslateAnchor { wrap() }
}
extension TMBIconTranslateAnchor: SwiftValueConvertible {
    public func unwrap() -> IconTranslateAnchor {
        self.origin
    }
    func iconTranslateAnchor() -> IconTranslateAnchor { unwrap() }
}
@objc extension TMBValue {
    @objc public class func iconTranslateAnchor(_ iconTranslateAnchor: TMBIconTranslateAnchor) -> TMBValue {
        return TMBValue(constant: iconTranslateAnchor.rawValue)
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
extension TextTranslateAnchor: ObjcConvertible {
    public func wrap() -> TMBTextTranslateAnchor {
        TMBTextTranslateAnchor(origin: self)
    }
    func textTranslateAnchor() -> TMBTextTranslateAnchor { wrap() }
}
extension TMBTextTranslateAnchor: SwiftValueConvertible {
    public func unwrap() -> TextTranslateAnchor {
        self.origin
    }
    func textTranslateAnchor() -> TextTranslateAnchor { unwrap() }
}
@objc extension TMBValue {
    @objc public class func textTranslateAnchor(_ textTranslateAnchor: TMBTextTranslateAnchor) -> TMBValue {
        return TMBValue(constant: textTranslateAnchor.rawValue)
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
extension CirclePitchAlignment: ObjcConvertible {
    public func wrap() -> TMBCirclePitchAlignment {
        TMBCirclePitchAlignment(origin: self)
    }
    func circlePitchAlignment() -> TMBCirclePitchAlignment { wrap() }
}
extension TMBCirclePitchAlignment: SwiftValueConvertible {
    public func unwrap() -> CirclePitchAlignment {
        self.origin
    }
    func circlePitchAlignment() -> CirclePitchAlignment { unwrap() }
}
@objc extension TMBValue {
    @objc public class func circlePitchAlignment(_ circlePitchAlignment: TMBCirclePitchAlignment) -> TMBValue {
        return TMBValue(constant: circlePitchAlignment.rawValue)
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
extension CirclePitchScale: ObjcConvertible {
    public func wrap() -> TMBCirclePitchScale {
        TMBCirclePitchScale(origin: self)
    }
    func circlePitchScale() -> TMBCirclePitchScale { wrap() }
}
extension TMBCirclePitchScale: SwiftValueConvertible {
    public func unwrap() -> CirclePitchScale {
        self.origin
    }
    func circlePitchScale() -> CirclePitchScale { unwrap() }
}
@objc extension TMBValue {
    @objc public class func circlePitchScale(_ circlePitchScale: TMBCirclePitchScale) -> TMBValue {
        return TMBValue(constant: circlePitchScale.rawValue)
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
extension CircleTranslateAnchor: ObjcConvertible {
    public func wrap() -> TMBCircleTranslateAnchor {
        TMBCircleTranslateAnchor(origin: self)
    }
    func circleTranslateAnchor() -> TMBCircleTranslateAnchor { wrap() }
}
extension TMBCircleTranslateAnchor: SwiftValueConvertible {
    public func unwrap() -> CircleTranslateAnchor {
        self.origin
    }
    func circleTranslateAnchor() -> CircleTranslateAnchor { unwrap() }
}
@objc extension TMBValue {
    @objc public class func circleTranslateAnchor(_ circleTranslateAnchor: TMBCircleTranslateAnchor) -> TMBValue {
        return TMBValue(constant: circleTranslateAnchor.rawValue)
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
extension FillExtrusionTranslateAnchor: ObjcConvertible {
    public func wrap() -> TMBFillExtrusionTranslateAnchor {
        TMBFillExtrusionTranslateAnchor(origin: self)
    }
    func fillExtrusionTranslateAnchor() -> TMBFillExtrusionTranslateAnchor { wrap() }
}
extension TMBFillExtrusionTranslateAnchor: SwiftValueConvertible {
    public func unwrap() -> FillExtrusionTranslateAnchor {
        self.origin
    }
    func fillExtrusionTranslateAnchor() -> FillExtrusionTranslateAnchor { unwrap() }
}
@objc extension TMBValue {
    @objc public class func fillExtrusionTranslateAnchor(_ fillExtrusionTranslateAnchor: TMBFillExtrusionTranslateAnchor) -> TMBValue {
        return TMBValue(constant: fillExtrusionTranslateAnchor.rawValue)
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
extension RasterResampling: ObjcConvertible {
    public func wrap() -> TMBRasterResampling {
        TMBRasterResampling(origin: self)
    }
    func rasterResampling() -> TMBRasterResampling { wrap() }
}
extension TMBRasterResampling: SwiftValueConvertible {
    public func unwrap() -> RasterResampling {
        self.origin
    }
    func rasterResampling() -> RasterResampling { unwrap() }
}
@objc extension TMBValue {
    @objc public class func rasterResampling(_ rasterResampling: TMBRasterResampling) -> TMBValue {
        return TMBValue(constant: rasterResampling.rawValue)
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
extension HillshadeIlluminationAnchor: ObjcConvertible {
    public func wrap() -> TMBHillshadeIlluminationAnchor {
        TMBHillshadeIlluminationAnchor(origin: self)
    }
    func hillshadeIlluminationAnchor() -> TMBHillshadeIlluminationAnchor { wrap() }
}
extension TMBHillshadeIlluminationAnchor: SwiftValueConvertible {
    public func unwrap() -> HillshadeIlluminationAnchor {
        self.origin
    }
    func hillshadeIlluminationAnchor() -> HillshadeIlluminationAnchor { unwrap() }
}
@objc extension TMBValue {
    @objc public class func hillshadeIlluminationAnchor(_ hillshadeIlluminationAnchor: TMBHillshadeIlluminationAnchor) -> TMBValue {
        return TMBValue(constant: hillshadeIlluminationAnchor.rawValue)
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
extension ModelScaleMode: ObjcConvertible {
    public func wrap() -> TMBModelScaleMode {
        TMBModelScaleMode(origin: self)
    }
    func modelScaleMode() -> TMBModelScaleMode { wrap() }
}
extension TMBModelScaleMode: SwiftValueConvertible {
    public func unwrap() -> ModelScaleMode {
        self.origin
    }
    func modelScaleMode() -> ModelScaleMode { unwrap() }
}
@objc extension TMBValue {
    @objc public class func modelScaleMode(_ modelScaleMode: TMBModelScaleMode) -> TMBValue {
        return TMBValue(constant: modelScaleMode.rawValue)
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
extension ModelType: ObjcConvertible {
    public func wrap() -> TMBModelType {
        TMBModelType(origin: self)
    }
    func modelType() -> TMBModelType { wrap() }
}
extension TMBModelType: SwiftValueConvertible {
    public func unwrap() -> ModelType {
        self.origin
    }
    func modelType() -> ModelType { unwrap() }
}
@objc extension TMBValue {
    @objc public class func modelType(_ modelType: TMBModelType) -> TMBValue {
        return TMBValue(constant: modelType.rawValue)
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
extension SkyType: ObjcConvertible {
    public func wrap() -> TMBSkyType {
        TMBSkyType(origin: self)
    }
    func skyType() -> TMBSkyType { wrap() }
}
extension TMBSkyType: SwiftValueConvertible {
    public func unwrap() -> SkyType {
        self.origin
    }
    func skyType() -> SkyType { unwrap() }
}
@objc extension TMBValue {
    @objc public class func skyType(_ skyType: TMBSkyType) -> TMBValue {
        return TMBValue(constant: skyType.rawValue)
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
extension Anchor: ObjcConvertible {
    public func wrap() -> TMBAnchor {
        TMBAnchor(origin: self)
    }
    func anchor() -> TMBAnchor { wrap() }
}
extension TMBAnchor: SwiftValueConvertible {
    public func unwrap() -> Anchor {
        self.origin
    }
    func anchor() -> Anchor { unwrap() }
}
@objc extension TMBValue {
    @objc public class func anchor(_ anchor: TMBAnchor) -> TMBValue {
        return TMBValue(constant: anchor.rawValue)
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
extension StyleProjectionName: ObjcConvertible {
    public func wrap() -> TMBStyleProjectionName {
        TMBStyleProjectionName(origin: self)
    }
    func styleProjectionName() -> TMBStyleProjectionName { wrap() }
}
extension TMBStyleProjectionName: SwiftValueConvertible {
    public func unwrap() -> StyleProjectionName {
        self.origin
    }
    func styleProjectionName() -> StyleProjectionName { unwrap() }
}
@objc extension TMBValue {
    @objc public class func styleProjectionName(_ styleProjectionName: TMBStyleProjectionName) -> TMBValue {
        return TMBValue(constant: styleProjectionName.rawValue)
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
extension TextWritingMode: ObjcConvertible {
    public func wrap() -> TMBTextWritingMode {
        TMBTextWritingMode(origin: self)
    }
    func textWritingMode() -> TMBTextWritingMode { wrap() }
}
extension TMBTextWritingMode: SwiftValueConvertible {
    public func unwrap() -> TextWritingMode {
        self.origin
    }
    func textWritingMode() -> TextWritingMode { unwrap() }
}
@objc extension TMBValue {
    @objc public class func textWritingMode(_ textWritingMode: TMBTextWritingMode) -> TMBValue {
        return TMBValue(constant: textWritingMode.rawValue)
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

// MARK: CLIP_LAYER_TYPES

/// Layer types that will also be removed if fallen below this clip layer.
@objc open class TMBClipLayerTypes: NSObject {
    public let origin: ClipLayerTypes
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: ClipLayerTypes(rawValue: rawValue))
    }

    public init(origin: ClipLayerTypes) {
       self.origin = origin
    }



    /// If present the clip layer would remove all 3d model layers below it. Currently only instanced models (e.g. trees) are removed.
    @objc public static let model = TMBClipLayerTypes(origin: ClipLayerTypes.model)

    /// If present the clip layer would remove all symbol layers below it.
    @objc public static let symbol = TMBClipLayerTypes(origin: ClipLayerTypes.symbol)

}
extension ClipLayerTypes: ObjcConvertible {
    public func wrap() -> TMBClipLayerTypes {
        TMBClipLayerTypes(origin: self)
    }
    func clipLayerTypes() -> TMBClipLayerTypes { wrap() }
}
extension TMBClipLayerTypes: SwiftValueConvertible {
    public func unwrap() -> ClipLayerTypes {
        self.origin
    }
    func clipLayerTypes() -> ClipLayerTypes { unwrap() }
}
@objc extension TMBValue {
    @objc public class func clipLayerTypes(_ clipLayerTypes: TMBClipLayerTypes) -> TMBValue {
        return TMBValue(constant: clipLayerTypes.rawValue)
    }
}
extension MapboxMaps.Value where T == ClipLayerTypes {
    func clipLayerTypes() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [ClipLayerTypes] {
    func arrayOfClipLayerTypes() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension TMBValue {
    func clipLayerTypes() -> Value<ClipLayerTypes>? {
        if let constant = self.constant as? String {
            return Value.constant(ClipLayerTypes(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOfClipLayerTypes() -> Value<[ClipLayerTypes]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ ClipLayerTypes(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}

// End of generated file.
