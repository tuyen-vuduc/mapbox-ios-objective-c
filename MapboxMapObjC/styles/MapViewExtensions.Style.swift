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
    @objc public func loadStyle(_ styleUri: String, completion: ((TMBStyle?, Error?) -> Void)?) {
        let uri = StyleURI(url: URL(string: styleUri)!)!
        self.mapboxMap.loadStyleURI(uri) { result in
            guard let completion = completion else {
                return
            }
            
            switch(result) {
                case .success(let style):
                    completion(TMBStyle(style), nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }
    
    @objc public func addImage(id: String, image: UIImage, sdf: Bool = false, contentInsets: UIEdgeInsets = .zero, completion: ((Error?) -> Void)?) {
        do {
            try self.mapboxMap.style.addImage(image, id: id, sdf: sdf, contentInsets: contentInsets)
            
            if let completion = completion {
                completion(nil)
            }
        } catch {
            if let completion = completion {
                completion(error)
            }
        }
    }
    
    @objc public func removeImage(id: String, completion: ((Error?) -> Void)?) {
        do {
            try self.mapboxMap.style.removeImage(withId: id)
            
            if let completion = completion {
                completion(nil)
            }
        } catch {
            if let completion = completion {
                completion(error)
            }
        }
    }
    
    @objc public func imageExists(id: String) -> Bool {
        return self.mapboxMap.style.imageExists(withId: id)
    }
}
