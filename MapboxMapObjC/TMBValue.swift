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
        return UIColor(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
    }
}

extension TMBValue {
    static func fromSwiftValue<T>(_ value: Value<T>?) -> TMBValue? {
        guard let value = value else {
            return nil
        }
        
        switch(value) {
        case .constant(let obj):
            if let objcc = obj as? (any ObjcConvertible) {
                return TMBValue(constant: objcc.objcValue() as! NSObject)
            }
            
            return TMBValue(constant: obj)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
    
    func styleColor<T>() -> Value<T>? {
        if let constant = self.constant as? UIColor {
            return Value.constant(StyleColor(constant) as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOfString<T>() -> Value<T>? {
        if let constant = self.constant as? NSArray,
            let array = constant as? [String] {
            return Value.constant(array as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func string<T>() -> Value<T>? {
        if let constant = self.constant as? String {
            return Value.constant(constant as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfDouble<T>() -> Value<T>? {
        if let constant = self.constant as? NSArray,
            let array = constant as? [Double] {
            return Value.constant(array as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }    
    func double<T>() -> Value<T>? {
        if let constant = self.constant as? Double {
            return Value.constant(constant as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func boolean<T>() -> Value<T>? {
        if let constant = self.constant as? Bool {
            return Value.constant(constant as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func visibility<T>() -> Value<T>? {
        if let constant = self.constant as? TMBVisibility {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func lineCap<T>() -> Value<T>? {
        if let constant = self.constant as? TMBLineCap {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func lineJoin<T>() -> Value<T>? {
        if let constant = self.constant as? TMBLineJoin {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func iconAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? TMBIconAnchor {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func iconPitchAlignment<T>() -> Value<T>? {
        if let constant = self.constant as? TMBIconPitchAlignment {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func iconRotationAlignment<T>() -> Value<T>? {
        if let constant = self.constant as? TMBIconRotationAlignment {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func iconTextFit<T>() -> Value<T>? {
        if let constant = self.constant as? TMBIconTextFit {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func symbolPlacement<T>() -> Value<T>? {
        if let constant = self.constant as? TMBSymbolPlacement {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func symbolZOrder<T>() -> Value<T>? {
        if let constant = self.constant as? TMBSymbolZOrder {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func textAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? TMBTextAnchor {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfTextAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? [TMBTextAnchor] {
            return Value.constant(constant.map({$0.swiftValue()}) as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func textJustify<T>() -> Value<T>? {
        if let constant = self.constant as? TMBTextJustify {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func textPitchAlignment<T>() -> Value<T>? {
        if let constant = self.constant as? TMBTextPitchAlignment {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func textRotationAlignment<T>() -> Value<T>? {
        if let constant = self.constant as? TMBTextRotationAlignment {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func textTransform<T>() -> Value<T>? {
        if let constant = self.constant as? TMBTextTransform {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func fillTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? TMBFillTranslateAnchor {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func lineTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? TMBLineTranslateAnchor {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func iconTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? TMBIconTranslateAnchor {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func textTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? TMBTextTranslateAnchor {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func circlePitchAlignment<T>() -> Value<T>? {
        if let constant = self.constant as? TMBCirclePitchAlignment {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func circlePitchScale<T>() -> Value<T>? {
        if let constant = self.constant as? TMBCirclePitchScale {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func circleTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? TMBCircleTranslateAnchor {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func fillExtrusionTranslateAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? TMBFillExtrusionTranslateAnchor {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func rasterResampling<T>() -> Value<T>? {
        if let constant = self.constant as? TMBRasterResampling {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func hillshadeIlluminationAnchor<T>() -> Value<T>? {
        if let constant = self.constant as? TMBHillshadeIlluminationAnchor {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func skyType<T>() -> Value<T>? {
        if let constant = self.constant as? TMBSkyType {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func anchor<T>() -> Value<T>? {
        if let constant = self.constant as? TMBAnchor {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func styleProjectionName<T>() -> Value<T>? {
        if let constant = self.constant as? TMBStyleProjectionName {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func textWritingMode<T>() -> Value<T>? {
        if let constant = self.constant as? TMBTextWritingMode {
            return Value.constant(constant.swiftValue() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func arrayOfTextWritingMode<T>() -> Value<T>? {
        if let constant = self.constant as? [TMBTextWritingMode] {
            return Value.constant(constant.map({$0.swiftValue()}) as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
    func resolvedImage<T>() -> Value<T>? {
        if let constant = self.constant as? TMBResolvedImage {
            return Value.constant(constant.swiftOnly() as! T)
        }
        
        return Value.expression(expression!.rawValue)
    }
}

extension StyleColor: ObjcConvertible {
    public func objcValue() -> UIColor {
        return uiColor()
    }
    
    func uiColor() -> UIColor {
        return UIColor(
            red: self.red/255.0,
            green: self.green/255.0,
            blue: self.blue/255.0,
            alpha: self.alpha)
    }
}
