import MapboxMaps

@objc
open class MBXStyle : NSObject {
    let style: Style;
    
    init(_ style: Style) {
        self.style = style
        super.init()
    }
    
    @objc
    public func addImage(_ image: UIImage, id: String, completion: ((Error)->Void)?) {
        do {
            try style.addImage(image, id: id)
        } catch {
            if let xcompletion = completion {
                xcompletion(error)
            }
        }
    }
}
