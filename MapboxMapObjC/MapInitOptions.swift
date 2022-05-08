import Foundation
import MapboxMaps

extension MapInitOptions {
    @objc public convenience init(
        resourceOptions: MapboxCoreMaps.ResourceOptions? = nil,
        mapOptions: MapOptions? = nil,
        cameraOptions: MapboxCoreMaps.CameraOptions? = nil,
        stylePath: String?) {
    
        let swiftResourceOptions = resourceOptions != nil
            ? MapboxMaps.ResourceOptions(resourceOptions!)
            : ResourceOptionsManager.default.resourceOptions
            
        let swiftCameraOptions = cameraOptions?.create()
            
        let swiftStyleUri = stylePath != nil
            ? StyleURI(rawValue: stylePath!)
            : nil
        
        self.init(
            resourceOptions: swiftResourceOptions,
            mapOptions: mapOptions ?? MapOptions(),
            cameraOptions: swiftCameraOptions,
            styleURI: swiftStyleUri ?? .streets)
    }
    
    @objc public convenience init(
        resourceOptions: MapboxCoreMaps.ResourceOptions? = nil,
        mapOptions: MapOptions? = nil,
        cameraOptions: MapboxCoreMaps.CameraOptions? = nil,
        styleURI: URL?) {
    
        let swiftResourceOptions = resourceOptions != nil
            ? MapboxMaps.ResourceOptions(resourceOptions!)
            : ResourceOptionsManager.default.resourceOptions
            
        let swiftCameraOptions = cameraOptions?.create()
            
        let swiftStyleUri = styleURI != nil
            ? StyleURI(url: styleURI!)
            : nil
        
        self.init(
            resourceOptions: swiftResourceOptions,
            mapOptions: mapOptions ?? MapOptions(),
            cameraOptions: swiftCameraOptions,
            styleURI: swiftStyleUri ?? .streets)
    }
}
