import UIKit
import MapboxMaps


/// Represents the different types of pucks
@objc public enum TMBPuckType: Int {
    /// A 2-dimensional puck. Optionally provide `Puck2DConfiguration` to configure the puck's appearance.
    case puck2D

    /// A 3-dimensional puck. Provide a `Puck3DConfiguration` to configure the puck's appearance.
    case puck3D
}

@objc public protocol TMBPuckTypeConfiguration {
    
}

extension TMBPuckTypeConfiguration {
    func unwrap() -> PuckType? {
        switch(self) {
        case let puck2D as TMBPuck2DConfiguration:
            return .puck2D(puck2D.unwrap())
        case let puck3D as TMBPuck3DConfiguration:
            return .puck3D(puck3D.unwrap())
        default:
            return nil
        }
    }
}

extension PuckType{
    func wrap() -> TMBPuckTypeConfiguration {
        switch(self) {
        case .puck2D(let puck2D):
            return puck2D.wrap()
        case .puck3D(let puck3D):
            return puck3D.wrap()
        }
    }
}

@objc open class TMBPuck2DConfiguration: NSObject, TMBPuckTypeConfiguration {
    /// The opacity of the entire location indicator.
    @objc public var opacity: Double

    /// Image to use as the top of the location indicator.
    @objc public var topImage: UIImage?

    /// Image to use as the middle of the location indicator.
    @objc public var bearingImage: UIImage?

    /// Image to use as the background of the location indicator.
    @objc public var shadowImage: UIImage?

    /// The size of the images, as a scale factor applied to the size of the specified image.
    @objc public var scale: TMBValue?

    // Location puck pulsing configuration is pulsing on the map.
    @objc public var pulsing: TMBPuck2DConfigurationPulsing?

    /// Flag determining if the horizontal accuracy ring should be shown arround the `Puck`. default value is false
    @objc public var showsAccuracyRing: Bool

    /// The color of the accuracy ring.
    @objc public var accuracyRingColor: UIColor

    /// The color of the accuracy ring border.
    @objc public var accuracyRingBorderColor: UIColor

    /// Initialize a `Puck2D` object with a top image, bearing image, shadow image, scale, opacity and accuracy ring visibility.
    /// - Parameters:
    ///   - topImage: The image to use as the top layer for the location indicator.
    ///   - bearingImage: The image used as the middle of the location indicator.
    ///   - shadowImage: The image that acts as a background of the location indicator.
    ///   - scale: The size of the images, as a scale factor applied to the size of the specified image.
    ///   - showsAccuracyRing: Indicates whether the location accurary ring should be shown.
    ///   - opacity: The opacity of the entire location indicator.
    @objc public init(topImage : UIImage?,
                bearingImage : UIImage?,
                shadowImage : UIImage?, 
                scale : TMBValue?,
                pulsing : TMBPuck2DConfigurationPulsing?,
                showsAccuracyRing : Bool ,
                opacity : Double ){
        self.topImage = topImage
        self.bearingImage = bearingImage
        self.shadowImage = shadowImage
        self.scale = scale
        self.pulsing = pulsing
        self.showsAccuracyRing = showsAccuracyRing
        self.opacity = opacity
        self.accuracyRingColor = UIColor(red: 0.537, green: 0.812, blue: 0.941, alpha: 0.3)
        self.accuracyRingBorderColor = UIColor(red: 0.537, green: 0.812, blue: 0.941, alpha: 0.3)
    }

    /// Initialize a `Puck2D` object with a top image, bearing image, shadow image, scale, opacity and accuracy ring visibility.
    /// - Parameters:
    ///   - topImage: The image to use as the top layer for the location indicator.
    ///   - bearingImage: The image used as the middle of the location indicator.
    ///   - shadowImage: The image that acts as a background of the location indicator.
    ///   - scale: The size of the images, as a scale factor applied to the size of the specified image..
    ///   - showsAccuracyRing: Indicates whether the location accurary ring should be shown.
    ///   - accuracyRingColor:The color of the accuracy ring.
    ///   - accuracyRingBorderColor: The color of the accuracy ring border.
    ///   - opacity: The opacity of the entire location indicator.
    @objc public init(topImage : UIImage?,
                bearingImage : UIImage?,
                shadowImage : UIImage?,
                scale : TMBValue?,
                showsAccuracyRing : Bool , 
                accuracyRingColor : UIColor , 
                accuracyRingBorderColor : UIColor , 
                opacity : Double ){
        self.topImage = topImage
        self.bearingImage = bearingImage
        self.shadowImage = shadowImage
        self.scale = scale
        self.showsAccuracyRing = showsAccuracyRing
        self.accuracyRingColor = accuracyRingColor
        self.accuracyRingBorderColor = accuracyRingBorderColor
        self.opacity = opacity
    }

    /// Create a Puck2DConfiguration instance with or without an arrow bearing image. Default without the arrow bearing image.
    @objc public static func makeDefault(showBearing: Bool = false) -> TMBPuck2DConfiguration {
        return Puck2DConfiguration.makeDefault(showBearing: showBearing).wrap()
    }
}
extension TMBPuck2DConfiguration {
    func unwrap() -> Puck2DConfiguration {
        var result = Puck2DConfiguration(topImage: self.topImage,
            bearingImage: self.bearingImage,
            shadowImage: self.shadowImage,
            scale: self.scale?.double(),
            showsAccuracyRing: self.showsAccuracyRing,
            accuracyRingColor: self.accuracyRingColor,
            accuracyRingBorderColor: self.accuracyRingBorderColor,
            opacity: self.opacity)
        result.pulsing = self.pulsing?.unwrap()
        return result
    }
}
extension Puck2DConfiguration {
    func wrap() -> TMBPuck2DConfiguration {
        var result = TMBPuck2DConfiguration(topImage: self.topImage,
          bearingImage: self.bearingImage,
          shadowImage: self.shadowImage,
          scale: (self.scale)?.double(),
          showsAccuracyRing: self.showsAccuracyRing,
          accuracyRingColor: self.accuracyRingColor,
          accuracyRingBorderColor: self.accuracyRingBorderColor,
          opacity: self.opacity)
        result.pulsing = self.pulsing?.wrap()
        return result
    }
}

