// This file is generated.
import Foundation
import MapboxMaps

@objc open class TMBExpressionOperator: NSObject {
    public let origin: Exp.Operator
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: Exp.Operator(rawValue: rawValue))
    }

    public init(origin: Exp.Operator) {
       self.origin = origin
    }

        /// For two inputs, returns the result of subtracting the second input from the first. For a single input, returns the result of subtracting it from 0.
    @objc public static let subtract = TMBExpressionOperator(origin: Exp.Operator.subtract)

        /// Logical negation. Returns `true` if the input is `false`, and `false` if the input is `true`.
    @objc public static let not = TMBExpressionOperator(origin: Exp.Operator.not)

        /// Returns `true` if the input values are not equal, `false` otherwise. The comparison is strictly typed: values of different runtime types are always considered unequal. Cases where the types are known to be different at parse time are considered invalid and will produce a parse error. Accepts an optional `collator` argument to control locale-dependent string comparisons.
    @objc public static let neq = TMBExpressionOperator(origin: Exp.Operator.neq)

        /// Returns the product of the inputs.
    @objc public static let product = TMBExpressionOperator(origin: Exp.Operator.product)

        /// Returns the result of floating point division of the first input by the second.
    @objc public static let division = TMBExpressionOperator(origin: Exp.Operator.division)

        /// Returns the remainder after integer division of the first input by the second.
    @objc public static let mod = TMBExpressionOperator(origin: Exp.Operator.mod)

        /// Returns the result of raising the first input to the power specified by the second.
    @objc public static let pow = TMBExpressionOperator(origin: Exp.Operator.pow)

        /// Returns the sum of the inputs.
    @objc public static let sum = TMBExpressionOperator(origin: Exp.Operator.sum)

        /// Returns `true` if the first input is strictly less than the second, `false` otherwise. The arguments are required to be either both strings or both numbers; if during evaluation they are not, expression evaluation produces an error. Cases where this constraint is known not to hold at parse time are considered in valid and will produce a parse error. Accepts an optional `collator` argument to control locale-dependent string comparisons.
    @objc public static let lt = TMBExpressionOperator(origin: Exp.Operator.lt)

        /// Returns `true` if the first input is less than or equal to the second, `false` otherwise. The arguments are required to be either both strings or both numbers; if during evaluation they are not, expression evaluation produces an error. Cases where this constraint is known not to hold at parse time are considered in valid and will produce a parse error. Accepts an optional `collator` argument to control locale-dependent string comparisons.
    @objc public static let lte = TMBExpressionOperator(origin: Exp.Operator.lte)

        /// Returns `true` if the input values are equal, `false` otherwise. The comparison is strictly typed: values of different runtime types are always considered unequal. Cases where the types are known to be different at parse time are considered invalid and will produce a parse error. Accepts an optional `collator` argument to control locale-dependent string comparisons.
    @objc public static let eq = TMBExpressionOperator(origin: Exp.Operator.eq)

        /// Returns `true` if the first input is strictly greater than the second, `false` otherwise. The arguments are required to be either both strings or both numbers; if during evaluation they are not, expression evaluation produces an error. Cases where this constraint is known not to hold at parse time are considered in valid and will produce a parse error. Accepts an optional `collator` argument to control locale-dependent string comparisons.
    @objc public static let gt = TMBExpressionOperator(origin: Exp.Operator.gt)

        /// Returns `true` if the first input is greater than or equal to the second, `false` otherwise. The arguments are required to be either both strings or both numbers; if during evaluation they are not, expression evaluation produces an error. Cases where this constraint is known not to hold at parse time are considered in valid and will produce a parse error. Accepts an optional `collator` argument to control locale-dependent string comparisons.
    @objc public static let gte = TMBExpressionOperator(origin: Exp.Operator.gte)

        /// Returns the absolute value of the input.
    @objc public static let abs = TMBExpressionOperator(origin: Exp.Operator.abs)

        /// Returns the value of a cluster property accumulated so far. Can only be used in the `clusterProperties` option of a clustered GeoJSON source.
    @objc public static let accumulated = TMBExpressionOperator(origin: Exp.Operator.accumulated)

        /// Returns the arccosine of the input.
    @objc public static let acos = TMBExpressionOperator(origin: Exp.Operator.acos)

        /// Returns a string which matches one of the values specified in the text-anchor layout property, depending on the best-fit anchor for the symbol during rendering. Using this expression the content of the layer can be dynamically configured for the specific anchor type.
        //@_spi(Experimental) public static let activeAnchor = Operator(rawValue: "active-anchor")

        /// Returns `true` if all the inputs are `true`, `false` otherwise. The inputs are evaluated in order, and evaluation is short-circuiting: once an input expression evaluates to `false`, the result is `false` and no further input expressions are evaluated.
    @objc public static let all = TMBExpressionOperator(origin: Exp.Operator.all)

        /// Returns `true` if any of the inputs are `true`, `false` otherwise. The inputs are evaluated in order, and evaluation is short-circuiting: once an input expression evaluates to `true`, the result is `true` and no further input expressions are evaluated.
    @objc public static let any = TMBExpressionOperator(origin: Exp.Operator.any)

        /// Asserts that the input is an array (optionally with a specific item type and length). If, when the input expression is evaluated, it is not of the asserted type, then this assertion will cause the whole expression to be aborted.
    @objc public static let array = TMBExpressionOperator(origin: Exp.Operator.array)

        /// Returns the arcsine of the input.
    @objc public static let asin = TMBExpressionOperator(origin: Exp.Operator.asin)

        /// Retrieves an item from an array.
    @objc public static let at = TMBExpressionOperator(origin: Exp.Operator.at)

        /// Returns the arctangent of the input.
    @objc public static let atan = TMBExpressionOperator(origin: Exp.Operator.atan)

        /// Asserts that the input value is a boolean. If multiple values are provided, each one is evaluated in order until a boolean is obtained. If none of the inputs are booleans, the expression is an error.
    @objc public static let boolean = TMBExpressionOperator(origin: Exp.Operator.boolean)

        /// Selects the first output whose corresponding test condition evaluates to true, or the fallback value otherwise.
    @objc public static let switchCase = TMBExpressionOperator(origin: Exp.Operator.switchCase)

        /// Returns the smallest integer that is greater than or equal to the input.
    @objc public static let ceil = TMBExpressionOperator(origin: Exp.Operator.ceil)

        /// Evaluates each expression in turn until the first valid value is obtained. Invalid values are `null` and [`'image'`](#types-image) expressions that are unavailable in the style. If all values are invalid, `coalesce` returns the first value listed.
    @objc public static let coalesce = TMBExpressionOperator(origin: Exp.Operator.coalesce)

        /// Returns a `collator` for use in locale-dependent comparison operations. The `case-sensitive` and `diacritic-sensitive` options default to `false`. The `locale` argument specifies the IETF language tag of the locale to use. If none is provided, the default locale is used. If the requested locale is not available, the `collator` will use a system-defined fallback locale. Use `resolved-locale` to test the results of locale fallback behavior.
    @objc public static let collator = TMBExpressionOperator(origin: Exp.Operator.collator)

        /// Returns a `string` consisting of the concatenation of the inputs. Each input is converted to a string as if by `to-string`.
    @objc public static let concat = TMBExpressionOperator(origin: Exp.Operator.concat)

        /// Retrieves the configuration value for the given option.
    @objc public static let config = TMBExpressionOperator(origin: Exp.Operator.config)

        /// Returns the cosine of the input.
    @objc public static let cos = TMBExpressionOperator(origin: Exp.Operator.cos)

        /// Returns the shortest distance in meters between the evaluated feature and the input geometry. The input value can be a valid GeoJSON of type `Point`, `MultiPoint`, `LineString`, `MultiLineString`, `Polygon`, `MultiPolygon`, `Feature`, or `FeatureCollection`. Distance values returned may vary in precision due to loss in precision from encoding geometries, particularly below zoom level 13.
    @objc public static let distance = TMBExpressionOperator(origin: Exp.Operator.distance)

        /// Returns the distance of a `symbol` instance from the center of the map. The distance is measured in pixels divided by the height of the map container. It measures 0 at the center, decreases towards the camera and increase away from the camera. For example, if the height of the map is 1000px, a value of -1 means 1000px away from the center towards the camera, and a value of 1 means a distance of 1000px away from the camera from the center. `["distance-from-center"]` may only be used in the `filter` expression for a `symbol` layer.
    @objc public static let distanceFromCenter = TMBExpressionOperator(origin: Exp.Operator.distanceFromCenter)

        /// Returns the input string converted to lowercase. Follows the Unicode Default Case Conversion algorithm and the locale-insensitive case mappings in the Unicode Character Database.
    @objc public static let downcase = TMBExpressionOperator(origin: Exp.Operator.downcase)

        /// Returns the mathematical constant e.
    @objc public static let e = TMBExpressionOperator(origin: Exp.Operator.e)

        /// Retrieves a property value from the current feature's state. Returns `null` if the requested property is not present on the feature's state. A feature's state is not part of the GeoJSON or vector tile data, and must be set programmatically on each feature. Features are identified by their `id` attribute, which must be an integer or a string that can be cast to an integer. Note that ["feature-state"] can only be used with paint properties that support data-driven styling.
    @objc public static let featureState = TMBExpressionOperator(origin: Exp.Operator.featureState)

        /// Returns the largest integer that is less than or equal to the input.
    @objc public static let floor = TMBExpressionOperator(origin: Exp.Operator.floor)

        /// Returns a `formatted` string for displaying mixed-format text in the `text-field` property. The input may contain a string literal or expression, including an [`'image'`](#types-image) expression. Strings may be followed by a style override object that supports the following properties:
        /// - `"text-font"`: Overrides the font stack specified by the root layout property.
        /// - `"text-color"`: Overrides the color specified by the root paint property.
        /// - `"font-scale"`: Applies a scaling factor on `text-size` as specified by the root layout property.
    @objc public static let format = TMBExpressionOperator(origin: Exp.Operator.format)

        /// Returns the feature's geometry type: `Point`, `LineString` or `Polygon`. `Multi-` feature types return the singular forms.
    @objc public static let geometryType = TMBExpressionOperator(origin: Exp.Operator.geometryType)

        /// Retrieves a property value from the current feature's properties, or from another object if a second argument is provided. Returns `null` if the requested property is missing.
    @objc public static let get = TMBExpressionOperator(origin: Exp.Operator.get)

        /// Tests for the presence of an property value in the current feature's properties, or from another object if a second argument is provided.
    @objc public static let has = TMBExpressionOperator(origin: Exp.Operator.has)

        /// Returns the kernel density estimation of a pixel in a heatmap layer, which is a relative measure of how many data points are crowded around a particular pixel. Can only be used in the `heatmap-color` property.
    @objc public static let heatmapDensity = TMBExpressionOperator(origin: Exp.Operator.heatmapDensity)

        /// Creates a color value from hue (range 0-360), saturation and lightness components (range 0-100), and an alpha component of 1. If any component is out of range, the expression is an error.
    @objc public static let hsl = TMBExpressionOperator(origin: Exp.Operator.hsl)

        /// Creates a color value from hue (range 0-360), saturation and lightness components (range 0-100), and an alpha component (range 0-1). If any component is out of range, the expression is an error.
    @objc public static let hsla = TMBExpressionOperator(origin: Exp.Operator.hsla)

        /// Returns the feature's id, if it has one.
    @objc public static let id = TMBExpressionOperator(origin: Exp.Operator.id)

        /// Returns a [`ResolvedImage`](/mapbox-gl-js/style-spec/types/#resolvedimage) for use in [`icon-image`](/mapbox-gl-js/style-spec/layers/#layout-symbol-icon-image), `--pattern` entries, and as a section in the [`'format'`](#types-format) expression. A [`'coalesce'`](#coalesce) expression containing `image` expressions will evaluate to the first listed image that is currently in the style. This validation process is synchronous and requires the image to have been added to the style before requesting it in the `'image'` argument. To implement crossfading between two images within a symbol layer using the [`icon-image-cross-fade`](/mapbox-gl-js/style-spec/layers/#paint-symbol-icon-image-cross-fade) attribute, include a second image as the second argument in the `'image'` expression.
    @objc public static let image = TMBExpressionOperator(origin: Exp.Operator.image)

        /// Determines whether an item exists in an array or a substring exists in a string. In the specific case when the second and third arguments are string literals, you must wrap at least one of them in a [`literal`](#types-literal) expression to hint correct interpretation to the [type system](#type-system).
    @objc public static let inExpression = TMBExpressionOperator(origin: Exp.Operator.inExpression)

        /// Returns the first position at which an item can be found in an array or a substring can be found in a string, or `-1` if the input cannot be found. Accepts an optional index from where to begin the search.
    @objc public static let indexOf = TMBExpressionOperator(origin: Exp.Operator.indexOf)

        /// Produces continuous, smooth results by interpolating between pairs of input and output values ("stops"). The `input` may be any numeric expression (e.g., `["get", "population"]`). Stop inputs must be numeric literals in strictly ascending order. The output type must be `number`, `array<number>`, or `color`.
        ///
        /// Interpolation types:
        /// - `["linear"]`: Interpolates linearly between the pair of stops just less than and just greater than the input.
        /// - `["exponential", base]`: Interpolates exponentially between the stops just less than and just greater than the input. `base` controls the rate at which the output increases: higher values make the output increase more towards the high end of the range. With values close to 1 the output increases linearly.
        /// - `["cubic-bezier", x1, y1, x2, y2]`: Interpolates using the cubic bezier curve defined by the given control points.
    @objc public static let interpolate = TMBExpressionOperator(origin: Exp.Operator.interpolate)

        /// Returns `true` if the input string is expected to render legibly. Returns `false` if the input string contains sections that cannot be rendered without potential loss of meaning (e.g. Indic scripts that require complex text shaping, or right-to-left scripts if the the `mapbox-gl-rtl-text` plugin is not in use in Mapbox GL JS).
    @objc public static let isSupportedScript = TMBExpressionOperator(origin: Exp.Operator.isSupportedScript)

        /// Returns the length of an array or string.
    @objc public static let length = TMBExpressionOperator(origin: Exp.Operator.length)

        /// Binds expressions to named variables, which can then be referenced in the result expression using ["var", "variable_name"].
    @objc public static let letExpression = TMBExpressionOperator(origin: Exp.Operator.letExpression)

        /// Returns the progress along a gradient line. Can only be used in the `line-gradient` property.
    @objc public static let lineProgress = TMBExpressionOperator(origin: Exp.Operator.lineProgress)

        /// Provides a literal array or object value.
    @objc public static let literal = TMBExpressionOperator(origin: Exp.Operator.literal)

        /// Returns the natural logarithm of the input.
    @objc public static let ln = TMBExpressionOperator(origin: Exp.Operator.ln)

        /// Returns mathematical constant ln(2).
    @objc public static let ln2 = TMBExpressionOperator(origin: Exp.Operator.ln2)

        /// Returns the base-ten logarithm of the input.
    @objc public static let log10 = TMBExpressionOperator(origin: Exp.Operator.log10)

        /// Returns the base-two logarithm of the input.
    @objc public static let log2 = TMBExpressionOperator(origin: Exp.Operator.log2)

        /// Selects the output for which the label value matches the input value, or the fallback value if no match is found. The input can be any expression (for example, `["get", "building_type"]`). Each label must be unique, and must be either:
        ///  - a single literal value; or
        ///  - an array of literal values, the values of which must be all strings or all numbers (for example `[100, 101]` or `["c", "b"]`).
        ///
        /// The input matches if any of the values in the array matches using strict equality, similar to the `"in"` operator.
        /// If the input type does not match the type of the labels, the result will be the fallback value.
    @objc public static let match = TMBExpressionOperator(origin: Exp.Operator.match)

        /// Returns the maximum value of the inputs.
    @objc public static let max = TMBExpressionOperator(origin: Exp.Operator.max)

        /// Returns a requested property of the light configuration based on the supplied options. Currently the only supported option is `brightness` which returns the global brightness value of the lights on a scale of 0 to 1, where 0 means total darkness and 1 means full brightness. This expression works only with 3D light, i.e. when `lights` root property is defined.
    @objc public static let measureLight = TMBExpressionOperator(origin: Exp.Operator.measureLight)

        /// Returns the minimum value of the inputs.
    @objc public static let min = TMBExpressionOperator(origin: Exp.Operator.min)

        /// Asserts that the input value is a number. If multiple values are provided, each one is evaluated in order until a number is obtained. If none of the inputs are numbers, the expression is an error.
    @objc public static let number = TMBExpressionOperator(origin: Exp.Operator.number)

        /// Converts the input number into a string representation using the providing formatting rules. If set, the `locale` argument specifies the locale to use, as a BCP 47 language tag. If set, the `currency` argument specifies an ISO 4217 code to use for currency-style formatting. If set, the `unit` argument specifies a [simple ECMAScript unit](https://tc39.es/proposal-unified-intl-numberformat/section6/locales-currencies-tz_proposed_out.html#sec-issanctionedsimpleunitidentifier) to use for unit-style formatting. If set, the `min-fraction-digits` and `max-fraction-digits` arguments specify the minimum and maximum number of fractional digits to include.
    @objc public static let numberFormat = TMBExpressionOperator(origin: Exp.Operator.numberFormat)

        /// Asserts that the input value is an object. If multiple values are provided, each one is evaluated in order until an object is obtained. If none of the inputs are objects, the expression is an error.
    @objc public static let objectExpression = TMBExpressionOperator(origin: Exp.Operator.objectExpression)

        /// Returns the mathematical constant pi.
    @objc public static let pi = TMBExpressionOperator(origin: Exp.Operator.pi)

        /// Returns the current pitch in degrees. `["pitch"]` may only be used in the `filter` expression for a `symbol` layer.
    @objc public static let pitch = TMBExpressionOperator(origin: Exp.Operator.pitch)

        /// Returns the feature properties object. Note that in some cases, it may be more efficient to use `["get", "property_name"]` directly.
    @objc public static let properties = TMBExpressionOperator(origin: Exp.Operator.properties)

        /// Returns a random value in the specified range (first two input numbers) based on a supplied seed (third input). The seed can be an expression or a constant number or string value.
    @objc public static let random = TMBExpressionOperator(origin: Exp.Operator.random)

        /// Returns the length of the particle velocity vector. Can only be used in the `raster-particle-color` property.
    @objc public static let rasterParticleSpeed = TMBExpressionOperator(origin: Exp.Operator.rasterParticleSpeed)

        /// Returns the raster value of a pixel computed via `raster-color-mix`. Can only be used in the `raster-color` property.
    @objc public static let rasterValue = TMBExpressionOperator(origin: Exp.Operator.rasterValue)

        /// Returns the IETF language tag of the locale being used by the provided `collator`. This can be used to determine the default system locale, or to determine if a requested locale was successfully loaded.
    @objc public static let resolvedLocale = TMBExpressionOperator(origin: Exp.Operator.resolvedLocale)

        /// Creates a color value from red, green, and blue components, which must range between 0 and 255, and an alpha component of 1. If any component is out of range, the expression is an error.
    @objc public static let rgb = TMBExpressionOperator(origin: Exp.Operator.rgb)

        /// Creates a color value from red, green, blue components, which must range between 0 and 255, and an alpha component which must range between 0 and 1. If any component is out of range, the expression is an error.
    @objc public static let rgba = TMBExpressionOperator(origin: Exp.Operator.rgba)

        /// Rounds the input to the nearest integer. Halfway values are rounded away from zero. For example, `["round", -1.5]` evaluates to -2.
    @objc public static let round = TMBExpressionOperator(origin: Exp.Operator.round)

        /// Returns the sine of the input.
    @objc public static let sin = TMBExpressionOperator(origin: Exp.Operator.sin)

        /// Returns the distance of a point on the sky from the sun position. Returns 0 at sun position and 1 when the distance reaches `sky-gradient-radius`. Can only be used in the `sky-gradient` property.
    @objc public static let skyRadialProgress = TMBExpressionOperator(origin: Exp.Operator.skyRadialProgress)

        /// Returns an item from an array or a substring from a string from a specified start index, or between a start index and an end index if set. The return value is inclusive of the start index but not of the end index.
    @objc public static let slice = TMBExpressionOperator(origin: Exp.Operator.slice)

        /// Returns the square root of the input.
    @objc public static let sqrt = TMBExpressionOperator(origin: Exp.Operator.sqrt)

        /// Produces discrete, stepped results by evaluating a piecewise-constant function defined by pairs of input and output values ("stops"). The `input` may be any numeric expression (e.g., `["get", "population"]`). Stop inputs must be numeric literals in strictly ascending order. Returns the output value of the stop just less than the input, or the first output if the input is less than the first stop.
    @objc public static let step = TMBExpressionOperator(origin: Exp.Operator.step)

        /// Asserts that the input value is a string. If multiple values are provided, each one is evaluated in order until a string is obtained. If none of the inputs are strings, the expression is an error.
    @objc public static let string = TMBExpressionOperator(origin: Exp.Operator.string)

        /// Returns the tangent of the input.
    @objc public static let tan = TMBExpressionOperator(origin: Exp.Operator.tan)

        /// Converts the input value to a boolean. The result is `false` when then input is an empty string, 0, `false`, `null`, or `NaN`; otherwise it is `true`.
    @objc public static let toBoolean = TMBExpressionOperator(origin: Exp.Operator.toBoolean)

        /// Converts the input value to a color. If multiple values are provided, each one is evaluated in order until the first successful conversion is obtained. If none of the inputs can be converted, the expression is an error.
    @objc public static let toColor = TMBExpressionOperator(origin: Exp.Operator.toColor)

        /// Converts the input value to a number, if possible. If the input is `null` or `false`, the result is 0. If the input is `true`, the result is 1. If the input is a string, it is converted to a number as specified by the ["ToNumber Applied to the String Type" algorithm](https://tc39.github.io/ecma262/#sec-tonumber-applied-to-the-string-type) of the ECMAScript Language Specification. If multiple values are provided, each one is evaluated in order until the first successful conversion is obtained. If none of the inputs can be converted, the expression is an error.
    @objc public static let toNumber = TMBExpressionOperator(origin: Exp.Operator.toNumber)

        /// Returns a four-element array containing the input color's red, green, blue, and alpha components, in that order.
    @objc public static let toRgba = TMBExpressionOperator(origin: Exp.Operator.toRgba)

        /// Converts the input value to a string. If the input is `null`, the result is `""`. If the input is a [`boolean`](#types-boolean), the result is `"true"` or `"false"`. If the input is a number, it is converted to a string as specified by the ["NumberToString" algorithm](https://tc39.github.io/ecma262/#sec-tostring-applied-to-the-number-type) of the ECMAScript Language Specification. If the input is a [`color`](#color), it is converted to a string of the form `"rgba(r,g,b,a)"`, where `r`, `g`, and `b` are numerals ranging from 0 to 255, and `a` ranges from 0 to 1. If the input is an [`'image'`](#types-image) expression, `'to-string'` returns the image name. Otherwise, the input is converted to a string in the format specified by the [`JSON.stringify`](https://tc39.github.io/ecma262/#sec-json.stringify) function of the ECMAScript Language Specification.
    @objc public static let toString = TMBExpressionOperator(origin: Exp.Operator.toString)

        /// Returns a string describing the type of the given value.
    @objc public static let typeofExpression = TMBExpressionOperator(origin: Exp.Operator.typeofExpression)

        /// Returns the input string converted to uppercase. Follows the Unicode Default Case Conversion algorithm and the locale-insensitive case mappings in the Unicode Character Database.
    @objc public static let upcase = TMBExpressionOperator(origin: Exp.Operator.upcase)

        /// References variable bound using "let".
    @objc public static let varExpression = TMBExpressionOperator(origin: Exp.Operator.varExpression)

        /// Returns `true` if the evaluated feature is fully contained inside a boundary of the input geometry, `false` otherwise. The input value can be a valid GeoJSON of type `Polygon`, `MultiPolygon`, `Feature`, or `FeatureCollection`. Supported features for evaluation:
        /// - `Point`: Returns `false` if a point is on the boundary or falls outside the boundary.
        /// - `LineString`: Returns `false` if any part of a line falls outside the boundary, the line intersects the boundary, or a line's endpoint is on the boundary.
    @objc public static let within = TMBExpressionOperator(origin: Exp.Operator.within)

        /// Returns the current zoom level. Note that in style layout and paint properties, ["zoom"] may only appear as the input to a top-level "step" or "interpolate" expression.
    @objc public static let zoom = TMBExpressionOperator(origin: Exp.Operator.zoom)

        /// Interpolates linearly between the pair of stops just less than and just greater than the input
    @objc public static let linear = TMBExpressionOperator(origin: Exp.Operator.linear)

        /// `["exponential", base]`
        /// Interpolates exponentially between the stops just less than and just
        /// greater than the input. base controls the rate at which the output increases: higher values make the output
        /// increase more towards the high end of the range.
        /// With values close to 1 the output increases linearly.
    @objc public static let exponential = TMBExpressionOperator(origin: Exp.Operator.exponential)

        /// `["cubic-bezier", x1, y1, x2, y2]`
        /// Interpolates using the cubic bezier curve defined by the given control points.
    @objc public static let cubicBezier = TMBExpressionOperator(origin: Exp.Operator.cubicBezier)

}
extension Exp.Operator: ObjcConvertible {
    public func wrap() -> TMBExpressionOperator {
        TMBExpressionOperator(origin: self)
    }
    func expressionOperator() -> TMBExpressionOperator { wrap() }
}
extension TMBExpressionOperator: SwiftValueConvertible {
    public func unwrap() -> Exp.Operator {
        self.origin
    }
    func expressionOperator() -> Exp.Operator { unwrap() }
}
@objc extension TMBValue {
    @objc public class func expressionOperator(_ expressionOperator: TMBExpressionOperator) -> TMBValue {
        return TMBValue(constant: expressionOperator.rawValue)
    }
}
extension MapboxMaps.Value where T == Exp.Operator {
    func expressionOperator() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [Exp.Operator] {
    func arrayOfExpressionOperator() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension TMBValue {
    func expressionOperator() -> Value<Exp.Operator>? {
        if let constant = self.constant as? String {
            return Value.constant(Exp.Operator(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOfExpressionExpressionOperator() -> Value<[Exp.Operator]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ Exp.Operator(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}


// End of generated file.
