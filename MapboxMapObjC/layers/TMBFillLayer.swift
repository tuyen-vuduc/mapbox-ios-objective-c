// This file is generated.
import Foundation
import MapboxMaps

/// A filled polygon with an optional stroked border.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-fill)
@objc open class TMBFillLayer: TMBLayer {
    private var _self: FillLayer {
        get {
            return rawValue as! FillLayer
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public init(id: String = UUID().uuidString) {
        super.init(FillLayer(id: id))
        
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

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var fillSortKey : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillSortKey)
        }
        set {
            _self.fillSortKey = newValue?.double()
        }
    }

    /// Whether or not the fill should be antialiased.
    @objc public var fillAntialias : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillAntialias)
        }
        set {
            _self.fillAntialias = newValue?.boolean()
        }
    }

    /// The color of the filled part of this layer. This color can be specified as `rgba` with an alpha component and the color's opacity will not affect the opacity of the 1px stroke, if it is used.
    @objc public var fillColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillColor)
        }
        set {
            _self.fillColor = newValue?.styleColor()
        }
    }

    /// Transition options for `fillColor`.
    @objc public var fillColorTransition : TMBStyleTransition? {
                get {
                    return _self.fillColorTransition?.objcValue()
                }
                set {
                    _self.fillColorTransition = newValue?.rawValue
                }
            }

    /// The opacity of the entire fill layer. In contrast to the `fill-color`, this value will also affect the 1px stroke around the fill, if the stroke is used.
    @objc public var fillOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillOpacity)
        }
        set {
            _self.fillOpacity = newValue?.double()
        }
    }

    /// Transition options for `fillOpacity`.
    @objc public var fillOpacityTransition : TMBStyleTransition? {
                get {
                    return _self.fillOpacityTransition?.objcValue()
                }
                set {
                    _self.fillOpacityTransition = newValue?.rawValue
                }
            }

    /// The outline color of the fill. Matches the value of `fill-color` if unspecified.
    @objc public var fillOutlineColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillOutlineColor)
        }
        set {
            _self.fillOutlineColor = newValue?.styleColor()
        }
    }

    /// Transition options for `fillOutlineColor`.
    @objc public var fillOutlineColorTransition : TMBStyleTransition? {
                get {
                    return _self.fillOutlineColorTransition?.objcValue()
                }
                set {
                    _self.fillOutlineColorTransition = newValue?.rawValue
                }
            }

    /// Name of image in sprite to use for drawing image fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var fillPattern : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillPattern)
        }
        set {
            _self.fillPattern = newValue?.resolvedImage()
        }
    }

    /// Transition options for `fillPattern`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    @objc public var fillPatternTransition : TMBStyleTransition? {
                get {
                    return _self.fillPatternTransition?.objcValue()
                }
                set {
                    _self.fillPatternTransition = newValue?.rawValue
                }
            }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var fillTranslate : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillTranslate)
        }
        set {
            _self.fillTranslate = newValue?.arrayOfDouble()
        }
    }

    /// Transition options for `fillTranslate`.
    @objc public var fillTranslateTransition : TMBStyleTransition? {
                get {
                    return _self.fillTranslateTransition?.objcValue()
                }
                set {
                    _self.fillTranslateTransition = newValue?.rawValue
                }
            }

    /// Controls the frame of reference for `fill-translate`.
    @objc public var fillTranslateAnchor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillTranslateAnchor)
        }
        set {
            _self.fillTranslateAnchor = newValue?.fillTranslateAnchor()
        }
    }
}
