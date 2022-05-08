import Foundation
import MapboxMaps

@objc
open class MapInitOptionsFactory : NSObject {
    @objc public static func create(
        resourceOptions: MapboxCoreMaps.ResourceOptions? = nil,
        mapOptions: MapOptions? = nil,
        cameraOptions: MapboxCoreMaps.CameraOptions? = nil,
        stylePath: String?) -> MapInitOptions {
    
        let swiftResourceOptions = resourceOptions != nil
            ? MapboxMaps.ResourceOptions(resourceOptions!)
            : ResourceOptionsManager.default.resourceOptions
            
        let swiftCameraOptions = cameraOptions?.create()
            
        let swiftStyleUri = stylePath != nil
            ? StyleURI(rawValue: stylePath!)
            : nil
        
        return MapInitOptions(
            resourceOptions: swiftResourceOptions,
            mapOptions: mapOptions ?? MapOptions(),
            cameraOptions: swiftCameraOptions,
            styleURI: swiftStyleUri ?? .streets)
    }
    
    @objc public static func create(
        resourceOptions: MapboxCoreMaps.ResourceOptions? = nil,
        mapOptions: MapOptions? = nil,
        cameraOptions: MapboxCoreMaps.CameraOptions? = nil,
        styleURI: URL?) -> MapInitOptions {
    
        let swiftResourceOptions = resourceOptions != nil
            ? MapboxMaps.ResourceOptions(resourceOptions!)
            : ResourceOptionsManager.default.resourceOptions
            
        let swiftCameraOptions = cameraOptions?.create()
            
        let swiftStyleUri = styleURI != nil
            ? StyleURI(url: styleURI!)
            : nil
        
        return MapInitOptions(
            resourceOptions: swiftResourceOptions,
            mapOptions: mapOptions ?? MapOptions(),
            cameraOptions: swiftCameraOptions,
            styleURI: swiftStyleUri ?? .streets)
    }
}
