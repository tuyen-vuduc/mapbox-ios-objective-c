import MapboxMaps

@objc open class TMBExpression: NSObject {
    private var _self: Expression
    init(_ _self: Expression) {
        self._self = _self
    }
    public var rawValue: Expression {
        return _self
    }
    
    /// Time allotted for transitions to complete in seconds.
    @objc public var expressionOperator: TMBExpressionOperator {
        return _self.`operator`.objcValue()
    }
    
    /// Length of time before a transition begins in seconds.
    @objc public var arguments: [Any] {
        return TMBExpression.getObjcArguments(_self.arguments)
    }
    
    @objc class public func create(withOperator `operator`: TMBExpressionOperator) -> TMBExpression{
        return TMBExpression(Expression(`operator`.swiftValue()))
    }
    
    @objc class public func create(withOperator `operator`: TMBExpressionOperator, arguments: [Any]) -> TMBExpression{
        return TMBExpression(Expression(operator: `operator`.swiftValue(), arguments: getSwiftArguments(arguments)))
    }
    
    class func getSwiftArguments(_ arguments: [Any]) -> [Expression.Argument] {
        return arguments.map({
            switch $0 {
            case let value as TMBExpression:
                return Expression.Argument.expression(value.rawValue)
            case let value as NSNumber:
                return Expression.Argument.number(value.doubleValue)
            case let value as String:
                return Expression.Argument.string(value)
            case let value as Bool:
                return Expression.Argument.boolean(value)
            case let value as [NSNumber]:
                return Expression.Argument.numberArray(value.map { $0.doubleValue })
            case let value as [String]:
                return Expression.Argument.stringArray(value)
            case let options as TMBExpressionOptions:
                switch(options.options) {
                case let value as TMBFormatOptions:
                    return Expression.Argument.option(.format(value.rawValue))
                case let value as TMBNumberFormatOptions:
                    return Expression.Argument.option(.numberFormat(value.rawValue))
                case let value as TMBCollatorOptions:
                    return Expression.Argument.option(.collator(value.rawValue))
                default:
                    return Expression.Argument.null
                }
            case let geometry as MapboxCommon.Geometry:
                let xgeometry = Turf.Geometry(geometry)!
                return Expression.Argument.geoJSONObject(.geometry(xgeometry))
            case let feature as MapboxCommon.Feature:
                let xfeature = Turf.Feature(feature)
                return Expression.Argument.geoJSONObject(.feature(xfeature))
//            case let featureCollection as MapboxCommon.FeatureCollection:
//                let xfeatureCollection = Turf.FeatureCollection(featureCollection)
//                return Expression.Argument.geoJSONObject(.featureCollection(xfeatureCollection))
            default:
                return Expression.Argument.null
            }
        })
    }
    
    class func getObjcArguments(_ arguments: [Expression.Argument]) -> [Any] {
        return arguments.map({
            switch $0 {
            case .number(let value):
                return value
            case .string(let value):
                return value
            case .boolean(let value):
                return value
            case .numberArray(let value):
                return value
            case .stringArray(let value):
                return value
            case .option(let options):
                switch(options) {
                case .format(let value):
                    return TMBFormatOptions(value)
                case .numberFormat(let value):
                    return TMBNumberFormatOptions(value)
                case .collator(let value):
                    return TMBCollatorOptions(value)
                }
            case .geoJSONObject(let geojson):
                switch(geojson) {
                case .geometry(let value):
                    return MapboxCommon.Geometry(value)
                case .feature(let value):
                    return MapboxCommon.Feature(value)
                case .featureCollection(_):
                    return geojson
                }
            case .null:
                return $0
            case .expression(let value):
                return TMBExpression(value)
            }
        })
    }
    
    @objc class public func args(_ arguments: [Any]) -> TMBExpression{
        return TMBExpression(Expression(arguments: getSwiftArguments(arguments)))
    }
}

extension Expression: ObjcConvertible {
    public func objcValue() -> TMBExpression {
        return TMBExpression(self)
    }
    public func expression() -> TMBExpression {
        return objcValue()
    }
}

extension TMBExpression {
    public func expression() -> Expression {
        return rawValue
    }
}
