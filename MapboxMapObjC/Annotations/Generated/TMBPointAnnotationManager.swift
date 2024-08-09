// This file is generated.
import Foundation
import MapboxMaps

import os
import MapboxMaps

@_implementationOnly import MapboxCommon_Private
import MapboxMaps


/// An instance of `PointAnnotationManager` is responsible for a collection of `PointAnnotation`s.
@objc open class TMBPointAnnotationManager: NSObject, TMBAnnotationManager {
    
    @objc public var sourceId: String  {
        origin.sourceId
    }

    @objc public var layerId: String  {
        origin.layerId
    }

    @objc public var id: String {            
        origin.id
    }

    /// The collection of ``PointAnnotation`` being managed.
    @objc public var annotations: [TMBPointAnnotation] {            
        get {
            origin.annotations.map { $0.wrap() }
        }
        set {
            origin.annotations = newValue.map { $0.unwrap() }
        }
    }

    // MARK: - Common layer properties


    /// If true, the icon will be visible even if it collides with other previously drawn symbols.
    @objc public var iconAllowOverlap: NSNumber? {
        get {
            origin.iconAllowOverlap?.bool()
        }
        set {
            origin.iconAllowOverlap = newValue?.bool()
        }
    }

    /// If true, other symbols can be visible even if they collide with the icon.
    @objc public var iconIgnorePlacement: NSNumber? {
        get {
            origin.iconIgnorePlacement?.bool()
        }
        set {
            origin.iconIgnorePlacement = newValue?.bool()
        }
    }

    /// If true, the icon may be flipped to prevent it from being rendered upside-down.
    @objc public var iconKeepUpright: NSNumber? {
        get {
            origin.iconKeepUpright?.bool()
        }
        set {
            origin.iconKeepUpright = newValue?.bool()
        }
    }

    /// If true, text will display without their corresponding icons when the icon collides with other symbols and the text does not.
    @objc public var iconOptional: NSNumber? {
        get {
            origin.iconOptional?.bool()
        }
        set {
            origin.iconOptional = newValue?.bool()
        }
    }

    /// Size of the additional area around the icon bounding box used for detecting symbol collisions.
    @objc public var iconPadding: NSNumber? {
        get {
            origin.iconPadding?.double()
        }
        set {
            origin.iconPadding = newValue?.double()
        }
    }

