import MapboxMaps

@objc
open class TMBValue : NSObject {
    let constant: Any?
    let expression: TMBExpression?
    
    @objc public init(constant: Any?) {
        self.constant = constant
        self.expression = nil
    }
    
    @objc public init(expression: TMBExpression) {
        self.expression = expression
        self.constant = nil
    }
    
    @objc class public func constant(_ constant: NSObject) -> TMBValue {
        return TMBValue(constant: constant)
    }
    
    @objc class public func intValue(_ value: Int) -> TMBValue {
        return TMBValue(constant: NSNumber(value: value))
    }
    
    @objc class public func doubleValue(_ value: Double) -> TMBValue {
        return TMBValue(constant: NSNumber(value: value))
    }
    
    @objc class public func expression(_ expression: TMBExpression) -> TMBValue {
        return TMBValue(expression: expression)
    }
}

extension UIColor {
    func styleColor() -> StyleColor {
        return StyleColor(self)
    }
    
    class func fromStyleColor(_ color: StyleColor) -> UIColor {
        return UIColor.fromString(string: color.rawValue)
    }
}

extension MapboxMaps.Value where T == StyleColor {
    func styleColor() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.wrap())
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == Double {
    func double() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.asNumber())
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [Double] {
    func arrayOfDouble() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == String {
    func string() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [String] {
    func arrayOfString() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == Bool {
    func boolean() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.asNumber())
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [Bool] {
    func arrayOfBool() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension TMBValue {
    func styleColor() -> Value<StyleColor>? {
        if let constant = self.constant as? UIColor {
            return Value.constant(StyleColor(constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOfString() -> Value<[String]>? {
        if let constant = self.constant as? NSArray,
            let array = constant as? [String] {
            return Value.constant(array)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func string() -> Value<String>? {
        if let constant = self.constant as? String {
            return Value.constant(constant)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfDouble() -> Value<[Double]>? {
        if let constant = self.constant as? NSArray,
            let array = constant as? [Double] {
            return Value.constant(array)
        }
        
        return Value.expression(expression!.rawValue)
    }    
    func double() -> Value<Double>? {
        if let constant = self.constant as? Double {
            return Value.constant(constant)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func boolean() -> Value<Bool>? {
        if let constant = self.constant as? Bool {
            return Value.constant(constant)
        }
        
        return Value.expression(expression!.rawValue)
    }
}

extension StyleColor: ObjcConvertible {
    public func wrap() -> UIColor {
        return UIColor.fromString(string: self.rawValue)
    }
}
