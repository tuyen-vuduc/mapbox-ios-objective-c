import MapboxMaps

@objc
open class MapInitOptionsBuilder : NSObject {
    @objc public class var defaultResourceOptions: MapboxCoreMaps.ResourceOptions {
        MapboxCoreMaps.ResourceOptions(ResourceOptionsManager.default.resourceOptions)
    }
    
    @objc public class func create() -> MapInitOptionsBuilder {
        MapInitOptionsBuilder()
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
        self.cameraOptions = value?.swiftValue()
        
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
}