import MapboxMaps
import MapboxMobileEvents

// MapView.camera

@objc
extension MapView {
    @objc public func setCamera(to cameraOptions: MapboxCoreMaps.CameraOptions) {
        self.mapboxMap.setCamera(to: cameraOptions.swiftValue())
    }
}

// MapView.ornaments
extension MapView {
    @objc public func ornamentsOptionsScaleBarVisibility(_ value: MBXOrnamentVisibility) {
        self.ornaments.options.scaleBar.visibility = value.swiftOnly()
    }
}

// MapView.events
extension MapView {
    /// The style has been fully loaded, and the map has rendered all visible tiles.
    @discardableResult
    @objc public func onMapLoaded(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .mapLoaded) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// Describes an error that has occurred while loading the Map. The `type` property defines what resource could
    /// not be loaded and the `message` property will contain a descriptive error message.
    /// In case of `source` or `tile` loading errors, `source-id` will contain the id of the source failing.
    /// In case of `tile` loading errors, `tile-id` will contain the id of the tile.
    @discardableResult
    @objc public func onMapLoadingError(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .mapLoadingError) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// The map has entered the idle state. The map is in the idle state when there are no ongoing transitions
    /// and the map has rendered all requested non-volatile tiles. The event will not be emitted if `setUserAnimationInProgress`
    /// and / or `setGestureInProgress` is set to `true`.
    @discardableResult
    @objc public func onMapIdle(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .mapIdle) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// The requested style data has been loaded. The `type` property defines what kind of style data has been loaded.
    /// Event may be emitted synchronously, for example, when `setStyleJSON` is used to load style.
    ///
    /// Based on an event data `type` property value, following use-cases may be implemented:
    /// - `style`: Style is parsed, style layer properties could be read and modified, style layers and sources could be
    /// added or removed before rendering is started.
    /// - `sprite`: Style's sprite sheet is parsed and it is possible to add or update images.
    /// - `sources`: All sources defined by the style are loaded and their properties could be read and updated if needed.
    @discardableResult
    @objc public func onStyleDataLoaded(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .styleDataLoaded) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// The requested style has been fully loaded, including the style, specified sprite and sources' metadata.
    ///
    /// Note: The style specified sprite would be marked as loaded even with sprite loading error (An error will be emitted via `.mapLoadingError`).
    /// Sprite loading error is not fatal and we don't want it to block the map rendering, thus this event will still be emitted if style and sources are fully loaded.
    @discardableResult
    @objc public func onStyleLoaded(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .styleLoaded) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// A style has a missing image. This event is emitted when the map renders visible tiles and
    /// one of the required images is missing in the sprite sheet. Subscriber has to provide the missing image
    /// by calling ``Style/addImage(_:id:sdf:contentInsets:)``.
    @discardableResult
    @objc public func onStyleImageMissing(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .styleImageMissing) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// An image added to the style is no longer needed and can be removed using ``Style/removeImage(withId:)``.
    @discardableResult
    @objc public func onStyleImageRemoveUnused(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .styleImageRemoveUnused) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// A source data has been loaded.
    /// Event may be emitted synchronously in cases when source's metadata is available when source is added to the style.
    ///
    /// The `id` property defines the source id.
    ///
    /// The `type` property defines if source's metadata (e.g., TileJSON) or tile has been loaded. The property of `metadata`
    /// value might be useful to identify when particular source's metadata is loaded, thus all source's properties are
    /// readable and can be updated before map will start requesting data to be rendered.
    ///
    /// The `loaded` property will be set to `true` if all source's data required for visible viewport of the map, are loaded.
    /// The `tile-id` property defines the tile id if the `type` field equals `tile`.
    @discardableResult
    @objc public func onSourceDataLoaded(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .sourceDataLoaded) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// The source has been added with ``Style/addSource(_:id:)`` or ``Style/addSource(withId:properties:)``.
    /// The event is emitted synchronously, therefore, it is possible to immediately
    /// read added source's properties.
    @discardableResult
    @objc public func onSourceAdded(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .sourceAdded) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// The source has been removed with ``Style/removeSource(withId:)``.
    /// The event is emitted synchronously, thus, ``Style/allSourceIdentifiers`` will be
    /// in sync when the observer receives the notification.
    @discardableResult
    @objc public func onSourceRemoved(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .sourceRemoved) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// The map finished rendering a frame.
    /// The `render-mode` property tells whether the map has all data (`full`) required to render the visible viewport.
    /// The `needs-repaint` property provides information about ongoing transitions that trigger map repaint.
    /// The `placement-changed` property tells if the symbol placement has been changed in the visible viewport.
    @discardableResult
    @objc public func onRenderFrameStarted(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .renderFrameStarted) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// The camera has changed. This event is emitted whenever the visible viewport
    /// changes due to the MapView's size changing or when the camera
    /// is modified by calling camera methods. The event is emitted synchronously,
    /// so that an updated camera state can be fetched immediately.
    @discardableResult
    @objc public func onRenderFrameFinished(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .renderFrameFinished) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// The camera has changed. This event is emitted whenever the visible viewport
    /// changes due to the MapView's size changing or when the camera
    /// is modified by calling camera methods. The event is emitted synchronously,
    /// so that an updated camera state can be fetched immediately.
    @discardableResult
    @objc public func onEvenCameraChanged(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .cameraChanged) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }

    /// The `ResourceRequest` event allows client to observe resource requests made by a
    /// map or snapshotter.
    @discardableResult
    @objc public func onResourceRequest(_ handler: @escaping (AnyObject) -> Void) -> MBCCancelable {
        let cancelable = mapboxMap.onNext(event: .resourceRequest) { data in
            // TODO Convert data to obj-c data
            handler(data)
        }
        
        return MBCCancelable(cancelable: cancelable)
    }
}

