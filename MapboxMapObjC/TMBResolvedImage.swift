import MapboxMaps

@objc
open class TMBResolvedImageData : NSObject {
    public let available: Bool
    public let name: String
    
    init(available: Bool, name: String) {
        self.available = available
        self.name = name
    }
}

@objc
open class TMBResolvedImage : NSObject, Codable {
    public let available: Bool?
    public let name: String
    
    init(name: String) {
        self.name = name
        self.available = nil
    }
    
    init(name: String, available: Bool) {
        self.name = name
        self.available = available
    }
}

extension TMBResolvedImage {
    @objc
    public class func from(name: String) -> TMBResolvedImage {
        TMBResolvedImage(name: name)
    }
    
    @objc
    public class func from(name: String, available: Bool) -> TMBResolvedImage {
        TMBResolvedImage(name: name, available: available)
    }
    
    func swiftOnly() -> ResolvedImage {
        var data: Data!
        let jsonEncoder = JSONEncoder()
        if self.available != nil {
            data = try! jsonEncoder.encode(self)
        } else {
            data = try! jsonEncoder.encode(self.name)
        }
        
        let jsonDecoder = JSONDecoder()
        return try! jsonDecoder.decode(ResolvedImage.self, from: data);
    }
    
    func resolvedImage() -> ResolvedImage {
        return swiftOnly()
    }
}

extension ResolvedImage {
    func resolvedImage() -> TMBResolvedImage {
        switch(self) {
        case .name(let name):
            return TMBResolvedImage(name: name)
        case .data(let data):
            return TMBResolvedImage(name: data.name, available: data.available)
        }
    }
}

extension MapboxMaps.Value where T == ResolvedImage {
    func resolvedImage() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.resolvedImage())
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [ResolvedImage] {
    func arrayOfResolvedImage() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.resolvedImage() })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}
extension TMBValue {
    func resolvedImage() -> Value<ResolvedImage>? {
        if let constant = self.constant as? TMBResolvedImage {
            return Value.constant(constant.swiftOnly())
        }
        
        return Value.expression(expression!.rawValue)
    }
}

