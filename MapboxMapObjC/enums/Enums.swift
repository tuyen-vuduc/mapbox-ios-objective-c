// This file is generated.
import Foundation
import MapboxMaps

@objc public enum TMBVisibility: Int {

    /// The layer is shown.
    case visible

    /// The layer is not shown.
    case none
}
@objc extension TMBValue {
    @objc public class func visibility(_ visibility: TMBVisibility) -> TMBValue {
        return TMBValue(constant: NSNumber(value: visibility.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withVisibility visibility: TMBVisibility) -> NSNumber {
        return NSNumber(value: visibility.rawValue)
    }
    
    @objc public func visibility() -> TMBVisibility {
        return TMBVisibility(rawValue: self.intValue)!
    }
}

extension TMBVisibility: SwiftValueConvertible {
    public func swiftValue() -> Visibility {
        switch(self) {
            case .visible:
                return .visible
            case .none:
                return .none
        }
    }
}

extension Visibility: ObjcConvertible {
    public func objcValue() -> TMBVisibility {
        switch(self) {
            case .visible:
                return .visible
            case .none:
                return .none
        }
    }
}

// MARK: LINE_CAP

/// The display of line endings.
@objc public enum TMBLineCap: Int {

    /// A cap with a squared-off end which is drawn to the exact endpoint of the line.
    case butt

    /// A cap with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
    case round

    /// A cap with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
    case square

}
@objc extension TMBValue {
    @objc public class func lineCap(_ lineCap: TMBLineCap) -> TMBValue {
        return TMBValue(constant: NSNumber(value: lineCap.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withLineCap lineCap: TMBLineCap) -> NSNumber {
        return NSNumber(value: lineCap.rawValue)
    }
    
    @objc public func lineCap() -> TMBLineCap {
        return TMBLineCap(rawValue: self.intValue)!
    }
}

extension TMBLineCap: SwiftValueConvertible {
    public func swiftValue() -> LineCap {
        switch(self) {
            case .butt:
                return .butt
            case .round:
                return .round
            case .square:
                return .square
        }
    }
}

extension LineCap: ObjcConvertible {
    public func objcValue() -> TMBLineCap {
        switch(self) {
            case .butt:
                return .butt
            case .round:
                return .round
            case .square:
                return .square
        }
    }
}

// MARK: LINE_JOIN

/// The display of lines when joining.
@objc public enum TMBLineJoin: Int {

    /// A join with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
    case bevel

    /// A join with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
    case round

    /// A join with a sharp, angled corner which is drawn with the outer sides beyond the endpoint of the path until they meet.
    case miter

}
@objc extension TMBValue {
    @objc public class func lineJoin(_ lineJoin: TMBLineJoin) -> TMBValue {
        return TMBValue(constant: NSNumber(value: lineJoin.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withLineJoin lineJoin: TMBLineJoin) -> NSNumber {
        return NSNumber(value: lineJoin.rawValue)
    }
    
    @objc public func lineJoin() -> TMBLineJoin {
        return TMBLineJoin(rawValue: self.intValue)!
    }
}

extension TMBLineJoin: SwiftValueConvertible {
    public func swiftValue() -> LineJoin {
        switch(self) {
            case .bevel:
                return .bevel
            case .round:
                return .round
            case .miter:
                return .miter
        }
    }
}

extension LineJoin: ObjcConvertible {
    public func objcValue() -> TMBLineJoin {
        switch(self) {
            case .bevel:
                return .bevel
            case .round:
                return .round
            case .miter:
                return .miter
        }
    }
}

// MARK: ICON_ANCHOR

/// Part of the icon placed closest to the anchor.
@objc public enum TMBIconAnchor: Int {

    /// The center of the icon is placed closest to the anchor.
    case center

    /// The left side of the icon is placed closest to the anchor.
    case left

    /// The right side of the icon is placed closest to the anchor.
    case right

    /// The top of the icon is placed closest to the anchor.
    case top

    /// The bottom of the icon is placed closest to the anchor.
    case bottom

    /// The top left corner of the icon is placed closest to the anchor.
    case topLeft

    /// The top right corner of the icon is placed closest to the anchor.
    case topRight

    /// The bottom left corner of the icon is placed closest to the anchor.
    case bottomLeft

