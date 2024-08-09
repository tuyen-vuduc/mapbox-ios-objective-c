import MapboxMaps

@objc public protocol TMBLayer {
    /// Unique layer name
    @objc var id: String { get set }
    
    /// Rendering type of this layer.
    @objc var type: TMBLayerType { get }
    
    /// Whether this layer is displayed.
    @objc var visibility: TMBValue { get set }

    /// The minimum zoom level for the layer. At zoom levels less than the minzoom, the layer will be hidden.
    @objc var minZoom: NSNumber? { get set }
    
    /// The maximum zoom level for the layer. At zoom levels equal to or greater than the maxzoom, the layer will be hidden.
    @objc var maxZoom: NSNumber? { get set }
    
    /// The slot this layer is assigned to. If specified, and a slot with that name exists, it will be placed at that position in the layer order.
    @objc var slot: TMBSlot? { get set }
}

public protocol SwiftValueConvertible<T> {
    associatedtype T
    func unwrap() -> T
}

