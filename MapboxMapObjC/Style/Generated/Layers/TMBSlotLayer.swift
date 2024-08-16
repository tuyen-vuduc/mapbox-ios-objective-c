// This file is generated.
import UIKit
import MapboxMaps

/// Marks the position of a slot.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-slot)
@objc open class TMBSlotLayer: NSObject, TMBLayer {
    @objc public init(id: String) {
        self.id = id
        self.type = TMBLayerType.slot
        self.visibility = .visibility(.visible)
    }

    // MARK: - Conformance to `Layer` protocol
    /// Unique layer name
    @objc public var id: String

    /// Rendering type of this layer.
    @objc public let type: TMBLayerType

    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc public var slot: TMBSlot?

    /// No-op for slot layer.
    @objc public var minZoom: NSNumber?

    /// No-op for slot layer.
    @objc public var maxZoom: NSNumber?

    /// No-op for slot layer.
    @objc public var visibility: TMBValue

}

extension TMBSlotLayer {
    func mapTo(_ source: inout SlotLayer) {
        source.id = self.id
        source.slot = self.slot?.slot()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
    }
}

extension SlotLayer {
    func mapTo(_ source:inout TMBSlotLayer) {
        source.id = self.id
        source.slot = self.slot?.wrap()
        source.minZoom = self.minZoom?.double()
        source.maxZoom = self.maxZoom?.double()
        source.visibility = self.visibility.visibility()
    }
}

extension TMBSlotLayer: SwiftValueConvertible {
    public func unwrap() -> SlotLayer {
        var result = SlotLayer(id: self.id)
        self.mapTo(&result)
        return result
    }
}

extension SlotLayer {
    func wrap() -> TMBSlotLayer {
        var result = TMBSlotLayer(id: self.id)
        self.mapTo(&result)
        return result
    }
}