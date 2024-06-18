// This file is generated.
import Foundation
import MapboxMaps


/// Location Indicator layer.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-location-indicator)
@objc open class TMBLocationIndicatorLayer: NSObject, TMBLayer {

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
    @objc public var  id: String

    /// Rendering type of this layer.
    @objc public let  type: TMBLayerType

    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc public var  slot: TMBSlot?

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc public var  minZoom: NSNumber?

    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc public var  maxZoom: NSNumber?

    /// Whether this layer is displayed.
    @objc public var  visibility: TMBValue

    /// Name of image in sprite to use as the middle of the location indicator.
    @objc public var  bearingImage: TMBValue?

    /// Name of image in sprite to use as the background of the location indicator.
    @objc public var  shadowImage: TMBValue?

    /// Name of image in sprite to use as the top of the location indicator.
    @objc public var  topImage: TMBValue?

    /// The accuracy, in meters, of the position source used to retrieve the position of the location indicator.
    @objc public var  accuracyRadius: TMBValue?

    /// Transition options for `accuracyRadius`.
    @objc public var  accuracyRadiusTransition: TMBStyleTransition?

    /// The color for drawing the accuracy radius border. To adjust transparency, set the alpha component of the color accordingly.
    @objc public var  accuracyRadiusBorderColor: TMBValue?

    /// Transition options for `accuracyRadiusBorderColor`.
    @objc public var  accuracyRadiusBorderColorTransition: TMBStyleTransition?

    /// The color for drawing the accuracy radius, as a circle. To adjust transparency, set the alpha component of the color accordingly.
    @objc public var  accuracyRadiusColor: TMBValue?

    /// Transition options for `accuracyRadiusColor`.
    @objc public var  accuracyRadiusColorTransition: TMBStyleTransition?

    /// The bearing of the location indicator.
    @objc public var  bearing: TMBValue?

    /// Transition options for `bearing`.
    @objc public var  bearingTransition: TMBStyleTransition?

    /// The size of the bearing image, as a scale factor applied to the size of the specified image.
    @objc public var  bearingImageSize: TMBValue?

    /// Transition options for `bearingImageSize`.
    @objc public var  bearingImageSizeTransition: TMBStyleTransition?

    /// The color of the circle emphasizing the indicator. To adjust transparency, set the alpha component of the color accordingly.
    @objc public var  emphasisCircleColor: TMBValue?

    /// Transition options for `emphasisCircleColor`.
    @objc public var  emphasisCircleColorTransition: TMBStyleTransition?

    /// The radius, in pixel, of the circle emphasizing the indicator, drawn between the accuracy radius and the indicator shadow.
    @objc public var  emphasisCircleRadius: TMBValue?

    /// Transition options for `emphasisCircleRadius`.
    @objc public var  emphasisCircleRadiusTransition: TMBStyleTransition?

    /// The displacement off the center of the top image and the shadow image when the pitch of the map is greater than 0. This helps producing a three-dimensional appearence.
    @objc public var  imagePitchDisplacement: TMBValue?

    /// An array of [latitude, longitude, altitude] position of the location indicator.
    @objc public var  location: TMBValue?

    /// Transition options for `location`.
    @objc public var  locationTransition: TMBStyleTransition?

    /// The opacity of the entire location indicator layer.
    @objc public var  locationIndicatorOpacity: TMBValue?

    /// Transition options for `locationIndicatorOpacity`.
    @objc public var  locationIndicatorOpacityTransition: TMBStyleTransition?

    /// The amount of the perspective compensation, between 0 and 1. A value of 1 produces a location indicator of constant width across the screen. A value of 0 makes it scale naturally according to the viewing projection.
    @objc public var  perspectiveCompensation: TMBValue?

    /// The size of the shadow image, as a scale factor applied to the size of the specified image.
    @objc public var  shadowImageSize: TMBValue?

    /// Transition options for `shadowImageSize`.
    @objc public var  shadowImageSizeTransition: TMBStyleTransition?

    /// The size of the top image, as a scale factor applied to the size of the specified image.
    @objc public var  topImageSize: TMBValue?

