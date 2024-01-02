// This file is generated.
import Foundation
import MapboxMaps


/// A layer to render 3D Models.
@objc open class TMBModelLayer: NSObject, TMBLayer {

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
@objc public var  id: String

    /// Rendering type of this layer.
@objc public let  type: TMBLayerType

    /// An expression specifying conditions on source features.
    /// Only features that match the filter are displayed.
@objc public var  filter: TMBExpression?

    /// Name of a source description to be used for this layer.
    /// Required for all layer types except ``BackgroundLayer``, ``SkyLayer``, and ``LocationIndicatorLayer``.
@objc public var  source: String?

    /// Layer to use from a vector tile source.
    ///
    /// Required for vector tile sources.
    /// Prohibited for all other source types, including GeoJSON sources.
@objc public var  sourceLayer: String?
    
    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
@objc public var  slot: TMBSlot?

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
@objc public var  minZoom: NSNumber?

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
@objc public var  maxZoom: NSNumber?

    /// Whether this layer is displayed.
@objc public var  visibility: TMBValue

    /// Model to render.
@objc public var  modelId: TMBValue?

    /// Intensity of the ambient occlusion if present in the 3D model.
@objc public var  modelAmbientOcclusionIntensity: TMBValue?

    /// Transition options for `modelAmbientOcclusionIntensity`.
@objc public var  modelAmbientOcclusionIntensityTransition: TMBStyleTransition?

    /// Enable/Disable shadow casting for this layer
@objc public var  modelCastShadows: TMBValue?

    /// The tint color of the model layer. model-color-mix-intensity (defaults to 0) defines tint(mix) intensity - this means that, this color is not used unless model-color-mix-intensity gets value greater than 0.
@objc public var  modelColor: TMBValue?

    /// Transition options for `modelColor`.
@objc public var  modelColorTransition: TMBStyleTransition?

    /// Intensity of model-color (on a scale from 0 to 1) in color mix with original 3D model's colors. Higher number will present a higher model-color contribution in mix.
@objc public var  modelColorMixIntensity: TMBValue?

    /// Transition options for `modelColorMixIntensity`.
@objc public var  modelColorMixIntensityTransition: TMBStyleTransition?

    /// This parameter defines the range for the fade-out effect before an automatic content cutoff  on pitched map views. The automatic cutoff range is calculated according to the minimum required zoom level of the source and layer. The fade range is expressed in relation to the height of the map view. A value of 1.0 indicates that the content is faded to the same extent as the map's height in pixels, while a value close to zero represents a sharp cutoff. When the value is set to 0.0, the cutoff is completely disabled. Note: The property has no effect on the map if terrain is enabled.
@objc public var  modelCutoffFadeRange: TMBValue?

    /// Strength of the emission. There is no emission for value 0. For value 1.0, only emissive component (no shading) is displayed and values above 1.0 produce light contribution to surrounding area, for some of the parts (e.g. doors). Expressions that depend on measure-light are not supported when using GeoJSON or vector tile as the model layer source.
@objc public var  modelEmissiveStrength: TMBValue?

    /// Transition options for `modelEmissiveStrength`.
@objc public var  modelEmissiveStrengthTransition: TMBStyleTransition?

    /// Emissive strength multiplier along model height (gradient begin, gradient end, value at begin, value at end, gradient curve power (logarithmic scale, curve power = pow(10, val)).
@objc public var  modelHeightBasedEmissiveStrengthMultiplier: TMBValue?

    /// Transition options for `modelHeightBasedEmissiveStrengthMultiplier`.
@objc public var  modelHeightBasedEmissiveStrengthMultiplierTransition: TMBStyleTransition?

    /// The opacity of the model layer.
@objc public var  modelOpacity: TMBValue?

    /// Transition options for `modelOpacity`.
@objc public var  modelOpacityTransition: TMBStyleTransition?

    /// Enable/Disable shadow receiving for this layer
@objc public var  modelReceiveShadows: TMBValue?

    /// The rotation of the model in euler angles [lon, lat, z].
@objc public var  modelRotation: TMBValue?

    /// Transition options for `modelRotation`.
@objc public var  modelRotationTransition: TMBStyleTransition?

    /// Material roughness. Material is fully smooth for value 0, and fully rough for value 1. Affects only layers using batched-model source.
@objc public var  modelRoughness: TMBValue?

    /// Transition options for `modelRoughness`.
@objc public var  modelRoughnessTransition: TMBStyleTransition?

    /// The scale of the model.
@objc public var  modelScale: TMBValue?

    /// Transition options for `modelScale`.
@objc public var  modelScaleTransition: TMBStyleTransition?

    /// Defines scaling mode. Only applies to location-indicator type layers.
@objc public var  modelScaleMode: TMBValue?

    /// The translation of the model in meters in form of [longitudal, latitudal, altitude] offsets.
@objc public var  modelTranslation: TMBValue?

    /// Transition options for `modelTranslation`.
@objc public var  modelTranslationTransition: TMBStyleTransition?

    /// Defines rendering behavior of model in respect to other 3D scene objects.
@objc public var  modelType: TMBValue?


