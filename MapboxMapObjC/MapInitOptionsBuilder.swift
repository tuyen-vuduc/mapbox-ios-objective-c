import MapboxMaps

@objc
open class MapboxInitOptionsBuilder : NSObject {
    @objc public class var defaultResourceOptions: MapboxCoreMaps.ResourceOptions {
        return MapboxCoreMaps.ResourceOptions(ResourceOptionsManager.default.resourceOptions)
    }
    
    @objc public class func create() -> MapboxInitOptionsBuilder {
        return MapboxInitOptionsBuilder()
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
    
    @objc public func resourceOptions(_ value: MapboxCoreMaps.ResourceOptions?) -> MapboxInitOptionsBuilder {
        self.resourceOptions = value != nil
            ? ResourceOptions(value!)
            : ResourceOptionsManager.default.resourceOptions
        
        return self
    }
    
    @objc public func accessToken(_ value: String) -> MapboxInitOptionsBuilder {
        self.resourceOptions = ResourceOptions(accessToken: value)
        return self
    }
    
    @objc public func mapOptions(_ value: MapOptions?) -> MapboxInitOptionsBuilder {
        self.mapOptions = value
        
        return self
    }
    
    @objc public func cameraOptions(_ value: MapboxCoreMaps.CameraOptions?) -> MapboxInitOptionsBuilder {
        self.cameraOptions = value?.create()
        
        return self
    }
    
    @objc public func styleUriString(_ value: String) -> MapboxInitOptionsBuilder {
        self.styleUri = StyleURI(rawValue: value)
        
        return self
    }
    
    @objc public func styleUri(_ value: URL) -> MapboxInitOptionsBuilder {
        self.styleUri = StyleURI(url: value)
        
        return self
    }
    
    /// Mapbox Streets is a general-purpose style with detailed road and transit networks.
    @objc public func styleStreets() -> MapboxInitOptionsBuilder {
        self.styleUri = .streets
        
        return self
    }

    /// Mapbox Outdoors is a general-purpose style tailored to outdoor activities.
    @objc public func styleOutdoors() -> MapboxInitOptionsBuilder {
        self.styleUri = .outdoors
        
        return self
    }

    /// Mapbox Light is a subtle, light-colored backdrop for data visualizations.
    @objc public func styleLight() -> MapboxInitOptionsBuilder {
        self.styleUri = .light
        
        return self
    }

    /// Mapbox Dark is a subtle, dark-colored backdrop for data visualizations.
    @objc public func styleDark() -> MapboxInitOptionsBuilder {
        self.styleUri = .dark
        
        return self
    }

    /// The Mapbox Satellite style is a base-map of high-resolution satellite and aerial imagery.
    @objc public func styleSatellite() -> MapboxInitOptionsBuilder {
        self.styleUri = .satellite
        
        return self
    }

    /// The Mapbox Satellite Streets style combines the high-resolution satellite and aerial imagery
    /// of Mapbox Satellite with unobtrusive labels and translucent roads from Mapbox Streets.
    @objc public func styleSatelliteStreets() -> MapboxInitOptionsBuilder {
        self.styleUri = .satelliteStreets
        
        return self
    }
}
