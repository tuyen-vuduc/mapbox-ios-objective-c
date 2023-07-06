// This file is generated.
import Foundation
import MapboxMaps

/// Location Indicator layer.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-location-indicator)
@objc open class TMBLocationIndicatorLayer: TMBLayer {
    private var _self: LocationIndicatorLayer {
        get {
            return rawValue as! LocationIndicatorLayer
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(LocationIndicatorLayer(id: id))
    }
    
    public init(_ rawValue: LocationIndicatorLayer) {
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

    /// Name of image in sprite to use as the middle of the location indicator.
    @objc public var bearingImage : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.bearingImage)
        }
        set {
            _self.bearingImage = newValue?.resolvedImage()
        }
    }

    /// Name of image in sprite to use as the background of the location indicator.
    @objc public var shadowImage : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.shadowImage)
        }
        set {
            _self.shadowImage = newValue?.resolvedImage()
        }
    }

    /// Name of image in sprite to use as the top of the location indicator.
    @objc public var topImage : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.topImage)
        }
        set {
            _self.topImage = newValue?.resolvedImage()
        }
    }

    /// The accuracy, in meters, of the position source used to retrieve the position of the location indicator.
    @objc public var accuracyRadius : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.accuracyRadius)
        }
        set {
            _self.accuracyRadius = newValue?.double()
        }
    }

    /// Transition options for `accuracyRadius`.
    @objc public var accuracyRadiusTransition : TMBStyleTransition? {
                get {
                    return _self.accuracyRadiusTransition?.objcValue()
                }
                set {
                    _self.accuracyRadiusTransition = newValue?.rawValue
                }
            }

    /// The color for drawing the accuracy radius border. To adjust transparency, set the alpha component of the color accordingly.
    @objc public var accuracyRadiusBorderColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.accuracyRadiusBorderColor)
        }
        set {
            _self.accuracyRadiusBorderColor = newValue?.styleColor()
        }
    }

    /// Transition options for `accuracyRadiusBorderColor`.
    @objc public var accuracyRadiusBorderColorTransition : TMBStyleTransition? {
                get {
                    return _self.accuracyRadiusBorderColorTransition?.objcValue()
                }
                set {
                    _self.accuracyRadiusBorderColorTransition = newValue?.rawValue
                }
            }

    /// The color for drawing the accuracy radius, as a circle. To adjust transparency, set the alpha component of the color accordingly.
    @objc public var accuracyRadiusColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.accuracyRadiusColor)
        }
        set {
            _self.accuracyRadiusColor = newValue?.styleColor()
        }
    }

    /// Transition options for `accuracyRadiusColor`.
    @objc public var accuracyRadiusColorTransition : TMBStyleTransition? {
                get {
                    return _self.accuracyRadiusColorTransition?.objcValue()
                }
                set {
                    _self.accuracyRadiusColorTransition = newValue?.rawValue
                }
            }

    /// The bearing of the location indicator.
    @objc public var bearing : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.bearing)
        }
        set {
            _self.bearing = newValue?.double()
        }
    }

    /// Transition options for `bearing`.
    @objc public var bearingTransition : TMBStyleTransition? {
                get {
                    return _self.bearingTransition?.objcValue()
                }
                set {
                    _self.bearingTransition = newValue?.rawValue
                }
            }

    /// The size of the bearing image, as a scale factor applied to the size of the specified image.
    @objc public var bearingImageSize : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.bearingImageSize)
        }
        set {
            _self.bearingImageSize = newValue?.double()
        }
    }

    /// Transition options for `bearingImageSize`.
    @objc public var bearingImageSizeTransition : TMBStyleTransition? {
                get {
                    return _self.bearingImageSizeTransition?.objcValue()
                }
                set {
                    _self.bearingImageSizeTransition = newValue?.rawValue
                }
            }

    /// The color of the circle emphasizing the indicator. To adjust transparency, set the alpha component of the color accordingly.
    @objc public var emphasisCircleColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.emphasisCircleColor)
        }
        set {
            _self.emphasisCircleColor = newValue?.styleColor()
        }
    }

    /// Transition options for `emphasisCircleColor`.
    @objc public var emphasisCircleColorTransition : TMBStyleTransition? {
                get {
                    return _self.emphasisCircleColorTransition?.objcValue()
                }
                set {
                    _self.emphasisCircleColorTransition = newValue?.rawValue
                }
            }

    /// The radius, in pixel, of the circle emphasizing the indicator, drawn between the accuracy radius and the indicator shadow.
    @objc public var emphasisCircleRadius : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.emphasisCircleRadius)
        }
        set {
            _self.emphasisCircleRadius = newValue?.double()
        }
    }

    /// Transition options for `emphasisCircleRadius`.
    @objc public var emphasisCircleRadiusTransition : TMBStyleTransition? {
                get {
                    return _self.emphasisCircleRadiusTransition?.objcValue()
                }
                set {
                    _self.emphasisCircleRadiusTransition = newValue?.rawValue
                }
            }

    /// The displacement off the center of the top image and the shadow image when the pitch of the map is greater than 0. This helps producing a three-dimensional appearence.
    @objc public var imagePitchDisplacement : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.imagePitchDisplacement)
        }
        set {
            _self.imagePitchDisplacement = newValue?.double()
        }
    }

    /// An array of [latitude, longitude, altitude] position of the location indicator.
    @objc public var location : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.location)
        }
        set {
            _self.location = newValue?.arrayOfDouble()
        }
    }

    /// Transition options for `location`.
    @objc public var locationTransition : TMBStyleTransition? {
                get {
                    return _self.locationTransition?.objcValue()
                }
                set {
                    _self.locationTransition = newValue?.rawValue
                }
            }

    /// The opacity of the entire location indicator layer.
    @objc public var locationIndicatorOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.locationIndicatorOpacity)
        }
        set {
            _self.locationIndicatorOpacity = newValue?.double()
        }
    }

    /// Transition options for `locationIndicatorOpacity`.
    @objc public var locationIndicatorOpacityTransition : TMBStyleTransition? {
                get {
                    return _self.locationIndicatorOpacityTransition?.objcValue()
                }
                set {
                    _self.locationIndicatorOpacityTransition = newValue?.rawValue
                }
            }

    /// The amount of the perspective compensation, between 0 and 1. A value of 1 produces a location indicator of constant width across the screen. A value of 0 makes it scale naturally according to the viewing projection.
    @objc public var perspectiveCompensation : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.perspectiveCompensation)
        }
        set {
            _self.perspectiveCompensation = newValue?.double()
        }
    }

    /// The size of the shadow image, as a scale factor applied to the size of the specified image.
    @objc public var shadowImageSize : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.shadowImageSize)
        }
        set {
            _self.shadowImageSize = newValue?.double()
        }
    }

    /// Transition options for `shadowImageSize`.
    @objc public var shadowImageSizeTransition : TMBStyleTransition? {
                get {
                    return _self.shadowImageSizeTransition?.objcValue()
                }
                set {
                    _self.shadowImageSizeTransition = newValue?.rawValue
                }
            }

    /// The size of the top image, as a scale factor applied to the size of the specified image.
    @objc public var topImageSize : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.topImageSize)
        }
        set {
            _self.topImageSize = newValue?.double()
        }
    }

    /// Transition options for `topImageSize`.
    @objc public var topImageSizeTransition : TMBStyleTransition? {
                get {
                    return _self.topImageSizeTransition?.objcValue()
                }
                set {
                    _self.topImageSizeTransition = newValue?.rawValue
                }
            }
}
