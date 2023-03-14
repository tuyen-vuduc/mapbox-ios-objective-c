import MapboxMaps

@objc
open class MapInitOptionsBuilder : NSObject {
    @objc public class var defaultResourceOptions: MapboxCoreMaps.ResourceOptions {
        return MapboxCoreMaps.ResourceOptions(ResourceOptionsManager.default.resourceOptions)
    }
    
    @objc public class func create() -> MapInitOptionsBuilder {
        return MapInitOptionsBuilder()
    }
    
    private var resourceOptions: ResourceOptions = ResourceOptionsManager.default.resourceOptions
    private var mapOptions: MapOptions?
    private var cameraOptions: CameraOptions?
    private var styleUri: StyleURI?
    
    @objc public func build() -> MapInitOptions {
        return MapInitOptions(
            resourceOptions: resourceOptions,
            mapOptions: mapOptions ?? MapOptions(),
            cameraOptions: cameraOptions,
            styleURI: styleUri ?? .streets)
    }
    
    @objc public func resourceOptions(_ value: MapboxCoreMaps.ResourceOptions?) -> MapInitOptionsBuilder {
        self.resourceOptions = value != nil
            ? ResourceOptions(value!)
            : ResourceOptionsManager.default.resourceOptions
        
        return self
    }
    
    @objc public func accessToken(_ value: String) -> MapInitOptionsBuilder {
        self.resourceOptions = ResourceOptions(accessToken: value)
        return self
    }
    
    @objc public func mapOptions(_ value: MapOptions?) -> MapInitOptionsBuilder {
        self.mapOptions = value
        
        return self
    }
    
    @objc public func cameraOptions(_ value: MapboxCoreMaps.CameraOptions?) -> MapInitOptionsBuilder {
        self.cameraOptions = value?.create()
        
        return self
    }
    
    @objc public func styleUriString(_ value: String) -> MapInitOptionsBuilder {
        self.styleUri = StyleURI(rawValue: value)
        
        return self
    }
    
    @objc public func styleUri(_ value: URL) -> MapInitOptionsBuilder {
        self.styleUri = StyleURI(url: value)
        
        return self
    }
    
    /// Mapbox Streets is a general-purpose style with detailed road and transit networks.
    @objc public func styleStreets() -> MapInitOptionsBuilder {
        self.styleUri = .streets
        
        return self
    }

    /// Mapbox Outdoors is a general-purpose style tailored to outdoor activities.
    @objc public func styleOutdoors() -> MapInitOptionsBuilder {
        self.styleUri = .outdoors
        
        return self
    }

    /// Mapbox Light is a subtle, light-colored backdrop for data visualizations.
    @objc public func styleLight() -> MapInitOptionsBuilder {
        self.styleUri = .light
        
        return self
    }

    /// Mapbox Dark is a subtle, dark-colored backdrop for data visualizations.
    @objc public func styleDark() -> MapInitOptionsBuilder {
        self.styleUri = .dark
        
        return self
    }

    /// The Mapbox Satellite style is a base-map of high-resolution satellite and aerial imagery.
    @objc public func styleSatellite() -> MapInitOptionsBuilder {
        self.styleUri = .satellite
        
        return self
    }

    /// The Mapbox Satellite Streets style combines the high-resolution satellite and aerial imagery
    /// of Mapbox Satellite with unobtrusive labels and translucent roads from Mapbox Streets.
    @objc public func styleSatelliteStreets() -> MapInitOptionsBuilder {
        self.styleUri = .satelliteStreets
        
        return self
    }
}
