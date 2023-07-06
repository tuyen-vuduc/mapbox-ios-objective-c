// This file is generated.
import Foundation
import MapboxMaps

/// Raster map textures such as satellite imagery.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-raster)
@objc open class TMBRasterLayer: TMBLayer {
    private var _self: RasterLayer {
        get {
            return rawValue as! RasterLayer
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(RasterLayer(id: id))
    }
    
    public init(_ rawValue: RasterLayer) {
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

    /// Increase or reduce the brightness of the image. The value is the maximum brightness.
    @objc public var rasterBrightnessMax : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.rasterBrightnessMax)
        }
        set {
            _self.rasterBrightnessMax = newValue?.double()
        }
    }

    /// Transition options for `rasterBrightnessMax`.
    @objc public var rasterBrightnessMaxTransition : TMBStyleTransition? {
                get {
                    return _self.rasterBrightnessMaxTransition?.objcValue()
                }
                set {
                    _self.rasterBrightnessMaxTransition = newValue?.rawValue
                }
            }

    /// Increase or reduce the brightness of the image. The value is the minimum brightness.
    @objc public var rasterBrightnessMin : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.rasterBrightnessMin)
        }
        set {
            _self.rasterBrightnessMin = newValue?.double()
        }
    }

    /// Transition options for `rasterBrightnessMin`.
    @objc public var rasterBrightnessMinTransition : TMBStyleTransition? {
                get {
                    return _self.rasterBrightnessMinTransition?.objcValue()
                }
                set {
                    _self.rasterBrightnessMinTransition = newValue?.rawValue
                }
            }

    /// Increase or reduce the contrast of the image.
    @objc public var rasterContrast : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.rasterContrast)
        }
        set {
            _self.rasterContrast = newValue?.double()
        }
    }

    /// Transition options for `rasterContrast`.
    @objc public var rasterContrastTransition : TMBStyleTransition? {
                get {
                    return _self.rasterContrastTransition?.objcValue()
                }
                set {
                    _self.rasterContrastTransition = newValue?.rawValue
                }
            }

    /// Fade duration when a new tile is added.
    @objc public var rasterFadeDuration : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.rasterFadeDuration)
        }
        set {
            _self.rasterFadeDuration = newValue?.double()
        }
    }

    /// Rotates hues around the color wheel.
    @objc public var rasterHueRotate : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.rasterHueRotate)
        }
        set {
            _self.rasterHueRotate = newValue?.double()
        }
    }

    /// Transition options for `rasterHueRotate`.
    @objc public var rasterHueRotateTransition : TMBStyleTransition? {
                get {
                    return _self.rasterHueRotateTransition?.objcValue()
                }
                set {
                    _self.rasterHueRotateTransition = newValue?.rawValue
                }
            }

    /// The opacity at which the image will be drawn.
    @objc public var rasterOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.rasterOpacity)
        }
        set {
            _self.rasterOpacity = newValue?.double()
        }
    }

    /// Transition options for `rasterOpacity`.
    @objc public var rasterOpacityTransition : TMBStyleTransition? {
                get {
                    return _self.rasterOpacityTransition?.objcValue()
                }
                set {
                    _self.rasterOpacityTransition = newValue?.rawValue
                }
            }

    /// The resampling/interpolation method to use for overscaling, also known as texture magnification filter
    @objc public var rasterResampling : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.rasterResampling)
        }
        set {
            _self.rasterResampling = newValue?.rasterResampling()
        }
    }

    /// Increase or reduce the saturation of the image.
    @objc public var rasterSaturation : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.rasterSaturation)
        }
        set {
            _self.rasterSaturation = newValue?.double()
        }
    }

    /// Transition options for `rasterSaturation`.
    @objc public var rasterSaturationTransition : TMBStyleTransition? {
                get {
                    return _self.rasterSaturationTransition?.objcValue()
                }
                set {
                    _self.rasterSaturationTransition = newValue?.rawValue
                }
            }
}