    /// Orientation of icon when map is pitched.
    @objc public var iconPitchAlignment: TMBIconPitchAlignment? {            
        get {
            origin.iconPitchAlignment?.wrap()
        }
        set {
            origin.iconPitchAlignment = newValue?.unwrap()
        }
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of icons.
    @objc public var iconRotationAlignment: TMBIconRotationAlignment? {            
        get {
            origin.iconRotationAlignment?.wrap()
        }
        set {
            origin.iconRotationAlignment = newValue?.unwrap()
        }
    }

    /// If true, the symbols will not cross tile edges to avoid mutual collisions. Recommended in layers that don't have enough padding in the vector tile to prevent collisions, or if it is a point symbol layer placed after a line symbol layer. When using a client that supports global collision detection, like Mapbox GL JS version 0.42.0 or greater, enabling this property is not needed to prevent clipped labels at tile boundaries.
    @objc public var symbolAvoidEdges: NSNumber? {
        get {
            origin.symbolAvoidEdges?.bool()
        }
        set {
            origin.symbolAvoidEdges = newValue?.bool()
        }
    }

    /// Label placement relative to its geometry.
    @objc public var symbolPlacement: TMBSymbolPlacement? {            
        get {
            origin.symbolPlacement?.wrap()
        }
        set {
            origin.symbolPlacement = newValue?.unwrap()
        }
    }

    /// Distance between two symbol anchors.
    @objc public var symbolSpacing: NSNumber? {
        get {
            origin.symbolSpacing?.double()
        }
        set {
            origin.symbolSpacing = newValue?.double()
        }
    }

    /// Position symbol on buildings (both fill extrusions and models) roof tops. In order to have minimal impact on performance, this is supported only when `fill-extrusion-height` is not zoom-dependent and not edited after initial bucket creation. For fading in buildings when zooming in, fill-extrusion-vertical-scale should be used and symbols would raise with building roofs. Symbols are sorted by elevation, except in case when `viewport-y` sorting or `symbol-sort-key` are applied.
    @objc public var symbolZElevate: NSNumber? {
        get {
            origin.symbolZElevate?.bool()
        }
        set {
            origin.symbolZElevate = newValue?.bool()
        }
    }

    /// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
    @objc public var symbolZOrder: TMBSymbolZOrder? {            
        get {
            origin.symbolZOrder?.wrap()
        }
        set {
            origin.symbolZOrder = newValue?.unwrap()
        }
    }

    /// If true, the text will be visible even if it collides with other previously drawn symbols.
    @objc public var textAllowOverlap: NSNumber? {
        get {
            origin.textAllowOverlap?.bool()
        }
        set {
            origin.textAllowOverlap = newValue?.bool()
        }
    }

    /// Font stack to use for displaying text.
    @objc public var textFont: [String]? {
        get {
            origin.textFont
        }
        set {
            origin.textFont = newValue
        }
    }

    /// If true, other symbols can be visible even if they collide with the text.
    @objc public var textIgnorePlacement: NSNumber? {
        get {
            origin.textIgnorePlacement?.bool()
        }
        set {
            origin.textIgnorePlacement = newValue?.bool()
        }
    }

    /// If true, the text may be flipped vertically to prevent it from being rendered upside-down.
    @objc public var textKeepUpright: NSNumber? {
        get {
            origin.textKeepUpright?.bool()
        }
        set {
            origin.textKeepUpright = newValue?.boolValue
        }
    }

    /// Maximum angle change between adjacent characters.
    @objc public var textMaxAngle: NSNumber? {
        get {
            origin.textMaxAngle?.double()
        }
        set {
            origin.textMaxAngle = newValue?.double()
        }
    }

    /// If true, icons will display without their corresponding text when the text collides with other symbols and the icon does not.
    @objc public var textOptional: NSNumber? {
        get {
            origin.textOptional?.bool()
        }
        set {
            origin.textOptional = newValue?.bool()
        }
    }

    /// Size of the additional area around the text bounding box used for detecting symbol collisions.
    @objc public var textPadding: NSNumber? {
        get {
            origin.textPadding?.double()
        }
        set {
            origin.textPadding = newValue?.double()
        }
    }

    /// Orientation of text when map is pitched.
    @objc public var textPitchAlignment: TMBTextPitchAlignment? {            
        get {
            origin.textPitchAlignment?.wrap()
        }
        set {
            origin.textPitchAlignment = newValue?.unwrap()
        }
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
    @objc public var textRotationAlignment: TMBTextRotationAlignment? {            
        get {
            origin.textRotationAlignment?.wrap()
        }
        set {
            origin.textRotationAlignment = newValue?.unwrap()
        }
    }

    /// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
    @objc public var textVariableAnchor: [TMBTextAnchor]? {
        get {
            origin.textVariableAnchor?.map { $0.wrap() }
        }
        set {
            origin.textVariableAnchor = newValue?.map { $0.unwrap() }
        }
    }

    /// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
    @objc public var textWritingMode: [TMBTextWritingMode]? {
        get {
            origin.textWritingMode?.map { $0.wrap() }
        }
        set {
            origin.textWritingMode = newValue?.map { $0.unwrap() }
        }
    }

    /// Distance that the icon's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc public var iconTranslate: [Double]? {
        get {
            origin.iconTranslate
        }
        set {
            origin.iconTranslate = newValue
        }
    }

    /// Controls the frame of reference for `icon-translate`.
    @objc public var iconTranslateAnchor: TMBIconTranslateAnchor? {            
        get {
            origin.iconTranslateAnchor?.wrap()
        }
        set {
            origin.iconTranslateAnchor = newValue?.unwrap()
        }
    }

    /// Distance that the text's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc public var textTranslate: [Double]? {
        get {
            origin.textTranslate
        }
        set {
            origin.textTranslate = newValue
        }
    }

    /// Controls the frame of reference for `text-translate`.
    @objc public var textTranslateAnchor: TMBTextTranslateAnchor? {            
        get {
            origin.textTranslateAnchor?.wrap()
        }
        set {
            origin.textTranslateAnchor = newValue?.unwrap()
        }
    }

    /// 
    /// Slot for the underlying layer.
    ///
    /// Use this property to position the annotations relative to other map features if you use Mapbox Standard Style.
    /// See <doc:Migrate-to-v11##21-The-Mapbox-Standard-Style> for more info.
    @objc public var slot: String? {            
        get {
            origin.slot
        }
        set {
            origin.slot = newValue
        }
    }
    
    private let origin:PointAnnotationManager
    init(origin: PointAnnotationManager) {
        self.origin = origin
    }
}
extension TMBPointAnnotationManager {
    func unwrap() -> PointAnnotationManager {
        self.origin
    }
}

@objc
extension TMBPointAnnotationManager {
    @objc public func addAnnotations(_ annotations: [TMBPointAnnotation]) {
        self.origin.annotations.append(contentsOf: annotations.map{ $0.unwrap() })
    }
    @objc public func addAnnotation(_ annotation: TMBPointAnnotation) {
        self.origin.annotations.append(annotation.unwrap())
    }
    @objc public func removeAnnotation(_ annotation: TMBPointAnnotation) {
        self.origin.annotations.removeAll(where: { item in
            item.id == annotation.id
        })
    }
    @objc public func removeAnnotationById(_ annotationId: String) {
        self.origin.annotations.removeAll(where: { item in
            item.id == annotationId
        })
    }
    @objc public func removeAllAnnotations() {
        self.origin.annotations.removeAll()
    }
}
extension PointAnnotationManager {
    func wrap() -> TMBPointAnnotationManager {
        TMBPointAnnotationManager(origin: self)
    }
}