// MapView.location
extension MapView {
    @objc public func locationDelegate(_ delegate: LocationPermissionsDelegate) {
        self.location.delegate = delegate
    }
    
    @objc public func locationRequestTemporaryFullAccuracyPermissions(_ customKey: String) {
        self.location.requestTemporaryFullAccuracyPermissions(withPurposeKey: customKey)
    }
    
    @objc public func puck2D(_ build: ((_ builder: Puck2DConfigurationBuilder) -> Void)?) {
        if let build {
            let builder = Puck2DConfigurationBuilder()
            build(builder)
            self.location.options.puckType = .puck2D(builder.build())
        } else {
            self.location.options.puckType = .puck2D()
        }
    }
    
    @objc public func puckBearingSource(_ source: MBXPuckBearingSource) {
        self.location.options.puckBearingSource = source.swiftOnly()
    }
}

// MapView.misc
extension MapView {
    @objc public func preferredFrameRateRange(_ value: CAFrameRateRange) {
        self.preferredFrameRateRange = value
    }
    @objc public func mapboxMapDebugOptions() -> [NSNumber] {
        return self.mapboxMap.debugOptions.map{
            return NSNumber(value: $0.rawValue)
        }
    }
    @objc public func mapboxMapDebugOptions(_ value: [NSNumber]) {
        let debugOptions = value.map {
            return MapDebugOptions(rawValue: $0.intValue)!
        }
        
        self.mapboxMap.debugOptions = debugOptions;
    }
}

@objc
open class MBCCancelable : NSObject {
    let cancelable: AnyObject;
    
    init(cancelable: Cancelable) {
        self.cancelable = cancelable
    }
    
    init(cancelable: MapboxCommon.Cancelable) {
        self.cancelable = cancelable
    }
    
    @objc public func cancel() {
        let cancelSel = #selector(cancel)
        if cancelable.responds(to: cancelSel) {
            _ = cancelable.perform(cancelSel)
        }
    }
}
