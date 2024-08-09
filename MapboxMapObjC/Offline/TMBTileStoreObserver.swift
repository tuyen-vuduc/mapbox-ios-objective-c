import Foundation
import MapboxMaps
import MapboxCommon

@objc
public protocol TMBTileStoreObserver: AnyObject {
    /// Called whenever the load progress of a `TileRegion` changes.
    func onRegionLoadProgress(forId id: String, progress: TileRegionLoadProgress)

    /// Called when a `TileRegion` load finishes.
    func onRegionLoadFinished(forId id: String, region: TileRegion?, error: Error?)

    /// Called when a `TileRegion` was removed.
    func onRegionRemoved(forId id: String)

    /// Called when the geometry of a `TileRegion` was modified.
    func onRegionGeometryChanged(forId id: String, geometry: MapboxCommon.Geometry?)

    /// Called when the user-provided metadata associated with a `TileRegion` was changed.
    func onRegionMetadataChanged(forId id: String, value: Any)
}

internal class TMBTileStoreObserverWrapper : TileStoreObserver {
    let xvalue: TMBTileStoreObserver
    
    init(_ xvalue: TMBTileStoreObserver) {
        self.xvalue = xvalue
    }
    
    func onRegionLoadProgress(forId id: String, progress: TileRegionLoadProgress) {
        xvalue.onRegionLoadProgress(forId: id, progress: progress)
    }
    
    func onRegionLoadFinished(forId id: String, region: Result<TileRegion, Error>) {
        var xregion:TileRegion? = nil
        var xerror:Error? = nil
        switch region {
        case .success(let value):
            xregion = value
        case .failure(let error):
            xerror = error
        }
        xvalue.onRegionLoadFinished(forId: id, region: xregion, error: xerror)
    }
    
    func onRegionRemoved(forId id: String) {
        xvalue.onRegionRemoved(forId: id)
    }
    
    func onRegionGeometryChanged(forId id: String, geometry: MapboxMaps.Geometry?) {
        let xgeometry = geometry != nil ? MapboxCommon.Geometry(geometry!) : nil
        xvalue.onRegionGeometryChanged(forId: id, geometry: xgeometry)
    }
    
    func onRegionMetadataChanged(forId id: String, value: Any) {
        xvalue.onRegionMetadataChanged(forId: id, value: value)
    }
}