    /// Transition options for `topImageSize`.
    @objc public var  topImageSizeTransition: TMBStyleTransition?

    
    @objc public init(id : String) {
        self.id = id
        self.type = TMBLayerType.locationIndicator
        self.visibility = .visibility(.visible)
    }
}
extension TMBLocationIndicatorLayer: SwiftValueConvertible {
    public func unwrap() -> LocationIndicatorLayer {
        var result = LocationIndicatorLayer(id: self.id)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout LocationIndicatorLayer) {
        dest.slot = self.slot?.unwrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.bearingImage = self.bearingImage?.resolvedImage()
        dest.shadowImage = self.shadowImage?.resolvedImage()
        dest.topImage = self.topImage?.resolvedImage()
        dest.accuracyRadius = self.accuracyRadius?.double()
        dest.accuracyRadiusTransition = self.accuracyRadiusTransition?.unwrap()
        dest.accuracyRadiusBorderColor = self.accuracyRadiusBorderColor?.styleColor()
        dest.accuracyRadiusBorderColorTransition = self.accuracyRadiusBorderColorTransition?.unwrap()
        dest.accuracyRadiusColor = self.accuracyRadiusColor?.styleColor()
        dest.accuracyRadiusColorTransition = self.accuracyRadiusColorTransition?.unwrap()
        dest.bearing = self.bearing?.double()
        dest.bearingTransition = self.bearingTransition?.unwrap()
        dest.bearingImageSize = self.bearingImageSize?.double()
        dest.bearingImageSizeTransition = self.bearingImageSizeTransition?.unwrap()
        dest.emphasisCircleColor = self.emphasisCircleColor?.styleColor()
        dest.emphasisCircleColorTransition = self.emphasisCircleColorTransition?.unwrap()
        dest.emphasisCircleRadius = self.emphasisCircleRadius?.double()
        dest.emphasisCircleRadiusTransition = self.emphasisCircleRadiusTransition?.unwrap()
        dest.imagePitchDisplacement = self.imagePitchDisplacement?.double()
        dest.location = self.location?.arrayOfDouble()
        dest.locationTransition = self.locationTransition?.unwrap()
        dest.locationIndicatorOpacity = self.locationIndicatorOpacity?.double()
        dest.locationIndicatorOpacityTransition = self.locationIndicatorOpacityTransition?.unwrap()
        dest.perspectiveCompensation = self.perspectiveCompensation?.double()
        dest.shadowImageSize = self.shadowImageSize?.double()
        dest.shadowImageSizeTransition = self.shadowImageSizeTransition?.unwrap()
        dest.topImageSize = self.topImageSize?.double()
        dest.topImageSizeTransition = self.topImageSizeTransition?.unwrap()
    }
}
extension LocationIndicatorLayer {
    func wrap() -> TMBLocationIndicatorLayer {
        var result = TMBLocationIndicatorLayer(id: self.id)

        self.mapTo(&result)

        return result
    }

    func mapTo(_ dest: inout TMBLocationIndicatorLayer)  {
        dest.slot = self.slot?.wrap()
        dest.minZoom = self.minZoom?.double()
        dest.maxZoom = self.maxZoom?.double()
        dest.visibility = self.visibility.visibility()
        dest.bearingImage = self.bearingImage?.resolvedImage()
        dest.shadowImage = self.shadowImage?.resolvedImage()
        dest.topImage = self.topImage?.resolvedImage()
        dest.accuracyRadius = self.accuracyRadius?.double()
        dest.accuracyRadiusTransition = self.accuracyRadiusTransition?.wrap()
        dest.accuracyRadiusBorderColor = self.accuracyRadiusBorderColor?.styleColor()
        dest.accuracyRadiusBorderColorTransition = self.accuracyRadiusBorderColorTransition?.wrap()
        dest.accuracyRadiusColor = self.accuracyRadiusColor?.styleColor()
        dest.accuracyRadiusColorTransition = self.accuracyRadiusColorTransition?.wrap()
        dest.bearing = self.bearing?.double()
        dest.bearingTransition = self.bearingTransition?.wrap()
        dest.bearingImageSize = self.bearingImageSize?.double()
        dest.bearingImageSizeTransition = self.bearingImageSizeTransition?.wrap()
        dest.emphasisCircleColor = self.emphasisCircleColor?.styleColor()
        dest.emphasisCircleColorTransition = self.emphasisCircleColorTransition?.wrap()
        dest.emphasisCircleRadius = self.emphasisCircleRadius?.double()
        dest.emphasisCircleRadiusTransition = self.emphasisCircleRadiusTransition?.wrap()
        dest.imagePitchDisplacement = self.imagePitchDisplacement?.double()
        dest.location = self.location?.arrayOfDouble()
        dest.locationTransition = self.locationTransition?.wrap()
        dest.locationIndicatorOpacity = self.locationIndicatorOpacity?.double()
        dest.locationIndicatorOpacityTransition = self.locationIndicatorOpacityTransition?.wrap()
        dest.perspectiveCompensation = self.perspectiveCompensation?.double()
        dest.shadowImageSize = self.shadowImageSize?.double()
        dest.shadowImageSizeTransition = self.shadowImageSizeTransition?.wrap()
        dest.topImageSize = self.topImageSize?.double()
        dest.topImageSizeTransition = self.topImageSizeTransition?.wrap()
    }
}
