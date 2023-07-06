// This file is generated.
import Foundation
import MapboxMaps

/// A heatmap.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-heatmap)
@objc open class TMBHeatmapLayer: TMBLayer {
    private var _self: HeatmapLayer {
        get {
            return rawValue as! HeatmapLayer
        }
        set {
            rawValue = newValue
        }
    }
    
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(HeatmapLayer(id: id))
    }
    
    public init(_ rawValue: HeatmapLayer) {
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

    /// Defines the color of each pixel based on its density value in a heatmap.  Should be an expression that uses `["heatmap-density"]` as input.
    @objc public var heatmapColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.heatmapColor)
        }
        set {
            _self.heatmapColor = newValue?.styleColor()
        }
    }

    /// Similar to `heatmap-weight` but controls the intensity of the heatmap globally. Primarily used for adjusting the heatmap based on zoom level.
    @objc public var heatmapIntensity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.heatmapIntensity)
        }
        set {
            _self.heatmapIntensity = newValue?.double()
        }
    }

    /// Transition options for `heatmapIntensity`.
    @objc public var heatmapIntensityTransition : TMBStyleTransition? {
                get {
                    return _self.heatmapIntensityTransition?.objcValue()
                }
                set {
                    _self.heatmapIntensityTransition = newValue?.rawValue
                }
            }

    /// The global opacity at which the heatmap layer will be drawn.
    @objc public var heatmapOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.heatmapOpacity)
        }
        set {
            _self.heatmapOpacity = newValue?.double()
        }
    }

    /// Transition options for `heatmapOpacity`.
    @objc public var heatmapOpacityTransition : TMBStyleTransition? {
                get {
                    return _self.heatmapOpacityTransition?.objcValue()
                }
                set {
                    _self.heatmapOpacityTransition = newValue?.rawValue
                }
            }

    /// Radius of influence of one heatmap point in pixels. Increasing the value makes the heatmap smoother, but less detailed. `queryRenderedFeatures` on heatmap layers will return points within this radius.
    @objc public var heatmapRadius : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.heatmapRadius)
        }
        set {
            _self.heatmapRadius = newValue?.double()
        }
    }

    /// Transition options for `heatmapRadius`.
    @objc public var heatmapRadiusTransition : TMBStyleTransition? {
                get {
                    return _self.heatmapRadiusTransition?.objcValue()
                }
                set {
                    _self.heatmapRadiusTransition = newValue?.rawValue
                }
            }

    /// A measure of how much an individual point contributes to the heatmap. A value of 10 would be equivalent to having 10 points of weight 1 in the same spot. Especially useful when combined with clustering.
    @objc public var heatmapWeight : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.heatmapWeight)
        }
        set {
            _self.heatmapWeight = newValue?.double()
        }
    }
}