    /// The bottom right corner of the icon is placed closest to the anchor.
    case bottomRight

}
@objc extension TMBValue {
    @objc public class func iconAnchor(_ iconAnchor: TMBIconAnchor) -> TMBValue {
        return TMBValue(constant: NSNumber(value: iconAnchor.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withIconAnchor iconAnchor: TMBIconAnchor) -> NSNumber {
        return NSNumber(value: iconAnchor.rawValue)
    }
    
    @objc public func iconAnchor() -> TMBIconAnchor {
        return TMBIconAnchor(rawValue: self.intValue)!
    }
}

extension TMBIconAnchor: SwiftValueConvertible {
    public func swiftValue() -> IconAnchor {
        switch(self) {
            case .center:
                return .center
            case .left:
                return .left
            case .right:
                return .right
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .topLeft:
                return .topLeft
            case .topRight:
                return .topRight
            case .bottomLeft:
                return .bottomLeft
            case .bottomRight:
                return .bottomRight
        }
    }
}

extension IconAnchor: ObjcConvertible {
    public func objcValue() -> TMBIconAnchor {
        switch(self) {
            case .center:
                return .center
            case .left:
                return .left
            case .right:
                return .right
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .topLeft:
                return .topLeft
            case .topRight:
                return .topRight
            case .bottomLeft:
                return .bottomLeft
            case .bottomRight:
                return .bottomRight
        }
    }
}

// MARK: ICON_PITCH_ALIGNMENT

/// Orientation of icon when map is pitched.
@objc public enum TMBIconPitchAlignment: Int {

    /// The icon is aligned to the plane of the map.
    case map

    /// The icon is aligned to the plane of the viewport.
    case viewport

    /// Automatically matches the value of {@link ICON_ROTATION_ALIGNMENT}.
    case auto

}
@objc extension TMBValue {
    @objc public class func iconPitchAlignment(_ iconPitchAlignment: TMBIconPitchAlignment) -> TMBValue {
        return TMBValue(constant: NSNumber(value: iconPitchAlignment.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withIconPitchAlignment iconPitchAlignment: TMBIconPitchAlignment) -> NSNumber {
        return NSNumber(value: iconPitchAlignment.rawValue)
    }
    
    @objc public func iconPitchAlignment() -> TMBIconPitchAlignment {
        return TMBIconPitchAlignment(rawValue: self.intValue)!
    }
}

extension TMBIconPitchAlignment: SwiftValueConvertible {
    public func swiftValue() -> IconPitchAlignment {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
            case .auto:
                return .auto
        }
    }
}

extension IconPitchAlignment: ObjcConvertible {
    public func objcValue() -> TMBIconPitchAlignment {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
            case .auto:
                return .auto
        }
    }
}

// MARK: ICON_ROTATION_ALIGNMENT

/// In combination with `symbol-placement`, determines the rotation behavior of icons.
@objc public enum TMBIconRotationAlignment: Int {

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, aligns icons east-west. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, aligns icon x-axes with the line.
    case map

    /// Produces icons whose x-axes are aligned with the x-axis of the viewport, regardless of the value of {@link SYMBOL_PLACEMENT}.
    case viewport

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, this is equivalent to {@link Property#ICON_ROTATION_ALIGNMENT_VIEWPORT}. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, this is equivalent to {@link Property#ICON_ROTATION_ALIGNMENT_MAP}.
    case auto

}
@objc extension TMBValue {
    @objc public class func iconRotationAlignment(_ iconRotationAlignment: TMBIconRotationAlignment) -> TMBValue {
        return TMBValue(constant: NSNumber(value: iconRotationAlignment.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withIconRotationAlignment iconRotationAlignment: TMBIconRotationAlignment) -> NSNumber {
        return NSNumber(value: iconRotationAlignment.rawValue)
    }
    
    @objc public func iconRotationAlignment() -> TMBIconRotationAlignment {
        return TMBIconRotationAlignment(rawValue: self.intValue)!
    }
}

extension TMBIconRotationAlignment: SwiftValueConvertible {
    public func swiftValue() -> IconRotationAlignment {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
            case .auto:
                return .auto
        }
    }
}

extension IconRotationAlignment: ObjcConvertible {
    public func objcValue() -> TMBIconRotationAlignment {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
            case .auto:
                return .auto
        }
    }
}

// MARK: ICON_TEXT_FIT

/// Scales the icon to fit around the associated text.
@objc public enum TMBIconTextFit: Int {

    /// The icon is displayed at its intrinsic aspect ratio.
    case none

    /// The icon is scaled in the x-dimension to fit the width of the text.
    case width

    /// The icon is scaled in the y-dimension to fit the height of the text.
    case height

