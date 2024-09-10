// This file is generated.
import UIKit
import MapboxMaps

/// Location Indicator layer.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-location-indicator)
@objc open class TMBLocationIndicatorLayer: NSObject, TMBLayer {
    @objc public init(id: String) {
        self.id = id
        self.type = TMBLayerType.locationIndicator
        self.visibility = .visibility(.visible)
    }

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
    @objc public var id: String

    /// Rendering type of this layer.
    @objc public let type: TMBLayerType

    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc public var slot: TMBSlot?

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc public var minZoom: NSNumber?

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc public var maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var visibility: TMBValue

    /// Name of image in sprite to use as the middle of the location indicator.
    @objc public var bearingImage: TMBValue?

    /// Name of image in sprite to use as the background of the location indicator.
    @objc public var shadowImage: TMBValue?

    /// Name of image in sprite to use as the top of the location indicator.
    @objc public var topImage: TMBValue?

    /// The accuracy, in meters, of the position source used to retrieve the position of the location indicator.
    /// Default value: 0.
    @objc public var accuracyRadius: TMBValue?

    /// Transition options for `accuracyRadius`.
    @objc public var accuracyRadiusTransition: TMBStyleTransition?

    /// The color for drawing the accuracy radius border. To adjust transparency, set the alpha component of the color accordingly.
    /// Default value: "#ffffff".
    @objc public var accuracyRadiusBorderColor: TMBValue?

    /// Transition options for `accuracyRadiusBorderColor`.
    @objc public var accuracyRadiusBorderColorTransition: TMBStyleTransition?

    /// The color for drawing the accuracy radius, as a circle. To adjust transparency, set the alpha component of the color accordingly.
    /// Default value: "#ffffff".
    @objc public var accuracyRadiusColor: TMBValue?

    /// Transition options for `accuracyRadiusColor`.
    @objc public var accuracyRadiusColorTransition: TMBStyleTransition?

    /// The bearing of the location indicator.
    /// Default value: 0.
    @objc public var bearing: TMBValue?

    /// Transition options for `bearing`.
    @objc public var bearingTransition: TMBStyleTransition?

    /// The size of the bearing image, as a scale factor applied to the size of the specified image.
    /// Default value: 1.
    @objc public var bearingImageSize: TMBValue?

    /// Transition options for `bearingImageSize`.
    @objc public var bearingImageSizeTransition: TMBStyleTransition?

    /// The color of the circle emphasizing the indicator. To adjust transparency, set the alpha component of the color accordingly.
    /// Default value: "#ffffff".
    @objc public var emphasisCircleColor: TMBValue?

    /// Transition options for `emphasisCircleColor`.
    @objc public var emphasisCircleColorTransition: TMBStyleTransition?

    /// The radius, in pixel, of the circle emphasizing the indicator, drawn between the accuracy radius and the indicator shadow.
    /// Default value: 0.
    @objc public var emphasisCircleRadius: TMBValue?

    /// Transition options for `emphasisCircleRadius`.
    @objc public var emphasisCircleRadiusTransition: TMBStyleTransition?

    /// The displacement off the center of the top image and the shadow image when the pitch of the map is greater than 0. This helps producing a three-dimensional appearence.
    /// Default value: "0".
    @objc public var imagePitchDisplacement: TMBValue?

    /// An array of [latitude, longitude, altitude] position of the location indicator.
    /// Default value: [0,0,0].
    @objc public var location: TMBValue?

    /// Transition options for `location`.
    @objc public var locationTransition: TMBStyleTransition?

    /// The opacity of the entire location indicator layer.
    /// Default value: 1. Value range: [0, 1]
    @objc public var locationIndicatorOpacity: TMBValue?

    /// Transition options for `locationIndicatorOpacity`.
    @objc public var locationIndicatorOpacityTransition: TMBStyleTransition?

    /// The amount of the perspective compensation, between 0 and 1. A value of 1 produces a location indicator of constant width across the screen. A value of 0 makes it scale naturally according to the viewing projection.
    /// Default value: "0.85".
    @objc public var perspectiveCompensation: TMBValue?

    /// The size of the shadow image, as a scale factor applied to the size of the specified image.
    /// Default value: 1.
    @objc public var shadowImageSize: TMBValue?

    /// Transition options for `shadowImageSize`.
    @objc public var shadowImageSizeTransition: TMBStyleTransition?

    /// The size of the top image, as a scale factor applied to the size of the specified image.
    /// Default value: 1.
    @objc public var topImageSize: TMBValue?

    /// Transition options for `topImageSize`.
    @objc public var topImageSizeTransition: TMBStyleTransition?

}