    @objc public init(id : String, source : String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.model
        self.visibility = .visibility(.visible)
    }
}
extension TMBModelLayer {
    func unwrap() -> ModelLayer {
        var result = ModelLayer(id: self.id,
            source: self.source)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout ModelLayer) {
        dest.filter = self.filter?.unwrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.unwrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.unwrap()
        dest.modelId = self.modelId?.unwrap()
        dest.modelAmbientOcclusionIntensity = self.modelAmbientOcclusionIntensity?.unwrap()
        dest.modelAmbientOcclusionIntensityTransition = self.modelAmbientOcclusionIntensityTransition?.unwrap()
        dest.modelCastShadows = self.modelCastShadows?.unwrap()
        dest.modelColor = self.modelColor?.unwrap()
        dest.modelColorTransition = self.modelColorTransition?.unwrap()
        dest.modelColorMixIntensity = self.modelColorMixIntensity?.unwrap()
        dest.modelColorMixIntensityTransition = self.modelColorMixIntensityTransition?.unwrap()
        dest.modelCutoffFadeRange = self.modelCutoffFadeRange?.unwrap()
        dest.modelEmissiveStrength = self.modelEmissiveStrength?.unwrap()
        dest.modelEmissiveStrengthTransition = self.modelEmissiveStrengthTransition?.unwrap()
        dest.modelHeightBasedEmissiveStrengthMultiplier = self.modelHeightBasedEmissiveStrengthMultiplier?.unwrap()
        dest.modelHeightBasedEmissiveStrengthMultiplierTransition = self.modelHeightBasedEmissiveStrengthMultiplierTransition?.unwrap()
        dest.modelOpacity = self.modelOpacity?.unwrap()
        dest.modelOpacityTransition = self.modelOpacityTransition?.unwrap()
        dest.modelReceiveShadows = self.modelReceiveShadows?.unwrap()
        dest.modelRotation = self.modelRotation?.unwrap()
        dest.modelRotationTransition = self.modelRotationTransition?.unwrap()
        dest.modelRoughness = self.modelRoughness?.unwrap()
        dest.modelRoughnessTransition = self.modelRoughnessTransition?.unwrap()
        dest.modelScale = self.modelScale?.unwrap()
        dest.modelScaleTransition = self.modelScaleTransition?.unwrap()
        dest.modelScaleMode = self.modelScaleMode?.unwrap()
        dest.modelTranslation = self.modelTranslation?.unwrap()
        dest.modelTranslationTransition = self.modelTranslationTransition?.unwrap()
        dest.modelType = self.modelType?.unwrap()
    }
}
extension ModelLayer {
    func wrap() -> TMBModelLayer {
        var result = TMBModelLayer(id: self.id,
          source: self.source)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBModelLayer)  {
        dest.filter = self.filter?.wrap()
        dest.source = self.source
        dest.sourceLayer = self.sourceLayer
        dest.slot = self.slot?.wrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.wrap()
        dest.modelId = self.modelId?.wrap()
        dest.modelAmbientOcclusionIntensity = self.modelAmbientOcclusionIntensity?.wrap()
        dest.modelAmbientOcclusionIntensityTransition = self.modelAmbientOcclusionIntensityTransition?.wrap()
        dest.modelCastShadows = self.modelCastShadows?.wrap()
        dest.modelColor = self.modelColor?.wrap()
        dest.modelColorTransition = self.modelColorTransition?.wrap()
        dest.modelColorMixIntensity = self.modelColorMixIntensity?.wrap()
        dest.modelColorMixIntensityTransition = self.modelColorMixIntensityTransition?.wrap()
        dest.modelCutoffFadeRange = self.modelCutoffFadeRange?.wrap()
        dest.modelEmissiveStrength = self.modelEmissiveStrength?.wrap()
        dest.modelEmissiveStrengthTransition = self.modelEmissiveStrengthTransition?.wrap()
        dest.modelHeightBasedEmissiveStrengthMultiplier = self.modelHeightBasedEmissiveStrengthMultiplier?.wrap()
        dest.modelHeightBasedEmissiveStrengthMultiplierTransition = self.modelHeightBasedEmissiveStrengthMultiplierTransition?.wrap()
        dest.modelOpacity = self.modelOpacity?.wrap()
        dest.modelOpacityTransition = self.modelOpacityTransition?.wrap()
        dest.modelReceiveShadows = self.modelReceiveShadows?.wrap()
        dest.modelRotation = self.modelRotation?.wrap()
        dest.modelRotationTransition = self.modelRotationTransition?.wrap()
        dest.modelRoughness = self.modelRoughness?.wrap()
        dest.modelRoughnessTransition = self.modelRoughnessTransition?.wrap()
        dest.modelScale = self.modelScale?.wrap()
        dest.modelScaleTransition = self.modelScaleTransition?.wrap()
        dest.modelScaleMode = self.modelScaleMode?.wrap()
        dest.modelTranslation = self.modelTranslation?.wrap()
        dest.modelTranslationTransition = self.modelTranslationTransition?.wrap()
        dest.modelType = self.modelType?.wrap()
    }
}