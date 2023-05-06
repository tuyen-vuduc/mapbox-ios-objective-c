import MapboxMaps

@objc
open class TMBStyle : NSObject {
    let style: Style;
    
    init(_ style: Style) {
        self.style = style
        super.init()
    }
    
    @objc public func addImage(id: String, image: UIImage, sdf: Bool = false, contentInsets: UIEdgeInsets = .zero, completion: ((Error?) -> Void)?) {
        do {
            try self.style.addImage(image, id: id, sdf: sdf, contentInsets: contentInsets)
            
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
            try self.style.removeImage(withId: id)
            
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
        return self.style.imageExists(withId: id)
    }
}