// swiftlint:disable nesting
/// Circle radius configuration for the pulsing circle animation.
@objc open class TMBPuck2DConfigurationPulsingRadius: NSObject {
    @objc public let constant: NSNumber?
    
    init(constant: Double?) {
        self.constant = constant?.double()
    }
    
    @objc public static let accuracy = TMBPuck2DConfigurationPulsingRadius(constant: nil)
    @objc public static func fromConstant(_ constant: Double) -> TMBPuck2DConfigurationPulsingRadius {
        TMBPuck2DConfigurationPulsingRadius(constant: constant)
    }
}

extension TMBPuck2DConfigurationPulsingRadius {
    func unwrap() -> Puck2DConfiguration.Pulsing.Radius {
        if let constant = self.constant?.double() {
            return .constant(constant)
        }
        return .accuracy
    }
}
extension Puck2DConfiguration.Pulsing.Radius {
    func wrap() -> TMBPuck2DConfigurationPulsingRadius {
        switch (self) {
        case .accuracy:
            return TMBPuck2DConfigurationPulsingRadius(constant: nil)
        case .constant(let constant):
            return TMBPuck2DConfigurationPulsingRadius(constant: constant)
        }
    }
}

/// The configuration parameters for sonar-like pulsing circle animation shown around the 2D puck.
@objc open class TMBPuck2DConfigurationPulsing: NSObject {
    @objc public static var `default`: TMBPuck2DConfigurationPulsing {
        Puck2DConfiguration.Pulsing.default.wrap()
    }
    // swiftlint:enable nesting

    /// Flag determining whether the pulsing circle animation. `true` by default.
    @objc public var isEnabled: Bool

    /// The color of the pulsing circle.
    @objc public var color: UIColor

    /// The radius of the pulsing circle.
    @objc public var radius: TMBPuck2DConfigurationPulsingRadius

    /// Create a pulsing animation config with a color and radius.
    /// - Parameters:
    ///   - color: The color of the pulsing circle.
    ///   - radius: The radius of the pulsing circle.
    @objc public init(color: UIColor = UIColor(red: 0.29, green: 0.565, blue: 0.886, alpha: 1),
                radius: TMBPuck2DConfigurationPulsingRadius = TMBPuck2DConfigurationPulsingRadius(constant: 30)) {
        self.color = color
        self.radius = radius
        self.isEnabled = true
    }
}
extension TMBPuck2DConfigurationPulsing {
    func unwrap() -> Puck2DConfiguration.Pulsing {
        var result = Puck2DConfiguration.Pulsing(
            color: self.color,
            radius: self.radius.unwrap()
        )
        result.isEnabled = self.isEnabled
        return result
    }
}
extension Puck2DConfiguration.Pulsing {
    func wrap() -> TMBPuck2DConfigurationPulsing {
        var result = TMBPuck2DConfigurationPulsing(
            color: self.color,
            radius: self.radius.wrap()
        )
        result.isEnabled = self.isEnabled
        return result
    }
}

@objc open class TMBPuck3DConfiguration: NSObject, TMBPuckTypeConfiguration {

    /// The model to use as the locaiton puck
    @objc public var model: TMBModel

    /// The scale of the model.
    @objc public var modelScale: TMBValue?

    /// The rotation of the model in euler angles [lon, lat, z].
    @objc public var modelRotation: TMBValue?

    /// The opacity of the model used as the location puck
    @objc public var modelOpacity: TMBValue?

    /// Strength of the emission.
    ///
    /// There is no emission for value 0. For value 1.0, only emissive component (no shading) is displayed and values above 1.0 produce light contribution to surrounding area, for some of the parts (e.g. windows).
    ///
    /// Default value is 1.
    @objc public var modelEmissiveStrength: TMBValue?

    /// Initialize a `Puck3DConfiguration` with a model, scale and rotation.
    /// - Parameters:
    ///   - model: The `gltf` model to use for the puck.
    ///   - modelScale: The amount to scale the model by.
    ///   - modelRotation: The rotation of the model in euler angles `[lon, lat, z]`.
    ///   - modelOpacity: The opacity of the model used as the location puck
    @objc public init(
        model : TMBModel, 
        modelScale : TMBValue?,
        modelRotation : TMBValue?,
        modelOpacity : TMBValue?){
        self.model = model
        self.modelScale = modelScale
        self.modelRotation = modelRotation
        self.modelOpacity = modelOpacity
    }
}
extension TMBPuck3DConfiguration {
    func unwrap() -> Puck3DConfiguration {
        Puck3DConfiguration(model: (self.model).unwrap(),
            modelScale: (self.modelScale)?.arrayOfDouble(),
            modelRotation: (self.modelRotation)?.arrayOfDouble(),
            modelOpacity: (self.modelOpacity)?.double())
    }
}
extension Puck3DConfiguration {
    func wrap() -> TMBPuck3DConfiguration {
        TMBPuck3DConfiguration(model: (self.model).wrap(),
          modelScale: (self.modelScale)?.arrayOfDouble(),
          modelRotation: (self.modelRotation)?.arrayOfDouble(),
          modelOpacity: (self.modelOpacity)?.double())
    }
}