    /// The icon is scaled in both x- and y-dimensions.
    case both

}
@objc extension TMBValue {
    @objc public class func iconTextFit(_ iconTextFit: TMBIconTextFit) -> TMBValue {
        return TMBValue(constant: NSNumber(value: iconTextFit.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withIconTextFit iconTextFit: TMBIconTextFit) -> NSNumber {
        return NSNumber(value: iconTextFit.rawValue)
    }
    
    @objc public func iconTextFit() -> TMBIconTextFit {
        return TMBIconTextFit(rawValue: self.intValue)!
    }
}

extension TMBIconTextFit: SwiftValueConvertible {
    public func swiftValue() -> IconTextFit {
        switch(self) {
            case .none:
                return .none
            case .width:
                return .width
            case .height:
                return .height
            case .both:
                return .both
        }
    }
}

extension IconTextFit: ObjcConvertible {
    public func objcValue() -> TMBIconTextFit {
        switch(self) {
            case .none:
                return .none
            case .width:
                return .width
            case .height:
                return .height
            case .both:
                return .both
        }
    }
}

// MARK: SYMBOL_PLACEMENT

/// Label placement relative to its geometry.
@objc public enum TMBSymbolPlacement: Int {

    /// The label is placed at the point where the geometry is located.
    case point

    /// The label is placed along the line of the geometry. Can only be used on LineString and Polygon geometries.
    case line

    /// The label is placed at the center of the line of the geometry. Can only be used on LineString and Polygon geometries. Note that a single feature in a vector tile may contain multiple line geometries.
    case lineCenter

}
@objc extension TMBValue {
    @objc public class func symbolPlacement(_ symbolPlacement: TMBSymbolPlacement) -> TMBValue {
        return TMBValue(constant: NSNumber(value: symbolPlacement.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withSymbolPlacement symbolPlacement: TMBSymbolPlacement) -> NSNumber {
        return NSNumber(value: symbolPlacement.rawValue)
    }
    
    @objc public func symbolPlacement() -> TMBSymbolPlacement {
        return TMBSymbolPlacement(rawValue: self.intValue)!
    }
}

extension TMBSymbolPlacement: SwiftValueConvertible {
    public func swiftValue() -> SymbolPlacement {
        switch(self) {
            case .point:
                return .point
            case .line:
                return .line
            case .lineCenter:
                return .lineCenter
        }
    }
}

extension SymbolPlacement: ObjcConvertible {
    public func objcValue() -> TMBSymbolPlacement {
        switch(self) {
            case .point:
                return .point
            case .line:
                return .line
            case .lineCenter:
                return .lineCenter
        }
    }
}

// MARK: SYMBOL_Z_ORDER

/// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
@objc public enum TMBSymbolZOrder: Int {

    /// Sorts symbols by symbol sort key if set. Otherwise, sorts symbols by their y-position relative to the viewport if {@link ICON_ALLOW_OVERLAP} or {@link TEXT_ALLOW_OVERLAP} is set to {@link TRUE} or {@link ICON_IGNORE_PLACEMENT} or {@link TEXT_IGNORE_PLACEMENT} is {@link FALSE}.
    case auto

    /// Sorts symbols by their y-position relative to the viewport if {@link ICON_ALLOW_OVERLAP} or {@link TEXT_ALLOW_OVERLAP} is set to {@link TRUE} or {@link ICON_IGNORE_PLACEMENT} or {@link TEXT_IGNORE_PLACEMENT} is {@link FALSE}.
    case viewportY

    /// Sorts symbols by symbol sort key if set. Otherwise, no sorting is applied; symbols are rendered in the same order as the source data.
    case source

}
@objc extension TMBValue {
    @objc public class func symbolZOrder(_ symbolZOrder: TMBSymbolZOrder) -> TMBValue {
        return TMBValue(constant: NSNumber(value: symbolZOrder.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withSymbolZOrder symbolZOrder: TMBSymbolZOrder) -> NSNumber {
        return NSNumber(value: symbolZOrder.rawValue)
    }
    
    @objc public func symbolZOrder() -> TMBSymbolZOrder {
        return TMBSymbolZOrder(rawValue: self.intValue)!
    }
}

extension TMBSymbolZOrder: SwiftValueConvertible {
    public func swiftValue() -> SymbolZOrder {
        switch(self) {
            case .auto:
                return .auto
            case .viewportY:
                return .viewportY
            case .source:
                return .source
        }
    }
}

extension SymbolZOrder: ObjcConvertible {
    public func objcValue() -> TMBSymbolZOrder {
        switch(self) {
            case .auto:
                return .auto
            case .viewportY:
                return .viewportY
            case .source:
                return .source
        }
    }
}

// MARK: TEXT_ANCHOR

/// Part of the text placed closest to the anchor.
@objc public enum TMBTextAnchor: Int {

    /// The center of the text is placed closest to the anchor.
    case center

    /// The left side of the text is placed closest to the anchor.
    case left

    /// The right side of the text is placed closest to the anchor.
    case right

    /// The top of the text is placed closest to the anchor.
    case top

    /// The bottom of the text is placed closest to the anchor.
    case bottom

    /// The top left corner of the text is placed closest to the anchor.
    case topLeft

    /// The top right corner of the text is placed closest to the anchor.
    case topRight

