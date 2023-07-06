// This file is generated.
import Foundation
import MapboxMaps

/// A filled circle.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-circle)
@objc open class TMBCircleLayer: TMBLayer {
    private var _self: CircleLayer {
        get {
            return rawValue as! CircleLayer
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(CircleLayer(id: id))
    }
    
    public init(_ rawValue: CircleLayer) {
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

    /// Sorts features in ascending order based on this value. Features with a higher sort key will appear above features with a lower sort key.
    @objc public var circleSortKey : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circleSortKey)
        }
        set {
            _self.circleSortKey = newValue?.double()
        }
    }

    /// Amount to blur the circle. 1 blurs the circle such that only the centerpoint is full opacity.
    @objc public var circleBlur : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circleBlur)
        }
        set {
            _self.circleBlur = newValue?.double()
        }
    }

    /// Transition options for `circleBlur`.
    @objc public var circleBlurTransition : TMBStyleTransition? {
                get {
                    return _self.circleBlurTransition?.objcValue()
                }
                set {
                    _self.circleBlurTransition = newValue?.rawValue
                }
            }

    /// The fill color of the circle.
    @objc public var circleColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circleColor)
        }
        set {
            _self.circleColor = newValue?.styleColor()
        }
    }

    /// Transition options for `circleColor`.
    @objc public var circleColorTransition : TMBStyleTransition? {
                get {
                    return _self.circleColorTransition?.objcValue()
                }
                set {
                    _self.circleColorTransition = newValue?.rawValue
                }
            }

    /// The opacity at which the circle will be drawn.
    @objc public var circleOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circleOpacity)
        }
        set {
            _self.circleOpacity = newValue?.double()
        }
    }

    /// Transition options for `circleOpacity`.
    @objc public var circleOpacityTransition : TMBStyleTransition? {
                get {
                    return _self.circleOpacityTransition?.objcValue()
                }
                set {
                    _self.circleOpacityTransition = newValue?.rawValue
                }
            }

    /// Orientation of circle when map is pitched.
    @objc public var circlePitchAlignment : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circlePitchAlignment)
        }
        set {
            _self.circlePitchAlignment = newValue?.circlePitchAlignment()
        }
    }

    /// Controls the scaling behavior of the circle when the map is pitched.
    @objc public var circlePitchScale : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circlePitchScale)
        }
        set {
            _self.circlePitchScale = newValue?.circlePitchScale()
        }
    }

    /// Circle radius.
    @objc public var circleRadius : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circleRadius)
        }
        set {
            _self.circleRadius = newValue?.double()
        }
    }

    /// Transition options for `circleRadius`.
    @objc public var circleRadiusTransition : TMBStyleTransition? {
                get {
                    return _self.circleRadiusTransition?.objcValue()
                }
                set {
                    _self.circleRadiusTransition = newValue?.rawValue
                }
            }

    /// The stroke color of the circle.
    @objc public var circleStrokeColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circleStrokeColor)
        }
        set {
            _self.circleStrokeColor = newValue?.styleColor()
        }
    }

    /// Transition options for `circleStrokeColor`.
    @objc public var circleStrokeColorTransition : TMBStyleTransition? {
                get {
                    return _self.circleStrokeColorTransition?.objcValue()
                }
                set {
                    _self.circleStrokeColorTransition = newValue?.rawValue
                }
            }

    /// The opacity of the circle's stroke.
    @objc public var circleStrokeOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circleStrokeOpacity)
        }
        set {
            _self.circleStrokeOpacity = newValue?.double()
        }
    }

    /// Transition options for `circleStrokeOpacity`.
    @objc public var circleStrokeOpacityTransition : TMBStyleTransition? {
                get {
                    return _self.circleStrokeOpacityTransition?.objcValue()
                }
                set {
                    _self.circleStrokeOpacityTransition = newValue?.rawValue
                }
            }

    /// The width of the circle's stroke. Strokes are placed outside of the `circle-radius`.
    @objc public var circleStrokeWidth : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circleStrokeWidth)
        }
        set {
            _self.circleStrokeWidth = newValue?.double()
        }
    }

    /// Transition options for `circleStrokeWidth`.
    @objc public var circleStrokeWidthTransition : TMBStyleTransition? {
                get {
                    return _self.circleStrokeWidthTransition?.objcValue()
                }
                set {
                    _self.circleStrokeWidthTransition = newValue?.rawValue
                }
            }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
    @objc public var circleTranslate : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circleTranslate)
        }
        set {
            _self.circleTranslate = newValue?.arrayOfDouble()
        }
    }

    /// Transition options for `circleTranslate`.
    @objc public var circleTranslateTransition : TMBStyleTransition? {
                get {
                    return _self.circleTranslateTransition?.objcValue()
                }
                set {
                    _self.circleTranslateTransition = newValue?.rawValue
                }
            }

    /// Controls the frame of reference for `circle-translate`.
    @objc public var circleTranslateAnchor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.circleTranslateAnchor)
        }
        set {
            _self.circleTranslateAnchor = newValue?.circleTranslateAnchor()
        }
    }
}
