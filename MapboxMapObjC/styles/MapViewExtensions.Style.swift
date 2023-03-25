import MapboxMaps

// MapView.style

@objc
extension MapView {
    @objc public func setStyle(_ styleUri: String) {
        self.mapboxMap.style.styleManager.setStyleURIForUri(styleUri)
    }
    @objc public func setStyle(inJson styleJson: String) {
        self.mapboxMap.style.styleManager.setStyleJSONForJson(styleJson)
    }
    @objc public func loadStyle(_ styleUri: String, completion: ((MBXStyle?, Error?) -> Void)?) {
        let uri = StyleURI(url: URL(string: styleUri)!)!
        self.mapboxMap.loadStyleURI(uri) { result in
            guard let completion = completion else {
                return
            }
            
            if let style = try? result.get() {
                completion(MBXStyle(style), nil)
            } else {
                completion(nil, MBXError(message: "Cannot load style"))
            }
        }
    }
}
