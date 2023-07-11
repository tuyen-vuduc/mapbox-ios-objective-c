// This file is generated.
import Foundation
import MapboxMaps

/// An extruded (3D) polygon.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-fill-extrusion)
@objc open class TMBFillExtrusionLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.fillExtrusion)
        
        self.visibility = TMBValue.visibility(.visible)
    }
    
    private init(_ id: String = UUID().uuidString, type: TMBLayerType) {
        self.id = id
        self.type = type
    }

    // MARK: - Conformance to `Layer` protocol
    @objc public var id: String
    @objc public let type: TMBLayerType
    @objc public var filter: TMBExpression?
    @objc public var source: String?
    @objc public var sourceLayer: String?
    @objc public var minZoom: NSNumber?
    @objc public var maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var visibility: TMBValue?

    /// Controls the intensity of shading near ground and concave angles between walls. Default value 0.0 disables ambient occlusion and values around 0.3 provide the most plausible results for buildings.
    @objc public var fillExtrusionAmbientOcclusionIntensity: TMBValue?

    /// Transition options for `fillExtrusionAmbientOcclusionIntensity`.
    @objc public var fillExtrusionAmbientOcclusionIntensityTransition: TMBStyleTransition?

    /// Shades area near ground and concave angles between walls where the radius defines only vertical impact. Default value 3.0 corresponds to height of one floor and brings the most plausible results for buildings.
    @objc public var fillExtrusionAmbientOcclusionRadius: TMBValue?

    /// Transition options for `fillExtrusionAmbientOcclusionRadius`.
    @objc public var fillExtrusionAmbientOcclusionRadiusTransition: TMBStyleTransition?

    /// The height with which to extrude the base of this layer. Must be less than or equal to `fill-extrusion-height`.
    @objc public var fillExtrusionBase: TMBValue?

    /// Transition options for `fillExtrusionBase`.
    @objc public var fillExtrusionBaseTransition: TMBStyleTransition?

    /// The base color of the extruded fill. The extrusion's surfaces will be shaded differently based on this color in combination with the root `light` settings. If this color is specified as `rgba` with an alpha component, the alpha component will be ignored; use `fill-extrusion-opacity` to set layer opacity.
    @objc public var fillExtrusionColor: TMBValue?

    /// Transition options for `fillExtrusionColor`.
    @objc public var fillExtrusionColorTransition: TMBStyleTransition?

    /// The height with which to extrude this layer.
    @objc public var fillExtrusionHeight: TMBValue?

    /// Transition options for `fillExtrusionHeight`.
    @objc public var fillExtrusionHeightTransition: TMBStyleTransition?

    /// The opacity of the entire fill extrusion layer. This is rendered on a per-layer, not per-feature, basis, and data-driven styling is not available.
    @objc public var fillExtrusionOpacity: TMBValue?

    /// Transition options for `fillExtrusionOpacity`.
    @objc public var fillExtrusionOpacityTransition: TMBStyleTransition?

    /// Name of image in sprite to use for drawing images on extruded fills. For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512). Note that zoom-dependent expressions will be evaluated only at integer zoom levels.
    @objc public var fillExtrusionPattern: TMBValue?

    /// Transition options for `fillExtrusionPattern`.
    @available(*, deprecated, message: "This property is deprecated and will be removed in the future. Setting this will have no effect.")
    @objc public var fillExtrusionPatternTransition: TMBStyleTransition?

    /// The geometry's offset. Values are [x, y] where negatives indicate left and up (on the flat plane), respectively.
    @objc public var fillExtrusionTranslate: TMBValue?

    /// Transition options for `fillExtrusionTranslate`.
    @objc public var fillExtrusionTranslateTransition: TMBStyleTransition?

    /// Controls the frame of reference for `fill-extrusion-translate`.
    @objc public var fillExtrusionTranslateAnchor: TMBValue?

    /// Whether to apply a vertical gradient to the sides of a fill-extrusion layer. If true, sides will be shaded slightly darker farther down.
    @objc public var fillExtrusionVerticalGradient: TMBValue?

}

