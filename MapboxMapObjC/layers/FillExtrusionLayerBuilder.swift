import MapboxMaps

@objc
open class FillExtrusionLayerBuilder : NSObject, LayerBuilder {
    public typealias T = FillExtrusionLayer
    
    public let id: String
    
    @objc public class func withId(_ id: String) -> FillExtrusionLayerBuilder {
        FillExtrusionLayerBuilder(id: id)
    }
    
    init(id: String) {
        self.id = id
        super.init()
    }
    
    public func create() -> FillExtrusionLayer {
        FillExtrusionLayer(id: id)
    }
    
    public func update(_ layer: inout FillExtrusionLayer) {
        if let filter = filter {
           layer.filter = filter.swiftOnly()
        }
        if let source = source {
           layer.source = source
        }
        if let sourceLayer = sourceLayer {
           layer.sourceLayer = sourceLayer
        }
        if let minZoom = minZoom {
           layer.minZoom = minZoom.doubleValue
        }
        if let maxZoom = maxZoom {
            layer.maxZoom = maxZoom.doubleValue
        }

        /// Whether this layer is displayed.
        if let visibility = visibility {
           layer.visibility = visibility.visibility()
        }

        /// Controls the intensity of shading near ground and concave angles between walls. Default value 0.0 disables ambient occlusion and values around 0.3 provide the most plausible results for buildings.
        if let fillExtrusionAmbientOcclusionIntensity = fillExtrusionAmbientOcclusionIntensity {
           layer.fillExtrusionAmbientOcclusionIntensity = fillExtrusionAmbientOcclusionIntensity.double()
        }

        /// Transition options for `fillExtrusionAmbientOcclusionIntensity`.
        if let fillExtrusionAmbientOcclusionIntensityTransition = fillExtrusionAmbientOcclusionIntensityTransition {
           layer.fillExtrusionAmbientOcclusionIntensityTransition = fillExtrusionAmbientOcclusionIntensityTransition.swiftOnly()
        }

        /// Shades area near ground and concave angles between walls where the radius defines only vertical impact. Default value 3.0 corresponds to height of one floor and brings the most plausible results for buildings.
        if let fillExtrusionAmbientOcclusionRadius = fillExtrusionAmbientOcclusionRadius {
           layer.fillExtrusionAmbientOcclusionRadius = fillExtrusionAmbientOcclusionRadius.double()
        }

        /// Transition options for `fillExtrusionAmbientOcclusionRadius`.
        if let fillExtrusionAmbientOcclusionRadiusTransition = fillExtrusionAmbientOcclusionRadiusTransition {
           layer.fillExtrusionAmbientOcclusionRadiusTransition = fillExtrusionAmbientOcclusionRadiusTransition.swiftOnly()
        }

        /// The height with which to extrude the base of this layer. Must be less than or equal to `fill-extrusion-height`.
        if let fillExtrusionBase = fillExtrusionBase {
           layer.fillExtrusionBase = fillExtrusionBase.double()
        }

        /// Transition options for `fillExtrusionBase`.
        if let fillExtrusionBaseTransition = fillExtrusionBaseTransition {
           layer.fillExtrusionBaseTransition = fillExtrusionBaseTransition.swiftOnly()
        }

        /// The base color of the extruded fill. The extrusion's surfaces will be shaded differently based on this color in combination with the root `light` settings. If this color is specified as `rgba` with an alpha component, the alpha component will be ignored; use `fill-extrusion-opacity` to set layer opacity.
        if let fillExtrusionColor = fillExtrusionColor {
           layer.fillExtrusionColor = fillExtrusionColor.styleColor()
        }

        /// Transition options for `fillExtrusionColor`.
        if let fillExtrusionColorTransition = fillExtrusionColorTransition {
           layer.fillExtrusionColorTransition = fillExtrusionColorTransition.swiftOnly()
        }

        /// The height with which to extrude this layer.
        if let fillExtrusionHeight = fillExtrusionHeight {
           layer.fillExtrusionHeight = fillExtrusionHeight.double()
        }

        /// Transition options for `fillExtrusionHeight`.
        if let fillExtrusionHeightTransition = fillExtrusionHeightTransition {
           layer.fillExtrusionHeightTransition = fillExtrusionHeightTransition.swiftOnly()
        }

        /// The opacity of the entire fill extrusion layer. This is rendered on a per-layer, not per-feature, basis, and data-driven styling is not available.
        if let fillExtrusionOpacity = fillExtrusionOpacity {
           layer.fillExtrusionOpacity = fillExtrusionOpacity.double()
        }

        /// Transition options for `fillExtrusionOpacity`.
        if let fillExtrusionOpacityTransition = fillExtrusionOpacityTransition {
           layer.fillExtrusionOpacityTransition = fillExtrusionOpacityTransition.swiftOnly()
        }

        /// Name of image in sprite to use for drawing images on extruded fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
        if let fillExtrusionPattern = fillExtrusionPattern {
           layer.fillExtrusionPattern = fillExtrusionPattern.resolvedImage()
        }

        /// Transition options for `fillExtrusionPattern`.
        if let fillExtrusionPatternTransition = fillExtrusionPatternTransition {
           layer.fillExtrusionPatternTransition = fillExtrusionPatternTransition.swiftOnly()
        }

        /// The geometry's offset. Values are [x, y] where negatives indicate left and up (on the flat plane), respectively.
        if let fillExtrusionTranslate = fillExtrusionTranslate {
           layer.fillExtrusionTranslate = fillExtrusionTranslate.arrayOfDouble()
        }

        /// Transition options for `fillExtrusionTranslate`.
        if let fillExtrusionTranslateTransition = fillExtrusionTranslateTransition {
           layer.fillExtrusionTranslateTransition = fillExtrusionTranslateTransition.swiftOnly()
        }

        /// Controls the frame of reference for `fill-extrusion-translate`.
        if let fillExtrusionTranslateAnchor = fillExtrusionTranslateAnchor {
           layer.fillExtrusionTranslateAnchor = fillExtrusionTranslateAnchor.fillExtrusionTranslateAnchor()
        }

        /// Whether to apply a vertical gradient to the sides of a fill-extrusion layer. If true, sides will be shaded slightly darker farther down.
        if let fillExtrusionVerticalGradient = fillExtrusionVerticalGradient {
           layer.fillExtrusionVerticalGradient = fillExtrusionVerticalGradient.boolean()
        }
    }
    