    /// The bottom left corner of the text is placed closest to the anchor.
    case bottomLeft

    /// The bottom right corner of the text is placed closest to the anchor.
    case bottomRight

}
@objc extension TMBValue {
    @objc public class func textAnchor(_ textAnchor: TMBTextAnchor) -> TMBValue {
        return TMBValue(constant: NSNumber(value: textAnchor.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withTextAnchor textAnchor: TMBTextAnchor) -> NSNumber {
        return NSNumber(value: textAnchor.rawValue)
    }
    
    @objc public func textAnchor() -> TMBTextAnchor {
        return TMBTextAnchor(rawValue: self.intValue)!
    }
}

extension TMBTextAnchor: SwiftValueConvertible {
    public func swiftValue() -> TextAnchor {
        switch(self) {
            case .center:
                return .center
            case .left:
                return .left
            case .right:
                return .right
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .topLeft:
                return .topLeft
            case .topRight:
                return .topRight
            case .bottomLeft:
                return .bottomLeft
            case .bottomRight:
                return .bottomRight
        }
    }
}

extension TextAnchor: ObjcConvertible {
    public func objcValue() -> TMBTextAnchor {
        switch(self) {
            case .center:
                return .center
            case .left:
                return .left
            case .right:
                return .right
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .topLeft:
                return .topLeft
            case .topRight:
                return .topRight
            case .bottomLeft:
                return .bottomLeft
            case .bottomRight:
                return .bottomRight
        }
    }
}

// MARK: TEXT_JUSTIFY

/// Text justification options.
@objc public enum TMBTextJustify: Int {

    /// The text is aligned towards the anchor position.
    case auto

    /// The text is aligned to the left.
    case left

    /// The text is centered.
    case center

    /// The text is aligned to the right.
    case right

}
@objc extension TMBValue {
    @objc public class func textJustify(_ textJustify: TMBTextJustify) -> TMBValue {
        return TMBValue(constant: NSNumber(value: textJustify.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withTextJustify textJustify: TMBTextJustify) -> NSNumber {
        return NSNumber(value: textJustify.rawValue)
    }
    
    @objc public func textJustify() -> TMBTextJustify {
        return TMBTextJustify(rawValue: self.intValue)!
    }
}

extension TMBTextJustify: SwiftValueConvertible {
    public func swiftValue() -> TextJustify {
        switch(self) {
            case .auto:
                return .auto
            case .left:
                return .left
            case .center:
                return .center
            case .right:
                return .right
        }
    }
}

extension TextJustify: ObjcConvertible {
    public func objcValue() -> TMBTextJustify {
        switch(self) {
            case .auto:
                return .auto
            case .left:
                return .left
            case .center:
                return .center
            case .right:
                return .right
        }
    }
}

// MARK: TEXT_PITCH_ALIGNMENT

/// Orientation of text when map is pitched.
@objc public enum TMBTextPitchAlignment: Int {

    /// The text is aligned to the plane of the map.
    case map

    /// The text is aligned to the plane of the viewport.
    case viewport

    /// Automatically matches the value of {@link TEXT_ROTATION_ALIGNMENT}.
    case auto

}
@objc extension TMBValue {
    @objc public class func textPitchAlignment(_ textPitchAlignment: TMBTextPitchAlignment) -> TMBValue {
        return TMBValue(constant: NSNumber(value: textPitchAlignment.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withTextPitchAlignment textPitchAlignment: TMBTextPitchAlignment) -> NSNumber {
        return NSNumber(value: textPitchAlignment.rawValue)
    }
    
    @objc public func textPitchAlignment() -> TMBTextPitchAlignment {
        return TMBTextPitchAlignment(rawValue: self.intValue)!
    }
}

extension TMBTextPitchAlignment: SwiftValueConvertible {
    public func swiftValue() -> TextPitchAlignment {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
            case .auto:
                return .auto
        }
    }
}

extension TextPitchAlignment: ObjcConvertible {
    public func objcValue() -> TMBTextPitchAlignment {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
            case .auto:
                return .auto
        }
    }
}

// MARK: TEXT_ROTATION_ALIGNMENT

/// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
@objc public enum TMBTextRotationAlignment: Int {

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, aligns text east-west. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, aligns text x-axes with the line.
    case map

    /// Produces glyphs whose x-axes are aligned with the x-axis of the viewport, regardless of the value of {@link SYMBOL_PLACEMENT}.
    case viewport

