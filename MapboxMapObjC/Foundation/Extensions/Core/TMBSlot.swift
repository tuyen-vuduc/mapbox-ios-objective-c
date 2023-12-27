import Foundation
import MapboxMaps

/// A pre-specified location in the style where layer will be added to
/// (such as on top of existing land layers, but below all labels).
@objc open class TMBSlot: NSObject {
    /// Above POI labels and behind Place and Transit labels
    @objc public static let top = TMBSlot(origin: Slot.top!)

    /// Above lines (roads, etc.) and behind 3D buildings
    @objc public static let middle = TMBSlot(origin: Slot.middle!)

    /// Above polygons (land, landuse, water, etc.)
    @objc public static let bottom = TMBSlot(origin: Slot.bottom!)
    public let origin: Slot
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: Slot(rawValue: rawValue)!)
    }

    public init(origin: Slot) {
       self.origin = origin
    }
}
extension Slot {
    func wrap() -> TMBSlot {
        TMBSlot(origin: self)
    }
}
extension TMBSlot {
    func unwrap() -> Slot {
        self.origin
    }
}
