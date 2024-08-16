//
//  TMBTileCacheBudgetSize.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 8/16/24.
//

import Foundation
import MapboxMaps

/// Defines a TileCacheBudgetSize, which can be set as either a megabyte or tile count limit.
/// Whenever tile cache goes over the defined limit
/// the least recently used tile will be evicted from the in-memory cache
///
///  To use, create a TileCacheBudgetSize and then either:
///  (1) Set it for an individual source with with the tileCacheBudget property, or
///  (2) Set if for the map with ``MapboxMap/setTileCacheBudget(size:)``
@objc public class TMBTileCacheBudgetSize : NSObject{

    /// A tile cache budget measured in tile units
    @objc public let tiles: NSNumber?

    /// A tile cache budget measured in megabyte units
    @objc public let megabytes: NSNumber?
    
    private init(tiles: NSNumber?, megabytes: NSNumber?) {
        self.tiles = tiles
        self.megabytes = megabytes
    }
    
    @objc public static func inTiles(_ tiles: Int) -> TMBTileCacheBudgetSize {
        TMBTileCacheBudgetSize(tiles: tiles.int(), megabytes: nil)
    }
    
    @objc public static func inMegabytes(_ megabytes: Int) -> TMBTileCacheBudgetSize {
        TMBTileCacheBudgetSize(tiles: nil, megabytes: megabytes.int())
    }

    /// The TileCacheBudget formatted for core
    @objc public var coreTileCacheBudget: TileCacheBudget {
        if let tiles {
            return TileCacheBudget.fromTileCacheBudget(TileCacheBudgetInTiles(size: tiles.uint64Value))
        }
        return TileCacheBudget.fromTileCacheBudget(TileCacheBudgetInMegabytes(size: megabytes!.uint64Value))
    }
}

extension TileCacheBudgetSize {
    func wrap() -> TMBTileCacheBudgetSize {
        switch self {
        case .tiles(let tiles):
            return TMBTileCacheBudgetSize.inTiles(tiles)
        case .megabytes(let megabytes):
            return TMBTileCacheBudgetSize.inMegabytes(megabytes)
        }
    }
    func tileCacheBudgetSize() -> TMBTileCacheBudgetSize { wrap() }
}
extension TMBTileCacheBudgetSize {
    func unwrap() -> TileCacheBudgetSize {
        if let tiles {
            return .tiles(tiles.intValue)
        }
        
        return .megabytes(megabytes!.intValue)
    }
    func tileCacheBudgetSize() -> TileCacheBudgetSize { unwrap() }
}