    /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, this is equivalent to {@link Property#TEXT_ROTATION_ALIGNMENT_VIEWPORT}. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, this is equivalent to {@link Property#TEXT_ROTATION_ALIGNMENT_MAP}.
    case auto

}
@objc extension TMBValue {
    @objc public class func textRotationAlignment(_ textRotationAlignment: TMBTextRotationAlignment) -> TMBValue {
        return TMBValue(constant: NSNumber(value: textRotationAlignment.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withTextRotationAlignment textRotationAlignment: TMBTextRotationAlignment) -> NSNumber {
        return NSNumber(value: textRotationAlignment.rawValue)
    }
    
    @objc public func textRotationAlignment() -> TMBTextRotationAlignment {
        return TMBTextRotationAlignment(rawValue: self.intValue)!
    }
}

extension TMBTextRotationAlignment: SwiftValueConvertible {
    public func swiftValue() -> TextRotationAlignment {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
            case .auto:
                return .auto
        }
    }
}

extension TextRotationAlignment: ObjcConvertible {
    public func objcValue() -> TMBTextRotationAlignment {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
            case .auto:
                return .auto
        }
    }
}

// MARK: TEXT_TRANSFORM

/// Specifies how to capitalize text, similar to the CSS `text-transform` property.
@objc public enum TMBTextTransform: Int {

    /// The text is not altered.
    case none

    /// Forces all letters to be displayed in uppercase.
    case uppercase

    /// Forces all letters to be displayed in lowercase.
    case lowercase

}
@objc extension TMBValue {
    @objc public class func textTransform(_ textTransform: TMBTextTransform) -> TMBValue {
        return TMBValue(constant: NSNumber(value: textTransform.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withTextTransform textTransform: TMBTextTransform) -> NSNumber {
        return NSNumber(value: textTransform.rawValue)
    }
    
    @objc public func textTransform() -> TMBTextTransform {
        return TMBTextTransform(rawValue: self.intValue)!
    }
}

extension TMBTextTransform: SwiftValueConvertible {
    public func swiftValue() -> TextTransform {
        switch(self) {
            case .none:
                return .none
            case .uppercase:
                return .uppercase
            case .lowercase:
                return .lowercase
        }
    }
}

extension TextTransform: ObjcConvertible {
    public func objcValue() -> TMBTextTransform {
        switch(self) {
            case .none:
                return .none
            case .uppercase:
                return .uppercase
            case .lowercase:
                return .lowercase
        }
    }
}

// MARK: FILL_TRANSLATE_ANCHOR

/// Controls the frame of reference for `fill-translate`.
@objc public enum TMBFillTranslateAnchor: Int {

    /// The fill is translated relative to the map.
    case map

    /// The fill is translated relative to the viewport.
    case viewport

}
@objc extension TMBValue {
    @objc public class func fillTranslateAnchor(_ fillTranslateAnchor: TMBFillTranslateAnchor) -> TMBValue {
        return TMBValue(constant: NSNumber(value: fillTranslateAnchor.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withFillTranslateAnchor fillTranslateAnchor: TMBFillTranslateAnchor) -> NSNumber {
        return NSNumber(value: fillTranslateAnchor.rawValue)
    }
    
    @objc public func fillTranslateAnchor() -> TMBFillTranslateAnchor {
        return TMBFillTranslateAnchor(rawValue: self.intValue)!
    }
}

extension TMBFillTranslateAnchor: SwiftValueConvertible {
    public func swiftValue() -> FillTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

extension FillTranslateAnchor: ObjcConvertible {
    public func objcValue() -> TMBFillTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

// MARK: LINE_TRANSLATE_ANCHOR

/// Controls the frame of reference for `line-translate`.
@objc public enum TMBLineTranslateAnchor: Int {

    /// The line is translated relative to the map.
    case map

    /// The line is translated relative to the viewport.
    case viewport

}
@objc extension TMBValue {
    @objc public class func lineTranslateAnchor(_ lineTranslateAnchor: TMBLineTranslateAnchor) -> TMBValue {
        return TMBValue(constant: NSNumber(value: lineTranslateAnchor.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withLineTranslateAnchor lineTranslateAnchor: TMBLineTranslateAnchor) -> NSNumber {
        return NSNumber(value: lineTranslateAnchor.rawValue)
    }
    
    @objc public func lineTranslateAnchor() -> TMBLineTranslateAnchor {
        return TMBLineTranslateAnchor(rawValue: self.intValue)!
    }
}

extension TMBLineTranslateAnchor: SwiftValueConvertible {
    public func swiftValue() -> LineTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

extension LineTranslateAnchor: ObjcConvertible {
    public func objcValue() -> TMBLineTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

// MARK: ICON_TRANSLATE_ANCHOR

/// Controls the frame of reference for `icon-translate`.
@objc public enum TMBIconTranslateAnchor: Int {

    /// Icons are translated relative to the map.
    case map

