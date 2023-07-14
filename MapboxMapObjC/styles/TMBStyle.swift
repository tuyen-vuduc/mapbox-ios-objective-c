import MapboxMaps

// swiftlint:disable type_body_length

/// Style provides access to the APIs used to dynamically modify the map's style. Use it
/// to read and write layers, sources, and images. Obtain the Style instance for a MapView
/// via MapView.mapboxMap.style.
///
/// - Important: Style should only be used from the main thread.
@objc open class TMBStyle: NSObject {
    private let _self: Style;
    init(_ style: Style) {
        self._self = style
    }
    public var rawValue: Style {
        return _self
    }

    @objc public weak var styleManager: StyleManager! {
        return _self.styleManager
    }

    // MARK: - Layers

    /// Adds a `layer` to the map
    ///
    /// - Parameters:
    ///   - layer: The layer to apply on the map
    ///   - layerPosition: Position to add the layer in the stack of layers on the map. Defaults to the top layer.
    ///
    /// - Throws: ``StyleError`` if there is a problem adding the given `layer` at the given `position`.
    @objc public func addLayer(
        _ layer: TMBLayer,
        layerPosition: TMBLayerPosition? = nil,
        completion: ((Error?)->Void)? = nil
    ) {
        guard let svc = layer as? (any SwiftValueConvertible),
              let xlayer = svc.swiftValue() as? Layer else {
            completion?(TMBError(message: "Invalid TMBLayer"))
            return
        }
        
        do
        {
            try _self.addLayer(xlayer, layerPosition: layerPosition?.swiftValue() ?? .default)
            completion?(nil)
        }
        catch {
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
    @objc public func addPersistentLayer(
        _ layer: TMBLayer,
        layerPosition: TMBLayerPosition? = nil,
        completion: ((Error?)->Void)? = nil
    ) {
        guard let svc = layer as? (any SwiftValueConvertible),
              let xlayer = svc.swiftValue() as? Layer else {
            completion?(TMBError(message: "Invalid TMBLayer"))
            return
        }
        
        do
        {
            try _self.addPersistentLayer(xlayer, layerPosition: layerPosition?.swiftValue() ?? .default)
            completion?(nil)
        }
        catch {
            completion?(error)
        }        
    }

    /**
     Moves a `layer` to a new layer position in the style.
     - Parameter layerId: The layer to move
     - Parameter position: Position to move the layer in the stack of layers on the map. Defaults to the top layer.

     - Throws: `StyleError` on failure, or `NSError` with a _domain of "com.mapbox.bindgen"
     */
    @objc public func moveLayer(
        withId id: String,
        to position: TMBLayerPosition,
        completion: ((Error?)->Void)? = nil
    ) {
        do
        {
            try _self.moveLayer(withId: id, to: position.swiftValue())
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    private func layerTypeToLayer(_ id: String, layerType: TMBLayerType) throws -> TMBLayer  {
        switch(layerType) {
        case .fill:
            let layer = try _self.layer(withId: id, type: FillLayer.self)
            var xlayer = TMBFillLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .line:
            let layer = try _self.layer(withId: id, type: LineLayer.self)
            var xlayer = TMBLineLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .symbol:
            let layer = try _self.layer(withId: id, type: SymbolLayer.self)
            var xlayer = TMBSymbolLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .circle:
            let layer = try _self.layer(withId: id, type: CircleLayer.self)
            var xlayer = TMBCircleLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .heatmap:
            let layer = try _self.layer(withId: id, type: HeatmapLayer.self)
            var xlayer = TMBHeatmapLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .fillExtrusion:
            let layer = try _self.layer(withId: id, type: FillExtrusionLayer.self)
            var xlayer = TMBFillExtrusionLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .raster:
            let layer = try _self.layer(withId: id, type: RasterLayer.self)
            var xlayer = TMBRasterLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .hillshade:
            let layer = try _self.layer(withId: id, type: HillshadeLayer.self)
            var xlayer = TMBHillshadeLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .background:
            let layer = try _self.layer(withId: id, type: BackgroundLayer.self)
            var xlayer = TMBBackgroundLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .locationIndicator:
            let layer = try _self.layer(withId: id, type: LocationIndicatorLayer.self)
            var xlayer = TMBLocationIndicatorLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .sky:
            let layer = try _self.layer(withId: id, type: SkyLayer.self)
            var xlayer = TMBSkyLayer(id: id)
            layer.mapTo(&xlayer)
            return xlayer
        case .model:
            throw TMBError(message: "MobelLayer is deprecated.")
        }
    }
    
    private func layerToLayer(_ layer: Layer) -> TMBLayer? {
        switch(layer.type) {
        case .fill:
            let zlayer = layer as! FillLayer
            var xlayer = TMBFillLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .line:
            let zlayer = layer as! LineLayer
            var xlayer = TMBLineLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .symbol:
            let zlayer = layer as! SymbolLayer
            var xlayer = TMBSymbolLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .circle:
            let zlayer = layer as! CircleLayer
            var xlayer = TMBCircleLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .heatmap:
            let zlayer = layer as! HeatmapLayer
            var xlayer = TMBHeatmapLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .fillExtrusion:
            let zlayer = layer as! FillExtrusionLayer
            var xlayer = TMBFillExtrusionLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .raster:
            let zlayer = layer as! RasterLayer
            var xlayer = TMBRasterLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .hillshade:
            let zlayer = layer as! HillshadeLayer
            var xlayer = TMBHillshadeLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .background:
            let zlayer = layer as! BackgroundLayer
            var xlayer = TMBBackgroundLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .locationIndicator:
            let zlayer = layer as! LocationIndicatorLayer
            var xlayer = TMBLocationIndicatorLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .sky:
            let zlayer = layer as! SkyLayer
            var xlayer = TMBSkyLayer(id: layer.id)
            zlayer.mapTo(&xlayer)
            return xlayer
        case .model:
            return nil
        }
    }
    
    /**
     Gets a `layer` from the map
     - Parameter id: The id of the layer to be fetched
     - Parameter type: The type of the layer that will be fetched

     - Returns: The fully formed `layer` object of type equal to `type`
     - Throws: ``StyleError`` if there is a problem getting the layer data.
     - Throws: ``TypeConversionError`` is there is a problem decoding the layer data to the given `type`.
     */
    @objc public func layer(
        withId id: String,
        type: TMBLayerType,
        completion: ((TMBLayer?, Error?)->Void)? = nil
    ) {
        do {
            let layer = try layerTypeToLayer(id, layerType: type)
            completion?(layer, nil)
        }
        catch {
            completion?(nil, error)
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
    @objc public func layer(
        withId id: String,
        completion: ((TMBLayer?, Error?)->Void)? = nil
    ) {
        do {
            let layer = try _self.layer(withId: id)
            let xlayer = layerToLayer(layer)
            
            if (xlayer == nil) {
                completion?(nil, TMBError(message: "Invalid layer"))
                return
            }
            
            completion?(xlayer, nil)
        }
        catch {
            completion?(nil, error)
        }
    }

    /// Updates a `layer` that exists in the `style` already
    ///
    /// - Parameters:
    ///   - id: identifier of layer to update
    ///   - type: Type of the layer
    ///   - update: Closure that mutates a layer passed to it
    ///
    /// - Throws: ``TypeConversionError`` if there is a problem getting a layer data.
    /// - Throws: ``StyleError`` if there is a problem updating the layer.
    /// - Throws: An error when executing `update` block.
    @objc public func updateLayer(
        withId id: String,
        type: TMBLayerType,
        update: (TMBLayer) -> TMBLayer,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            switch(type) {
            case .fill:
                try _self.updateLayer(withId: id, type: FillLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBFillLayer
                    zlayer.mapTo(&layer)
                }
            case .line:
                try _self.updateLayer(withId: id, type: LineLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBLineLayer
                    zlayer.mapTo(&layer)
                }
            case .symbol:
                try _self.updateLayer(withId: id, type: SymbolLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBSymbolLayer
                    zlayer.mapTo(&layer)
                }
            case .circle:
                try _self.updateLayer(withId: id, type: CircleLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBCircleLayer
                    zlayer.mapTo(&layer)
                }
            case .heatmap:
                try _self.updateLayer(withId: id, type: HeatmapLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBHeatmapLayer
                    zlayer.mapTo(&layer)
                }
            case .fillExtrusion:
                try _self.updateLayer(withId: id, type: FillExtrusionLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBFillExtrusionLayer
                    zlayer.mapTo(&layer)
                }
            case .raster:
                try _self.updateLayer(withId: id, type: RasterLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBRasterLayer
                    zlayer.mapTo(&layer)
                }
            case .hillshade:
                try _self.updateLayer(withId: id, type: HillshadeLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBHillshadeLayer
                    zlayer.mapTo(&layer)
                }
            case .background:
                try _self.updateLayer(withId: id, type: BackgroundLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBBackgroundLayer
                    zlayer.mapTo(&layer)
                }
            case .locationIndicator:
                try _self.updateLayer(withId: id, type: LocationIndicatorLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBLocationIndicatorLayer
                    zlayer.mapTo(&layer)
                }
            case .sky:
                try _self.updateLayer(withId: id, type: SkyLayer.self) { layer in
                    let xlayer = layer.objcValue()
                    let zlayer = update(xlayer) as! TMBSkyLayer
                    zlayer.mapTo(&layer)
                }
            case .model:
                throw TMBError(message: "ModelLayer is deprecated.")
            }
            
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    // MARK: - Sources
    
    func sourceToSource(_ objc: TMBSource) throws -> Source {
        switch(objc.type) {
        case .vector:
            return (objc as! TMBVectorSource).swiftValue()
        case .raster:
            return (objc as! TMBRasterSource).swiftValue()
        case .rasterDem:
            return (objc as! TMBRasterDemSource).swiftValue()
        case .geoJson:
            return (objc as! TMBGeoJSONSource).swiftValue()
        case .image:
            return (objc as! TMBImageSource).swiftValue()
        case .model:
            throw TMBError(message: "ModelSource is internal")
        }
    }
    func sourceToSource(_ value: Source, id: String) throws -> TMBSource {
        switch(value.type) {
        case .vector:
            return (value as! VectorSource).objcValue(id)
        case .raster:
            return (value as! RasterSource).objcValue(id)
        case .rasterDem:
            return (value as! RasterDemSource).objcValue(id)
        case .geoJson:
            return (value as! GeoJSONSource).objcValue(id)
        case .image:
            return (value as! ImageSource).objcValue(id)
        case .model:
            throw TMBError(message: "ModelSource is internal")
        }
    }

    /**
     Adds a `source` to the map
     - Parameter source: The source to add to the map.
     - Parameter identifier: A unique source identifier.

     - Throws: ``StyleError`` if there is a problem adding the `source`.
     */
    @objc public func addSource(
        _ source: TMBSource,
        id: String,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            let xsource = try sourceToSource(source)
            try _self.addSource(xsource, id: id)
            
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }
    
    @objc public func addSource(id: String, geometry: MapboxCommon.Geometry, completion: ((Error?)->Void)?) -> Void {
        do {
            var source = GeoJSONSource()
            source.data = .geometry(Geometry(geometry)!)
            try _self.addSource(source, id: id)
            completion?(nil)
        } catch {
            completion?(error)
        }
    }
    
    private func sourceTypeToSource(_ id: String, sourceType: TMBSourceType) throws -> TMBSource  {
        switch(sourceType) {
        case .vector:
            let source = try _self.source(withId: id, type: VectorSource.self)
            var xsource = TMBVectorSource(id: id)
            source.mapTo(&xsource)
            return xsource
        case .raster:
            let source = try _self.source(withId: id, type: RasterSource.self)
            var xsource = TMBRasterSource(id: id)
            source.mapTo(&xsource)
            return xsource
        case .rasterDem:
            let source = try _self.source(withId: id, type: RasterDemSource.self)
            var xsource = TMBRasterDemSource(id: id)
            source.mapTo(&xsource)
            return xsource
        case .geoJson:
            let source = try _self.source(withId: id, type: GeoJSONSource.self)
            var xsource = TMBGeoJSONSource(id: id)
            source.mapTo(&xsource)
            return xsource
        case .image:
            let source = try _self.source(withId: id, type: ImageSource.self)
            var xsource = TMBImageSource(id: id)
            source.mapTo(&xsource)
            return xsource
        case .model:
            throw TMBError(message: "Internal use only")
        }
    }
    /**
     Retrieves a `source` from the map
     - Parameter id: The id of the source to retrieve
     - Parameter type: The type of the source

     - Returns: The fully formed `source` object of type equal to `type`.
     - Throws: ``StyleError`` if there is a problem getting the source data.
     - Throws: ``TypeConversionError`` if there is a problem decoding the source data to the given `type`.
     */
    @objc public func source(
        withId id: String,
        type: TMBSourceType,
        completion: ((TMBSource?, Error?)->Void)? = nil
    ) {
        do {
            let result = try sourceTypeToSource(id, sourceType: type)
            
            completion?(result, nil)
        }
        catch {
            completion?(nil, error)
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
    @objc public func source(
        withId id: String,
        completion: ((TMBSource?, Error?)->Void)? = nil
    ) {
        do {
            let source = try _self.source(withId: id)
            let result = try sourceToSource(source, id: id)
            
            completion?(result, nil)
        }
        catch {
            completion?(nil, error)
        }
    }

    /// Updates the `data` property of a given `GeoJSONSource` with a new value
    /// conforming to the `GeoJSONObject` protocol.
    ///
    /// - Parameters:
    ///   - id: The identifier representing the GeoJSON source.
    ///   - geoJSON: The new GeoJSON to be associated with the source data. i.e.
    ///   a feature or feature collection.
    ///
    /// - Throws: ``StyleError`` if there is a problem when updating GeoJSON source.
    ///
    /// - Attention: This method is only effective with sources of `GeoJSONSource`
    /// type, and cannot be used to update other source types.
    @objc public func updateGeoJSONSource(
        withId id: String,
        geometry: MapboxCommon.Geometry,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.updateGeoJSONSource(withId: id, geoJSON: .geometry(Turf.Geometry(geometry)!))
            
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }
    @objc public func updateGeoJSONSource(
        withId id: String,
        feature: MapboxCommon.Feature,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.updateGeoJSONSource(withId: id, geoJSON: .feature(Turf.Feature(feature)))
            
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// `true` if and only if the style JSON contents, the style specified sprite,
    /// and sources are all loaded, otherwise returns `false`.
    @objc public var isLoaded: Bool {
        return _self.isLoaded
    }

    /// Get or set the style URI
    ///
    /// Setting a new style is asynchronous. In order to get the result of this
    /// operation, listen to `MapEvents.styleDataLoaded`, `MapEvents.styleLoaded`.
    ///
    /// - Attention:
    ///     This method should be called on the same thread where the MapboxMap
    ///     object is initialized.
    @objc public var uri: String? {
        get {
            _self.uri?.rawValue
        }
        set {
            if let uriString = newValue {
                _self.uri = StyleURI(rawValue: uriString)
            } else {
                _self.uri = nil
            }
        }
    }

    /// Get or set the style via a JSON serialization string
    ///
    /// - Attention:
    ///     This method should be called on the same thread where the MapboxMap
    ///     object is initialized.
    @objc public var JSON: String {
        get {
            _self.JSON
        }
        set {
            _self.JSON = newValue
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
    @objc public var defaultCamera: MapboxCoreMaps.CameraOptions {
        return MapboxCoreMaps.CameraOptions(_self.defaultCamera)
    }

    /// Get or set the map `style`'s transition options.
    ///
    /// By default, the style parser will attempt to read the style default
    /// transition, if any, falling back to a 0.3 s transition otherwise.
    ///
    /// Overridden transitions are reset once a new style has been loaded.
    /// To customize the transition used when switching styles, set this
    /// property after `MapEvents.EventKind.styleDataLoaded` where
    /// `Event.type == "style"` and before
    /// `MapEvents.EventKind.styleDataLoaded` where `Event.type == "sprite"`
    /// and where `Event.type == "sources"`.
    /// - SeeAlso: ``MapboxMap/onNext(_:handler:)``
    @objc public var transition: TransitionOptions {
        get {
            return _self.transition
        }
        set {
            _self.transition = newValue
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
    @objc public func addLayer(
        withProperties properties: [String: Any],
        layerPosition: TMBLayerPosition?,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.addLayer(with: properties, layerPosition: layerPosition?.swiftValue())
            
            completion?(nil)
        }
        catch {
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
    @objc public func addPersistentLayer(
        with properties: [String: Any],
        layerPosition: TMBLayerPosition?,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.addPersistentLayer(with: properties, layerPosition: layerPosition?.swiftValue())
            
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Returns `true` if the id passed in is associated to a persistent layer
    /// - Parameter id: The layer identifier to test
    @objc public func isPersistentLayer(
        id: String,
        completion: ((NSNumber?, Error?)->Void)? = nil
    ) {
        do {
            let result = try _self.isPersistentLayer(id: id)
            
            completion?(result.asNumber(), nil)
        }
        catch {
            completion?(nil, error)
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
    @objc public func addPersistentCustomLayer(
        withId id: String,
        layerHost: CustomLayerHost,
        layerPosition: TMBLayerPosition?,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.addPersistentCustomLayer(withId: id, layerHost: layerHost, layerPosition: layerPosition?.swiftValue())
            
            completion?(nil)
        }
        catch {
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
    @objc public func addCustomLayer(
        withId id: String,
        layerHost: CustomLayerHost,
        layerPosition: TMBLayerPosition?,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.addCustomLayer(withId: id, layerHost: layerHost, layerPosition: layerPosition?.swiftValue())
            
            completion?(nil)
        }
        catch {
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
    @objc public func removeLayer(
        withId id: String,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.removeLayer(withId: id)
            
            completion?(nil)
        }
        catch {
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
    @objc public func layerExists(withId id: String) -> Bool {
        return _self.layerExists(withId: id)
    }

    /// The ordered list of the current style layers' identifiers and types
    @objc public var allLayerIdentifiers: [TMBLayerInfo] {
        return _self.allLayerIdentifiers.map{ TMBLayerInfo($0) }
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
    @objc public func layerPropertyValue(for layerId: String, property: String) -> Any {
        return _self.layerPropertyValue(for: layerId, property: property)
    }

    /// Gets the value of style layer property.
    ///
    /// - Parameters:
    ///   - layerId: Style layer identifier.
    ///   - property: Style layer property name.
    ///
    /// - Returns:
    ///     The value of the property in the layer with layerId.
    @objc public func layerProperty(for layerId: String, property: String) -> StylePropertyValue {
        return _self.layerProperty(for: layerId, property: property)
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
    @objc public func setLayerProperty(
        for layerId: String,
        property: String,
        value: Any,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setLayerProperty(for: layerId, property: property, value: value)
            
            completion?(nil)
        }
        catch {
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
    @objc public static func layerPropertyDefaultValue(
        for layerType: TMBLayerType,
        property: String
    ) -> StylePropertyValue {
        return Style.layerPropertyDefaultValue(for: layerType.swiftValue(), property: property)
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
    @objc public func layerProperties(
        for layerId: String,
        completion: (([String: Any]?, Error?)->Void)? = nil
    ) {
        do {
            let result = try _self.layerProperties(for: layerId)
            
            completion?(result, nil)
        }
        catch {
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
    @objc public func setLayerProperties(
        for layerId: String,
        properties: [String: Any],
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setLayerProperties(for: layerId, properties: properties)
            
            completion?(nil)
        }
        catch {
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
    @objc public func addSource(
        withId id: String,
        properties: [String: Any],
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.addSource(withId: id, properties: properties)
            
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Removes an existing style source.
    ///
    /// - Parameter id: Identifier of the style source to remove.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func removeSource(
        withId id: String,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.removeSource(withId: id)
            
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Checks whether a given style source exists.
    ///
    /// - Parameter id: Style source identifier.
    ///
    /// - Returns: `true` if the given source exists, `false` otherwise.
    @objc public func sourceExists(
        withId id: String
    ) -> Bool {
        return _self.sourceExists(withId: id)
    }

    /// The ordered list of the current style sources' identifiers and types. Identifiers for custom vector
    /// sources will not be included
    @objc public var allSourceIdentifiers: [TMBSourceInfo] {
        return _self.allSourceIdentifiers.map{ TMBSourceInfo($0) }
    }

    // MARK: - Source properties

    /// Gets the value of style source property.
    ///
    /// - Parameters:
    ///   - sourceId: Style source identifier.
    ///   - property: Style source property name.
    ///
    /// - Returns: The value of the property in the source with sourceId.
    @objc public func sourceProperty(for sourceId: String, property: String) -> StylePropertyValue {
        return _self.sourceProperty(for: sourceId, property: property)
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
    @objc public func setSourceProperty(
        for sourceId: String,
        property: String,
        value: Any,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setSourceProperty(for: sourceId, property: property, value: value)
            
            completion?(nil)
        }
        catch {
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
    @objc public func sourceProperties(
        for sourceId: String,
        completion: (([String: Any]?, Error?)->Void)? = nil
    ) {
        do {
            let result = try _self.sourceProperties(for: sourceId)
            
            completion?(result, nil)
        }
        catch {
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
    @objc public func setSourceProperties(
        for sourceId: String,
        properties: [String: Any],
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setSourceProperties(for: sourceId, properties: properties)
            
            completion?(nil)
        }
        catch {
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
    @objc public static func sourcePropertyDefaultValue(
        for sourceType: String,
        property: String) -> StylePropertyValue {
        return Style.sourcePropertyDefaultValue(for: sourceType, property: property)
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
    @objc public func updateImageSource(
        withId id: String,
        image: UIImage,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.updateImageSource(withId: id, image: image)
            
            completion?(nil)
        }
        catch {
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
    @objc public func addImage(
        _ image: UIImage,
        id: String,
        sdf: Bool = false,
        stretchX: [ImageStretches],
        stretchY: [ImageStretches],
        content: ImageContent? = nil,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.addImage(image, id: id, sdf: sdf, stretchX: stretchX, stretchY: stretchY)
            completion?(nil)
        }
        catch {
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
    @objc public func addImage(
        _ image: UIImage,
        id: String,
        sdf: Bool = false,
        contentInsets: UIEdgeInsets = .zero,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.addImage(image, id: id, sdf: sdf, contentInsets: contentInsets)
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Removes an image from the style.
    ///
    /// - Parameter id: ID of the image to remove.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func removeImage(
        withId id: String,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.removeImage(withId: id)
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Checks whether an image exists.
    ///
    /// - Parameter id: The identifier of the image.
    ///
    /// - Returns: `true` if the given image exists, `false` otherwise.
    @objc public func imageExists(withId id: String) -> Bool {
        return _self.imageExists(withId: id)
    }

    /// Get an image from the style.
    ///
    /// - Parameter id: ID of the image.
    ///
    /// - Returns: UIImage representing the data associated with the given ID,
    ///     or nil if no image is associated with that ID.
    @objc public func image(withId id: String) -> UIImage? {
        return _self.image(withId: id)
    }

    // MARK: - Light

    /// Sets a light on the style.
    ///
    /// - Parameter light: The `Light` that should be applied.
    ///
    /// - Throws: An error describing why the operation was unsuccessful.
    @objc public func setLight(
        _ light: TMBLight,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            var xlight = Light()
            light.mapTo(&xlight)
            try _self.setLight(xlight)
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Sets the style global light source properties.
    ///
    /// - See Also: https://docs.mapbox.com/mapbox-gl-js/style-spec/#light
    ///
    /// - Parameter properties: A dictionary of style light properties values,
    ///     with their names as key.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setLight(
        properties: [String: Any],
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setLight(properties: properties)
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Sets a value to the style light property.
    ///
    /// - Parameters:
    ///   - property: Style light property name.
    ///   - value: Style light property value.
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setLightProperty(
        _ property: String,
        value: Any,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setLightProperty(property, value: value)
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Gets the value of a style light property.
    ///
    /// - Parameter property: Style light property name.
    ///
    /// - Returns: Style light property value.
    @objc public func lightProperty(_ property: String) -> Any {
        return _self.lightProperty(property)
    }

    /// Gets the value of a style light property.
    ///
    /// - Parameter property: Style light property name.
    ///
    /// - Returns: Style light property value.
    @objc public func lightStylePropertyValue(_ property: String) -> StylePropertyValue {
        return _self.lightProperty(property)
    }

    // MARK: - Terrain

    /// Sets a terrain on the style
    ///
    /// - Parameter terrain: The `Terrain` that should be rendered
    ///
    /// - Throws:
    ///     An error describing why the operation was unsuccessful.
    @objc public func setTerrain(
        _ terrain: TMBTerrain,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            var xterrain = Terrain(sourceId: terrain.source)
            terrain.mapTo(&xterrain)
            try _self.setTerrain(xterrain)
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Removes terrain from style if it was set.
    @objc public func removeTerrain() {
        _self.removeTerrain()
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
    @objc public func setTerrain(
        properties: [String: Any],
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setTerrain(properties: properties)
            completion?(nil)
        }
        catch {
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
    @objc public func setTerrainProperty(
        _ property: String,
        value: Any,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setTerrainProperty(property, value: value)
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Gets the value of a style terrain property.
    ///
    /// - Parameter property: Style terrain property name.
    ///
    /// - Returns: Style terrain property value.
    @objc public func terrainProperty(_ property: String) -> Any {
        return _self.terrainProperty(property)
    }

    /// Gets the value of a style terrain property.
    ///
    /// - Parameter property: Style terrain property name.
    ///
    /// - Returns: Style terrain property value.
    @objc public func terrainStylePropertyValue(_ property: String) -> StylePropertyValue {
        return _self.terrainProperty(property)
    }

    // MARK: - Atmosphere

    /// Set the atmosphere of the style
    /// - Parameter atmosphere: ``Atmosphere`` object describing the fog, space and stars.
    @objc public func setAtmosphere(
        _ atmosphere: TMBAtmosphere,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            var xatmosphere = Atmosphere()
            atmosphere.mapTo(&xatmosphere)           
            try _self.setAtmosphere(xatmosphere)
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// Remove the atmosphere of the style. No fog, space or stars would be rendered.
    @objc public func removeAtmosphere(
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.removeAtmosphere()
            completion?(nil)
        }
        catch {
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
    @objc public func setAtmosphere(
        properties: [String: Any],
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setAtmosphere(properties: properties)
            completion?(nil)
        }
        catch {
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
    @objc public func setAtmosphereProperty(
        _ property: String,
        value: Any,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setAtmosphereProperty(property, value: value)
            completion?(nil)
        }
        catch {
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
    @objc public func atmosphereProperty(_ property: String) -> StylePropertyValue {
        return _self.atmosphereProperty(property)
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
    @objc public func addCustomGeometrySource(
        withId id: String,
        options: CustomGeometrySourceOptions,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.addCustomGeometrySource(withId: id, options: options)
            completion?(nil)
        }
        catch {
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
    @objc public func setCustomGeometrySourceTileData(
        forSourceId sourceId: String,
        tileId: CanonicalTileID,
        features: [MapboxCommon.Feature],
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setCustomGeometrySourceTileData(forSourceId: sourceId, tileId: tileId, features: features.map { Turf.Feature($0) })
            completion?(nil)
        }
        catch {
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
    @objc public func invalidateCustomGeometrySourceTile(
        forSourceId sourceId: String,
        tileId: CanonicalTileID,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.invalidateCustomGeometrySourceTile(forSourceId: sourceId, tileId: tileId)
            completion?(nil)
        }
        catch {
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
    @objc public func invalidateCustomGeometrySourceRegion(
        forSourceId sourceId: String,
        bounds: CoordinateBounds,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.invalidateCustomGeometrySourceRegion(forSourceId: sourceId, bounds: bounds)
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }
}

// MARK: - StyleProjection

extension TMBStyle {
    /// Sets the projection.
    ///
    /// - Parameter projection: The ``StyleProjection`` to apply to the style.
    /// - Throws: ``StyleError`` if the projection could not be applied.
    @objc public func setProjection(
        _ projection: TMBStyleProjection,
        completion: ((Error?)->Void)? = nil
    ) {
        do {
            try _self.setProjection(projection.rawValue)
            completion?(nil)
        }
        catch {
            completion?(error)
        }
    }

    /// The current projection.
    @objc public var projection: TMBStyleProjection {
        return _self.projection.objcValue()
    }
}

@objc
extension TMBStyle {
    @objc public func addGeoJSONSource(id: String, properties: [String: Any], geojson: String, onComplete: ((Error?)->Void)?) -> Void {
        do {
            // Fake data properties
            var xproperties = properties
            xproperties["data"] = ""
            try _self.addSource(withId: id, properties: xproperties)
            
            updateGeoJSONSource(id: id, geojson: geojson, onComplete: onComplete)
        } catch {
            onComplete?(error)
        }
    }
    
    @objc public func updateGeoJSONSource(id: String, geojson: String, onComplete: ((Error?)->Void)?) -> Void {
        do {
            let data =  geojson.data(using: .utf8)
            let sourceData = try JSONDecoder().decode(GeoJSONSourceData.self, from: data!)
            
            var source: GeoJSONObject?
            
            switch sourceData {
            case .feature(let feature):
                source = .feature(feature)
            case .featureCollection(let featureCollection):
                source = .featureCollection(featureCollection)
            case .geometry(let geometry):
                source = .geometry(geometry)
            default:
                source = nil
            }
            
            if let source = source {
                try _self.updateGeoJSONSource(withId: id, geoJSON: source)
            }
            
            onComplete?(nil)
        } catch {
            onComplete?(error)
        }
    }
}
