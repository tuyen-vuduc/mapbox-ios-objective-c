import UIKit
import MapboxMaps

@objc open class TMBPointAnnotationImage: NSObject {
    @objc public var image: UIImage
    @objc public var name: String

    @objc public init(image: UIImage, name: String) {
        self.image = image
        self.name = name
    }
}

extension TMBPointAnnotationImage {
    func unwrap() -> PointAnnotation.Image {
        PointAnnotation.Image(image: self.image, name: self.name)
    }
}

extension PointAnnotation.Image {
    func wrap() -> TMBPointAnnotationImage {
        TMBPointAnnotationImage(image: self.image, name: self.name)
    }
}
