import Foundation
import MapboxMaps

/// Options used when initializing `MapView`.
///
/// Contains the `ResourceOptions`, `MapOptions` (including `GlyphsRasterizationOptions`)
/// that are required to initialize a `MapView`.
@objc
extension MapInitOptions {
    /// Associated `MapOptions`
    @objc public func getMapOptions() -> MapOptions {
        return self.mapOptions
    }
    
    /// Style URI for initializing the map. Defaults to Mapbox Streets.
    @objc public func getStyleURI() -> String? {
        return self.styleURI?.rawValue
    }
    
    /// String representation of JSON style spec. Has precedence over ``styleURI``.
    @objc public func getStyleJSON() -> String? {
        return self.styleJSON
    }
    
    /// Camera options for initializing the map. CameraOptions default to 0.0 for each value.
    @objc public func getCameraOptions() -> TMBCameraOptions {
        return TMBCameraOptions(self.cameraOptions)
    }
    
    @objc public func getAntialiasingSampleCount() -> Int {
        return self.antialiasingSampleCount
    }
}

@objc open class MapInitOptionsFactory : NSObject {
    /// Initializer. The default initializer, i.e. `MapInitOptions()` will use
    /// the default `ResourceOptionsManager` to use the current shared access token.
    ///
    /// - Parameters:
    ///   - resourceOptions: `ResourceOptions`; default creates an instance
    ///         using `ResourceOptionsManager.default`
    ///   - mapOptions: `MapOptions`; see `GlyphsRasterizationOptions` for the default
    ///         used for glyph rendering.
    ///   - cameraOptions: `CameraOptions` to be applied to the map, overriding
    ///         the default camera that has been specified in the style.
    ///   - styleURI: Style URI for the map to load. Defaults to `.streets`, but
    ///         can be `nil`.
    ///   - styleJSON: Style JSON in String representation. Has precedence over ``styleURI``.
    @objc public static func create(
        mapOptions: MapOptions? = nil,
        cameraOptions: TMBCameraOptions? = nil,
        styleURI: String? = nil,
        styleJSON: String? = nil,
        antialiasingSampleCount: Int = 1
    ) -> MapInitOptions {
        let xstyleUri = styleURI != nil
            ? StyleURI(rawValue: styleURI!)
            : .streets
        
        return MapInitOptions(
            mapOptions: mapOptions ?? MapOptions(),
            cameraOptions: CameraOptions(cameraOptions),
            styleURI: xstyleUri,
            styleJSON: styleJSON,
            antialiasingSampleCount: antialiasingSampleCount)
    }
}
