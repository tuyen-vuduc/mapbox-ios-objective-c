import Foundation
import MapboxMaps

@objc
open class MapInitOptionsFactory : NSObject {
    /// :nodoc:
    /// See https://developer.apple.com/forums/thread/650054 for context
    @available(*, unavailable)
    internal override init() {
        fatalError("This initializer should not be called.")
    }
    
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

extension MapInitOptions {
    @objc public func options() -> NSArray {
        return [
            MapboxCoreMaps.ResourceOptions(self.resourceOptions),
            self.mapOptions,
            self.cameraOptions,
            self.styleURI?.rawValue,
        ]
    }
}
