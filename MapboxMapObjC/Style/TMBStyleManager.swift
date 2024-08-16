import UIKit
import MapboxMaps
// swiftlint:disable type_body_length

/// Style manager is a base class for ``MapboxMap`` and ``Snapshotter`` that provides provides methods to manipulate Map Style at runtime.
///
/// Use style manager to dynamically modify the map style. You can manage layers, sources, lights, terrain, and many more.
/// Typically, you don’t create the style manager instances yourself. Instead you receive instance of this class from ``MapView`` as the ``MapView/mapboxMap`` property, or create an instance of ``Snapshotter``.
///
/// To load the style use ``styleURI`` or ``styleJSON`` or new experimental ``mapStyle`` property. The latter
/// allows not only load the style, but also modify the style configuration, for more information, see ``MapStyle``.
///
/// - Important: `StyleManager` should only be used from the main thread.
@objc open class TMBStyleManager: NSObject {

    // MARK: - Layers

    /// Adds a `layer` to the map
    ///
    /// - Parameters:
    ///   - layer: The layer to apply on the map
    ///   - layerPosition: Position to add the layer in the stack of layers on the map. Defaults to the top layer.
    ///
    /// - Throws: ``StyleError`` if there is a problem adding the given `layer` at the given `position`.
    @objc public func addLayer(_  layer: TMBLayer, layerPosition : TMBLayerPosition?, completion: ((Error?)->Void)?) {
        let unwrapped = (layer as! any SwiftValueConvertible).unwrap() as! Layer
        do {
            try origin.addLayer(unwrapped, layerPosition: (layerPosition)?.unwrap())
            
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Adds a  persistent `layer` to the map.
    /// Persistent layers are valid across `style` changes.
    ///
    /// - Parameters:
    ///   - layer: The layer to apply on the map
    ///   - layerPosition: Position to add the layer in the stack of layers on the map. Defaults to the top layer.
    ///
    /// - Throws: ``StyleError`` if there is a problem adding the persistent layer.
    @objc public func addPersistentLayer(_  layer: TMBLayer, layerPosition : TMBLayerPosition?, completion: ((Error?)->Void)?) {
        
        let unwrapped = (layer as! any SwiftValueConvertible).unwrap() as! Layer
        do {
            try origin.addPersistentLayer(unwrapped, layerPosition: (layerPosition)?.unwrap())
        
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /**
     Moves a `layer` to a new layer position in the style.
     - Parameter layerId: The layer to move
     - Parameter position: Position to move the layer in the stack of layers on the map. Defaults to the top layer.

     - Throws: `StyleError` on failure, or `NSError` with a _domain of "com.mapbox.bindgen"
     */
    @objc public func moveLayer(withId  id: String, to  position: TMBLayerPosition, completion: ((Error?)->Void)?) {
        do {
            try origin.moveLayer(withId: id, to: (position).unwrap())
            
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /**
     Gets a `layer` from the map.

     This function is useful if you do not know the concrete type of the layer
     you are fetching, or don't need to know for your situation.

     - Parameter layerID: The id of the layer to be fetched

     - Returns: The fully formed `layer` object.
     - Throws: Type conversion errors
     */
    @objc public func layer(withId  id: String, completion: ((TMBLayer?, Error?)->Void)?) {
        do {
            let result = try origin.layer(withId: id)
            
            completion?((result as! any ObjcConvertible).wrap() as? TMBLayer, nil)
        } catch {
            completion?(nil, error)
        }
    }

    // MARK: - Sources

    /**
     Adds a `source` to the map
     - Parameter source: The source to add to the map.
     - Parameter identifier: A unique source identifier.
     - Parameter dataId: An optional data ID to filter ``MapboxMap/onSourceDataLoaded`` to only the specified data source. Applies only to ``GeoJSONSource``s.

     - Throws: ``StyleError`` if there is a problem adding the `source`.
     */
    @objc public func addSource(_  source: TMBSource, dataId : String?, completion: ((Error?)->Void)?) {
        do {
            let unwrapped = (source as! any SwiftValueConvertible).unwrap() as! Source
            
            try origin.addSource(unwrapped, dataId: dataId)
            
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /**
     Retrieves a `source` from the map

     This function is useful if you do not know the concrete type of the source
     you are fetching, or don't need to know for your situation.

     - Parameter id: The id of the `source` to retrieve.
     - Returns: The fully formed `source` object.
     - Throws: ``StyleError`` if there is a problem getting the source data.
     - Throws: ``TypeConversionError`` if there is a problem decoding the source of given `id`.
     */
    @objc public func source(withId  id: String, completion: ((Error?)->Void)?) {
        do {
            let result = try origin.source(withId: id)
            
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Updates the ``GeoJSONSource/data`` property of a given ``GeoJSONSource`` with a new value.
    ///
    /// - Parameters:
    ///   - id: The identifier representing the GeoJSON source.
    ///   - data: The new data to be associated with the source.
    ///   - dataId: An optional data ID to filter ``MapboxMap/onSourceDataLoaded`` to only the specified data source.
    ///
    /// The update will be scheduled and applied on a GeoJSON serialization queue.
    ///
    /// In order to capture events when actual data is drawn on the map please refer to Events API
    /// and listen to `onSourceDataLoaded` (optionally pass the `dataId` parameter to filter the events)
    /// or `onMapLoadingError` with `type = metadata` if data parsing error has occurred.
    ///
    /// - Attention: This method is only effective with sources of `GeoJSONSource`
    /// type, and cannot be used to update other source types.
    @objc public func updateGeoJSONSource(withId  id: String, data : TMBGeoJSONSourceData, dataId : String?) {
        origin.updateGeoJSONSource(withId: id, data: (data).unwrap(), dataId: dataId)
    }

    /// Add additional features to a GeoJSON style source.
    ///
    /// The add operation will be scheduled and applied on a GeoJSON serialization queue.
    ///
    /// In order to capture events when actual data is drawn on the map please refer to Events API
    /// and listen to `onSourceDataLoaded` (optionally pass the `dataId` parameter to filter the events)
    /// or `onMapLoadingError` with `type = metadata` if data parsing error has occurred.
    ///
    /// Partially updating a GeoJSON source is not compatible with using shared cache and generated IDs.
    /// It is important to ensure that every feature in the GeoJSON style source, as well as the newly added
    /// feature, has a unique ID (or a unique promote ID if in use). Failure to provide unique IDs will result
    /// in a `map-loading-error`.
    ///
    /// - Note: The method allows the user to provide a data ID, which will be returned as the `dataId` parameter in the
    /// `source-data-loaded` event. However, it's important to note that multiple partial updates can be queued
    /// for the same GeoJSON source when ongoing source parsing is taking place. In these cases, the partial
    /// updates will be applied to the source in batches. Only the data ID provided in the most recent call within
    /// each batch will be included in the `source-data-loaded` event. If no data ID is provided in the most recent
    /// call, the data ID in the `source-data-loaded`event will be null.
    ///
    /// - Parameters:
    ///   - sourceId: The identifier of the style source.
    ///   - features: An array of GeoJSON features to be added to the source.
    ///   - dataId: An arbitrary string used to track the given GeoJSON data.
    /// - Throws: ``StyleError`` if there is a problem adding features to the source.
    @objc public func addGeoJSONSourceFeatures(forSourceId  sourceId: String, features : [MapboxCommon.Feature], dataId : String?) {
        origin.addGeoJSONSourceFeatures(forSourceId: sourceId, features: features.map{ Turf.Feature($0) }, dataId: dataId)
    }

    /// Update existing features in a GeoJSON style source.
    ///
    /// The update operation will be scheduled and applied on a GeoJSON serialization queue.
    ///
    /// In order to capture events when actual data is drawn on the map please refer to Events API
    /// and listen to `onSourceDataLoaded` (optionally pass the `dataId` parameter to filter the events)
    /// or `onMapLoadingError` with `type = metadata` if data parsing error has occurred.
    ///
    /// Partially updating a GeoJSON source is not compatible with using shared cache and generated IDs.
    /// It is important to ensure that every feature in the GeoJSON style source, as well as the newly added
    /// feature, has a unique ID (or a unique promote ID if in use). Failure to provide unique IDs will result
    /// in a `map-loading-error`.
    ///
    /// - Note: The method allows the user to provide a data ID, which will be returned as the `dataId` parameter in the
    /// `source-data-loaded` event. However, it's important to note that multiple partial updates can be queued
    /// for the same GeoJSON source when ongoing source parsing is taking place. In these cases, the partial
    /// updates will be applied to the source in batches. Only the data ID provided in the most recent call within
    /// each batch will be included in the `source-data-loaded` event. If no data ID is provided in the most recent
    /// call, the data ID in the `source-data-loaded`event will be null.
    /// - Parameters:
    ///   - sourceId: A style source identifier.
    ///   - features: The GeoJSON features to be updated in the source.
    ///   - dataId: An arbitrary string used to track the given GeoJSON data.
    /// - Throws: ``StyleError`` if there is a problem updating features in the source.
    @objc public func updateGeoJSONSourceFeatures(forSourceId  sourceId: String, features : [MapboxCommon.Feature], dataId : String?) {
        origin.updateGeoJSONSourceFeatures(forSourceId: sourceId, features: features.map{ Turf.Feature($0) }, dataId: dataId)
    }

    /// Remove features from a GeoJSON style source.
    ///
    /// The remove operation will be scheduled and applied on a GeoJSON serialization queue.
    ///
    /// In order to capture events when actual data is drawn on the map please refer to Events API
    /// and listen to `onSourceDataLoaded` (optionally pass the `dataId` parameter to filter the events)
    /// or `onMapLoadingError` with `type = metadata` if an error has occurred.
    ///
    /// Partially updating a GeoJSON source is not compatible with using shared cache and generated IDs.
    /// It is important to ensure that every feature in the GeoJSON style source, as well as the newly added
    /// feature, has a unique ID (or a unique promote ID if in use). Failure to provide unique IDs will result
    /// in a `map-loading-error`.
    ///
    /// - Note: The method allows the user to provide a data ID, which will be returned as the `dataId` parameter in the
    /// `source-data-loaded` event. However, it's important to note that multiple partial updates can be queued
    /// for the same GeoJSON source when ongoing source parsing is taking place. In these cases, the partial
    /// updates will be applied to the source in batches. Only the data ID provided in the most recent call within
    /// each batch will be included in the `source-data-loaded` event. If no data ID is provided in the most recent
    /// call, the data ID in the `source-data-loaded`event will be null.
    /// - Parameters:
    ///   - sourceId: A style source identifier.
    ///   - featureIds: The Ids of the features that need to be removed from the source.
    ///   - dataId: An arbitrary string used to track the given GeoJSON data.
    /// - Throws: ``StyleError`` if there is a problem removing features from the source.
    @objc public func removeGeoJSONSourceFeatures(forSourceId  sourceId: String, featureIds : [String], dataId : String?) {
        origin.removeGeoJSONSourceFeatures(forSourceId: sourceId, featureIds: featureIds, dataId: dataId)
    }

    /// `true` if and only if the style JSON contents, the style specified sprite,
    /// and sources are all loaded, otherwise returns `false`.
    @objc public var isStyleLoaded: Bool {            
        origin.isStyleLoaded
    }

    /// Get or set the style URI
    ///
    /// Setting a new style is asynchronous. In order to get the result of this
    /// operation, listen to `MapEvents.styleDataLoaded`, `MapEvents.styleLoaded`.
    ///
    /// - Attention:
    ///     This method should be called on the same thread where the MapboxMap
    ///     object is initialized.
    @objc public var styleURI: TMBStyleURI? {            
        get {
            origin.styleURI?.wrap()
        }
        set {
            origin.styleURI = newValue?.unwrap()
        }
    }

    /// Get or set the style via a JSON serialization string
    ///
    /// - Attention:
    ///     This method should be called on the same thread where the MapboxMap
    ///     object is initialized.
    @objc public var styleJSON: String {            
        get {
            origin.styleJSON
        }
        set {
            origin.styleJSON = newValue
        }
    }

    /// The map `style`'s default camera, if any, or a default camera otherwise.
    /// The map `style` default camera is defined as follows:
    ///
    /// - [center](https://docs.mapbox.com/mapbox-gl-js/style-spec/#root-center)
    /// - [zoom](https://docs.mapbox.com/mapbox-gl-js/style-spec/#root-zoom)
    /// - [bearing](https://docs.mapbox.com/mapbox-gl-js/style-spec/#root-bearing)
    /// - [pitch](https://docs.mapbox.com/mapbox-gl-js/style-spec/#root-pitch)
    ///
    /// The `style` default camera is re-evaluated when a new `style` is loaded. Values default to 0.0 if they are not defined in the `style`.
    @objc public var styleDefaultCamera: TMBCameraOptions {            
        origin.styleDefaultCamera.wrap()
    }

    /// Get or set the map `style`'s transition options.
    ///
    /// By default, the style parser will attempt to read the style default
    /// transition, if any, falling back to a 0.3 s transition otherwise.
    ///
    /// Overridden transitions are reset once a new style has been loaded.
    /// To customize the transition used when switching styles, set this
    /// property after `MapEvents.Event.styleDataLoaded` where
    /// `payload type == "style"` and before
    /// `MapEvents.Event.styleDataLoaded` where `payload type == "sprite"`
    /// and where `payload type == "sources"`.
    /// - SeeAlso: ``MapboxMap/onNext(event:handler:)``
    @objc public var styleTransition: MapboxCoreMaps.TransitionOptions {
        get {
            MapboxCoreMaps.TransitionOptions(origin.styleTransition)
        }
        set {
            origin.styleTransition = TransitionOptions(newValue)
        }
    }

    /// Returns the list containing information about existing style import objects.
    @objc public var styleImports: [StyleObjectInfo] {
        origin.styleImports
    }

    /// Removes an existing style import.
    ///
    ///  - Parameters:
    ///   - importId: Identifier of the style import to remove.
    ///
    ///  - Throws:
    ///   - An error describing why the operation was unsuccessful.
    @objc public func removeStyleImport(for  importId: String, completion: ((Error?)->Void)?) {
        do {
            try origin.removeStyleImport(for: importId)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Gets the style import schema.
    ///
    ///  - Parameters:
    ///   - importId: Identifier of the style import.
    ///
    ///  - Returns:
    ///   - The style import schema, containing the default configurations for the style import,
    ///           or a string describing an error if the operation was not successful.
    ///  - Throws:
    ///   - A StyleError or decoding error if the operation was not successful.
    @objc public func getStyleImportSchema(for  importId: String, completion: ((Any?, Error?)->Void)?) {
        do {
            let result = try origin.getStyleImportSchema(for: importId)
            completion?(result, nil)
        } catch {
            completion?(nil, error)
        }
    }

    /// Gets style import config.
    ///
    ///  - Parameters:
    ///   - importId: Identifier of the style import.
    ///
    ///  - Returns:
    ///   - The style import configuration or a string describing an error if the operation was not successful.
    @objc public func getStyleImportConfigProperties(for  importId: String, completion: (([String: StylePropertyValue]?, Error?)->Void)?) {
        do {
            let result = try origin.getStyleImportConfigProperties(for: importId)
            completion?(result, nil)
        } catch {
            completion?(nil, error)
        }
    }

    /// Gets the value of style import config.
    ///
    ///  - Parameters:
    ///   - importId: Identifier of the style import.
    ///   - config: The style import config name.
    ///
    ///  - Returns:
    ///   - The style import configuration or a string describing an error if the operation was not successful.
    @objc public func getStyleImportConfigProperty(for  importId: String, config : String, completion: ((StylePropertyValue?, Error?)->Void)?) {
        do {
            let result = try origin.getStyleImportConfigProperty(for: importId, config: config)
            completion?(result, nil)
        } catch {
            completion?(nil, error)
        }
    }

    /// Sets style import config.
    /// This method can be used to perform batch update for a style import configurations.
    ///
    ///  - Parameters:
    ///   - importId: Identifier of the style import.
    ///   - configs: A map of style import configurations.
    ///
    ///  - Throws:
    ///   - A string describing an error if the operation was not successful.
    @objc public func setStyleImportConfigProperties(for  importId: String, configs : [String: Any], completion: ((Error?)->Void)?) {
        do {
            try origin.setStyleImportConfigProperties(for: importId, configs: configs)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Sets a value to a style import config.
    ///
    ///  - Parameters:
    ///   - importId: Identifier of the style import.
    ///   - config: The style import config name.
    ///   - value: The style import config value.
    ///
    ///  - Throws:
    ///   - A string describing an error if the operation was not successful.
    @objc public func setStyleImportConfigProperty(for  importId: String, config : String, value : Any, completion: ((Error?)->Void)?) {
        do {
            try origin.setStyleImportConfigProperty(for: importId, config: config, value: value)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    // MARK: - Layers

    /// Adds a new style layer given its JSON properties
    ///
    /// Runtime style layers are valid until they are either removed or a new
    /// style is loaded.
    ///
    /// - See Also: https://docs.mapbox.com/mapbox-gl-js/style-spec/#layers
    ///
    /// - Parameters:
    ///   - properties: A JSON dictionary of style layer properties.
    ///   - layerPosition: Position to add the layer in the stack of layers on the map. Defaults to the top layer.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func addLayer(with  properties: [String:Any], layerPosition : TMBLayerPosition?, completion: ((Error?)->Void)?) {
        do {
            try origin.addLayer(with: properties, layerPosition: (layerPosition)?.unwrap())
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Adds a new persistent style layer given its JSON properties
    ///
    /// Persistent style layers remain valid across style reloads.
    ///
    /// - Parameters:
    ///   - properties: A JSON dictionary of style layer properties
    ///   - layerPosition: Position to add the layer in the stack of layers on the map. Defaults to the top layer.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful
    @objc public func addPersistentLayer(with  properties: [String: Any], layerPosition : TMBLayerPosition?, completion: ((Error?)->Void)?) {
        do {
            try origin.addPersistentLayer(with: properties, layerPosition: (layerPosition)?.unwrap())
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Returns `true` if the id passed in is associated to a persistent layer
    /// - Parameter id: The layer identifier to test
    @objc public func isPersistentLayer(id : String, completion: ((Bool, Error?)->Void)?) {
        do {
            let result = try origin.isPersistentLayer(id: id)
            completion?(result, nil)
        } catch {
            completion?(false, error)
        }
    }

    /// Adds a new persistent style custom layer.
    ///
    /// Persistent style layers are valid across style reloads.
    ///
    /// - See Also: https://docs.mapbox.com/mapbox-gl-js/style-spec/#layers
    ///
    /// - Parameters:
    ///   - id: Style layer id.
    ///   - layerHost: Style custom layer host.
    ///   - layerPosition: Position to add the layer in the stack of layers on the map. Defaults to the top layer.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func addPersistentCustomLayer(withId  id: String, layerHost : CustomLayerHost, layerPosition : TMBLayerPosition?, completion: ((Error?)->Void)?) {
        do {
            try origin.addPersistentCustomLayer(withId: id, layerHost: (layerHost), layerPosition: (layerPosition)?.unwrap())
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Adds a new style custom layer.
    ///
    /// Runtime style layers are valid until they are either removed or a new
    /// style is loaded.
    ///
    /// - See Also: https://docs.mapbox.com/mapbox-gl-js/style-spec/#layers
    ///
    /// - Parameters:
    ///   - id: Style layer id.
    ///   - layerHost: Style custom layer host.
    ///   - layerPosition: Position to add the layer in the stack of layers on the map. Defaults to the top layer.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func addCustomLayer(withId  id: String, layerHost : CustomLayerHost, layerPosition : TMBLayerPosition?, completion: ((Error?)->Void)?) {
        do {
            try origin.addCustomLayer(withId: id, layerHost: (layerHost), layerPosition: (layerPosition)?.unwrap())
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Removes an existing style layer
    ///
    /// Runtime style layers are valid until they are either removed or a new
    /// style is loaded.
    ///
    /// - Parameter id: Identifier of the style layer to remove.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func removeLayer(withId  id: String, completion: ((Error?)->Void)?) {
        do {
            try origin.removeLayer(withId: id)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Checks whether a given style layer exists.
    ///
    /// Runtime style layers are valid until they are either removed or a new
    /// style is loaded.
    ///
    /// - Parameter id: Style layer identifier.
    ///
    /// - Returns: `true` if the given style layer exists, `false` otherwise.
    @objc public func layerExists(withId  id: String) -> Bool {
        origin.layerExists(withId: id)
    }

    /// The ordered list of the current style layers' identifiers and types
    @objc public var allLayerIdentifiers: [TMBLayerInfo] {
        origin.allLayerIdentifiers.map{ $0.wrap() }
    }

    // MARK: - Layer Properties

    /// Gets the value of style layer property.
    ///
    /// - Parameters:
    ///   - layerId: Style layer identifier.
    ///   - property: Style layer property name.
    ///
    /// - Returns:
    ///     The value of the property in the layer with layerId.
    @objc public func layerPropertyValue(for  layerId: String, property : String) -> Any {
        origin.layerPropertyValue(for: layerId, property: property)
    }

    /// Gets the value of style layer property.
    ///
    /// - Parameters:
    ///   - layerId: Style layer identifier.
    ///   - property: Style layer property name.
    ///
    /// - Returns:
    ///     The value of the property in the layer with layerId.
    @objc public func layerProperty(for  layerId: String, property : String) -> StylePropertyValue {
        origin.layerProperty(for: layerId, property: property)
    }

    /// Sets a JSON value to a style layer property.
    ///
    /// - Parameters:
    ///   - layerId: Style layer identifier.
    ///   - property: Style layer property name.
    ///   - value: Style layer property value.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setLayerProperty(for  layerId: String, property : String, value : Any, completion: ((Error?)->Void)?) {
        do {
            try origin.setLayerProperty(for: layerId, property: property, value: value)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Gets the default value of style layer property.
    ///
    /// - Parameters:
    ///   - layerType: Style layer type.
    ///   - property: Style layer property name.
    ///
    /// - Returns:
    ///     The default value of the property for the layers with type layerType.
    @objc public func layerPropertyDefaultValue(for  layerType: TMBLayerType, property : String) -> StylePropertyValue {
        StyleManager.layerPropertyDefaultValue(for: (layerType).unwrap(), property: property)
    }

    /// Gets the properties for a style layer.
    ///
    /// - Parameter layerId: layer id.
    ///
    /// - Returns:
    ///     JSON dictionary representing the layer properties
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func layerProperties(for  layerId: String, completion: (( [String: Any]?, Error?)->Void)?) {
        do {
            let result = try origin.layerProperties(for: layerId)
            completion?(result, nil)
        } catch {
            completion?(nil, error)
        }
    }

    /// Sets style layer properties.
    ///
    /// This method can be used to perform batch update for a style layer properties.
    /// The structure of a provided `properties` value must conform to the
    /// [format for a corresponding layer type](https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/).
    ///
    /// Modification of a [layer identifier](https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/#id)
    /// and/or [layer type](https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/#type)
    /// is not allowed.
    ///
    /// - Parameters:
    ///   - layerId: Style layer identifier.
    ///   - properties: JSON dictionary representing the updated layer properties.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setLayerProperties(for  layerId: String, properties : [String: Any], completion: ((Error?)->Void)?) {
        do {
            try origin.setLayerProperties(for: layerId, properties: properties)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    // MARK: - Sources

    /// Adds a new style source.
    ///
    /// - See Also: https://docs.mapbox.com/mapbox-gl-js/style-spec/#sources
    ///
    /// - Parameters:
    ///   - id: An identifier for the style source.
    ///   - properties: A JSON dictionary of style source properties.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func addSource(withId  id: String, properties : [String: Any], completion: ((Error?)->Void)?) {
        do {
            try origin.addSource(withId: id, properties: properties)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Removes an existing style source.
    ///
    /// - Parameter id: Identifier of the style source to remove.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func removeSource(withId  id: String, completion: ((Error?)->Void)?) {
        do {
            try origin.removeSource(withId: id)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Checks whether a given style source exists.
    ///
    /// - Parameter id: Style source identifier.
    ///
    /// - Returns: `true` if the given source exists, `false` otherwise.
    @objc public func sourceExists(withId  id: String) -> Bool {
        origin.sourceExists(withId: id)
    }

    /// The ordered list of the current style sources' identifiers and types.
    @objc public var allSourceIdentifiers: [TMBSourceInfo] {
        origin.allSourceIdentifiers.map { $0.wrap() }
    }

    // MARK: - Source properties

    /// Gets the value of style source property.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier.
    ///   - property: Style source property name.
    ///
    /// - Returns: The value of the property in the source with sourceId.
    @objc public func sourceProperty(for  sourceId: String, property : String) -> StylePropertyValue {
        origin.sourceProperty(for: sourceId, property: property)
    }

    /// Sets a value to a style source property.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier.
    ///   - property: Style source property name.
    ///   - value: Style source property value (JSON value)
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setSourceProperty(for  sourceId: String, property : String, value : Any, completion: ((Error?)->Void)?) {
        do {
            try origin.setSourceProperty(for: sourceId, property: property, value: value)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Gets style source properties.
    ///
    /// - Parameter sourceId: Style source identifier
    ///
    /// - Returns:
    ///     JSON dictionary representing the layer properties
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func sourceProperties(for  sourceId: String, completion: (([String: Any]?, Error?)->Void)?) {
        do {
            let result = try origin.sourceProperties(for: sourceId)
            completion?(result, nil)
        } catch {
            completion?(nil, error)
        }
    }

    /// Sets style source properties.
    ///
    /// This method can be used to perform batch update for a style source properties.
    /// The structure of a provided `properties` value must conform to the
    /// [format](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/) for a
    /// corresponding source type. Modification of a [source type](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/#type)
    /// is not allowed.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier
    ///   - properties: A JSON dictionary of Style source properties
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setSourceProperties(for  sourceId: String, properties : [String: Any], completion: ((Error?)->Void)?) {
        do {
            try origin.setSourceProperties(for: sourceId, properties: properties)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Gets the default value of style source property.
    ///
    /// - Parameters:
    ///   - sourceType: Style source type.
    ///   - property: Style source property name.
    ///
    /// - Returns:
    ///     The default value for the named property for the sources with type sourceType.
    @objc public func sourcePropertyDefaultValue(for  sourceType: String, property : String) -> StylePropertyValue {
        StyleManager.sourcePropertyDefaultValue(for: sourceType, property: property)
    }

    // MARK: - Image source

    /// Updates the image of an image style source.
    ///
    /// - See Also: https://docs.mapbox.com/mapbox-gl-js/style-spec/#sources-image
    ///
    /// - Parameters:
    ///   - id: Style source identifier.
    ///   - image: UIImage
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func updateImageSource(withId  id: String, image : UIImage, completion: ((Error?)->Void)?) {
        do {
            try origin.updateImageSource(withId: id, image: image)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    // MARK: Style images

    /// Adds an image to be used in the style.
    ///
    /// This API can also be used for
    /// updating an image. If the image id was already added, it gets replaced
    /// by the new image.
    ///
    /// The image can be used in
    /// [`icon-image`](https://www.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-image),
    /// [`fill-pattern`](https://www.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-pattern), and
    /// [`line-pattern`](https://www.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-pattern).
    ///
    /// For more information on how `stretchX` and `stretchY` parameters affect image stretching
    /// see [this Mapbox GL-JS example](https://docs.mapbox.com/mapbox-gl-js/example/add-image-stretchable).
    ///
    /// - Parameters:
    ///   - image: Image to add.
    ///   - id: ID of the image.
    ///   - sdf: Option to treat whether image is SDF(signed distance field) or not.
    ///         Setting this to `true` allows template images to be recolored. The
    ///         default value is `false`.
    ///   - stretchX: An array of two-element arrays, consisting of two numbers
    ///         that represent the from position and the to position of areas
    ///         that can be stretched horizontally.
    ///   - stretchY: An array of two-element arrays, consisting of two numbers
    ///         that represent the from position and the to position of areas
    ///         that can be stretched vertically.
    ///   - content: An array of four numbers, with the first two specifying the
    ///         left, top corner, and the last two specifying the right, bottom
    ///         corner. If present, and if the icon uses icon-text-fit, the
    ///         symbol's text will be fit inside the content box.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func addImage(_  image: UIImage, 
                         id : String, 
                         sdf : Bool, 
                         stretchX : [ImageStretches],
                         stretchY : [ImageStretches],
                         content : ImageContent?, completion: ((Error?)->Void)?) {
        do {
            try origin.addImage(image, id: id, sdf: sdf, stretchX: (stretchX), stretchY: (stretchY), content: (content))
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Adds an image to be used in the style.
    ///
    /// If the image has non-zero `UIImage.capInsets` it will be stretched accordingly,
    /// regardless of the value in `UIImage.resizingMode`.
    ///
    /// - Parameters:
    ///   - image: Image to add.
    ///   - id: ID of the image.
    ///   - sdf: Option to treat whether image is SDF(signed distance field) or not.
    ///         Setting this to `true` allows template images to be recolored. The
    ///         default value is `false`.
    ///   - contentInsets: The distances the edges of content are inset from the image rectangle.
    ///         If present, and if the icon uses icon-text-fit, the
    ///         symbol's text will be fit inside the content box.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func addImage(_  image: UIImage, id : String, sdf : Bool, contentInsets : UIEdgeInsets, completion: ((Error?)->Void)?) {
        do {
            try origin.addImage(image, id: id, sdf: sdf, contentInsets: contentInsets)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Removes an image from the style.
    ///
    /// - Parameter id: ID of the image to remove.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func removeImage(withId  id: String, completion: ((Error?)->Void)?) {
        do {
            try origin.removeImage(withId: id)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Checks whether an image exists.
    ///
    /// - Parameter id: The identifier of the image.
    ///
    /// - Returns: `true` if the given image exists, `false` otherwise.
    @objc public func imageExists(withId  id: String) -> Bool {
        origin.imageExists(withId: id)
    }

    /// Get an image from the style.
    ///
    /// - Parameter id: ID of the image.
    ///
    /// - Returns: UIImage representing the data associated with the given ID,
    ///     or nil if no image is associated with that ID.
    @objc public func image(withId  id: String) -> UIImage? {
        origin.image(withId: id)
    }

    // MARK: - Lights

    /// The ordered list of the current style lights' identifiers and types
    @objc public var allLightIdentifiers: [TMBLightInfo] {
        origin.allLightIdentifiers.map{ $0.wrap() }
    }

    /// Gets the value of a style light property.
    ///
    /// - Parameter light: The unique identifier of the style light in lights list.
    /// - Parameter property: The style light property name.
    @objc public func lightProperty(for  lightId: String, property : String) -> Any {
        origin.lightProperty(for: lightId, property: property)
    }

    /// Set global directional lightning.
    /// - Parameter flatLight: The flat light source.
    @objc public func setLights(_  flatLight: TMBFlatLight, completion: ((Error?)->Void)?) {
        do {
            try origin.setLights((flatLight).unwrap())
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Set dynamic lightning.
    /// - Parameters:
    ///   - ambientLight: The ambient light source.
    ///   - directionalLight: The directional light source.
    @objc public func setLights(ambient  ambientLight: TMBAmbientLight, directional  directionalLight: TMBDirectionalLight, completion: ((Error?)->Void)?) {
        do {
            try origin.setLights(ambient: (ambientLight).unwrap(), directional: (directionalLight).unwrap())
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Sets the value of a style light property in lights list.
    ///
    /// - Parameter id: The unique identifier of the style light in lights list.
    /// - Parameter property: The style light property name.
    /// - Parameter value: The style light property value.
    /// - throws: An error describing why the operation is unsuccessful.
    @objc public func setLightProperty(for  lightId: String, property : String, value : Any, completion: ((Error?)->Void)?) {
        do {
            try origin.setLightProperty(for: lightId, property: property, value: value)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    // MARK: - Terrain

    /// Sets a terrain on the style
    ///
    /// - Parameter terrain: The `Terrain` that should be rendered
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setTerrain(_  terrain: TMBTerrain, completion: ((Error?)->Void)?) {
        do {
            try origin.setTerrain((terrain).unwrap())
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Removes terrain from style if it was set.
    @objc public func removeTerrain() {
        origin.removeTerrain()
    }

    /// Sets the style global terrain source properties.
    ///
    /// - See Also: https://docs.mapbox.com/mapbox-gl-js/style-spec/#terrain
    ///
    /// - Parameter properties: A dictionary of style terrain properties values,
    ///     with their names as key.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setTerrain(properties : [String: Any], completion: ((Error?)->Void)?) {
        do {
            try origin.setTerrain(properties: properties)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Sets a value to the named style terrain property.
    ///
    /// - Parameters:
    ///   - property: Style terrain property name.
    ///   - value: Style terrain property value.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setTerrainProperty(_  property: String, value : Any, completion: ((Error?)->Void)?) {
        do {
            try origin.setTerrainProperty(property, value: value)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Gets the value of a style terrain property.
    ///
    /// - Parameter property: Style terrain property name.
    ///
    /// - Returns: Style terrain property value.
    @objc public func terrainPropertyValue(_  property: String) -> Any {
        origin.terrainProperty(property).value
    }

    /// Gets the value of a style terrain property.
    ///
    /// - Parameter property: Style terrain property name.
    ///
    /// - Returns: Style terrain property value.
    @objc public func terrainProperty(_  property: String) -> StylePropertyValue {
        origin.terrainProperty(property)
    }

    // MARK: - Atmosphere

    /// Set the atmosphere of the style
    /// - Parameter atmosphere: ``Atmosphere`` object describing the fog, space and stars.
    @objc public func setAtmosphere(_  atmosphere: TMBAtmosphere, completion: ((Error?)->Void)?) {
        do {
            try origin.setAtmosphere((atmosphere).unwrap())
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Remove the atmosphere of the style. No fog, space or stars would be rendered.
    @objc public func removeAtmosphere(completion: ((Error?)->Void)?) {
        do {
            try origin.removeAtmosphere()
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Set an explicit atmosphere properties
    ///
    /// - See Also [style-spec/fog](https://docs.mapbox.com/mapbox-gl-js/style-spec/fog/)
    ///
    /// - Parameter properties: A dictionary of style fog (aka atmosphere) properties values,
    ///     with their names as key.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setAtmosphere(properties : [String: Any], completion: ((Error?)->Void)?) {
        do {
            try origin.setAtmosphere(properties: properties)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Sets the value of a style atmosphere property.
    ///
    /// - See Also [style-spec/fog](https://docs.mapbox.com/mapbox-gl-js/style-spec/fog/)
    ///
    /// - Parameter property: Style atmosphere property name.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setAtmosphereProperty(_  property: String, value : Any, completion: ((Error?)->Void)?) {
        do {
            try origin.setAtmosphereProperty(property, value: value)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Gets the value of a style atmosphere property.
    ///
    /// - See Also: https://docs.mapbox.com/mapbox-gl-js/style-spec/fog/
    ///
    /// - Parameter property: Style atmosphere property name.
    ///
    /// - Returns: Style atmosphere property value.
    @objc public func atmosphereProperty(_  property: String) -> StylePropertyValue {
        origin.atmosphereProperty(property)
    }

    // MARK: - Custom geometry

    /// Adds a custom geometry to be used in the style.
    ///
    /// To add the data, implement the fetchTileFunction callback in the options
    /// and call `setCustomGeometrySourceTileData`.
    ///
    /// - Parameters:
    ///   - id: Style source identifier
    ///   - options: Settings for the custom geometry
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func addCustomGeometrySource(withId  id: String, options : CustomGeometrySourceOptions, completion: ((Error?)->Void)?) {
        do {
            try origin.addCustomGeometrySource(withId: id, options: (options))
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Set tile data of a custom geometry.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier
    ///   - tileId: Identifier of the tile
    ///   - features: An array of features to add
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setCustomGeometrySourceTileData(forSourceId  sourceId: String, tileId : CanonicalTileID, features : [MapboxCommon.Feature], completion: ((Error?)->Void)?) {
        do {
            try origin.setCustomGeometrySourceTileData(forSourceId: sourceId, tileId: (tileId), features: (features).map { Turf.Feature($0) })
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Invalidate tile for provided custom geometry source.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier
    ///   - tileId: Identifier of the tile
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func invalidateCustomGeometrySourceTile(forSourceId  sourceId: String, tileId : CanonicalTileID, completion: ((Error?)->Void)?) {
        do {
            try origin.invalidateCustomGeometrySourceTile(forSourceId: sourceId, tileId: (tileId))
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// Invalidate region for provided custom geometry source.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier
    ///   - bounds: Coordinate bounds.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func invalidateCustomGeometrySourceRegion(forSourceId  sourceId: String, bounds : CoordinateBounds, completion: ((Error?)->Void)?) {
        do {
            try origin.invalidateCustomGeometrySourceRegion(forSourceId: sourceId, bounds: bounds)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }
    
    private let origin:StyleManager
    init(origin: StyleManager) {
        self.origin = origin
    }
}
extension TMBStyleManager {
    func unwrap() -> StyleManager {
        self.origin
    }
}
extension StyleManager {
    func wrap() -> TMBStyleManager {
        TMBStyleManager(origin: self)
    }
}

// MARK: - StyleProjection

extension TMBStyleManager {
    /// Sets the projection.
    ///
    /// - Parameter projection: The ``StyleProjection`` to apply to the style.
    /// - Throws: ``StyleError`` if the projection could not be applied.
    @objc public func setProjection(_ projection: TMBStyleProjection, completion: ((Error?)->Void)?) {
        do {
            try origin.setProjection(projection.unwrap())
            completion?(nil)
        } catch {
            completion?(error)
        }
    }

    /// The current projection.
    @objc public func projection() -> TMBStyleProjection? {
        origin.projection?.wrap()
    }
}
// MARK: - StyleTransition -

/**
 The transition property for a layer.
 A transition property controls timing for the interpolation between a
 transitionable style property's previous value and new value.
 */
@objc open class TMBStyleTransition: NSObject {
    /// Time allotted for transitions to complete in seconds.
    @objc public var duration: TimeInterval

    /// Length of time before a transition begins in seconds.
    @objc public var delay: TimeInterval

    /// Initiralizer for `StyleTransition`
    /// - Parameters:
    ///   - duration: Time for transition in seconds.
    ///   - delay: Time before transition begins in seconds.
    @objc public init(duration : TimeInterval, delay : TimeInterval){
        self.duration = duration
        self.delay = delay
    }
}
extension TMBStyleTransition {
    func unwrap() -> StyleTransition {
        StyleTransition(duration: self.duration,
            delay: self.delay)
    }
    func styleTransition() -> StyleTransition { unwrap() }
}
extension StyleTransition {
    func wrap() -> TMBStyleTransition {
        TMBStyleTransition(duration: self.duration,
          delay: self.delay)
    }
    func styleTransition() -> TMBStyleTransition { wrap() }
}