    private var filter: TMBExpression?;
    @objc public func filter(_ value: TMBExpression?) {
        filter = value
    }
    private var source: String?;
    @objc public func source(_ value: String?) {
        source = value
    }
    private var sourceLayer: String?;
    @objc public func sourceLayer(_ value: String?) {
        sourceLayer = value
    }
    private var minZoom: NSNumber?;
    @objc public func minZoom(_ value: NSNumber?) {
        minZoom = value
    }
    private var maxZoom: NSNumber?;
    @objc public func maxZoom(_ value: NSNumber?) {
        maxZoom = value
    }

    /// Whether this layer is displayed.
    private var visibility: TMBValue?;
    @objc public func visibility(_ value: TMBValue?) {
        visibility = value
    }

    /// Controls the intensity of shading near ground and concave angles between walls. Default value 0.0 disables ambient occlusion and values around 0.3 provide the most plausible results for buildings.
    private var fillExtrusionAmbientOcclusionIntensity: TMBValue?;
    @objc public func fillExtrusionAmbientOcclusionIntensity(_ value: TMBValue?) {
        fillExtrusionAmbientOcclusionIntensity = value
    }

    /// Transition options for `fillExtrusionAmbientOcclusionIntensity`.
    private var fillExtrusionAmbientOcclusionIntensityTransition: TMBStyleTransition?;
    @objc public func fillExtrusionAmbientOcclusionIntensityTransition(_ value: TMBStyleTransition?) {
        fillExtrusionAmbientOcclusionIntensityTransition = value
    }

    /// Shades area near ground and concave angles between walls where the radius defines only vertical impact. Default value 3.0 corresponds to height of one floor and brings the most plausible results for buildings.
    private var fillExtrusionAmbientOcclusionRadius: TMBValue?;
    @objc public func fillExtrusionAmbientOcclusionRadius(_ value: TMBValue?) {
        fillExtrusionAmbientOcclusionRadius = value
    }