extension TMBFillExtrusionLayer {
    public func mapTo(_ layer: inout FillExtrusionLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.fillExtrusionAmbientOcclusionIntensity = self.fillExtrusionAmbientOcclusionIntensity?.double()
        layer.fillExtrusionAmbientOcclusionIntensityTransition = self.fillExtrusionAmbientOcclusionIntensityTransition?.styleTransition()
        layer.fillExtrusionAmbientOcclusionRadius = self.fillExtrusionAmbientOcclusionRadius?.double()
        layer.fillExtrusionAmbientOcclusionRadiusTransition = self.fillExtrusionAmbientOcclusionRadiusTransition?.styleTransition()
        layer.fillExtrusionBase = self.fillExtrusionBase?.double()
        layer.fillExtrusionBaseTransition = self.fillExtrusionBaseTransition?.styleTransition()
        layer.fillExtrusionColor = self.fillExtrusionColor?.styleColor()
        layer.fillExtrusionColorTransition = self.fillExtrusionColorTransition?.styleTransition()
        layer.fillExtrusionHeight = self.fillExtrusionHeight?.double()
        layer.fillExtrusionHeightTransition = self.fillExtrusionHeightTransition?.styleTransition()
        layer.fillExtrusionOpacity = self.fillExtrusionOpacity?.double()
        layer.fillExtrusionOpacityTransition = self.fillExtrusionOpacityTransition?.styleTransition()
        layer.fillExtrusionPattern = self.fillExtrusionPattern?.resolvedImage()
        layer.fillExtrusionPatternTransition = self.fillExtrusionPatternTransition?.styleTransition()
        layer.fillExtrusionTranslate = self.fillExtrusionTranslate?.arrayOfDouble()
        layer.fillExtrusionTranslateTransition = self.fillExtrusionTranslateTransition?.styleTransition()
        layer.fillExtrusionTranslateAnchor = self.fillExtrusionTranslateAnchor?.fillExtrusionTranslateAnchor()
        layer.fillExtrusionVerticalGradient = self.fillExtrusionVerticalGradient?.boolean()
    }
}

extension FillExtrusionLayer {
    public func mapTo(_ layer:inout TMBFillExtrusionLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = TMBValue.fromSwiftValue(self.visibility)
        layer.fillExtrusionAmbientOcclusionIntensity = TMBValue.fromSwiftValue(self.fillExtrusionAmbientOcclusionIntensity)
        layer.fillExtrusionAmbientOcclusionIntensityTransition = self.fillExtrusionAmbientOcclusionIntensityTransition?.objcValue()
        layer.fillExtrusionAmbientOcclusionRadius = TMBValue.fromSwiftValue(self.fillExtrusionAmbientOcclusionRadius)
        layer.fillExtrusionAmbientOcclusionRadiusTransition = self.fillExtrusionAmbientOcclusionRadiusTransition?.objcValue()
        layer.fillExtrusionBase = TMBValue.fromSwiftValue(self.fillExtrusionBase)
        layer.fillExtrusionBaseTransition = self.fillExtrusionBaseTransition?.objcValue()
        layer.fillExtrusionColor = TMBValue.fromSwiftValue(self.fillExtrusionColor)
        layer.fillExtrusionColorTransition = self.fillExtrusionColorTransition?.objcValue()
        layer.fillExtrusionHeight = TMBValue.fromSwiftValue(self.fillExtrusionHeight)
        layer.fillExtrusionHeightTransition = self.fillExtrusionHeightTransition?.objcValue()
        layer.fillExtrusionOpacity = TMBValue.fromSwiftValue(self.fillExtrusionOpacity)
        layer.fillExtrusionOpacityTransition = self.fillExtrusionOpacityTransition?.objcValue()
        layer.fillExtrusionPattern = TMBValue.fromSwiftValue(self.fillExtrusionPattern)
        layer.fillExtrusionPatternTransition = self.fillExtrusionPatternTransition?.objcValue()
        layer.fillExtrusionTranslate = TMBValue.fromSwiftValue(self.fillExtrusionTranslate)
        layer.fillExtrusionTranslateTransition = self.fillExtrusionTranslateTransition?.objcValue()
        layer.fillExtrusionTranslateAnchor = TMBValue.fromSwiftValue(self.fillExtrusionTranslateAnchor)
        layer.fillExtrusionVerticalGradient = TMBValue.fromSwiftValue(self.fillExtrusionVerticalGradient)
    }
}

extension TMBFillExtrusionLayer: SwiftValueConvertible {
    public func swiftValue() -> FillExtrusionLayer {
        var layer = FillExtrusionLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension FillExtrusionLayer: ObjcConvertible {
    public func objcValue() ->  TMBFillExtrusionLayer {
        var layer = TMBFillExtrusionLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}