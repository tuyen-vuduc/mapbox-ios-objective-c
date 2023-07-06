// This file is generated.
import Foundation
import MapboxMaps

/// An extruded (3D) polygon.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-fill-extrusion)
@objc open class TMBFillExtrusionLayer: TMBLayer {
    private var _self: FillExtrusionLayer {
        get {
            return rawValue as! FillExtrusionLayer
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(FillExtrusionLayer(id: id))
    }
    
    public init(_ rawValue: FillExtrusionLayer) {
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

    /// Controls the intensity of shading near ground and concave angles between walls. Default value 0.0 disables ambient occlusion and values around 0.3 provide the most plausible results for buildings.
    @objc public var fillExtrusionAmbientOcclusionIntensity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillExtrusionAmbientOcclusionIntensity)
        }
        set {
            _self.fillExtrusionAmbientOcclusionIntensity = newValue?.double()
        }
    }

    /// Transition options for `fillExtrusionAmbientOcclusionIntensity`.
    @objc public var fillExtrusionAmbientOcclusionIntensityTransition : TMBStyleTransition? {
                get {
                    return _self.fillExtrusionAmbientOcclusionIntensityTransition?.objcValue()
                }
                set {
                    _self.fillExtrusionAmbientOcclusionIntensityTransition = newValue?.rawValue
                }
            }

    /// Shades area near ground and concave angles between walls where the radius defines only vertical impact. Default value 3.0 corresponds to height of one floor and brings the most plausible results for buildings.
    @objc public var fillExtrusionAmbientOcclusionRadius : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillExtrusionAmbientOcclusionRadius)
        }
        set {
            _self.fillExtrusionAmbientOcclusionRadius = newValue?.double()
        }
    }

    /// Transition options for `fillExtrusionAmbientOcclusionRadius`.
    @objc public var fillExtrusionAmbientOcclusionRadiusTransition : TMBStyleTransition? {
                get {
                    return _self.fillExtrusionAmbientOcclusionRadiusTransition?.objcValue()
                }
                set {
                    _self.fillExtrusionAmbientOcclusionRadiusTransition = newValue?.rawValue
                }
            }

    /// The height with which to extrude the base of this layer. Must be less than or equal to `fill-extrusion-height`.
    @objc public var fillExtrusionBase : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillExtrusionBase)
        }
        set {
            _self.fillExtrusionBase = newValue?.double()
        }
    }

    /// Transition options for `fillExtrusionBase`.
    @objc public var fillExtrusionBaseTransition : TMBStyleTransition? {
                get {
                    return _self.fillExtrusionBaseTransition?.objcValue()
                }
                set {
                    _self.fillExtrusionBaseTransition = newValue?.rawValue
                }
            }

    /// The base color of the extruded fill. The extrusion's surfaces will be shaded differently based on this color in combination with the root `light` settings. If this color is specified as `rgba` with an alpha component, the alpha component will be ignored; use `fill-extrusion-opacity` to set layer opacity.
    @objc public var fillExtrusionColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillExtrusionColor)
        }
        set {
            _self.fillExtrusionColor = newValue?.styleColor()
        }
    }

    /// Transition options for `fillExtrusionColor`.
    @objc public var fillExtrusionColorTransition : TMBStyleTransition? {
                get {
                    return _self.fillExtrusionColorTransition?.objcValue()
                }
                set {
                    _self.fillExtrusionColorTransition = newValue?.rawValue
                }
            }

    /// The height with which to extrude this layer.
    @objc public var fillExtrusionHeight : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillExtrusionHeight)
        }
        set {
            _self.fillExtrusionHeight = newValue?.double()
        }
    }

    /// Transition options for `fillExtrusionHeight`.
    @objc public var fillExtrusionHeightTransition : TMBStyleTransition? {
                get {
                    return _self.fillExtrusionHeightTransition?.objcValue()
                }
                set {
                    _self.fillExtrusionHeightTransition = newValue?.rawValue
                }
            }

    /// The opacity of the entire fill extrusion layer. This is rendered on a per-layer, not per-feature, basis, and data-driven styling is not available.
    @objc public var fillExtrusionOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillExtrusionOpacity)
        }
        set {
            _self.fillExtrusionOpacity = newValue?.double()
        }
    }

    /// Transition options for `fillExtrusionOpacity`.
    @objc public var fillExtrusionOpacityTransition : TMBStyleTransition? {
                get {
                    return _self.fillExtrusionOpacityTransition?.objcValue()
                }
                set {
                    _self.fillExtrusionOpacityTransition = newValue?.rawValue
                }
            }

    /// Name of image in sprite to use for drawing images on extruded fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var fillExtrusionPattern : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillExtrusionPattern)
        }
        set {
            _self.fillExtrusionPattern = newValue?.resolvedImage()
        }
    }

    /// Transition options for `fillExtrusionPattern`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    @objc public var fillExtrusionPatternTransition : TMBStyleTransition? {
                get {
                    return _self.fillExtrusionPatternTransition?.objcValue()
                }
                set {
                    _self.fillExtrusionPatternTransition = newValue?.rawValue
                }
            }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up (on the flat plane), respectively.
    @objc public var fillExtrusionTranslate : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillExtrusionTranslate)
        }
        set {
            _self.fillExtrusionTranslate = newValue?.arrayOfDouble()
        }
    }

    /// Transition options for `fillExtrusionTranslate`.
    @objc public var fillExtrusionTranslateTransition : TMBStyleTransition? {
                get {
                    return _self.fillExtrusionTranslateTransition?.objcValue()
                }
                set {
                    _self.fillExtrusionTranslateTransition = newValue?.rawValue
                }
            }

    /// Controls the frame of reference for `fill-extrusion-translate`.
    @objc public var fillExtrusionTranslateAnchor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillExtrusionTranslateAnchor)
        }
        set {
            _self.fillExtrusionTranslateAnchor = newValue?.fillExtrusionTranslateAnchor()
        }
    }

    /// Whether to apply a vertical gradient to the sides of a fill-extrusion layer. If true, sides will be shaded slightly darker farther down.
    @objc public var fillExtrusionVerticalGradient : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.fillExtrusionVerticalGradient)
        }
        set {
            _self.fillExtrusionVerticalGradient = newValue?.boolean()
        }
    }
}
