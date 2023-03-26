import MapboxCoreMaps
import MapboxMaps
@_implementationOnly import MapboxCommon_Private

@objc
extension OfflineManager {
    @objc
    public func loadStyle(
        styleUriString: String,
        styleLoadOptions: StylePackLoadOptions,
        progress: @escaping StylePackLoadProgressCallback,
        completion: @escaping (StylePack?, Error?)->Void
    ) -> TMBCancelable {
        let cancelable = self.loadStylePack(
            for: StyleURI(rawValue: styleUriString)!,
            loadOptions: styleLoadOptions,
            progress: progress
        ) { result in
            switch(result) {
            case .success(let stylePack):
                completion(stylePack, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
        return TMBCancelable(cancelable: cancelable)
    }
    
    @objc
    public func allStylePacks(_ completion: @escaping ([StylePack]?, Error?) -> Void) {
        self.allStylePacks { result in
            switch(result) {
            case .success(let stylePacks):
                completion(stylePacks, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

@objc
extension TileStore {
    @objc
    public class func getDefault() -> TileStore {
        TileStore.default;
    }
    
    @discardableResult
    @objc
    public func loadTileRegion(forId id: String,
                               loadOptions: TileRegionLoadOptions,
                               progress: TileRegionLoadProgressCallback? = nil,
                               completion: @escaping (TileRegion?, Error?) -> Void) -> TMBCancelable {
        let cancelable = loadTileRegion(forId: id, loadOptions: loadOptions, progress: progress) { result in
            switch(result) {
            case .success(let tileRegion):
                completion(tileRegion, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
        
        return TMBCancelable(cancelable: cancelable)
    }
    
    @objc
    public func allTileRegions(_ completion: @escaping ([TileRegion]?, Error?) -> Void) {
        self.allTileRegions { result in
            switch(result) {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
