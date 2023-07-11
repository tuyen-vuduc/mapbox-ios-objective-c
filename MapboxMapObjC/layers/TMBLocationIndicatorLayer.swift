// This file is generated.
import Foundation
import MapboxMaps

/// Location Indicator layer.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-location-indicator)
@objc open class TMBLocationIndicatorLayer: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.locationIndicator)
        
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

    /// Name of image in sprite to use as the middle of the location indicator.
    @objc public var bearingImage: TMBValue?

    /// Name of image in sprite to use as the background of the location indicator.
    @objc public var shadowImage: TMBValue?

    /// Name of image in sprite to use as the top of the location indicator.
    @objc public var topImage: TMBValue?

    /// The accuracy, in meters, of the position source used to retrieve the position of the location indicator.
    @objc public var accuracyRadius: TMBValue?

    /// Transition options for `accuracyRadius`.
    @objc public var accuracyRadiusTransition: TMBStyleTransition?

    /// The color for drawing the accuracy radius border. To adjust transparency, set the alpha component of the color accordingly.
    @objc public var accuracyRadiusBorderColor: TMBValue?

    /// Transition options for `accuracyRadiusBorderColor`.
    @objc public var accuracyRadiusBorderColorTransition: TMBStyleTransition?

    /// The color for drawing the accuracy radius, as a circle. To adjust transparency, set the alpha component of the color accordingly.
    @objc public var accuracyRadiusColor: TMBValue?

    /// Transition options for `accuracyRadiusColor`.
    @objc public var accuracyRadiusColorTransition: TMBStyleTransition?

    /// The bearing of the location indicator.
    @objc public var bearing: TMBValue?

    /// Transition options for `bearing`.
    @objc public var bearingTransition: TMBStyleTransition?

    /// The size of the bearing image, as a scale factor applied to the size of the specified image.
    @objc public var bearingImageSize: TMBValue?

    /// Transition options for `bearingImageSize`.
    @objc public var bearingImageSizeTransition: TMBStyleTransition?

    /// The color of the circle emphasizing the indicator. To adjust transparency, set the alpha component of the color accordingly.
    @objc public var emphasisCircleColor: TMBValue?

    /// Transition options for `emphasisCircleColor`.
    @objc public var emphasisCircleColorTransition: TMBStyleTransition?

    /// The radius, in pixel, of the circle emphasizing the indicator, drawn between the accuracy radius and the indicator shadow.
    @objc public var emphasisCircleRadius: TMBValue?

    /// Transition options for `emphasisCircleRadius`.
    @objc public var emphasisCircleRadiusTransition: TMBStyleTransition?

    /// The displacement off the center of the top image and the shadow image when the pitch of the map is greater than 0. This helps producing a three-dimensional appearence.
    @objc public var imagePitchDisplacement: TMBValue?

    /// An array of [latitude, longitude, altitude] position of the location indicator.
    @objc public var location: TMBValue?

    /// Transition options for `location`.
    @objc public var locationTransition: TMBStyleTransition?

    /// The opacity of the entire location indicator layer.
    @objc public var locationIndicatorOpacity: TMBValue?

    /// Transition options for `locationIndicatorOpacity`.
    @objc public var locationIndicatorOpacityTransition: TMBStyleTransition?

    /// The amount of the perspective compensation, between 0 and 1. A value of 1 produces a location indicator of constant width across the screen. A value of 0 makes it scale naturally according to the viewing projection.
    @objc public var perspectiveCompensation: TMBValue?

    /// The size of the shadow image, as a scale factor applied to the size of the specified image.
    @objc public var shadowImageSize: TMBValue?

    /// Transition options for `shadowImageSize`.
    @objc public var shadowImageSizeTransition: TMBStyleTransition?

    /// The size of the top image, as a scale factor applied to the size of the specified image.
    @objc public var topImageSize: TMBValue?

    /// Transition options for `topImageSize`.
    @objc public var topImageSizeTransition: TMBStyleTransition?

}

