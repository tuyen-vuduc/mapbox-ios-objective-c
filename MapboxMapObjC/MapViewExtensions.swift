import MapboxMaps


// MapView.ornaments
extension MapView {
    @objc public func ornamentsOptionsScaleBarVisibility(_ value: MBXOrnamentVisibility) {
        self.ornaments.options.scaleBar.visibility = value.swiftOnly()
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
