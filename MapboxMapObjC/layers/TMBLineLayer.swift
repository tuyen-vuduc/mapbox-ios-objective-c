// This file is generated.
import Foundation
import MapboxMaps

/// A stroked line.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-line)
@objc open class TMBLineLayer: TMBLayer {
    private var _self: LineLayer {
        get {
            return rawValue as! LineLayer
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(LineLayer(id: id))
    }
    
    public init(_ rawValue: LineLayer) {
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

    /// The display of line endings.
    @objc public var lineCap : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineCap)
        }
        set {
            _self.lineCap = newValue?.lineCap()
        }
    }

    /// The display of lines when joining.
    @objc public var lineJoin : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineJoin)
        }
        set {
            _self.lineJoin = newValue?.lineJoin()
        }
    }

    /// Used to automatically convert miter joins to bevel joins for sharp angles.
    @objc public var lineMiterLimit : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineMiterLimit)
        }
        set {
            _self.lineMiterLimit = newValue?.double()
        }
    }

    /// Used to automatically convert round joins to miter joins for shallow angles.
    @objc public var lineRoundLimit : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineRoundLimit)
        }
        set {
            _self.lineRoundLimit = newValue?.double()
        }
    }

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var lineSortKey : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineSortKey)
        }
        set {
            _self.lineSortKey = newValue?.double()
        }
    }

    /// Blur applied to the line, in pixels.
    @objc public var lineBlur : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineBlur)
        }
        set {
            _self.lineBlur = newValue?.double()
        }
    }

    /// Transition options for `lineBlur`.
    @objc public var lineBlurTransition : TMBStyleTransition? {
                get {
                    return _self.lineBlurTransition?.objcValue()
                }
                set {
                    _self.lineBlurTransition = newValue?.rawValue
                }
            }

    /// The color with which the line will be drawn.
    @objc public var lineColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineColor)
        }
        set {
            _self.lineColor = newValue?.styleColor()
        }
    }

    /// Transition options for `lineColor`.
    @objc public var lineColorTransition : TMBStyleTransition? {
                get {
                    return _self.lineColorTransition?.objcValue()
                }
                set {
                    _self.lineColorTransition = newValue?.rawValue
                }
            }

    /// Specifies the lengths of the alternating dashes and gaps that form the dash pattern. The lengths are later scaled by the line width. To convert a dash length to pixels, multiply the length by the current line width. Note that GeoJSON sources with `lineMetrics: true` specified won't render dashed lines to the expected scale. Also note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var lineDasharray : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineDasharray)
        }
        set {
            _self.lineDasharray = newValue?.arrayOfDouble()
        }
    }

    /// Transition options for `lineDasharray`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    @objc public var lineDasharrayTransition : TMBStyleTransition? {
                get {
                    return _self.lineDasharrayTransition?.objcValue()
                }
                set {
                    _self.lineDasharrayTransition = newValue?.rawValue
                }
            }

    /// Draws a line casing outside of a line's actual path. Value indicates the width of the inner gap.
    @objc public var lineGapWidth : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineGapWidth)
        }
        set {
            _self.lineGapWidth = newValue?.double()
        }
    }

    /// Transition options for `lineGapWidth`.
    @objc public var lineGapWidthTransition : TMBStyleTransition? {
                get {
                    return _self.lineGapWidthTransition?.objcValue()
                }
                set {
                    _self.lineGapWidthTransition = newValue?.rawValue
                }
            }

    /// Defines a gradient with which to color a line feature. Can only be used with GeoJSON sources that specify `"lineMetrics": true`.
    @objc public var lineGradient : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineGradient)
        }
        set {
            _self.lineGradient = newValue?.styleColor()
        }
    }

    /// The line's offset. For linear features, a positive value offsets the line to the right, relative to the direction of the line, and a negative value to the left. For polygon features, a positive value results in an inset, and a negative value results in an outset.
    @objc public var lineOffset : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineOffset)
        }
        set {
            _self.lineOffset = newValue?.double()
        }
    }

    /// Transition options for `lineOffset`.
    @objc public var lineOffsetTransition : TMBStyleTransition? {
                get {
                    return _self.lineOffsetTransition?.objcValue()
                }
                set {
                    _self.lineOffsetTransition = newValue?.rawValue
                }
            }

    /// The opacity at which the line will be drawn.
    @objc public var lineOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineOpacity)
        }
        set {
            _self.lineOpacity = newValue?.double()
        }
    }

    /// Transition options for `lineOpacity`.
    @objc public var lineOpacityTransition : TMBStyleTransition? {
                get {
                    return _self.lineOpacityTransition?.objcValue()
                }
                set {
                    _self.lineOpacityTransition = newValue?.rawValue
                }
            }

    /// Name of image in sprite to use for drawing image lines. For seamless patterns, image width must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var linePattern : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.linePattern)
        }
        set {
            _self.linePattern = newValue?.resolvedImage()
        }
    }

    /// Transition options for `linePattern`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    @objc public var linePatternTransition : TMBStyleTransition? {
                get {
                    return _self.linePatternTransition?.objcValue()
                }
                set {
                    _self.linePatternTransition = newValue?.rawValue
                }
            }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var lineTranslate : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineTranslate)
        }
        set {
            _self.lineTranslate = newValue?.arrayOfDouble()
        }
    }

    /// Transition options for `lineTranslate`.
    @objc public var lineTranslateTransition : TMBStyleTransition? {
                get {
                    return _self.lineTranslateTransition?.objcValue()
                }
                set {
                    _self.lineTranslateTransition = newValue?.rawValue
                }
            }

    /// Controls the frame of reference for `line-translate`.
    @objc public var lineTranslateAnchor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineTranslateAnchor)
        }
        set {
            _self.lineTranslateAnchor = newValue?.lineTranslateAnchor()
        }
    }

    /// The line part between [trim-start, trim-end] will be marked as transparent to make a route vanishing effect. The line trim-off offset is based on the whole line range [0.0, 1.0].
    @objc public var lineTrimOffset : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineTrimOffset)
        }
        set {
            _self.lineTrimOffset = newValue?.arrayOfDouble()
        }
    }

    /// Stroke thickness.
    @objc public var lineWidth : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.lineWidth)
        }
        set {
            _self.lineWidth = newValue?.double()
        }
    }

    /// Transition options for `lineWidth`.
    @objc public var lineWidthTransition : TMBStyleTransition? {
                get {
                    return _self.lineWidthTransition?.objcValue()
                }
                set {
                    _self.lineWidthTransition = newValue?.rawValue
                }
            }
}