extension TMBLocationIndicatorLayer {
    public func mapTo(_ layer: inout LocationIndicatorLayer) {
        layer.id = self.id

        layer.filter = self.filter?.expression()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.double()
        layer.maxZoom = self.maxZoom?.double()
        layer.visibility = self.visibility?.visibility()
        layer.bearingImage = self.bearingImage?.resolvedImage()
        layer.shadowImage = self.shadowImage?.resolvedImage()
        layer.topImage = self.topImage?.resolvedImage()
        layer.accuracyRadius = self.accuracyRadius?.double()
        layer.accuracyRadiusTransition = self.accuracyRadiusTransition?.styleTransition()
        layer.accuracyRadiusBorderColor = self.accuracyRadiusBorderColor?.styleColor()
        layer.accuracyRadiusBorderColorTransition = self.accuracyRadiusBorderColorTransition?.styleTransition()
        layer.accuracyRadiusColor = self.accuracyRadiusColor?.styleColor()
        layer.accuracyRadiusColorTransition = self.accuracyRadiusColorTransition?.styleTransition()
        layer.bearing = self.bearing?.double()
        layer.bearingTransition = self.bearingTransition?.styleTransition()
        layer.bearingImageSize = self.bearingImageSize?.double()
        layer.bearingImageSizeTransition = self.bearingImageSizeTransition?.styleTransition()
        layer.emphasisCircleColor = self.emphasisCircleColor?.styleColor()
        layer.emphasisCircleColorTransition = self.emphasisCircleColorTransition?.styleTransition()
        layer.emphasisCircleRadius = self.emphasisCircleRadius?.double()
        layer.emphasisCircleRadiusTransition = self.emphasisCircleRadiusTransition?.styleTransition()
        layer.imagePitchDisplacement = self.imagePitchDisplacement?.double()
        layer.location = self.location?.arrayOfDouble()
        layer.locationTransition = self.locationTransition?.styleTransition()
        layer.locationIndicatorOpacity = self.locationIndicatorOpacity?.double()
        layer.locationIndicatorOpacityTransition = self.locationIndicatorOpacityTransition?.styleTransition()
        layer.perspectiveCompensation = self.perspectiveCompensation?.double()
        layer.shadowImageSize = self.shadowImageSize?.double()
        layer.shadowImageSizeTransition = self.shadowImageSizeTransition?.styleTransition()
        layer.topImageSize = self.topImageSize?.double()
        layer.topImageSizeTransition = self.topImageSizeTransition?.styleTransition()
    }
}

extension LocationIndicatorLayer {
    public func mapTo(_ layer:inout TMBLocationIndicatorLayer) {
        layer.id = self.id

        layer.filter = self.filter?.objcValue()
        layer.source = self.source
        layer.sourceLayer = self.sourceLayer
        layer.minZoom = self.minZoom?.asNumber()
        layer.maxZoom = self.maxZoom?.asNumber()
        layer.visibility = TMBValue.fromSwiftValue(self.visibility)
        layer.bearingImage = TMBValue.fromSwiftValue(self.bearingImage)
        layer.shadowImage = TMBValue.fromSwiftValue(self.shadowImage)
        layer.topImage = TMBValue.fromSwiftValue(self.topImage)
        layer.accuracyRadius = TMBValue.fromSwiftValue(self.accuracyRadius)
        layer.accuracyRadiusTransition = self.accuracyRadiusTransition?.objcValue()
        layer.accuracyRadiusBorderColor = TMBValue.fromSwiftValue(self.accuracyRadiusBorderColor)
        layer.accuracyRadiusBorderColorTransition = self.accuracyRadiusBorderColorTransition?.objcValue()
        layer.accuracyRadiusColor = TMBValue.fromSwiftValue(self.accuracyRadiusColor)
        layer.accuracyRadiusColorTransition = self.accuracyRadiusColorTransition?.objcValue()
        layer.bearing = TMBValue.fromSwiftValue(self.bearing)
        layer.bearingTransition = self.bearingTransition?.objcValue()
        layer.bearingImageSize = TMBValue.fromSwiftValue(self.bearingImageSize)
        layer.bearingImageSizeTransition = self.bearingImageSizeTransition?.objcValue()
        layer.emphasisCircleColor = TMBValue.fromSwiftValue(self.emphasisCircleColor)
        layer.emphasisCircleColorTransition = self.emphasisCircleColorTransition?.objcValue()
        layer.emphasisCircleRadius = TMBValue.fromSwiftValue(self.emphasisCircleRadius)
        layer.emphasisCircleRadiusTransition = self.emphasisCircleRadiusTransition?.objcValue()
        layer.imagePitchDisplacement = TMBValue.fromSwiftValue(self.imagePitchDisplacement)
        layer.location = TMBValue.fromSwiftValue(self.location)
        layer.locationTransition = self.locationTransition?.objcValue()
        layer.locationIndicatorOpacity = TMBValue.fromSwiftValue(self.locationIndicatorOpacity)
        layer.locationIndicatorOpacityTransition = self.locationIndicatorOpacityTransition?.objcValue()
        layer.perspectiveCompensation = TMBValue.fromSwiftValue(self.perspectiveCompensation)
        layer.shadowImageSize = TMBValue.fromSwiftValue(self.shadowImageSize)
        layer.shadowImageSizeTransition = self.shadowImageSizeTransition?.objcValue()
        layer.topImageSize = TMBValue.fromSwiftValue(self.topImageSize)
        layer.topImageSizeTransition = self.topImageSizeTransition?.objcValue()
    }
}

extension TMBLocationIndicatorLayer: SwiftValueConvertible {
    public func swiftValue() -> LocationIndicatorLayer {
        var layer = LocationIndicatorLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension LocationIndicatorLayer: ObjcConvertible {
    public func objcValue() ->  TMBLocationIndicatorLayer {
        var layer = TMBLocationIndicatorLayer(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}