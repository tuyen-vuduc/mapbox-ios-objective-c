import MapboxMaps

@objc
open class MBXResolvedImageData : NSObject {
    public let available: Bool
    public let name: String
    
    init(available: Bool, name: String) {
        self.available = available
        self.name = name
    }
}

@objc
open class MBXResolvedImage : NSObject, Codable {
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

extension MBXResolvedImage {
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
}

extension MBXValue {
    
}

