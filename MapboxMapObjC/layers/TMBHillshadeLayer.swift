// This file is generated.
import Foundation
import MapboxMaps

/// Client-side hillshading visualization based on DEM data. Currently, the implementation only supports Mapbox Terrain RGB and Mapzen Terrarium tiles.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-hillshade)
@objc open class TMBHillshadeLayer: TMBLayer {
    private var _self: HillshadeLayer {
        get {
            return rawValue as! HillshadeLayer
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public init(id: String = UUID().uuidString) {
        super.init(HillshadeLayer(id: id))
        
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

    /// The shading color used to accentuate rugged terrain like sharp cliffs and gorges.
    @objc public var hillshadeAccentColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.hillshadeAccentColor)
        }
        set {
            _self.hillshadeAccentColor = newValue?.styleColor()
        }
    }

    /// Transition options for `hillshadeAccentColor`.
    @objc public var hillshadeAccentColorTransition : TMBStyleTransition? {
                get {
                    return _self.hillshadeAccentColorTransition?.objcValue()
                }
                set {
                    _self.hillshadeAccentColorTransition = newValue?.rawValue
                }
            }

    /// Intensity of the hillshade
    @objc public var hillshadeExaggeration : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.hillshadeExaggeration)
        }
        set {
            _self.hillshadeExaggeration = newValue?.double()
        }
    }

    /// Transition options for `hillshadeExaggeration`.
    @objc public var hillshadeExaggerationTransition : TMBStyleTransition? {
                get {
                    return _self.hillshadeExaggerationTransition?.objcValue()
                }
                set {
                    _self.hillshadeExaggerationTransition = newValue?.rawValue
                }
            }

    /// The shading color of areas that faces towards the light source.
    @objc public var hillshadeHighlightColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.hillshadeHighlightColor)
        }
        set {
            _self.hillshadeHighlightColor = newValue?.styleColor()
        }
    }

    /// Transition options for `hillshadeHighlightColor`.
    @objc public var hillshadeHighlightColorTransition : TMBStyleTransition? {
                get {
                    return _self.hillshadeHighlightColorTransition?.objcValue()
                }
                set {
                    _self.hillshadeHighlightColorTransition = newValue?.rawValue
                }
            }

    /// Direction of light source when map is rotated.
    @objc public var hillshadeIlluminationAnchor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.hillshadeIlluminationAnchor)
        }
        set {
            _self.hillshadeIlluminationAnchor = newValue?.hillshadeIlluminationAnchor()
        }
    }

    /// The direction of the light source used to generate the hillshading with 0 as the top of the viewport if `hillshade-illumination-anchor` is set to `viewport` and due north if `hillshade-illumination-anchor` is set to `map`.
    @objc public var hillshadeIlluminationDirection : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.hillshadeIlluminationDirection)
        }
        set {
            _self.hillshadeIlluminationDirection = newValue?.double()
        }
    }

    /// The shading color of areas that face away from the light source.
    @objc public var hillshadeShadowColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.hillshadeShadowColor)
        }
        set {
            _self.hillshadeShadowColor = newValue?.styleColor()
        }
    }

    /// Transition options for `hillshadeShadowColor`.
    @objc public var hillshadeShadowColorTransition : TMBStyleTransition? {
                get {
                    return _self.hillshadeShadowColorTransition?.objcValue()
                }
                set {
                    _self.hillshadeShadowColorTransition = newValue?.rawValue
                }
            }
}
