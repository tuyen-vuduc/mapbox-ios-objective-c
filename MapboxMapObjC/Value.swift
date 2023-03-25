import MapboxMaps

@objc
open class MBXValue : NSObject {
    let constant: NSObject?
    let expression: MBXExpression?
    
    @objc public init(constant: NSObject) {
        self.constant = constant
        self.expression = nil
    }
    
    @objc public init(expression: MBXExpression) {
        self.expression = expression
        self.constant = nil
    }
    
    @objc class public func constant(_ constant: NSObject) -> MBXValue {
        return MBXValue(constant: constant)
    }
    
    @objc class public func intValue(_ value: Int) -> MBXValue {
        return MBXValue(constant: NSNumber(value: value))
    }
    
    @objc class public func doubleValue(_ value: Double) -> MBXValue {
        return MBXValue(constant: NSNumber(value: value))
    }
    
    @objc class public func expression(_ expression: MBXExpression) -> MBXValue {
        return MBXValue(expression: expression)
    }
}


extension UIColor {
    func styleColor() -> StyleColor {
        return StyleColor(self)
    }
    
    class func fromStyleColor(_ color: StyleColor) -> UIColor {
        return UIColor(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
    }
}

extension MBXValue {
    func styleColor<T>() -> Value<T>? {
        if let constant = self.constant as? UIColor {
            return Value.constant(StyleColor(constant) as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    
    func arrayOfString<T>() -> Value<T>? {
        if let constant = self.constant as? NSArray,
            let array = constant as? [String] {
            return Value.constant(array as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func string<T>() -> Value<T>? {
        if let constant = self.constant as? String {
            return Value.constant(constant as! T)
        }
        
        let expression = expression!.swiftOnly();
        
        return Value.expression(expression)
    }
    func arrayOfDouble<T>() -> Value<T>? {
        if let constant = self.constant as? NSArray,
            let array = constant as? [Double] {
            return Value.constant(array as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }    
    func double<T>() -> Value<T>? {
        if let constant = self.constant as? Double {
            return Value.constant(constant as! T)
        }
        
        let expression = expression!.swiftOnly();
        
        return Value.expression(expression)
    }
    func boolean<T>() -> Value<T>? {
        if let constant = self.constant as? Bool {
            return Value.constant(constant as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func visibility<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.visibility() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func lineCap<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.lineCap() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func lineJoin<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.lineJoin() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func iconAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.iconAnchor() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func iconPitchAlignment<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.iconPitchAlignment() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func iconRotationAlignment<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.iconRotationAlignment() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func iconTextFit<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.iconTextFit() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func symbolPlacement<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.symbolPlacement() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func symbolZOrder<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.symbolZOrder() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func textAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.textAnchor() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func arrayOfTextAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? [NSNumber] {
            return Value.constant(constant.map({$0.textAnchor()}) as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func textJustify<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.textJustify() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func textPitchAlignment<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.textPitchAlignment() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func textRotationAlignment<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.textRotationAlignment() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func textTransform<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.textTransform() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func fillTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.fillTranslateAnchor() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func lineTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.lineTranslateAnchor() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func iconTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.iconTranslateAnchor() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func textTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.textTranslateAnchor() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func circlePitchAlignment<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.circlePitchAlignment() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func circlePitchScale<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.circlePitchScale() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func circleTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.circleTranslateAnchor() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func fillExtrusionTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.fillExtrusionTranslateAnchor() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func rasterResampling<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.rasterResampling() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func hillshadeIlluminationAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.hillshadeIlluminationAnchor() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func skyType<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.skyType() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func anchor<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.anchor() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func styleProjectionName<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.styleProjectionName() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func textWritingMode<T>() -> Value<T>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.textWritingMode() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func arrayOfTextWritingMode<T>() -> Value<T>? {
        if let constant = self.constant as? [NSNumber] {
            return Value.constant(constant.map({$0.textWritingMode()}) as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
    func resolvedImage<T>() -> Value<T>? {
        if let constant = self.constant as? MBXResolvedImage {
            return Value.constant(constant.swiftOnly() as! T)
        }
        
        return Value.expression(expression!.swiftOnly())
    }
}