extension TMBLocationIndicatorLayer {
    func mapTo(_ source: inout LocationIndicatorLayer) {
        source.id = self.id
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.bearingImage = self.bearingImage?.resolvedImage()
        source.shadowImage = self.shadowImage?.resolvedImage()
        source.topImage = self.topImage?.resolvedImage()
        source.accuracyRadius = self.accuracyRadius?.double()
        source.accuracyRadiusTransition = self.accuracyRadiusTransition?.styleTransition()
        source.accuracyRadiusBorderColor = self.accuracyRadiusBorderColor?.styleColor()
        source.accuracyRadiusBorderColorTransition = self.accuracyRadiusBorderColorTransition?.styleTransition()
        source.accuracyRadiusColor = self.accuracyRadiusColor?.styleColor()
        source.accuracyRadiusColorTransition = self.accuracyRadiusColorTransition?.styleTransition()
        source.bearing = self.bearing?.double()
        source.bearingTransition = self.bearingTransition?.styleTransition()
        source.bearingImageSize = self.bearingImageSize?.double()
        source.bearingImageSizeTransition = self.bearingImageSizeTransition?.styleTransition()
        source.emphasisCircleColor = self.emphasisCircleColor?.styleColor()
        source.emphasisCircleColorTransition = self.emphasisCircleColorTransition?.styleTransition()
        source.emphasisCircleRadius = self.emphasisCircleRadius?.double()
        source.emphasisCircleRadiusTransition = self.emphasisCircleRadiusTransition?.styleTransition()
        source.imagePitchDisplacement = self.imagePitchDisplacement?.double()
        source.location = self.location?.arrayOfDouble()
        source.locationTransition = self.locationTransition?.styleTransition()
        source.locationIndicatorOpacity = self.locationIndicatorOpacity?.double()
        source.locationIndicatorOpacityTransition = self.locationIndicatorOpacityTransition?.styleTransition()
        source.perspectiveCompensation = self.perspectiveCompensation?.double()
        source.shadowImageSize = self.shadowImageSize?.double()
        source.shadowImageSizeTransition = self.shadowImageSizeTransition?.styleTransition()
        source.topImageSize = self.topImageSize?.double()
        source.topImageSizeTransition = self.topImageSizeTransition?.styleTransition()
    }
}

extension LocationIndicatorLayer {
    func mapTo(_ source:inout TMBLocationIndicatorLayer) {
        source.id = self.id
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
        source.bearingImage = self.bearingImage?.resolvedImage()
        source.shadowImage = self.shadowImage?.resolvedImage()
        source.topImage = self.topImage?.resolvedImage()
        source.accuracyRadius = self.accuracyRadius?.double()
        source.accuracyRadiusTransition = self.accuracyRadiusTransition?.wrap()
        source.accuracyRadiusBorderColor = self.accuracyRadiusBorderColor?.styleColor()
        source.accuracyRadiusBorderColorTransition = self.accuracyRadiusBorderColorTransition?.wrap()
        source.accuracyRadiusColor = self.accuracyRadiusColor?.styleColor()
        source.accuracyRadiusColorTransition = self.accuracyRadiusColorTransition?.wrap()
        source.bearing = self.bearing?.double()
        source.bearingTransition = self.bearingTransition?.wrap()
        source.bearingImageSize = self.bearingImageSize?.double()
        source.bearingImageSizeTransition = self.bearingImageSizeTransition?.wrap()
        source.emphasisCircleColor = self.emphasisCircleColor?.styleColor()
        source.emphasisCircleColorTransition = self.emphasisCircleColorTransition?.wrap()
        source.emphasisCircleRadius = self.emphasisCircleRadius?.double()
        source.emphasisCircleRadiusTransition = self.emphasisCircleRadiusTransition?.wrap()
        source.imagePitchDisplacement = self.imagePitchDisplacement?.double()
        source.location = self.location?.arrayOfDouble()
        source.locationTransition = self.locationTransition?.wrap()
        source.locationIndicatorOpacity = self.locationIndicatorOpacity?.double()
        source.locationIndicatorOpacityTransition = self.locationIndicatorOpacityTransition?.wrap()
        source.perspectiveCompensation = self.perspectiveCompensation?.double()
        source.shadowImageSize = self.shadowImageSize?.double()
        source.shadowImageSizeTransition = self.shadowImageSizeTransition?.wrap()
        source.topImageSize = self.topImageSize?.double()
        source.topImageSizeTransition = self.topImageSizeTransition?.wrap()
    }
}

extension TMBLocationIndicatorLayer: SwiftValueConvertible {
    public func unwrap() -> LocationIndicatorLayer {
        var result = LocationIndicatorLayer(id: self.id)
        self.mapTo(&result)
        return result
    }
}

extension LocationIndicatorLayer {
    func wrap() -> TMBLocationIndicatorLayer {
        var result = TMBLocationIndicatorLayer(id: self.id)
        self.mapTo(&result)
        return result
    }
}