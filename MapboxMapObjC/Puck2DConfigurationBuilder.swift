import MapboxMaps

@objc
open class Puck2DConfigurationBuilder : NSObject {
    public static let defaultAccuracyRingColor = UIColor(red: 0.537, green: 0.812, blue: 0.941, alpha: 0.3)
    public static let defaultOpacity: NSNumber = 1
    
    private var pulsingBuilder: Puck2DConfigurationPulsingBuilder?
    
    public func build() -> Puck2DConfiguration {
        var puck2DConfiguration = Puck2DConfiguration(
            topImage: topImage,
            bearingImage: bearingImage,
            shadowImage: shadowImage,
            scale: scale,
            showsAccuracyRing: showsAccuracyRing,
            accuracyRingColor: accuracyRingColor ?? Puck2DConfigurationBuilder.defaultAccuracyRingColor,
            accuracyRingBorderColor: accuracyRingBorderColor ?? Puck2DConfigurationBuilder.defaultAccuracyRingColor,
            opacity: Double(truncating: opacity ?? Puck2DConfigurationBuilder.defaultOpacity))
        
        puck2DConfiguration.pulsing = pulsingBuilder?.build()
        
        return puck2DConfiguration
    }
    
    @objc public func setPulsingBuilder(_ builder: Puck2DConfigurationPulsingBuilder?) -> Puck2DConfigurationBuilder {
        pulsingBuilder = builder
        
        return self
    }
    
    @objc public func setPulsing(_ build: (_ builder: Puck2DConfigurationPulsingBuilder) -> Void) -> Puck2DConfigurationBuilder {
        pulsingBuilder = Puck2DConfigurationPulsingBuilder()
        
        build(pulsingBuilder!)
        
        return self
    }
    
    /// The opacity of the entire location indicator.
    private var opacity: NSNumber?
    @objc public func setOpacity(_ value: NSNumber) -> Puck2DConfigurationBuilder {
        opacity = value
        return self
    }

    /// Image to use as the top of the location indicator.
    private var topImage: UIImage?
    @objc public func setTopImage(_ value: UIImage?) -> Puck2DConfigurationBuilder {
        topImage = value
        return self
    }
    
    /// Image to use as the middle of the location indicator.
    private var bearingImage: UIImage?
    @objc public func setBearingImage(_ value: UIImage?) -> Puck2DConfigurationBuilder {
        bearingImage = value
        return self
    }

    /// Image to use as the background of the location indicator.
    private var shadowImage: UIImage?
    @objc public func setShadowImage(_ value: UIImage?) -> Puck2DConfigurationBuilder {
        shadowImage = value
        return self
    }

    /// The size of the images, as a scale factor applied to the size of the specified image.
    private var scale: Value<Double>?
    // TODO setScale of an Expression
    @objc public func setScale(_ value: NSNumber?) -> Puck2DConfigurationBuilder {
        if let value {
            scale = .constant(value.doubleValue)
        } else {
            scale = nil
        }
        return self
    }

    /// Flag determining if the horizontal accuracy ring should be shown arround the `Puck`. default value is false
    private var showsAccuracyRing: Bool = false
    @objc public func setShowsAccuracyRing(_ value: Bool) -> Puck2DConfigurationBuilder {
        showsAccuracyRing = value
        return self
    }

    /// The color of the accuracy ring.
    private var accuracyRingColor: UIColor?
    @objc public func setAccuracyRingColor(_ value: UIColor?) -> Puck2DConfigurationBuilder {
        accuracyRingColor = value
        return self
    }

    /// The color of the accuracy ring border.
    private var accuracyRingBorderColor: UIColor?
    @objc public func setAccuracyRingBorderColor(_ value: UIColor?) -> Puck2DConfigurationBuilder {
        accuracyRingBorderColor = value
        return self
    }
}

@objc
open class Puck2DConfigurationPulsingBuilder : NSObject {
    public func build() -> Puck2DConfiguration.Pulsing {
        return Puck2DConfiguration.Pulsing()
    }
    
    public static let defaultColor = UIColor(red: 0.29, green: 0.565, blue: 0.886, alpha: 1)
    public static let defaultRadius: NSNumber = 30
    
    private var color: UIColor = defaultColor
    @objc public func setColor(_ color: UIColor?) -> Puck2DConfigurationPulsingBuilder {
        self.color = color ?? Puck2DConfigurationPulsingBuilder.defaultColor
        return self
    }
    
    private var radius: Puck2DConfiguration.Pulsing.Radius = .constant(defaultRadius.doubleValue)
    @objc public func setRadius(value: NSNumber? = Puck2DConfigurationPulsingBuilder.defaultRadius) -> Puck2DConfigurationPulsingBuilder {
        if let value
        {
            self.radius = .constant(value.doubleValue)
        }
        else {
            self.radius =  .accuracy
        }
        return self
    }
}