    /// Icons are translated relative to the viewport.
    case viewport

}
@objc extension TMBValue {
    @objc public class func iconTranslateAnchor(_ iconTranslateAnchor: TMBIconTranslateAnchor) -> TMBValue {
        return TMBValue(constant: NSNumber(value: iconTranslateAnchor.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withIconTranslateAnchor iconTranslateAnchor: TMBIconTranslateAnchor) -> NSNumber {
        return NSNumber(value: iconTranslateAnchor.rawValue)
    }
    
    @objc public func iconTranslateAnchor() -> TMBIconTranslateAnchor {
        return TMBIconTranslateAnchor(rawValue: self.intValue)!
    }
}

extension TMBIconTranslateAnchor: SwiftValueConvertible {
    public func swiftValue() -> IconTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

extension IconTranslateAnchor: ObjcConvertible {
    public func objcValue() -> TMBIconTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

// MARK: TEXT_TRANSLATE_ANCHOR

/// Controls the frame of reference for `text-translate`.
@objc public enum TMBTextTranslateAnchor: Int {

    /// The text is translated relative to the map.
    case map

    /// The text is translated relative to the viewport.
    case viewport

}
@objc extension TMBValue {
    @objc public class func textTranslateAnchor(_ textTranslateAnchor: TMBTextTranslateAnchor) -> TMBValue {
        return TMBValue(constant: NSNumber(value: textTranslateAnchor.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withTextTranslateAnchor textTranslateAnchor: TMBTextTranslateAnchor) -> NSNumber {
        return NSNumber(value: textTranslateAnchor.rawValue)
    }
    
    @objc public func textTranslateAnchor() -> TMBTextTranslateAnchor {
        return TMBTextTranslateAnchor(rawValue: self.intValue)!
    }
}

extension TMBTextTranslateAnchor: SwiftValueConvertible {
    public func swiftValue() -> TextTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

extension TextTranslateAnchor: ObjcConvertible {
    public func objcValue() -> TMBTextTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

// MARK: CIRCLE_PITCH_ALIGNMENT

/// Orientation of circle when map is pitched.
@objc public enum TMBCirclePitchAlignment: Int {

    /// The circle is aligned to the plane of the map.
    case map

