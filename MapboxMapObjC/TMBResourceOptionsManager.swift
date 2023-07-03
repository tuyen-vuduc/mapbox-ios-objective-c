import Foundation
import MapboxMaps

/// Convenience class that manages a global `ResourceOptions`
///
/// It's possible to create `ResourceOptionsManager` instances as you need them,
/// however it's convenient to use the default object (`default`).
///
/// For example, we recommend that the Mapbox access token be set in
/// `application(_:didFinishLaunchingWithOptions:)` rather than relying on the
/// value in your application's Info.plist:
///
///     ```
///     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
///         // Override point for customization after application launch.
///         ResourceOptionsManager.default.resourceOptions.accessToken = "overridden-access-token"
///         return true
///     }
///     ```
@objc open class TMBResourceOptionsManager: NSObject {
    private var _self: ResourceOptionsManager
    init(_ _self: ResourceOptionsManager) {
        self._self = _self
    }
    public var rawValue: ResourceOptionsManager {
        return _self
    }

    /// Default instance
    ///
    /// This shared instance is used by the default initializers
    /// for `ResourceOptions` and `MapInitOptions`.
    ///
    /// The application's Info.plist will be searched for a valid access token
    /// under the key `MBXAccessToken`
    ///
    /// A valid access token must be provided or found.
    @objc public static var `default`: TMBResourceOptionsManager {
        if defaultInstance == nil {
            defaultInstance = TMBResourceOptionsManager(ResourceOptionsManager.default)
        }
        return defaultInstance!
    }
    private static var defaultInstance: TMBResourceOptionsManager?

    /// Convenience function to remove the default instance. Calling `default`
    /// again will re-create the default instance.
    @objc public static func destroyDefault() {
        defaultInstance = nil
        ResourceOptionsManager.destroyDefault()
    }

    /// Return the current resource options.
    @objc public var resourceOptions: MapboxCoreMaps.ResourceOptions {
        get {
            return _self.resourceOptions.objcValue()
        }
        set {
            _self.resourceOptions = newValue.swiftValue()
        }
    }

    /// Initializes a `ResourceOptionsManager` with an optional access token.
    ///
    /// If the supplied token is nil (which is the case for the `default`) then
    /// we will use appropriate defaults for the `ResourceOptions`, including
    /// searching for an access token in the application's Info.plist.
    ///
    /// You can override the shared global access token, using
    /// `ResourceOptionsManager.default`:
    ///
    ///     ```
    ///     ResourceOptionsManager.default.resourceOptions.accessToken = "overridden-access-token"
    ///     ```
    ///
    /// - Parameter accessToken: Valid access token or `nil`
    @objc public convenience init(accessToken: String? = nil) {
        self.init()
        _self = ResourceOptionsManager(accessToken: accessToken)
    }

    /// Initializes a `ResourceOptionsManager` with the specified `resourceOptions`.
    ///
    /// - Parameter resourceOptions: Resource options to initialize the manager with.
    @objc public convenience init(resourceOptions: MapboxCoreMaps.ResourceOptions) {
        self.init()
        _self = ResourceOptionsManager(resourceOptions: resourceOptions.swiftValue())
    }
}
