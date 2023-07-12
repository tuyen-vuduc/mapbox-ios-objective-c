import MapboxMaps

@objc open class TMBExpressionOptions: NSObject {
    @objc public let type: TMBExpressionOptionsType
    @objc public let options: Any
    public let arguments: [Expression.Argument]
    
    private init(_ type: TMBExpressionOptionsType, options: Any, arguments: [Expression.Argument]) {
        self.type = type
        self.options = options
        self.arguments = arguments
    }
    
    @objc public static func format(options: TMBFormatOptions) -> TMBExpressionOptions {
        return TMBExpressionOptions(.format, options: options, arguments: options.expressionArguments)
    }
    
    @objc public static func numberFormat(options: TMBNumberFormatOptions) -> TMBExpressionOptions {
        return TMBExpressionOptions(.numberFormat, options: options, arguments: options.expressionArguments)
    }
    
    @objc public static func collator(options: TMBCollatorOptions) -> TMBExpressionOptions {
        return TMBExpressionOptions(.collator, options: options, arguments: options.expressionArguments)
    }
}

@objc public enum TMBExpressionOptionsType: Int {
    case format
    case numberFormat
    case collator
}

@objc open class TMBFormatOptions: NSObject {
    private var _self: FormatOptions
    init(_ _self: FormatOptions) {
        self._self = _self
    }
    public var rawValue: FormatOptions {
        return _self
    }

    /// Applies a scaling factor on text-size as specified by the root layout property.
    @objc public var fontScaleValue: TMBValue? {
        get {
            return _self.fontScaleValue?.double()
        }
        set {
            _self.fontScaleValue = newValue?.double()
        }
    }
    /// Applies a scaling factor on text-size as specified by the root layout property.
    @objc public var fontScale: NSNumber? {
        get { _self.fontScale?.NSNumber }
        set { _self.fontScale = newValue?.doubleValue }
    }

    /// Overrides the font stack specified by the root layout property.
    @objc public var textFontValue: TMBValue? {
        get {
            return _self.textFontValue?.arrayOfString()
        }
        set {
            _self.textFontValue = newValue?.arrayOfString()
        }
    }
    /// Overrides the font stack specified by the root layout property.
    @objc public var textFont: [String]? {
        get { _self.textFont }
        set { _self.textFont = newValue }
    }

    /// Overrides the color specified by the root paint property.
    @objc public var textColorValue: TMBValue? {
        get {
            return _self.textColorValue?.styleColor()
        }
        set {
            _self.textColorValue = newValue?.styleColor()
        }
    }
    /// Overrides the color specified by the root paint property.
    @objc public var textColor: UIColor? {
        get { _self.textColor?.uiColor() }
        set {
            guard let color = newValue else {
                _self.textColor = nil
                return
            }
            
            _self.textColor = StyleColor(color)
        }
    }
    
    public var expressionArguments: [Expression.Argument] {
        return [.option(.format(_self))]
    }

    public init(fontScale: TMBValue? = nil, textFont:TMBValue? = nil, textColor: TMBValue? = nil) {
        _self = FormatOptions(
            fontScale: fontScale?.double(),
            textFont: textFont?.arrayOfString(),
            textColor: textColor?.styleColor())
    }

    public init(fontScale: Double? = nil, textFont: [String]? = nil, textColor: UIColor? = nil) {
        _self = FormatOptions(fontScale: fontScale, textFont: textFont, textColor: textColor)
    }
}

@objc open class TMBNumberFormatOptions: NSObject {
    private var _self: NumberFormatOptions
    init(_ _self: NumberFormatOptions) {
        self._self = _self
    }
    public var rawValue: NumberFormatOptions {
        return _self
    }

    /// Specifies the locale to use, as a BCP 47 language tag.
    public var locale: String? {
        get { _self.locale }
        set { _self.locale = newValue }
    }

    /// Specifies an ISO 4217 code to use for currency-style formatting.
    public var currency: String? {
        get { _self.currency }
        set { _self.currency = newValue }
    }

    /// Minimum  number of fractional digits to include.
    public var minFractionDigits: NSNumber?  {
        get {
            return _self.minFractionDigits?.asNumber()
        }
        set {
            guard let value = newValue else {
                _self.minFractionDigits = nil
                return
            }
            
            _self.minFractionDigits = value.intValue
        }
    }

    /// Maximum number of fractional digits to include.
    public var maxFractionDigits: NSNumber? {
        get {
            return _self.maxFractionDigits?.asNumber()
        }
        set {
            guard let value = newValue else {
                _self.maxFractionDigits = nil
                return
            }
            
            _self.maxFractionDigits = value.intValue
        }
    }

    public var expressionArguments: [Expression.Argument] {
        return [.option(.numberFormat(_self))]
    }
    
    public init(locale: String?, currency: String?, minFractionDigits: Int?, maxFractionDigits: Int?) {
        _self = NumberFormatOptions(locale: locale, currency: currency, minFractionDigits: minFractionDigits, maxFractionDigits: maxFractionDigits)
    }
}

@objc open class TMBCollatorOptions: NSObject {
    private var _self: CollatorOptions
    init(_ _self: CollatorOptions) {
        self._self = _self
    }
    public var rawValue: CollatorOptions {
        return _self
    }

    /// Whether comparison option is case sensitive.
    @objc public var caseSensitive: NSNumber? {
        get { _self.caseSensitive?.asNumber() }
        set { _self.caseSensitive = newValue?.boolValue }
    }

    /// Whether the comparison operation is diacritic sensitive
    @objc public var diacriticSensitive: NSNumber? {
        get { _self.diacriticSensitive?.asNumber() }
        set { _self.diacriticSensitive = newValue?.boolValue }
    }

    /// The locale argument specifies the IETF language tag of the locale to use.
    /// If none is provided, the default locale is used.
    @objc public var locale: String? {
        get { _self.locale }
        set { _self.locale = newValue }
    }

    public var expressionArguments: [Expression.Argument] {
        return [.option(.collator(_self))]
    }

    @objc public init(caseSensitive: NSNumber?, diacriticSensitive: NSNumber?, locale: String?) {
        _self = CollatorOptions(caseSensitive: caseSensitive?.boolValue, diacriticSensitive: diacriticSensitive?.boolValue, locale: locale)
    }

}