    /// The circle is aligned to the plane of the viewport.
    case viewport

}
@objc extension TMBValue {
    @objc public class func circlePitchAlignment(_ circlePitchAlignment: TMBCirclePitchAlignment) -> TMBValue {
        return TMBValue(constant: NSNumber(value: circlePitchAlignment.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withCirclePitchAlignment circlePitchAlignment: TMBCirclePitchAlignment) -> NSNumber {
        return NSNumber(value: circlePitchAlignment.rawValue)
    }
    
    @objc public func circlePitchAlignment() -> TMBCirclePitchAlignment {
        return TMBCirclePitchAlignment(rawValue: self.intValue)!
    }
}

extension TMBCirclePitchAlignment: SwiftValueConvertible {
    public func swiftValue() -> CirclePitchAlignment {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

extension CirclePitchAlignment: ObjcConvertible {
    public func objcValue() -> TMBCirclePitchAlignment {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

// MARK: CIRCLE_PITCH_SCALE

/// Controls the scaling behavior of the circle when the map is pitched.
@objc public enum TMBCirclePitchScale: Int {

    /// Circles are scaled according to their apparent distance to the camera.
    case map

    /// Circles are not scaled.
    case viewport

}
@objc extension TMBValue {
    @objc public class func circlePitchScale(_ circlePitchScale: TMBCirclePitchScale) -> TMBValue {
        return TMBValue(constant: NSNumber(value: circlePitchScale.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withCirclePitchScale circlePitchScale: TMBCirclePitchScale) -> NSNumber {
        return NSNumber(value: circlePitchScale.rawValue)
    }
    
    @objc public func circlePitchScale() -> TMBCirclePitchScale {
        return TMBCirclePitchScale(rawValue: self.intValue)!
    }
}

extension TMBCirclePitchScale: SwiftValueConvertible {
    public func swiftValue() -> CirclePitchScale {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

extension CirclePitchScale: ObjcConvertible {
    public func objcValue() -> TMBCirclePitchScale {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

// MARK: CIRCLE_TRANSLATE_ANCHOR

/// Controls the frame of reference for `circle-translate`.
@objc public enum TMBCircleTranslateAnchor: Int {

    /// The circle is translated relative to the map.
    case map

    /// The circle is translated relative to the viewport.
    case viewport

}
@objc extension TMBValue {
    @objc public class func circleTranslateAnchor(_ circleTranslateAnchor: TMBCircleTranslateAnchor) -> TMBValue {
        return TMBValue(constant: NSNumber(value: circleTranslateAnchor.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withCircleTranslateAnchor circleTranslateAnchor: TMBCircleTranslateAnchor) -> NSNumber {
        return NSNumber(value: circleTranslateAnchor.rawValue)
    }
    
    @objc public func circleTranslateAnchor() -> TMBCircleTranslateAnchor {
        return TMBCircleTranslateAnchor(rawValue: self.intValue)!
    }
}

extension TMBCircleTranslateAnchor: SwiftValueConvertible {
    public func swiftValue() -> CircleTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

extension CircleTranslateAnchor: ObjcConvertible {
    public func objcValue() -> TMBCircleTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

// MARK: FILL_EXTRUSION_TRANSLATE_ANCHOR

/// Controls the frame of reference for `fill-extrusion-translate`.
@objc public enum TMBFillExtrusionTranslateAnchor: Int {

    /// The fill extrusion is translated relative to the map.
    case map

    /// The fill extrusion is translated relative to the viewport.
    case viewport

}
@objc extension TMBValue {
    @objc public class func fillExtrusionTranslateAnchor(_ fillExtrusionTranslateAnchor: TMBFillExtrusionTranslateAnchor) -> TMBValue {
        return TMBValue(constant: NSNumber(value: fillExtrusionTranslateAnchor.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withFillExtrusionTranslateAnchor fillExtrusionTranslateAnchor: TMBFillExtrusionTranslateAnchor) -> NSNumber {
        return NSNumber(value: fillExtrusionTranslateAnchor.rawValue)
    }
    
    @objc public func fillExtrusionTranslateAnchor() -> TMBFillExtrusionTranslateAnchor {
        return TMBFillExtrusionTranslateAnchor(rawValue: self.intValue)!
    }
}

extension TMBFillExtrusionTranslateAnchor: SwiftValueConvertible {
    public func swiftValue() -> FillExtrusionTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

extension FillExtrusionTranslateAnchor: ObjcConvertible {
    public func objcValue() -> TMBFillExtrusionTranslateAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

// MARK: RASTER_RESAMPLING

/// The resampling/interpolation method to use for overscaling, also known as texture magnification filter
@objc public enum TMBRasterResampling: Int {

    /// (Bi)linear filtering interpolates pixel values using the weighted average of the four closest original source pixels creating a smooth but blurry look when overscaled
    case linear

    /// Nearest neighbor filtering interpolates pixel values using the nearest original source pixel creating a sharp but pixelated look when overscaled
    case nearest

}
@objc extension TMBValue {
    @objc public class func rasterResampling(_ rasterResampling: TMBRasterResampling) -> TMBValue {
        return TMBValue(constant: NSNumber(value: rasterResampling.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withRasterResampling rasterResampling: TMBRasterResampling) -> NSNumber {
        return NSNumber(value: rasterResampling.rawValue)
    }
    
    @objc public func rasterResampling() -> TMBRasterResampling {
        return TMBRasterResampling(rawValue: self.intValue)!
    }
}

extension TMBRasterResampling: SwiftValueConvertible {
    public func swiftValue() -> RasterResampling {
        switch(self) {
            case .linear:
                return .linear
            case .nearest:
                return .nearest
        }
    }
}

extension RasterResampling: ObjcConvertible {
    public func objcValue() -> TMBRasterResampling {
        switch(self) {
            case .linear:
                return .linear
            case .nearest:
                return .nearest
        }
    }
}

// MARK: HILLSHADE_ILLUMINATION_ANCHOR

/// Direction of light source when map is rotated.
@objc public enum TMBHillshadeIlluminationAnchor: Int {

    /// The hillshade illumination is relative to the north direction.
    case map

    /// The hillshade illumination is relative to the top of the viewport.
    case viewport

}
@objc extension TMBValue {
    @objc public class func hillshadeIlluminationAnchor(_ hillshadeIlluminationAnchor: TMBHillshadeIlluminationAnchor) -> TMBValue {
        return TMBValue(constant: NSNumber(value: hillshadeIlluminationAnchor.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withHillshadeIlluminationAnchor hillshadeIlluminationAnchor: TMBHillshadeIlluminationAnchor) -> NSNumber {
        return NSNumber(value: hillshadeIlluminationAnchor.rawValue)
    }
    
    @objc public func hillshadeIlluminationAnchor() -> TMBHillshadeIlluminationAnchor {
        return TMBHillshadeIlluminationAnchor(rawValue: self.intValue)!
    }
}

extension TMBHillshadeIlluminationAnchor: SwiftValueConvertible {
    public func swiftValue() -> HillshadeIlluminationAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

extension HillshadeIlluminationAnchor: ObjcConvertible {
    public func objcValue() -> TMBHillshadeIlluminationAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

// MARK: SKY_TYPE

/// The type of the sky
@objc public enum TMBSkyType: Int {

    /// Renders the sky with a gradient that can be configured with {@link SKY_GRADIENT_RADIUS} and {@link SKY_GRADIENT}.
    case gradient

    /// Renders the sky with a simulated atmospheric scattering algorithm, the sun direction can be attached to the light position or explicitly set through {@link SKY_ATMOSPHERE_SUN}.
    case atmosphere

}
@objc extension TMBValue {
    @objc public class func skyType(_ skyType: TMBSkyType) -> TMBValue {
        return TMBValue(constant: NSNumber(value: skyType.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withSkyType skyType: TMBSkyType) -> NSNumber {
        return NSNumber(value: skyType.rawValue)
    }
    
    @objc public func skyType() -> TMBSkyType {
        return TMBSkyType(rawValue: self.intValue)!
    }
}

extension TMBSkyType: SwiftValueConvertible {
    public func swiftValue() -> SkyType {
        switch(self) {
            case .gradient:
                return .gradient
            case .atmosphere:
                return .atmosphere
        }
    }
}

extension SkyType: ObjcConvertible {
    public func objcValue() -> TMBSkyType {
        switch(self) {
            case .gradient:
                return .gradient
            case .atmosphere:
                return .atmosphere
        }
    }
}

// MARK: ANCHOR

/// Whether extruded geometries are lit relative to the map or viewport.
@objc public enum TMBAnchor: Int {

    /// The position of the light source is aligned to the rotation of the map.
    case map

    /// The position of the light source is aligned to the rotation of the viewport.
    case viewport

}
@objc extension TMBValue {
    @objc public class func anchor(_ anchor: TMBAnchor) -> TMBValue {
        return TMBValue(constant: NSNumber(value: anchor.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withAnchor anchor: TMBAnchor) -> NSNumber {
        return NSNumber(value: anchor.rawValue)
    }
    
    @objc public func anchor() -> TMBAnchor {
        return TMBAnchor(rawValue: self.intValue)!
    }
}

extension TMBAnchor: SwiftValueConvertible {
    public func swiftValue() -> Anchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

extension Anchor: ObjcConvertible {
    public func objcValue() -> TMBAnchor {
        switch(self) {
            case .map:
                return .map
            case .viewport:
                return .viewport
        }
    }
}

// MARK: NAME

/// The name of the projection to be used for rendering the map.
@objc public enum TMBStyleProjectionName: Int {

    /// The Mercator projection is the default projection.
    case mercator

    /// A globe projection.
    case globe

}
@objc extension TMBValue {
    @objc public class func styleProjectionName(_ styleProjectionName: TMBStyleProjectionName) -> TMBValue {
        return TMBValue(constant: NSNumber(value: styleProjectionName.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withStyleProjectionName styleProjectionName: TMBStyleProjectionName) -> NSNumber {
        return NSNumber(value: styleProjectionName.rawValue)
    }
    
    @objc public func styleProjectionName() -> TMBStyleProjectionName {
        return TMBStyleProjectionName(rawValue: self.intValue)!
    }
}

extension TMBStyleProjectionName: SwiftValueConvertible {
    public func swiftValue() -> StyleProjectionName {
        switch(self) {
            case .mercator:
                return .mercator
            case .globe:
                return .globe
        }
    }
}

extension StyleProjectionName: ObjcConvertible {
    public func objcValue() -> TMBStyleProjectionName {
        switch(self) {
            case .mercator:
                return .mercator
            case .globe:
                return .globe
        }
    }
}

// MARK: TEXT_WRITING_MODE

/// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
@objc public enum TMBTextWritingMode: Int {

    /// If a text's language supports horizontal writing mode, symbols would be laid out horizontally.
    case horizontal

    /// If a text's language supports vertical writing mode, symbols would be laid out vertically.
    case vertical

}
@objc extension TMBValue {
    @objc public class func textWritingMode(_ textWritingMode: TMBTextWritingMode) -> TMBValue {
        return TMBValue(constant: NSNumber(value: textWritingMode.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(withTextWritingMode textWritingMode: TMBTextWritingMode) -> NSNumber {
        return NSNumber(value: textWritingMode.rawValue)
    }
    
    @objc public func textWritingMode() -> TMBTextWritingMode {
        return TMBTextWritingMode(rawValue: self.intValue)!
    }
}

extension TMBTextWritingMode: SwiftValueConvertible {
    public func swiftValue() -> TextWritingMode {
        switch(self) {
            case .horizontal:
                return .horizontal
            case .vertical:
                return .vertical
        }
    }
}

extension TextWritingMode: ObjcConvertible {
    public func objcValue() -> TMBTextWritingMode {
        switch(self) {
            case .horizontal:
                return .horizontal
            case .vertical:
                return .vertical
        }
    }
}

// End of generated file.
