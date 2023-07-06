// This file is generated.
import Foundation
import MapboxMaps

/// The background color or pattern of the map.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-background)
@objc open class TMBBackgroundLayer: TMBLayer {
    private var _self: BackgroundLayer {
        get {
            return rawValue as! BackgroundLayer
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(BackgroundLayer(id: id))
    }
    
    public init(_ rawValue: BackgroundLayer) {
        super.init(rawValue)
        
        self.visibility = TMBValue(constant: TMBVisibility.visible)
    }
    
    /// Whether this layer is displayed.
    @objc public var visibility : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.visibility)
        }
        set {
            _self.visibility = newValue?.visibility()
        }
    }
    
    /// The color with which the background will be drawn.
    @objc public var backgroundColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.backgroundColor)
        }
        set {
            _self.backgroundColor = newValue?.styleColor()
        }
    }
    
    /// Transition options for `backgroundColor`.
    @objc public var backgroundColorTransition : TMBStyleTransition? {
        get {
            return _self.backgroundColorTransition?.objcValue()
        }
        set {
            _self.backgroundColorTransition = newValue?.rawValue
        }
    }
    
    /// The opacity at which the background will be drawn.
    @objc public var backgroundOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.backgroundOpacity)
        }
        set {
            _self.backgroundOpacity = newValue?.double()
        }
    }
    
    /// Transition options for `backgroundOpacity`.
    @objc public var backgroundOpacityTransition : TMBStyleTransition? {
        get {
            return _self.backgroundOpacityTransition?.objcValue()
        }
        set {
            _self.backgroundOpacityTransition = newValue?.rawValue
        }
    }
    
    /// Name of image in sprite to use for drawing an image background. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var backgroundPattern : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.backgroundPattern)
        }
        set {
            _self.backgroundPattern = newValue?.resolvedImage()
        }
    }
    
    /// Transition options for `backgroundPattern`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    @objc public var backgroundPatternTransition : TMBStyleTransition? {
        get {
            return _self.backgroundPatternTransition?.objcValue()
        }
        set {
            _self.backgroundPatternTransition = newValue?.rawValue
        }
    }
}
