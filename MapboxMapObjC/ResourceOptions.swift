import Foundation
import MapboxMaps

extension MapboxMaps.ResourceOptions {
    public init(_ objcValue: MapboxCoreMaps.ResourceOptions) {
        let baseURL      = objcValue.baseURL.flatMap { URL(fileURLWithPath: $0) }
        let dataPathURL = objcValue.dataPath.flatMap { URL(fileURLWithPath: $0) }
        let assetPathURL = objcValue.assetPath.flatMap { URL(fileURLWithPath: $0) }

        self.init(accessToken: objcValue.accessToken,
                  baseURL: baseURL,
                  dataPathURL: dataPathURL,
                  assetPathURL: assetPathURL,
                  tileStore: objcValue.tileStore,
                  tileStoreUsageMode: objcValue.tileStoreUsageMode)
    }
}
extension MapboxCoreMaps.ResourceOptions {
    internal convenience init(_ swiftValue: MapboxMaps.ResourceOptions) {
        self.init(accessToken: swiftValue.accessToken,
                  baseURL: swiftValue.baseURL?.path,
                  dataPath: swiftValue.dataPathURL?.path,
                  assetPath: swiftValue.assetPathURL?.path,
                  tileStore: swiftValue.tileStore,
                  tileStoreUsageMode: swiftValue.tileStoreUsageMode)
    }
}
