//
//  TMBClusterOptions.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 22/05/2023.
//

import Foundation
import UIKit
import MapboxMaps

@objc
open class TMBClusterOptions : NSObject {
    /// The circle radius of the cluster items, 18 by default. Units in pixels.
    @objc
    var circleRadius: TMBValue

    /// The circle color, black by default.
    @objc
    var circleColor: TMBValue

    /// The text color of cluster item, white by default
    @objc
    var textColor: TMBValue

    /// The text size of cluster item, 12 by default. Units in pixels.
    @objc
    var textSize: TMBValue

    /// Value to use for a text label of the cluster. `get("point_count")` by default which
    /// will show the count of points in the cluster
    @objc
    var textField: TMBValue

    /// Radius of each cluster if clustering is enabled. A value of 512 indicates a radius equal
    /// to the width of a tile, 50 by default. Value must be greater than or equal to 0.
    @objc
    var clusterRadius: Double

    /// Max zoom on which to cluster points if clustering is enabled. Defaults to one zoom less
    /// than maxzoom (so that last zoom features are not clustered). Clusters are re-evaluated at integer zoom
    /// levels so setting clusterMaxZoom to 14 means the clusters will be displayed until z15.
    @objc
    var clusterMaxZoom: Double

    /// An object defining custom properties on the generated clusters if clustering is enabled, aggregating values from
    /// clustered points. Has the form `{"property_name": [operator, map_expression]}`.
    /// `operator` is any expression function that accepts at
    /// least 2 operands (e.g. `"+"` or `"max"`) — it accumulates the property value from clusters/points the
    /// cluster contains; `map_expression` produces the value of a single point. Example:
    ///
    /// ``Expression`` syntax:
    /// ```
    /// let expression = Exp(.sum) {
    ///     Exp(.get) { "scalerank" }
    /// }
    /// clusterProperties: ["sum": expression]
    /// ```
    ///
    /// JSON syntax:
    /// `{"sum": ["+", ["get", "scalerank"]]}`
    ///
    /// For more advanced use cases, in place of `operator`, you can use a custom reduce expression that references a special `["accumulated"]` value. Example:
    ///
    /// ``Expression`` syntax:
    /// ```
    /// let expression = Exp {
    ///     Exp(.sum) {
    ///         Exp(.accumulated)
    ///         Exp(.get) { "sum" }
    ///     }
    ///     Exp(.get) { "scalerank" }
    /// }
    /// clusterProperties: ["sum": expression]
    /// ```
    ///
    /// JSON syntax:
    /// `{"sum": [["+", ["accumulated"], ["get", "sum"]], ["get", "scalerank"]]}`
    var clusterProperties: [String: TMBExpression]?
    
    /// Define a set of cluster options to determine how to cluster annotations.
    /// Providing clusterOptions when initializing a ``PointAnnotationManager``
    /// will turn on clustering for that ``PointAnnotationManager``.
    @objc
    public init(circleRadius: TMBValue,
                circleColor: TMBValue,
                textColor: TMBValue,
                textSize: TMBValue,
                textField: TMBValue,
                clusterRadius: Double = 50,
                clusterMaxZoom: Double = 14,
                clusterProperties: [String: TMBExpression]? = nil) {
        self.circleRadius = circleRadius
        self.circleColor = circleColor
        self.textColor = textColor
        self.textSize = textSize
        self.textField = textField
        self.clusterRadius = clusterRadius
        self.clusterMaxZoom = clusterMaxZoom
        self.clusterProperties = clusterProperties
    }
    
    @objc
    class func defaultValue() -> TMBClusterOptions {
        return TMBClusterOptions(
            circleRadius: TMBValue(constant: NSNumber(value: 18)),
            circleColor: TMBValue(constant: UIColor.black),
            textColor: TMBValue(constant: UIColor.white),
            textSize: TMBValue(constant: NSNumber(value: 12)),
            textField: TMBValue(constant: TMBExpression(operator: TMBOperator.get, arguments:["point_count"])))
    }
    
    func swiftValue() -> ClusterOptions {
        return ClusterOptions(
            circleRadius: circleRadius.double()!,
            circleColor: circleColor.styleColor()!,
            textColor: textColor.styleColor()!,
            textSize: textSize.double()!,
            textField: textField.string()!,
            clusterRadius: clusterRadius,
            clusterMaxZoom: clusterMaxZoom,
            clusterProperties: clusterProperties?.mapValues({ item in
                return item.swiftOnly()
            })
        )
    }
}