    /// Transition options for `fillExtrusionAmbientOcclusionRadius`.
    private var fillExtrusionAmbientOcclusionRadiusTransition: TMBStyleTransition?;
    @objc public func fillExtrusionAmbientOcclusionRadiusTransition(_ value: TMBStyleTransition?) {
        fillExtrusionAmbientOcclusionRadiusTransition = value
    }

    /// The height with which to extrude the base of this layer. Must be less than or equal to `fill-extrusion-height`.
    private var fillExtrusionBase: TMBValue?;
    @objc public func fillExtrusionBase(_ value: TMBValue?) {
        fillExtrusionBase = value
    }

    /// Transition options for `fillExtrusionBase`.
    private var fillExtrusionBaseTransition: TMBStyleTransition?;
    @objc public func fillExtrusionBaseTransition(_ value: TMBStyleTransition?) {
        fillExtrusionBaseTransition = value
    }

    /// The base color of the extruded fill. The extrusion's surfaces will be shaded differently based on this color in combination with the root `light` settings. If this color is specified as `rgba` with an alpha component, the alpha component will be ignored; use `fill-extrusion-opacity` to set layer opacity.
    private var fillExtrusionColor: TMBValue?;
    @objc public func fillExtrusionColor(_ value: TMBValue?) {
        fillExtrusionColor = value
    }

    /// Transition options for `fillExtrusionColor`.
    private var fillExtrusionColorTransition: TMBStyleTransition?;
    @objc public func fillExtrusionColorTransition(_ value: TMBStyleTransition?) {
        fillExtrusionColorTransition = value
    }

    /// The height with which to extrude this layer.
    private var fillExtrusionHeight: TMBValue?;
    @objc public func fillExtrusionHeight(_ value: TMBValue?) {
        fillExtrusionHeight = value
    }

    /// Transition options for `fillExtrusionHeight`.
    private var fillExtrusionHeightTransition: TMBStyleTransition?;
    @objc public func fillExtrusionHeightTransition(_ value: TMBStyleTransition?) {
        fillExtrusionHeightTransition = value
    }

    /// The opacity of the entire fill extrusion layer. This is rendered on a per-layer, not per-feature, basis, and data-driven styling is not available.
    private var fillExtrusionOpacity: TMBValue?;
    @objc public func fillExtrusionOpacity(_ value: TMBValue?) {
        fillExtrusionOpacity = value
    }

    /// Transition options for `fillExtrusionOpacity`.
    private var fillExtrusionOpacityTransition: TMBStyleTransition?;
    @objc public func fillExtrusionOpacityTransition(_ value: TMBStyleTransition?) {
        fillExtrusionOpacityTransition = value
    }

    /// Name of image in sprite to use for drawing images on extruded fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    private var fillExtrusionPattern: TMBValue?;
    @objc public func fillExtrusionPattern(_ value: TMBValue?) {
        fillExtrusionPattern = value
    }

    /// Transition options for `fillExtrusionPattern`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    private var fillExtrusionPatternTransition: TMBStyleTransition?;
    @objc public func fillExtrusionPatternTransition(_ value: TMBStyleTransition?) {
        fillExtrusionPatternTransition = value
    }

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up (on the flat plane), respectively.
    private var fillExtrusionTranslate: TMBValue?;
    @objc public func fillExtrusionTranslate(_ value: TMBValue?) {
        fillExtrusionTranslate = value
    }

    /// Transition options for `fillExtrusionTranslate`.
    private var fillExtrusionTranslateTransition: TMBStyleTransition?;
    @objc public func fillExtrusionTranslateTransition(_ value: TMBStyleTransition?) {
        fillExtrusionTranslateTransition = value
    }

    /// Controls the frame of reference for `fill-extrusion-translate`.
    private var fillExtrusionTranslateAnchor: TMBValue?;
    @objc public func fillExtrusionTranslateAnchor(_ value: TMBValue) {
        fillExtrusionTranslateAnchor = value
    }

    /// Whether to apply a vertical gradient to the sides of a fill-extrusion layer. If true, sides will be shaded slightly darker farther down.
    private var fillExtrusionVerticalGradient: TMBValue?;
    @objc public func fillExtrusionVerticalGradient(_ value: TMBValue?) {
        fillExtrusionVerticalGradient = value
    }
}
